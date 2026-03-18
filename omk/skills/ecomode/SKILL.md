---
name: ecomode
description: Modo eficiente em tokens usando modelos mais leves
version: 1.0.0
---

# Ecomode Skill

## Purpose
Token-efficient execution using lightweight models for appropriate tasks. Saves 30-50% on tokens by routing simple tasks to lighter models.

## Use When
- User says "ecomode", "eco", "budget"
- Simple, straightforward tasks
- Exploration and research
- Tasks with low complexity
- Cost-conscious execution

## Model Routing

### Low Complexity (Eco)
- **explore**: File finding
- **style-reviewer**: Formatting checks
- **writer**: Documentation drafting

### Standard (Balanced)
- **executor**: Implementation
- **debugger**: Bug fixing
- **test-engineer**: Test writing

### High Complexity (Full)
- **architect**: System design
- **critic**: Deep analysis
- Complex refactoring

## Execution
1. Assess task complexity
2. Select appropriate model tier
3. Execute with chosen model
4. Report token savings

## State
```json
{
  "mode": "ecomode",
  "active": true,
  "savings_estimate": "35%"
}
```

## Invocation

### Keyword
```
ecomode explore the codebase
economode: find all TODOs
```

### Command
```
/omk-ecomode "explore project structure"
```

### Skill
```
$ecomode "explore project structure"
```

## Example
```
User: ecomode find all deprecated functions

Kimi: Running in ecomode (estimated 40% token savings)...
      Using lightweight model for exploration...
      Found 23 deprecated functions.
      Actual savings: 42% vs standard mode.
```
