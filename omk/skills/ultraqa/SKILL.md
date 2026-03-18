---
name: ultraqa
description: Ciclos QA - testa, verifica, corrige, repete
version: 1.0.0
---

# UltraQA Skill

## Purpose
QA cycling -- test, verify, fix, repeat. Ensures quality through iterative testing cycles.

## Use When
- Need thorough testing
- Before releases
- User says "ultraqa", "qa cycle"
- Quality validation needed

## Execution Loop

```
┌─────────────────────────────────────────────┐
│  Run Tests                                  │
│    ↓                                        │
│  All Pass? ──Yes──→ Complete                │
│    │ No                                     │
│    ↓                                        │
│  Identify Failures                          │
│    ↓                                        │
│  Fix Issues                                 │
│    ↓                                        │
│  Retry Count < 5? ──No──→ Report Failure    │
│    │ Yes                                    │
│    └──────────────→ Run Tests (loop)        │
└─────────────────────────────────────────────┘
```

## QA Checklist
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Lint checks pass
- [ ] Type checks pass
- [ ] Build succeeds
- [ ] No console errors

## State
```json
{
  "mode": "ultraqa",
  "active": true,
  "current_phase": "testing",
  "iteration": 2,
  "started_at": "2026-03-18T15:30:00Z"
}
```

## Invocation

### Command
```
/omk-ultraqa
```

### Skill
```
$ultraqa
```

## Example
```
User: ultraqa

Kimi: Starting UltraQA cycle...
      Iteration 1: Running tests...
      ❌ 3 tests failed
      Fixing issues...
      Iteration 2: Running tests...
      ❌ 1 test failed
      Fixing issues...
      Iteration 3: Running tests...
      ✅ All tests pass!
      UltraQA complete in 3 iterations.
```

## Limits
- Max 5 iterations
- Same error 3 times → escalate
