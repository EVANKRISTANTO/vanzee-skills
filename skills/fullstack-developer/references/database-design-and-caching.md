# Database Architecture, Data Modeling & Caching Strategies

Production database engineering guide for PostgreSQL, modern ORMs, and high-performance Redis caching.

---

## 1. PostgreSQL Schema Design & Indexing Mastery

Bad database design cannot be fixed with faster hardware. Follow these non-negotiable data modeling rules:

### A. Primary Keys: UUIDv7 vs. Serial
- **Avoid Random UUIDv4 for Primary Keys**: Random UUIDs cause severe B-Tree index fragmentation and massive cache thrashing on inserts.
- **Use UUIDv7 (Time-Ordered)** or **BigSerial/Identity**: UUIDv7 combines a Unix timestamp prefix with random entropy. It provides distributed uniqueness while preserving sequential insert locality.

### B. Indexing Discipline & Types
1. **The Leftmost Prefix Rule**: A composite index on `(tenant_id, status, created_at)` can accelerate queries on:
   - `(tenant_id)`
   - `(tenant_id, status)`
   - `(tenant_id, status, created_at)`
   *It CANNOT accelerate a query filtering only on `(status)` or `(created_at)` alone.*
2. **Partial Indexes (High-Value Optimization)**: Index only rows that match a frequent filter condition, saving 80% index storage:
   ```sql
   -- Instead of indexing all 10 million orders:
   CREATE INDEX idx_orders_unprocessed ON orders (created_at) 
   WHERE status = 'PENDING';
   ```
3. **GIN Indexes for JSONB & Search**:
   ```sql
   CREATE INDEX idx_users_metadata_gin ON users USING GIN (metadata jsonb_path_ops);
   ```

---

## 2. Transactions & Concurrency Control

Preventing double-spends, overselling inventory, or balance corruption requires strict transactional isolation.

### A. The Race Condition Trap (Lost Updates)
```sql
-- DANGEROUS: Two concurrent requests read balance = 100, both deduct 50, final balance = 50 instead of 0!
SELECT balance FROM accounts WHERE id = 1;
-- App computes: 100 - 50 = 50
UPDATE accounts SET balance = 50 WHERE id = 1;
```

### B. Defensive Solution: Atomic Mutations or Row-Level Locking
```sql
-- Solution 1: Single Atomic Statement (Best performance)
UPDATE accounts 
SET balance = balance - 50 
WHERE id = 1 AND balance >= 50;

-- Solution 2: Pessimistic Row Lock (SELECT FOR UPDATE)
BEGIN;
SELECT balance FROM accounts WHERE id = 1 FOR UPDATE;
-- Locks row until transaction commits
UPDATE accounts SET balance = balance - 50 WHERE id = 1;
COMMIT;
```

### C. Optimistic Concurrency Control (OCC)
Use a version integer column on high-read, low-conflict entities:
```sql
UPDATE documents 
SET content = 'new text', version = version + 1 
WHERE id = 10 AND version = 3;
-- If affected rows == 0, another user modified it; raise ConflictError
```

---

## 3. ORM Heuristics: Drizzle & Prisma

Modern TypeScript ORMs streamline development, but you must prevent the **N+1 Query Problem**.

### The N+1 Disaster:
```typescript
// N+1 Anti-Pattern: 1 query to fetch posts, then N separate queries for each author!
const posts = await db.select().from(postsTable);
for (const post of posts) {
  const author = await db.select().from(usersTable).where(eq(usersTable.id, post.authorId)); // BAD!
}

// Fixed with Drizzle Relational Queries (Single JOIN query):
const postsWithAuthors = await db.query.posts.findMany({
  with: {
    author: true,
  },
});
```

---

## 4. High-Performance Redis Caching Patterns

### Cache-Aside (Lazy Loading) with TTL & Mutex
Never cache data indefinitely. Always enforce a TTL (Time-To-Live) and handle cache misses deterministically:

```typescript
export async function getCachedUser(userId: string): Promise<User> {
  const cacheKey = `user:${userId}`;
  
  // 1. Check Redis cache
  const cached = await redis.get(cacheKey);
  if (cached) {
    return JSON.parse(cached);
  }
  
  // 2. Cache miss: Query Primary Database
  const user = await db.query.users.findFirst({ where: eq(users.id, userId) });
  if (!user) throw new NotFoundError('User', userId);
  
  // 3. Write to Redis with 15-minute TTL
  await redis.setex(cacheKey, 900, JSON.stringify(user));
  
  return user;
}
```

### Invalidation Strategy:
Invalidate or update the cache key immediately upon successful database write (`write-through` or `evict-on-write`):
```typescript
await db.update(users).set(data).where(eq(users.id, userId));
await redis.del(`user:${userId}`); // Purge stale cache
```
