---
name: trace
description: Mostra timeline de execução e estatísticas
version: 1.0.0
---

# Trace Skill

## Purpose
Show execution timeline and statistics. Debug and optimize agent orchestration by visualizing what happened when.

## Use When
- Debugging slow execution
- Understanding agent flow
- Optimizing workflows
- Analyzing performance
- Post-mortem analysis

## Invocation

### Command
```
/omk-trace timeline
/omk-trace summary
/omk-trace stats
```

### Skill
```
$trace timeline          # Chronological events
$trace summary           # Aggregate statistics
$trace stats             # Token usage, timing
$trace agent <name>      # Specific agent trace
```

## Timeline Output

```
$trace timeline

Execution Timeline: autopilot-session-abc123

16:00:00  [START]     autopilot mode activated
16:00:05  [AGENT]     analyst started
16:00:45  [COMPLETE]  analyst finished
16:00:46  [AGENT]     architect started
16:01:30  [COMPLETE]  architect finished
16:01:31  [AGENT]     executor started (parallel x3)
16:02:15  [COMPLETE]  executor-1 finished
16:02:20  [COMPLETE]  executor-2 finished
16:02:45  [COMPLETE]  executor-3 finished
16:02:46  [AGENT]     verifier started
16:03:00  [COMPLETE]  verifier finished
16:03:01  [END]       autopilot complete

Total time: 3m 1s
```

## Summary Output

```
$trace summary

Session: autopilot-session-abc123
Mode: autopilot
Status: complete

## Agent Usage
| Agent       | Count | Time   | Tokens |
|-------------|-------|--------|--------|
| analyst     | 1     | 45s    | 2,340  |
| architect   | 1     | 44s    | 3,120  |
| executor    | 3     | 74s    | 8,450  |
| verifier    | 1     | 14s    | 1,230  |
| **Total**   | **6** | **3m** | **15,140** |

## Phase Breakdown
| Phase      | Duration | % Total |
|------------|----------|---------|
| Planning   | 1m 29s   | 49%     |
| Execution  | 1m 14s   | 41%     |
| Verification| 14s     | 8%      |
| Overhead   | 4s       | 2%      |

## Bottlenecks
1. executor-3 waited 30s for dependencies
2. verifier could start earlier
```

## Statistics

```
$trace stats

## Token Usage
- Input: 8,230 tokens
- Output: 6,910 tokens
- Total: 15,140 tokens
- Cost estimate: $0.45

## Timing
- Total: 3m 1s
- Active: 2m 57s
- Idle: 4s
- Parallel efficiency: 85%

## Agents Spawned
- Total: 6
- Max parallel: 3
- Average duration: 45s
```

## Export

```
$trace export json > trace.json
$trace export html > report.html
```

## Storage

Traces stored in `.omk/traces/`:
```
.omk/traces/
├── 2026-03-18/
│   ├── autopilot-abc123.json
│   └── team-def456.json
```

## Auto-Trace

Enable automatic tracing:
```json
{
  "trace": {
    "autoTrace": true,
    "retentionDays": 30
  }
}
```
