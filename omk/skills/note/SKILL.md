---
name: note
description: Salva notas para persistência e resiliência
version: 1.0.0
---

# Note Skill

## Purpose
Save notes for session persistence and compaction resilience. Stores thoughts, reminders, and context that survives mode transitions.

## Use When
- Need to remember something across sessions
- Want to preserve context before mode switch
- Taking notes during long workflows
- Recording decisions or findings

## Storage
Notes are saved to `.omk/notepad.md` with structure:
```markdown
# OMK Notepad

## Priority Notes
[High priority items]

## Working Notes
[Active work items]

## Manual Notes
[User-created notes]
```

## Invocation

### Command
```
/omk-note "remember to refactor auth module"
/omk-note --priority "critical: fix security bug before release"
/omk-note --category working "need to add tests for new feature"
```

### Skill
```
$note "text to remember"
$note --priority "urgent item"
$note --list              # List all notes
$note --prune             # Remove completed notes
```

## Categories

| Category | Use For |
|----------|---------|
| `priority` | Critical items requiring immediate attention |
| `working` | Active work in progress |
| `manual` | General notes and reminders |

## Example

```
User: note --priority "Fix race condition in cache before deploying"

Kimi: Note saved to .omk/notepad.md (Priority section)

User: note --list

Kimi: ## Priority Notes
      - Fix race condition in cache before deploying
      
      ## Working Notes
      - Refactoring auth module (in progress)
```

## Auto-Notes

Some modes automatically add notes:
- `ralph` adds progress checkpoints
- `team` adds task completion notes
- `autopilot` adds phase transitions

## Pruning

Remove old/completed notes:
```
$note --prune
```

This moves completed items to `.omk/notepad-archive.md`.

## Integration with Modes

Notes are automatically:
- Loaded at mode start
- Referenced by agents
- Preserved across sessions
- Included in session summaries
