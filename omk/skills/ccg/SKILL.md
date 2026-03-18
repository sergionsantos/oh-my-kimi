---
name: ccg
description: Tri-model advisor - sintetiza respostas de Codex, Claude e Gemini
version: 1.0.0
---

# CCG Skill (Claude + Codex + Gemini)

## Purpose
Tri-model advisor synthesis. Routes via `/ask codex` + `/ask gemini`, then Claude synthesizes the combined insights.

## Use When
- Need comprehensive analysis from multiple AI perspectives
- Complex decisions requiring multiple viewpoints
- Want to leverage strengths of each model:
  - **Codex**: Code review, architecture
  - **Gemini**: UI/UX, design, large context
  - **Claude**: Synthesis, reasoning, final decisions

## Invocation

### Command
```
/ccg "Review this PR - architecture (Codex) and UI components (Gemini)"
/ccg "Analyze this codebase structure"
```

### Skill
```
$ccg "task description"
$ccg --focus architecture "design review"
$ccg --focus ui "component review"
```

## Workflow

### Step 1: Parallel Ask
```
Task(ask, "codex", "Review architecture: {task}")
Task(ask, "gemini", "Review UI/design: {task}")
```

### Step 2: Synthesis
Claude analyzes both responses and creates unified recommendation.

## Output Format

```markdown
# CCG Tri-Model Analysis

## Original Task
{task description}

## Codex Perspective
{Codex findings}

## Gemini Perspective
{Gemini findings}

## Synthesis (Claude)

### Agreements
- Point both models agreed on

### Unique Insights
- Codex unique: {insight}
- Gemini unique: {insight}

### Recommendations
1. {Combined recommendation}
2. {Combined recommendation}

### Confidence
- High confidence: {areas}
- Needs clarification: {areas}
```

## Example

```
User: ccg Review this PR - architecture and UI components

Kimi: Starting CCG tri-model analysis...
      
      [1/3] Querying Codex for architecture review...
      [2/3] Querying Gemini for UI review...
      [3/3] Synthesizing with Claude...
      
      ## CCG Analysis Complete
      
      ### Codex found:
      - API design issues
      - Database query optimizations
      
      ### Gemini found:
      - Accessibility improvements
      - Responsive design issues
      
      ### Claude's synthesis:
      Priority fixes:
      1. Fix N+1 query (Codex) - HIGH
      2. Add ARIA labels (Gemini) - MEDIUM
      3. Refactor API endpoints (Codex) - MEDIUM
```

## Comparison Table

| Model | Best For |
|-------|----------|
| Codex | Architecture, security, code review |
| Gemini | UI/UX, design, docs, large context |
| Claude | Synthesis, reasoning, final decisions |

## When to Use CCG vs Single Model

**Use CCG when:**
- High-stakes decisions
- Complex multi-faceted problems
- Need cross-validation
- Unsure which model is best

**Use single model when:**
- Simple, focused task
- Time critical
- Already know best model for task
