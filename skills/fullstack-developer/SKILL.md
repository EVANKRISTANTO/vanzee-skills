---
name: fullstack-developer
description: >-
  Senior fullstack engineering engine across frontend, backend, database architecture, DevOps, and defensive security. Architect and build production-grade web applications using React/Next.js, Node.js/Go/Python, PostgreSQL/Redis, Clean Architecture, REST/tRPC APIs, Docker multi-stage builds, and automated testing with zero AI slop.
---

# Fullstack Developer & Systems Architect

Master engineering framework for designing, implementing, and deploying end-to-end, production-ready web applications. Bridges frontend user experience, backend business logic, database performance, and DevOps infrastructure.

---

## 4 Core Pillars of Fullstack Engineering

```text
┌────────────────────────────────────────────────────────────────────────┐
│ 1. FRONTEND ARCHITECTURE & STATE ORCHESTRATION                         │
│    • Frameworks: Next.js (App Router RSC), Remix, Astro, Svelte, Vue 3 │
│    • State Division: Server State (TanStack Query/SWR) vs UI (Zustand) │
│    • Form Safety: React Hook Form + Zod synchronous validation         │
│    • Component Design: Compound components, headless Radix primitives │
├────────────────────────────────────────────────────────────────────────┤
│ 2. BACKEND SYSTEMS, API DESIGN & CLEAN ARCHITECTURE                    │
│    • Architectural Separation: Controllers -> Use Cases -> Repositories│
│    • Protocols: Semantic RESTful (cursor pagination), tRPC, SSE/WS     │
│    • Async Jobs: BullMQ / Redis background workers, retry backoffs     │
│    • Error Handling: Centralized AppError hierarchy, correlation IDs   │
├────────────────────────────────────────────────────────────────────────┤
│ 3. DATABASE ENGINEERING, DATA MODELING & CACHING                       │
│    • PostgreSQL: 3NF schemas, UUIDv7 primary keys, composite B-Tree    │
│    • Concurrency: Row-level locks (SELECT FOR UPDATE), atomic updates  │
│    • ORM Heuristics: Drizzle ORM / Prisma, eliminating N+1 waterfalls  │
│    • Caching: Redis Cache-Aside with TTLs & stale-while-revalidate     │
├────────────────────────────────────────────────────────────────────────┤
│ 4. DEVOPS, SECURITY HARDENING & TESTING PYRAMID                        │
│    • Containerization: Multi-stage Docker, non-root users, distroless  │
│    • Auth & Security: Silent JWT refresh rotation, HttpOnly cookies    │
│    • CI/CD: Automated GitHub Actions lint, test, build, deploy         │
│    • Testing Pyramid: Vitest unit tests, Supertest, Playwright E2E     │
└────────────────────────────────────────────────────────────────────────┘
```

---

## Standard Output Protocol for Fullstack Tasks

When asked to design, build, or refactor a fullstack feature, structure the implementation into these clear layers:

### 1. Architecture & Data Flow Blueprint
- Define the request/response journey: Client Component -> API Route -> Use Case / Business Logic -> Database Query / External API.
- Specify whether data fetching happens server-side (RSC) or client-side (TanStack Query).

### 2. Type-Safe Data Contracts (Zod / TypeScript)
- Declare shared validation schemas and TypeScript types used across both frontend and backend boundaries.

### 3. Implementation Modules
- **Database Schema**: Declarative Drizzle / Prisma / SQL migration with appropriate indexes and foreign keys.
- **Backend Service / API**: Clean route handler or use case with error handling and status codes.
- **Frontend Component**: Accessible, interactive component with loading states, error boundaries, and optimistic updates where appropriate.

### 4. Security & Trust Boundaries
- State authentication checks, authorization scopes (RBAC), and sanitization gates.

### 5. Automated Verification Test
- Include at least one unit or integration test proving correctness under happy path and failure edge cases.

---

## Anti-Slop Fullstack Code Rules

- ❌ **No Pseudo-Code or TODO Placeholders**: Never write `// TODO: Implement authentication here` or `// Add database query later`. Write working, production-grade code with error handling.
- ❌ **No `any` Types**: Never use `any` in TypeScript. Use `unknown` with runtime type narrowing, generics, or inferred Zod schemas.
- ❌ **No N+1 Query Loops**: Never query a database inside an un-batched `for` loop. Use relational joins, `DataLoader`, or composite SQL `IN` statements.
- ❌ **No Exposed Secrets**: Never commit or hardcode credentials, private keys, or API tokens. Enforce `zod` validated environment variables.
- ❌ **No Unhandled Promises**: Always handle async errors with typed try/catch or higher-order error handlers.

---

## Detailed Engineering References

- **Frontend Architecture & State**: See `references/frontend-architecture-and-state.md`
- **Backend APIs & Clean Architecture**: See `references/backend-api-and-clean-architecture.md`
- **Database Modeling & Caching**: See `references/database-design-and-caching.md`
- **DevOps, Security & Testing**: See `references/devops-security-and-testing.md`
