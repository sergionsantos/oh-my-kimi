---
name: team
description: Orquestração multi-agente com pipeline organizado
version: 1.0.0
---

# Team Skill

## Purpose
Team runs N coordinated agents on a shared task list through a canonical staged pipeline. It distributes complex work across specialized agents working in parallel.

## Use When
- Task requires multiple specialized perspectives
- Work can be parallelized across agents
- Need coordinated execution with verification
- User says "team", "equipa", "parallel", "swarm"
- Complex feature requiring architecture + implementation + testing

## Do Not Use When
- Single focused task (use direct agent)
- Sequential dependency chain (use pipeline)
- Exploration only (use explore)

## Execution Model

### Pipeline Stages
Team uses a canonical staged pipeline:

```
team-plan → team-prd → team-exec → team-verify → team-fix (loop)
```

**Stage transitions:**
- `team-plan` → `team-prd`: Planning/decomposition complete
- `team-prd` → `team-exec`: Acceptance criteria and scope explicit
- `team-exec` → `team-verify`: All execution tasks reach terminal states
- `team-verify` → `team-fix` | `complete` | `failed`: Verification decides next step
- `team-fix` → `team-exec` | `team-verify` | `complete` | `failed`: Fixes feed back into execution

**The `team-fix` loop** is bounded by max attempts; exceeding the bound transitions to `failed`.

Terminal states: `complete`, `failed`, `cancelled`.

### Team Compositions

**Feature Development:**
```
analyst → planner → executor → test-engineer → code-reviewer → verifier
```

**Bug Investigation:**
```
explore + debugger + executor + test-engineer + verifier
```

**Code Review:**
```
style-reviewer + code-reviewer + api-reviewer + security-reviewer
```

**Product Discovery:**
```
product-manager + ux-researcher + product-analyst + designer
```

**UX Audit:**
```
ux-researcher + information-architect + designer + product-analyst
```

## Invocation

### Basic
```
team 3 "fix all TypeScript errors"
```
Runs 3 executors in parallel on the task.

### With Agent Types
```
team 2:architect,1:executor "design and implement auth"
```
Runs 2 architects + 1 executor.

### Via Skill
```
/omk-team 3 "fix all TypeScript errors"
$team 3 "fix all TypeScript errors"
```

## State Management
```json
{
  "mode": "team",
  "active": true,
  "current_phase": "team-exec",
  "agent_count": 3,
  "team_name": "auth-feature",
  "tasks": [
    {"id": 1, "agent": "architect", "status": "complete"},
    {"id": 2, "agent": "executor", "status": "in_progress"}
  ]
}
```

## Agent Selection
Match agent to task complexity:
- **Low complexity** (quick lookups, narrow checks): explore, style-reviewer, writer
- **Standard** (implementation, debugging, reviews): executor, debugger, test-engineer
- **High complexity** (architecture, deep analysis, complex refactors): architect, executor, critic

## Parallelism Limits
- Maximum 6 concurrent agents
- Each agent has isolated context
- Parent coordinates results

## Output Format

```markdown
## Team Execution Report

### Configuration
- Agents: [N] ([types])
- Task: [Description]

### Phase: [Current]

### Results
| Agent | Task | Status | Output |
|-------|------|--------|--------|
| [Agent] | [Task] | ✅/❌ | [Summary] |

### Consensus
[Where agents agree]

### Conflicts
[Where agents disagree] → Resolution: [How resolved]

### Next Steps
[Actions based on results]
```

## Best Practices
- Use homogeneous teams for similar tasks
- Use heterogeneous teams for complex features
- Start with plan phase for large tasks
- Always include verifier before completion
