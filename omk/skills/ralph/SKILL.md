---
name: ralph
description: Modo persistência - não para até completar ou falhar definitivamente
version: 1.0.0
---

# Ralph Skill

## Purpose
Ralph is a self-referential persistence loop that continues working until the task is verified complete or definitively failed. It includes automatic verification and fix cycles.

## Use When
- User says "ralph", "don't stop", "must complete", "keep going", "não páres"
- Task must be completed fully (no silent partials)
- Long-running tasks that might encounter obstacles
- Critical tasks that cannot be left incomplete
- User wants "it just works" outcome

## Do Not Use When
- User wants to stop at any time (use direct execution)
- Task is exploratory (use plan or explore)
- Quick fixes (use executor directly)

## Execution Loop

```
┌─────────────────────────────────────────────────────────┐
│  START                                                  │
│    ↓                                                    │
│  Plan (if not exists)                                   │
│    ↓                                                    │
│  Execute                                                │
│    ↓                                                    │
│  Verify                                                 │
│    ↓                                                    │
│  ┌─────────────────┐                                    │
│  │ Complete?       │──Yes──→ DONE                       │
│  │                 │                                    │
│  │ Max attempts?   │──Yes──→ FAILED                     │
│  └────────┬────────┘                                    │
│           │ No                                          │
│           ↓                                             │
│  Fix → Verify → (loop)                                  │
└─────────────────────────────────────────────────────────┘
```

## State Management
```json
{
  "mode": "ralph",
  "active": true,
  "iteration": 3,
  "max_iterations": 10,
  "current_phase": "fix",
  "started_at": "2026-03-18T15:30:00Z",
  "completed_at": null
}
```

## Phases

### 1. Planning Gate (Ralplan-First)
**CRITICAL**: Enforce **ralplan-first** when ralph is active and planning is not complete.

Planning is complete only when both exist:
- `.omk/plans/prd-*.md`
- `.omk/plans/test-spec-*.md`

Until complete, do not begin implementation.

### 2. Execution
- Spawn executor agent
- Run implementation
- Update state

### 3. Verification
- Run tests
- Run lint
- Run typecheck
- Task(`verifier`, "Verify completion")

### 4. Fix (if needed)
If verification fails:
- Task(`debugger`, "Investigate failures")
- Task(`executor`, "Implement fixes")
- Increment iteration
- Loop back to verify

### 5. Completion
When verified:
- Set `active: false`
- Set `completed_at`
- Report success

## Limits
- **Max iterations**: 10 (configurable)
- **Max fix attempts per issue**: 3
- **Same error 3 times** → Escalate to user

## Invocation

### Keyword
```
ralph: refactor authentication module
```

### Command
```
/omk-ralph "refactor authentication module"
```

### Skill
```
$ralph "refactor authentication module"
```

## Ralph vs Autopilot
| Aspect | Ralph | Autopilot |
|--------|-------|-----------|
| Scope | Single focused task | End-to-end feature |
| Planning | Uses existing or ralplan | Full expansion |
| Phases | Execute → Fix loop | Full pipeline |
| Use for | Must-complete tasks | Greenfield development |

## Example
```
User: ralph fix all TypeScript errors

Kimi: Starting Ralph persistence mode...
      Iteration 1/10: Executing fixes
      Verification: 15 errors remaining
      Iteration 2/10: Fixing remaining errors
      Verification: 3 errors remaining
      Iteration 3/10: Fixing final errors
      Verification: ✅ All tests pass
      Ralph complete! Fixed all TypeScript errors in 3 iterations.
```
