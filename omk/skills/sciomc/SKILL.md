---
name: sciomc
description: Orquestra agentes cientistas em paralelo para análise comprehensiva
version: 1.0.0
---

# SCIO-MK (Scientific Research)

## Purpose
Orchestrate parallel scientist agents for comprehensive research workflows. Decomposes complex research goals into parallel investigations with verification and synthesis.

## Use When
- Deep analysis of codebase needed
- Complex research questions
- User says "sciomc", "research", "analyze deeply"
- Need comprehensive understanding
- Multiple hypotheses to test
- Cross-cutting concerns analysis

## Do Not Use When
- Simple questions (use direct query)
- Quick lookups (use explore)
- Already know exactly what to do

## Research Protocol

### 1. Decomposition
Break research goal into 3-7 independent stages:

```markdown
## Research Decomposition

**Goal:** [Original research goal]

### Stage 1: [Name]
- **Focus:** What this stage investigates
- **Hypothesis:** Expected finding
- **Scope:** Files/areas to examine
- **Tier:** LOW | MEDIUM | HIGH

### Stage 2: [Name]
...
```

### 2. Execution
Run parallel scientist agents on each stage:

```
Task(subagent_name="researcher", description="[STAGE:1] Investigate...")
Task(subagent_name="researcher", description="[STAGE:2] Analyze...")
Task(subagent_name="architect", description="[STAGE:3] Deep analysis...")
```

### 3. Verification
Cross-validate findings for consistency:
- Check contradictions between stages
- Identify missing connections
- Assess evidence quality

### 4. Synthesis
Aggregate results into comprehensive report.

## Smart Model Routing

| Task Complexity | Agent | Use For |
|----------------|-------|---------|
| **LOW** - Data gathering | `explore` | File enumeration, pattern counting |
| **MEDIUM** - Standard analysis | `analyst` | Code analysis, pattern detection |
| **HIGH** - Complex reasoning | `architect` | Architecture analysis, cross-cutting concerns |

## Routing Guide

| Research Task | Tier | Example |
|---------------|------|---------|
| "Count occurrences of X" | LOW | Count all uses of useState |
| "Find all files matching Y" | LOW | List all test files |
| "Analyze pattern Z" | MEDIUM | Analyze error handling |
| "Document how W works" | MEDIUM | Document auth flow |
| "Explain why X happens" | HIGH | Explain race conditions |
| "Compare approaches A vs B" | HIGH | Compare Redux vs Context |

## State Management

```json
{
  "mode": "sciomc",
  "session_id": "research-20260318-abc123",
  "goal": "Research goal",
  "status": "in_progress",
  "stages": [
    {
      "id": 1,
      "name": "Stage name",
      "tier": "MEDIUM",
      "status": "complete",
      "findings": ".omk/research/stage-1.md"
    }
  ],
  "verification": "pending",
  "started_at": "2026-03-18T16:00:00Z"
}
```

## Directory Structure

```
.omk/research/{session-id}/
├── state.json              # Session state
├── stages/
│   ├── stage-1.md
│   ├── stage-2.md
│   └── ...
├── findings/
│   ├── raw/
│   └── verified/
└── report.md               # Final report
```

## Execution Patterns

### Independent Analysis (Parallel)
```
// All stages fire simultaneously
Task(agent, "[STAGE:1] Analyze src/api/...")
Task(agent, "[STAGE:2] Analyze src/utils/...")
Task(agent, "[STAGE:3] Analyze src/components/...")
```

### Hypothesis Battery (Parallel)
```
// Test multiple hypotheses
Task(agent, "[HYPOTHESIS:A] Test if caching improves...")
Task(agent, "[HYPOTHESIS:B] Test if batching reduces...")
```

### Cross-Validation (Sequential)
```
// Wait for all stages, then verify
[Wait for all parallel stages]
Task(agent, "[VERIFICATION] Validate consistency across findings...")
```

## Concurrency Limits

**Maximum 6 concurrent agents** (kimi-cli limit).

If more stages needed, batch them:
```
Batch 1: Stages 1-6 (parallel)
[wait]
Batch 2: Stages 7-10 (parallel)
```

## Tag Format

Scientists use structured tags:

```
[FINDING:<id>] <title>
<evidence and analysis>
[/FINDING]

[EVIDENCE:<finding-id>]
- File: <path>
- Lines: <range>
- Content: <relevant code>
[/EVIDENCE]

[CONFIDENCE:<HIGH|MEDIUM|LOW>]
<reasoning>

[STAGE_COMPLETE:<id>]
```

## Invocation

### Standard Research
```
/sciomc What are the performance characteristics of different sorting algorithms?
/sciomc How does error handling work across the API layer?
```

### With AUTO Mode
```
/sciomc AUTO: Comprehensive security analysis of authentication system
```

### Session Commands
```
/sciomc status              # Check progress
/sciomc resume              # Resume session
/sciomc list                # List all sessions
/sciomc report <session-id> # Generate report
/sciomc cancel              # Cancel current
```

## Report Template

```markdown
# Research Report: [GOAL]

**Session ID:** [ID]
**Date:** [DATE]
**Status:** [STATUS]

## Executive Summary
[2-3 paragraphs of key findings]

## Methodology

### Research Stages
| Stage | Focus | Tier | Status |
|-------|-------|------|--------|
| [Table]

## Key Findings

### Finding 1: [TITLE]
**Confidence:** [LEVEL]
[Details with evidence]

### Finding 2: [TITLE]
...

## Cross-Validation
[Verification summary]

## Limitations
- [What's not covered]

## Recommendations
1. [Actionable recommendation]
2. [Actionable recommendation]
```

## Example Session

```
User: sciomc Analyze the authentication patterns in this codebase

Kimi: Starting SCIO-MK research session...
      
      [DECOMPOSITION]
      Breaking into 4 stages:
      - Stage 1 (LOW): Enumerate auth-related files
      - Stage 2 (MEDIUM): Analyze login flow
      - Stage 3 (MEDIUM): Review session management
      - Stage 4 (HIGH): Identify security patterns
      
      [EXECUTION]
      Firing stages 1-3 in parallel...
      Stage 1 complete: 12 files found
      Stage 2 complete: Login flow documented
      Stage 3 complete: Session management analyzed
      
      Firing stage 4...
      Stage 4 complete: 3 patterns identified
      
      [VERIFICATION]
      Cross-validating findings...
      All findings consistent ✓
      
      [SYNTHESIS]
      Generating report...
      Report saved to: .omk/research/report.md
      
Research complete! Found 5 key patterns and 2 potential issues.
```

## Cancellation

```
/sciomc cancel
```

Or: "stop research", "cancel research"

Progress preserved in `.omk/research/{session-id}/` for resume.

## Quality Thresholds

| Check | Requirement |
|-------|-------------|
| Evidence present | At least 1 [EVIDENCE] per [FINDING] |
| Confidence stated | Each finding has [CONFIDENCE] |
| Source cited | File paths are valid |
| Reproducible | Another agent could verify |
