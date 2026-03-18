---
name: deep-interview
description: Entrevista Socrática para clarificar requisitos antes de executar
version: 1.0.0
---

# Deep Interview Skill

## Purpose
Uses Socratic questioning to clarify user's thinking before any code is written. Exposes hidden assumptions and measures clarity across weighted dimensions, ensuring you know exactly what to build before execution begins.

## Use When
- User has vague idea: "I want to build something like..."
- Requirements unclear or contradictory
- User says "interview", "deep interview", "gather requirements", "don't assume"
- Before major feature to prevent rework
- Product discovery phase

## Do Not Use When
- Requirements are clear and specific
- Task is small and well-defined
- User wants immediate execution

## Interview Process

### Phase 1: Clarification Questions
Ask Socratic questions to expose assumptions:

**Functional:**
- What specific problem are you solving?
- Who are the users?
- What does success look like?
- What are the must-haves vs nice-to-haves?

**Technical:**
- What technology stack?
- Any existing constraints?
- Integration requirements?
- Performance expectations?

**Constraints:**
- Timeline?
- Budget?
- Team size?
- Regulatory requirements?

### Phase 2: Clarity Scoring
Rate clarity across dimensions (1-5):
- Functional requirements
- Technical approach
- User definition
- Success metrics
- Constraints

### Phase 3: Specification
Create `.omk/specs/deep-interview-*.md`:
```markdown
# Deep Interview Results

## Problem Statement
[Clear articulation]

## Users
- Primary: [Description]
- Secondary: [Description]

## Requirements
### Must Have
- [Req 1]

### Nice to Have
- [Req 2]

## Constraints
- [Constraint]

## Success Metrics
- [Metric]: [Target]

## Clarity Score: [X]/25
[Dimension scores]

## Recommendation
[Proceed / Needs more clarification]
```

## Dimensions & Weights
| Dimension | Weight | Score |
|-----------|--------|-------|
| Problem clarity | 25% | [1-5] |
| User definition | 20% | [1-5] |
| Functional reqs | 25% | [1-5] |
| Technical clarity | 15% | [1-5] |
| Constraints | 15% | [1-5] |
| **Total** | 100% | **[X]/25** |

## Thresholds
- **20-25**: Clear, proceed to execution
- **15-19**: Mostly clear, minor gaps
- **10-14**: Significant gaps, continue interview
- **<10**: Too vague, need much more clarification

## Invocation

### Keyword
```
deep-interview "I want to build a task management app"
```

### Command
```
/omk-deep-interview "I want to build a task management app"
```

## Example Session
```
User: deep-interview I want to build something like Notion

Kimi: Let's clarify what you're building. I'll ask some questions:

  1. What specific problem does your target user have that Notion solves?
  2. Who is your primary user? (individuals, teams, specific industry?)
  3. What are the MUST-HAVE features for version 1?
  4. What technology stack are you comfortable with?
  5. What's your timeline?
  
  [User answers...]
  
Kimi: Based on our interview, here's what I understand:
  
  ## Problem: [Summary]
  ## Users: [Description]
  ## Must-haves: [List]
  ## Clarity Score: 22/25
  
  We're ready to proceed! Use `$autopilot` or `$plan` to continue.
```
