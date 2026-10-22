# DevOps, Containerization, Fullstack Security & QA Testing

Production infrastructure, containerization, defensive authentication, and automated testing pyramid.

---

## 1. Authentication & Session Architecture

Never store raw JWT tokens in browser `localStorage` (vulnerable to XSS theft). Always implement the **Silent Token Refresh Pattern**:

```text
┌─────────────────┬───────────────────────────────────┬───────────────────────────┐
│ Token Type      │ Storage Mechanism                 │ Lifespan & Behavior       │
├─────────────────┼───────────────────────────────────┼───────────────────────────┤
│ Access Token    │ In-Memory (JavaScript variable)   │ Short-lived (10–15 mins)  │
│ Refresh Token   │ HttpOnly, Secure, SameSite=Strict │ Long-lived (7–30 days)    │
│                 │ Cookie (Inaccessible to JS)       │ Rotates on every refresh  │
└─────────────────┴───────────────────────────────────┴───────────────────────────┘
```

### Refresh Token Rotation & Theft Detection
1. When the client's in-memory access token expires, client issues a `POST /auth/refresh` sending the HttpOnly cookie.
2. The server invalidates the old refresh token and issues a new pair.
3. **Theft Detection Family**: If an already invalidated refresh token is presented, the server immediately revokes all active sessions for that user across all devices (mitigates replay attacks).

---

## 2. Hardened Multi-Stage Dockerfile (Node.js / Next.js)

Produce tiny, secure, non-root production images:

```dockerfile
# Stage 1: Dependency resolution
FROM node:20-alpine AS deps
WORKDIR /app
RUN apk add --no-cache libc6-compat
COPY package.json package-lock.json ./
RUN npm ci

# Stage 2: Application Build
FROM node:20-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
ENV NEXT_TELEMETRY_DISABLED=1
RUN npm run build

# Stage 3: Production Runner (Minimal & Non-Root)
FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV PORT=3000

# Create non-root user
RUN addgroup --system --gid 1001 nodejs && \
    adduser --system --uid 1001 nextjs

COPY --from=builder /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs
EXPOSE 3000
CMD ["node", "server.js"]
```

---

## 3. Environment Variable Security with Zod

Never access `process.env.VARIABLE` directly across code without compile-time and runtime validation:

```typescript
// src/env.ts
import { z } from 'zod';

const envSchema = z.object({
  NODE_ENV: z.enum(['development', 'test', 'production']).default('development'),
  PORT: z.coerce.number().default(3000),
  DATABASE_URL: z.string().url(),
  REDIS_URL: z.string().url(),
  JWT_SECRET: z.string().min(32, 'JWT secret must be at least 32 characters'),
  CORS_ORIGIN: z.string().default('*'),
});

const parsed = envSchema.safeParse(process.env);

if (!parsed.success) {
  console.error('❌ Invalid environment variables:', parsed.error.format());
  process.exit(1);
}

export const env = parsed.data;
```

---

## 4. The Testing Pyramid & Automated Verification

```text
                      /\
                     /  \
                    / E2E\          10% - Playwright (Critical user journeys)
                   /──────\
                  /  Integ \        30% - API Endpoints + DB queries
                 /──────────\
                /  Unit Tests\      60% - Vitest (Pure domain logic & utils)
               /──────────────\
```

### A. Unit Tests (Vitest):
Fast, deterministic tests for calculations, validators, and reducers:
```typescript
import { describe, it, expect } from 'vitest';
import { calculateTaxAndDiscount } from './pricing';

describe('calculateTaxAndDiscount', () => {
  it('correctly applies 10% coupon before 11% PPN tax', () => {
    const result = calculateTaxAndDiscount(100_000, 0.10, 0.11);
    expect(result.subtotal).toBe(90_000);
    expect(result.tax).toBe(9_900);
    expect(result.total).toBe(99_900);
  });
});
```

### B. Integration Tests (Supertest + Real DB):
Test complete HTTP request lifecycle including validation, authorization, and database persistence:
```typescript
import request from 'supertest';
import { app } from '../app';

it('POST /api/v1/orders returns 201 and creates order in DB', async () => {
  const res = await request(app)
    .post('/api/v1/orders')
    .set('Authorization', `Bearer ${testToken}`)
    .send({ items: [{ productId: 'prod_1', quantity: 2 }] });

  expect(res.status).toBe(201);
  expect(res.body.order).toHaveProperty('id');
  expect(res.body.order.status).toBe('PENDING');
});
```
