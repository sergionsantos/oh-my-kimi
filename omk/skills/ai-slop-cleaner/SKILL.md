---
name: ai-slop-cleaner
description: Limpa código gerado por AI - remove duplicação, código morto, abstrações desnecessárias
version: 1.0.0
---

# AI Slop Cleaner Skill

## Purpose
Regression-safe cleanup workflow for duplicate code, dead code, needless abstractions, and boundary violations. Uses separate writer/reviewer passes for safety.

## Use When
- User says "cleanup", "deslop", "anti-slop"
- AI-generated code needs refinement
- Code has duplication
- Dead code present
- Needless abstractions
- Before code review

## Execution

### Phase 1: Analysis
1. Task(`explorer`, "Map codebase for issues")
2. Identify:
   - Duplicate code
   - Dead/unused code
   - Needless abstractions
   - Boundary violations

### Phase 2: Planning
Create cleanup plan:
- Order: dead code → duplication → naming → tests
- Lock behavior with tests first
- Plan rollback strategy

### Phase 3: Cleanup (Writer Pass)
Task(`executor`, "Execute cleanup plan")

### Phase 4: Review (Reviewer Pass)
Task(`code-reviewer`, "Review cleanup changes independently")
- Same pass cannot author and approve
- Must have independent review

### Phase 5: Validation
- Run tests
- Run lint
- Verify no behavior changes

## Cleanup Plan Template
```markdown
## Cleanup Plan

### Issues Found
- [ ] Dead code: [locations]
- [ ] Duplication: [locations]
- [ ] Needless abstraction: [locations]

### Execution Order
1. Remove dead code
2. Consolidate duplication
3. Simplify abstractions
4. Improve naming
5. Verify tests still pass

### Safety Measures
- Tests locked before changes
- Small, reversible commits
- Independent review required
```

## State
```json
{
  "mode": "ai-slop-cleaner",
  "active": true,
  "current_phase": "analysis",
  "started_at": "2026-03-18T15:30:00Z"
}
```

## Invocation

### Keyword
```
cleanup this code
deslop the authentication module
```

### Command
```
/omk-ai-slop-cleaner "clean up auth module"
/omk-ai-slop-cleaner --review "review-only pass"
```

### Skill
```
$ai-slop-cleaner "clean up auth module"
```

## Example
```
User: cleanup this React component

Kimi: Analyzing for AI slop patterns...
      Found:
      - 3 duplicate helper functions
      - 2 unused imports
      - 1 needless abstraction
      
      Creating cleanup plan...
      [Plan created]
      
      Executing cleanup (writer pass)...
      [Changes made]
      
      Independent review (reviewer pass)...
      ✅ Review approved
      
      Validation: All tests pass
      Cleanup complete! -120 lines, +0 bugs
```

## Quality Gates
- Lint: ✅
- Typecheck: ✅
- Tests: ✅
- Review: ✅
