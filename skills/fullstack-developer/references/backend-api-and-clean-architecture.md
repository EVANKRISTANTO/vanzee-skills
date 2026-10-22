# Backend Architecture, API Design & Scalability

Production-grade backend engineering guide for building robust, scalable, and maintainable services.

---

## 1. Clean Architecture: Layered Separation of Concerns

Avoid "fat controllers" and spaghetti routes. Enforce strict directional dependencies: Outer layers depend on inner layers, never the reverse.

```text
┌────────────────────────────────────────────────────────────────────────┐
│ 1. PRESENTATION LAYER (Controllers / Route Handlers)                   │
│    • Receives HTTP requests / WebSocket events                         │
│    • Validates input format (Zod / JSON Schema)                        │
│    • Calls Application Use Case; returns HTTP status code (200, 201)   │
├────────────────────────────────────────────────────────────────────────┤
│ 2. APPLICATION LAYER (Use Cases / Services)                            │
│    • Orchestrates business workflows (e.g., RegisterUserUseCase)       │
│    • Handles transactions, triggers emails, dispatches queue jobs      │
│    • Depends on Domain Interfaces, not concrete implementations        │
├────────────────────────────────────────────────────────────────────────┤
│ 3. DOMAIN LAYER (Entities & Business Rules)                            │
│    • Pure business logic (e.g., User, Invoice, PricingRules)           │
│    • Zero dependencies on frameworks, databases, or external libraries│
├────────────────────────────────────────────────────────────────────────┤
│ 4. INFRASTRUCTURE LAYER (Repositories & Adapters)                      │
│    • Implements database queries (PostgreSQL, Drizzle, Prisma, Redis)  │
│    • External APIs (Stripe, Resend, S3, OpenAI)                        │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 2. API Design Protocols: REST vs. tRPC vs. Real-Time

Choose the API protocol that matches the team topology and consumer ecosystem:

```text
┌─────────────────┬──────────────────────┬──────────────────────┬──────────────────────┐
│ Protocol        │ Best Suited For      │ Key Advantage        │ Trade-Off            │
├─────────────────┼──────────────────────┼──────────────────────┼──────────────────────┤
│ RESTful API     │ Public APIs, mobile  │ Universal standard,  │ Manual types sync,   │
│                 │ apps, multi-language │ HTTP caching, OpenAPI│ potential waterfalls │
├─────────────────┼──────────────────────┼──────────────────────┼──────────────────────┤
│ tRPC            │ Fullstack TypeScript │ Instant end-to-end   │ Couples frontend to  │
│                 │ (Next.js / Turborepo)│ types, zero codegen  │ TypeScript backend   │
├─────────────────┼──────────────────────┼──────────────────────┼──────────────────────┤
│ SSE (EventStream│ AI streaming, news   │ Lightweight over HTTP│ Unidirectional       │
│                 │ feeds, live metrics  │ auto-reconnect       │ (server-to-client)   │
├─────────────────┼──────────────────────┼──────────────────────┼──────────────────────┤
│ WebSockets      │ Chat apps, multiplayer│ Bidirectional, ultra │ Stateful connection, │
│                 │ games, live trading  │ low latency          │ needs sticky sessions│
└─────────────────┴──────────────────────┴──────────────────────┴──────────────────────┘
```

### Essential RESTful Rules:
- **Correct HTTP Status Codes**:
  - `200 OK` (Read/Update successful), `201 Created` (Resource created), `204 No Content` (Deleted).
  - `400 Bad Request` (Validation error), `401 Unauthorized` (Unauthenticated), `403 Forbidden` (Authenticated but lacking role/permission), `404 Not Found`, `409 Conflict` (Duplicate unique field).
  - `429 Too Many Requests` (Rate limit exceeded), `500 Internal Server Error`.
- **Cursor-Based Pagination** (Mandatory for high-volume tables over offset-limit):
  ```sql
  -- Offset pagination degrades as offset scales (O(N) full scan)
  SELECT * FROM orders ORDER BY created_at DESC LIMIT 20 OFFSET 100000; -- SLOW
  
  -- Cursor pagination remains O(1) via B-Tree index scan:
  SELECT * FROM orders WHERE id < $last_seen_id ORDER BY id DESC LIMIT 20; -- FAST
  ```
- **Idempotency Keys**: Require an `Idempotency-Key: <UUID>` header on non-idempotent financial mutations (e.g., checkout/payment processing) to prevent duplicate transactions caused by network retries.

---

## 3. Asynchronous Jobs, Queues & Worker Architecture

Never execute heavy CPU tasks or slow third-party API calls (sending emails, processing videos, generating PDFs) inside synchronous HTTP request-response cycles.

```text
  Client Request ──► Fast API Route ──► Push Job to Redis Queue ──► Return 202 Accepted
                                                 │
                                                 ▼
                                         Background Worker (BullMQ)
                                         • Exponential backoff retry (3x)
                                         • Dead-Letter Queue (DLQ)
                                         • Push completion via Webhook / SSE
```

### BullMQ Worker Pattern:
```typescript
import { Queue, Worker } from 'bullmq';

const connection = { host: process.env.REDIS_HOST, port: 6379 };

export const emailQueue = new Queue('email-queue', { connection });

export const emailWorker = new Worker('email-queue', async (job) => {
  const { to, template, data } = job.data;
  await mailProvider.send({ to, template, data });
}, {
  connection,
  concurrency: 10,
  limiter: { max: 100, duration: 1000 }, // Rate limit protection
});

emailWorker.on('failed', (job, err) => {
  console.error(`Job ${job?.id} failed with error: ${err.message}`);
});
```

---

## 4. Centralized Error Handling & Structured Logging

Never swallow errors with empty `catch` blocks or leak raw stack traces to client responses.

```typescript
// Custom AppError Hierarchy
export class AppError extends Error {
  constructor(
    public readonly message: string,
    public readonly statusCode: number = 500,
    public readonly code: string = 'INTERNAL_ERROR',
    public readonly details: unknown = null
  ) {
    super(message);
    Object.setPrototypeOf(this, new.target.prototype);
  }
}

export class NotFoundError extends AppError {
  constructor(entity: string, id: string) {
    super(`${entity} with id '${id}' not found`, 404, 'NOT_FOUND');
  }
}

export class ValidationError extends AppError {
  constructor(details: unknown) {
    super('Input validation failed', 400, 'VALIDATION_ERROR', details);
  }
}
```
