---
name: ultrawork
description: Paralelismo máximo para fixes e refactors rápidos
version: 1.0.0
---

# Ultrawork Skill

## Purpose
Maximum parallelism for burst parallel fixes and refactors where Team overhead is disproportionate to the task. Spawns up to 6 agents simultaneously for maximum throughput.

## Use When
- Many independent small tasks
- Bulk refactoring
- Fixing all instances of a pattern
- User says "ultrawork", "ulw", "parallel"
- Need maximum speed, not coordination

## Do Not Use When
- Tasks have dependencies (use team)
- Need careful coordination (use team)
- Single focused task (use direct agent)

## Execution
1. Analyze task for parallelization opportunities
2. Split into independent subtasks
3. Spawn up to 6 agents simultaneously:
   ```
   Task(agent, "Fix: [subtask 1]")
   Task(agent, "Fix: [subtask 2]")
   ... up to 6
   ```
4. Collect all results
5. Report aggregate outcome

## State
```json
{
  "mode": "ultrawork",
  "active": true,
  "reinforcement_count": 0,
  "started_at": "2026-03-18T15:30:00Z"
}
```

## Invocation

### Keyword
```
ulw fix all errors
ultrawork rename all components
```

### Command
```
/omk-ultrawork "fix all lint errors"
```

### Skill
```
$ultrawork "fix all lint errors"
```

## Example
```
User: ultrawork fix all console.log statements

Kimi: Spawning 6 parallel agents...
      Agent 1: files src/components/*.ts
      Agent 2: files src/utils/*.ts
      Agent 3: files src/services/*.ts
      ...
      All agents complete! Fixed 47 console.log statements.
```

## Note
Ralph includes ultrawork automatically when appropriate. When you activate ralph mode, it uses ultrawork's parallel execution internally.
