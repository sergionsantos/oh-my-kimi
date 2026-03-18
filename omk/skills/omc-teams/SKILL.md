---
name: omc-teams
description: Integração com Teams nativo do Claude Code
version: 1.0.0
---

# OMC-Teams Skill

## Purpose
Integration with Claude Code's native teams feature. Spawns real Claude CLI workers in tmux panes for parallel execution.

## Requirements
- Claude Code CLI with experimental teams enabled
- tmux installed

## Enable Teams

Add to `~/.claude/settings.json`:
```json
{
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  }
}
```

## Use When
- Want true parallel Claude agents
- Have access to Claude Max/Pro
- Need maximum parallelism
- Complex multi-file changes

## Invocation

### Command
```
/omk-omc-teams 3 "fix all TypeScript errors"
/omk-omc-teams 2:executor "implement feature X"
```

### Skill
```
$omc-teams 3 "task description"
$omc-teams 2:architect,1:executor "design and implement"
```

## Worker Types

| Type | Best For |
|------|----------|
| `executor` | Implementation tasks |
| `architect` | Design and architecture |
| `debugger` | Bug investigation |
| `reviewer` | Code review |

## Workflow

### 1. Spawn Workers
```
omc team spawn 3 --task "fix errors"
```

### 2. Monitor Progress
```
omc team status
```

### 3. Collect Results
```
omc team results
```

### 4. Shutdown
```
omc team shutdown
```

## State

```json
{
  "mode": "omc-teams",
  "workers": 3,
  "task": "description",
  "panes": ["pane-1", "pane-2", "pane-3"],
  "status": "running"
}
```

## Example

```
User: omc-teams 3 "refactor authentication"

Kimi: Spawning 3 Claude workers in tmux...
      
      Worker 1 (pane-1): Analyzing auth module
      Worker 2 (pane-2): Refactoring login flow
      Worker 3 (pane-3): Updating tests
      
      [Progress updates...]
      
      All workers complete!
      Results aggregated from 3 workers.
```

## Comparison: omc-teams vs team

| Feature | omc-teams | team |
|---------|-----------|------|
| Workers | Real Claude processes | Task tool agents |
| Speed | Faster (native) | Good |
| Cost | Higher (more API calls) | Lower |
| Requires | tmux + Claude teams | Just kimi-cli |
| Best for | Complex parallel work | General orchestration |

## Fallback

If teams are disabled, OMK warns and falls back to standard `team` skill.
