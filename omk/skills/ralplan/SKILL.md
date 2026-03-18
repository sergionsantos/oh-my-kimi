---
name: ralplan
description: Planeamento iterativo com consenso validado
version: 1.0.0
---

# Ralplan Skill

## Purpose
Iterative consensus planning with RALPLAN-DR structured deliberation. Creates plans validated by multiple perspectives (planner + architect + critic).

## Use When
- High-risk projects needing thorough planning
- Complex architecture decisions
- User says "ralplan", "consensus plan"
- Before ralph execution for critical tasks
- When plan quality is paramount

## Do Not Use When
- Quick planning needed (use plan)
- Requirements unclear (use deep-interview first)
- Low-risk, straightforward tasks

## RALPLAN-DR Process

### Phase 1: Planner
Task(`planner`, "Create initial plan")
- Task breakdown
- Sequencing
- Estimation

### Phase 2: Architect Review
Task(`architect`, "Validate technical approach of plan")
- Technical feasibility
- Architecture soundness
- Scalability assessment

### Phase 3: Critic Challenge
Task(`critic`, "Challenge plan for risks and gaps")
- Assumption testing
- Risk identification
- Edge case analysis

### Phase 4: Consensus Resolution
Synthesize all perspectives:
- Incorporate valid concerns
- Resolve conflicts
- Finalize consensus plan

### Phase 5: Documentation
Create:
- `.omk/plans/ralplan-*.md` (consensus plan)
- `.omk/plans/prd-*.md` (product requirements)
- `.omk/plans/test-spec-*.md` (test specifications)

## Deliberation Modes

### Short (Default)
- Quick review by architect + critic
- Single round of feedback
- Suitable for most projects

### Deliberate (--deliberate flag)
- Multiple rounds of refinement
- Deep analysis of tradeoffs
- For high-risk/complex projects

## Invocation

### Keyword
```
ralplan this feature
```

### Command
```
/omk-ralplan "design authentication system"
/omk-ralplan --deliberate "design payment processing"
```

### Skill
```
$ralplan "design authentication system"
```

## Output Format
```markdown
# RALPLAN Consensus Plan

## Participants
- Planner: [Summary of approach]
- Architect: [Technical validation]
- Critic: [Risks identified]

## Consensus Decisions
[Where agreement was reached]

## Resolved Conflicts
| Issue | Planner | Architect | Critic | Resolution |
|-------|---------|-----------|--------|------------|
| [Issue] | [View] | [View] | [View] | [Decision] |

## Final Plan
[Consensus-validated plan]

## Risk Acceptance
[Risks acknowledged and accepted]
```

## Ralph Integration
When ralph is active, it checks for ralplan artifacts:
```
if (.omk/plans/ralplan-*.md exists) {
  skip to execution
} else {
  prompt: "Planning required. Run ralplan first?"
}
```

## Example
```
User: ralplan design the microservices architecture

Kimi: Starting RALPLAN deliberation...

  [Planner]: Breaking down into services...
  [Architect]: Validating service boundaries...
  [Critic]: Identifying coupling risks...
  
  Resolution: Service A and B should be merged
  
  Consensus reached! Plan saved to .omk/plans/ralplan-architecture.md
  Ready for execution with $ralph or $autopilot
```
