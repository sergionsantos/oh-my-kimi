---
name: plan
description: Planeamento estratégico com análise de riscos
version: 1.0.0
---

# Plan Skill

## Purpose
Create strategic execution plans with task sequencing, dependency analysis, and risk flags. Helps break down complex work into actionable steps.

## Use When
- Starting new project or feature
- Breaking down large tasks
- Need roadmap with clear steps
- Planning sprints or iterations
- Complex refactoring planned
- User says "plan", "planear", "let's plan"

## Do Not Use When
- Task is clear and immediate (just do it)
- Exploration needed first (use explore)
- Just brainstorming (use deep-interview)

## Execution

### Input Analysis
1. Read current context (if any)
2. Identify constraints
3. Assess scope

### Planning Process
1. Task(`planner`, "Create implementation plan")
2. Task(`architect`, "Validate technical approach")
3. Task(`critic`, "Challenge plan for risks")
4. Synthesize into comprehensive plan

### Output
Creates `.omk/plans/plan-*.md` with:
- Task breakdown
- Dependencies
- Estimates
- Risk flags
- Success criteria

## Plan Format
```markdown
# Plan: [Title]

## Overview
- Total tasks: [N]
- Estimated effort: [Duration]
- Risk level: [Low/Medium/High]

## Phase 1: [Name]
| # | Task | Size | Depends on | Agent |
|---|------|------|------------|-------|
| 1 | [Task] | S/M/L | - | executor |

## Parallel Groups
Group A (can run together): [tasks]
Group B (can run together): [tasks]

## Risk Flags
- [Risk]: [Probability] → [Mitigation]

## Success Criteria
- [ ] [Criterion 1]
- [ ] [Criterion 2]
```

## Invocation

### Keyword
```
plan this: implement OAuth authentication
```

### Command
```
/omk-plan "implement OAuth authentication"
```

### With Options
```
/omk-plan --review "assess this existing plan"
```

## Plan vs Ralplan
| Aspect | Plan | Ralplan |
|--------|------|---------|
| Speed | Fast | Thorough |
| Agents | Planner + Architect | Planner + Architect + Critic |
| Use for | Quick planning | High-risk/complex projects |
| Output | Single plan | Consensus-validated plan |
