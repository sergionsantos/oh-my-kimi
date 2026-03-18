---
name: hud
description: Configura display HUD (Head-Up Display)
version: 1.0.0
---

# HUD Skill

## Purpose
Configure HUD (Head-Up Display) for real-time orchestration visibility. Shows live status of agents, tasks, and progress.

## Use When
- Want real-time visibility
- Long-running tasks
- Team coordination
- Monitoring progress

## Invocation

### Command
```
/omk-hud setup
/omk-hud preset focused
/omk-hud preset minimal
```

### Skill
```
$hud setup
$hud preset focused
$hud disable
```

## Presets

### focused
Shows essential info only:
- Current mode
- Active agents
- Progress percentage
- Current phase

### minimal
Minimal display:
- Mode name only
- Status indicator

### verbose
Full information:
- All active agents
- Task list with status
- Time elapsed
- Token usage
- Error count

## Configuration

`~/.kimi/omk_config.json`:
```json
{
  "hud": {
    "enabled": true,
    "preset": "focused",
    "refreshRate": 1000,
    "showTokens": true,
    "showTiming": true
  }
}
```

## Display Elements

| Element | Shows |
|---------|-------|
| Mode | Current execution mode |
| Phase | Current pipeline phase |
| Agents | Active / Total agents |
| Progress | Visual progress bar |
| Status | Running / Waiting / Complete |
| Time | Elapsed time |

## Example

```
User: hud preset focused

Kimi: HUD configured with 'focused' preset
      
      ╭─────────────────────────────────╮
      │ OMK HUD | focused               │
      │                                 │
      │ Mode: autopilot                 │
      │ Phase: execution                │
      │ Agents: 3/6 active              │
      │ Progress: [████░░░░░░] 40%      │
      │ Status: running                 │
      │ Time: 2m 34s                    │
      ╰─────────────────────────────────╯
```

## Integration

HUD updates automatically when:
- Mode starts/stops
- Phase transitions
- Agent completes task
- Progress changes

## Disable

```
$hud disable
```
