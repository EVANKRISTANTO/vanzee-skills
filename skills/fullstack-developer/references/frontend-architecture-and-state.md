# Frontend Architecture, State Orchestration & Component Design

Modern, production-grade frontend architecture blueprint for resilient web applications.

---

## 1. Architectural Separation: Server vs. Client Components

In frameworks like Next.js (App Router), Remix, or Astro, the boundary between server execution and client hydration must be intentional.

```text
┌────────────────────────────────────────────────────────────────────────┐
│ SERVER COMPONENTS (RSC) - The Default                                  │
│ • Direct DB & backend API access (zero client network waterfalls)      │
│ • Zero bundle size impact on client JS                                 │
│ • Secure: Keeps tokens, database credentials, and secrets server-side │
│ • Static or streaming HTML with React Suspense                         │
├────────────────────────────────────────────────────────────────────────┤
│ ── Boundary: "use client" (Push as deep into the tree as possible) ─── │
├────────────────────────────────────────────────────────────────────────┤
│ CLIENT COMPONENTS - Only when interaction is required                  │
│ • Browser event listeners (onClick, onChange, onKeyDown)               │
│ • React Hooks with state (useState, useReducer, useEffect)             │
│ • Browser APIs (localStorage, geolocation, canvas, WebSockets)        │
│ • Custom animated UI components (Framer Motion, spring physics)        │
└────────────────────────────────────────────────────────────────────────┘
```

### Golden Heuristic:
Never mark an entire page `"use client"`. Keep the page and layout as Server Components, fetch data at the server root, and pass data as typed props down into small, isolated interactive leaf client components.

---

## 2. State Management: Server State vs. Client/UI State

Conflating server data (remote cached data) with UI state (modals, dropdowns, selected tabs) is the #1 cause of buggy web applications.

```text
                               State Taxonomy
                                     │
             ┌───────────────────────┴───────────────────────┐
             ▼                                               ▼
      [SERVER STATE]                                   [CLIENT/UI STATE]
  • User profile, order list                       • Modal open/close
  • Async, remote, shared                          • Form draft in progress
  • Stale over time                                • Ephemeral, local to tab
  • Tool: TanStack Query / SWR                     • Tool: Zustand / Context
```

### A. TanStack Query (Server State Best Practices)
1. **Query Key Factory Pattern**: Never use raw string query keys. Always use typed factories:
   ```typescript
   export const userKeys = {
     all: ['users'] as const,
     lists: () => [...userKeys.all, 'list'] as const,
     list: (filters: UserFilters) => [...userKeys.lists(), { filters }] as const,
     details: () => [...userKeys.all, 'detail'] as const,
     detail: (id: string) => [...userKeys.details(), id] as const,
   };
   ```
2. **Optimistic Updates**: Mutate the local cache immediately before the network response arrives; rollback automatically on error:
   ```typescript
   const queryClient = useQueryClient();
   const mutation = useMutation({
     mutationFn: updateTodoApi,
     onMutate: async (newTodo) => {
       await queryClient.cancelQueries({ queryKey: todoKeys.detail(newTodo.id) });
       const previousTodo = queryClient.getQueryData(todoKeys.detail(newTodo.id));
       queryClient.setQueryData(todoKeys.detail(newTodo.id), newTodo);
       return { previousTodo };
     },
     onError: (err, newTodo, context) => {
       if (context?.previousTodo) {
         queryClient.setQueryData(todoKeys.detail(newTodo.id), context.previousTodo);
       }
     },
     onSettled: (data, error, variables) => {
       queryClient.invalidateQueries({ queryKey: todoKeys.detail(variables.id) });
     },
   });
   ```

### B. Zustand (Client/UI State Architecture)
Keep stores small, single-purpose, and use atomic selectors to prevent unnecessary re-renders:
```typescript
interface ModalStore {
  activeModal: string | null;
  payload: unknown;
  openModal: (modalId: string, payload?: unknown) => void;
  closeModal: () => void;
}

export const useModalStore = create<ModalStore>((set) => ({
  activeModal: null,
  payload: null,
  openModal: (modalId, payload) => set({ activeModal: modalId, payload }),
  closeModal: () => set({ activeModal: null, payload: null }),
}));

// Consumer Component (Only re-renders when activeModal changes):
const activeModal = useModalStore((state) => state.activeModal);
```

---

## 3. Form Engineering: Type-Safe Validation Pipeline

Forms must be validated synchronously on the client for instant UX feedback, and re-validated identically on the server before mutating databases.

```text
   User Input ──► React Hook Form ──► Zod Schema Client Validation
                                              │ (Pass)
                                              ▼
                                     Server Action / API
                                              │
                                              ▼
                                     Zod Schema Server Validation
                                              │ (Pass)
                                              ▼
                                     Database Mutation
```

```typescript
// Shared Schema (shared/schemas/user.ts)
import { z } from 'zod';

export const UpdateProfileSchema = z.object({
  fullName: z.string().min(2, 'Name must be at least 2 characters').max(50),
  email: z.string().email('Invalid email address'),
  role: z.enum(['ADMIN', 'MEMBER', 'VIEWER']),
  bio: z.string().max(250).optional(),
});

export type UpdateProfileInput = z.infer<typeof UpdateProfileSchema>;
```

---

## 4. Component Patterns: Compound Components

For complex UI elements (Tabs, Dialogs, Selects, Accordions), use the compound component pattern with React Context or Radix UI headless primitives. This decouples visual layout from internal state logic.

```typescript
// Example: Accessible Tabs Compound Component
<Tabs defaultValue="overview">
  <Tabs.List className="flex border-b border-white/10">
    <Tabs.Trigger value="overview">Overview</Tabs.Trigger>
    <Tabs.Trigger value="analytics">Analytics</Tabs.Trigger>
    <Tabs.Trigger value="settings">Settings</Tabs.Trigger>
  </Tabs.List>
  <Tabs.Content value="overview"><OverviewPanel /></Tabs.Content>
  <Tabs.Content value="analytics"><AnalyticsPanel /></Tabs.Content>
  <Tabs.Content value="settings"><SettingsPanel /></Tabs.Content>
</Tabs>
```
