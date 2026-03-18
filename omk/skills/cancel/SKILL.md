---
name: cancel
description: Cancela modos de execução ativos
version: 1.0.0
---

# Cancel Skill

## Purpose
Cancel active execution modes gracefully. Clears state files and stops active loops.

## Use When
- All tasks are done and verified
- Work is blocked and cannot proceed
- User says "stop", "cancel", "abort"
- Need to exit current mode

## Do Not Use When
- Work is still incomplete (continue working)
- Single subtask failed but others can continue (fix and retry)

## Execution
1. Read current state (if any)
2. Set `active: false` in state files
3. Clear temporary state
4. Preserve artifacts for resume
5. Report cancellation

## State Cleanup
- Sets `active: false`
- Sets `cancelled_at: timestamp`
- Preserves artifacts for potential resume
- Clears in-memory state

## Invocation

### Keyword
```
cancel
stop
abort
```

### Command
```
/omk-cancel
```

### Skill
```
$cancel
```

## Example
```
User: cancel

Kimi: Cancelling active mode...
      Mode: autopilot
      Phase: execution
      Progress saved to .omk/state/autopilot.json
      Cancellation complete. Use `$autopilot --resume` to continue.
```

## Resume After Cancel
Most modes support resuming after cancellation:
```
$autopilot --resume
$ralph --resume
$team --resume
```
