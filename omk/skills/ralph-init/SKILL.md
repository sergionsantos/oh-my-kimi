---
name: ralph-init
description: Inicializa PRD para ralph estruturado
version: 1.0.0
---

# Ralph-Init Skill

## Purpose
Initialize PRD (Product Requirements Document) for structured ralph execution. Creates the planning artifacts required before ralph can run.

## Use When
- Starting ralph for complex task
- Need structured planning
- Want PRD + test spec before execution
- Enforcing ralplan-first workflow

## Requirements

Ralph requires before execution:
1. `.omk/plans/prd-*.md` - Product Requirements Document
2. `.omk/plans/test-spec-*.md` - Test specifications

## Invocation

### Command
```
/omk-ralph-init "implement payment system"
```

### Skill
```
$ralph-init "feature description"
$ralph-init --from-interview  # Use deep-interview results
$ralph-init --template full
```

## Process

### 1. Requirements Gathering
If not provided, runs `deep-interview`:
```
[Deep interview to clarify requirements]
```

### 2. PRD Creation
Creates comprehensive PRD:
```markdown
# PRD: Payment System

## Overview
[Description]

## Goals
- [Goal 1]
- [Goal 2]

## Non-Goals
- [Out of scope]

## Requirements

### Functional
- [Requirement 1]
- [Requirement 2]

### Technical
- [Technical req 1]
- [Technical req 2]

## Architecture
[High-level design]

## API Design
[Endpoints/contracts]

## Data Model
[Schema]

## UI/UX
[Design notes]

## Security
[Security considerations]

## Performance
[Requirements]

## Open Questions
[Unresolved items]
```

### 3. Test Spec Creation
Creates test specifications:
```markdown
# Test Spec: Payment System

## Test Categories

### Unit Tests
- [ ] Payment validation
- [ ] Amount calculation
- [ ] Error handling

### Integration Tests
- [ ] Payment flow
- [ ] Webhook handling
- [ ] Refund process

### E2E Tests
- [ ] Complete purchase
- [ ] Failed payment retry
- [ ] Refund workflow

## Test Data
[Fixtures and mocks]

## Edge Cases
- [Edge case 1]
- [Edge case 2]
```

### 4. Validation
```
✓ PRD reviewed by architect
✓ Test spec reviewed by test-engineer
✓ Requirements clear and complete
```

## Output

Creates:
```
.omk/plans/
├── prd-payment-system.md
└── test-spec-payment-system.md
```

## Example

```
User: ralph-init "implement Stripe integration"

Kimi: Initializing Ralph PRD...
      
      [1/4] Gathering requirements
      Running deep-interview...
      Requirements clarified ✓
      
      [2/4] Creating PRD
      ✓ Overview
      ✓ Goals/Non-goals
      ✓ Requirements
      ✓ Architecture
      ✓ API design
      ✓ Data model
      ✓ Security considerations
      
      [3/4] Creating test spec
      ✓ Unit tests
      ✓ Integration tests
      ✓ E2E tests
      ✓ Edge cases
      
      [4/4] Validation
      ✓ Architect review
      ✓ Test-engineer review
      
PRD and test spec ready!
You can now run: $ralph "implement Stripe integration"
```

## Ralph Integration

When ralph starts:
```
if (!prdExists || !testSpecExists) {
  prompt: "Run ralph-init first?"
}
```

## Templates

### full (default)
Complete PRD with all sections.

### minimal
Essential sections only.

### technical
Focus on technical requirements.
