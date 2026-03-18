---
name: autopilot
description: Execução autónoma completa - da ideia ao código funcional
version: 1.0.0
---

# Autopilot Skill

## Purpose
Autopilot takes a brief product idea and autonomously handles the full lifecycle: requirements analysis, technical design, planning, parallel implementation, QA cycling, and multi-perspective validation. It produces working, verified code from a 2-3 line description.

## Use When
- User wants end-to-end autonomous execution from an idea to working code
- User says "autopilot", "auto pilot", "autonomous", "build me", "create me", "make me", "full auto", "handle it all", or "I want a/an..."
- Task requires multiple phases: planning, coding, testing, and validation
- User wants hands-off execution and is willing to let the system run to completion

## Do Not Use When
- User wants to explore options or brainstorm -- use `plan` skill instead
- User says "just explain", "draft only", or "what would you suggest" -- respond conversationally
- User wants a single focused code change -- use `ralph` or delegate to an executor agent
- User wants to review or critique an existing plan -- use `plan --review`
- Task is a quick fix or small bug -- use direct executor delegation

## Why This Exists
Most non-trivial software tasks require coordinated phases: understanding requirements, designing a solution, implementing in parallel, testing, and validating quality. Autopilot orchestrates all of these phases automatically so the user can describe what they want and receive working code without managing each step.

## Execution Policy
- Each phase must complete before the next begins
- Parallel execution is used within phases where possible (Phase 2 and Phase 4)
- QA cycles repeat up to 5 times; if the same error persists 3 times, stop and report the fundamental issue
- Validation requires approval from all reviewers; rejected items get fixed and re-validated
- Cancel with `/omk-cancel` at any time; progress is preserved for resume

## State Management
Autopilot uses `.omk/state/autopilot.json` for persistence:
```json
{
  "mode": "autopilot",
  "active": true,
  "current_phase": "execution",
  "started_at": "2026-03-18T15:30:00Z",
  "phases_completed": ["expansion", "planning"],
  "artifacts": [
    ".omk/specs/autopilot-spec.md",
    ".omk/plans/autopilot-impl.md"
  ]
}
```

## Phases

### Phase 0 - Expansion
Turn the user's idea into a detailed spec.
- **If ralplan consensus plan exists** (`.omk/plans/ralplan-*.md` or `.omk/plans/consensus-*.md`): Skip BOTH Phase 0 and Phase 1 — jump directly to Phase 2 (Execution)
- **If deep-interview spec exists** (`.omk/specs/deep-interview-*.md`): Skip analyst+architect expansion, use the pre-validated spec directly as Phase 0 output. Continue to Phase 1 (Planning)
- **If input is vague** (no file paths, function names, or concrete anchors): Offer redirect to `/deep-interview` for Socratic clarification before expanding
- **Otherwise**: 
  1. Task(`analyst`, "Extract requirements from: [user input]")
  2. Task(`architect`, "Create technical specification based on analyst output")
  3. Synthesize into `.omk/specs/autopilot-spec.md`

### Phase 1 - Planning
Create an implementation plan from the spec.
- **If ralplan consensus plan exists**: Skip — already done
- Otherwise:
  1. Task(`planner`, "Create implementation plan from spec")
  2. Task(`architect`, "Validate technical approach")
  3. Output: `.omk/plans/autopilot-impl.md`

### Phase 2 - Execution
Implement the plan using parallel agents.
1. Read implementation plan
2. Break into independent tasks
3. For each task group (up to 6 parallel):
   - Task(`executor`, "Implement: [task description]")
4. Collect results
5. Update state after each batch

### Phase 3 - QA
Cycle until all tests pass (UltraQA mode)
1. Run tests: `npm test` or equivalent
2. Run lint: `npm run lint`
3. Run typecheck: `npm run typecheck` or `tsc --noEmit`
4. If failures:
   - Task(`debugger`, "Fix: [specific failures]")
   - Increment retry count
   - If same error 3 times → STOP, report fundamental issue
   - If retry count > 5 → STOP, report
5. Repeat until pass

### Phase 4 - Validation
Multi-perspective review in parallel
1. Task(`architect`, "Validate functional completeness")
2. Task(`security-reviewer`, "Security vulnerability check")
3. Task(`code-reviewer`, "Quality review")
4. Collect all reviews
5. If any rejection:
   - Task(`executor`, "Fix: [specific issues]")
   - Re-run validation
6. If all approve → proceed

### Phase 5 - Cleanup
Delete all state files on successful completion
- Remove `.omk/state/autopilot-state.json`
- Remove `ralph-state.json`, `ultrawork-state.json`, `ultraqa-state.json` if present
- Run `/omk-cancel` for clean exit

## Tool Usage
- Use `Task(subagent_name="architect", ...)` for Phase 4 architecture validation
- Use `Task(subagent_name="security-reviewer", ...)` for Phase 4 security review
- Use `Task(subagent_name="code-reviewer", ...)` for Phase 4 quality review
- Agents form their own analysis first, then spawn Task agents for cross-validation
- Never block on external tools; proceed with available agents if delegation fails

## Invocation

### Via Keyword
```
autopilot: build a REST API for managing tasks
```

### Via Command
```
/omk-autopilot "build a REST API for managing tasks"
```

### Via Skill
```
$autopilot "build a REST API for managing tasks"
```

## Examples

### Good
**User**: "autopilot A REST API for a bookstore inventory with CRUD operations using TypeScript"
**Why good**: Specific domain (bookstore), clear features (CRUD), technology constraint (TypeScript). Autopilot has enough context to expand into a full spec.

**User**: "build me a CLI tool that tracks daily habits with streak counting"
**Why good**: Clear product concept with a specific feature. The "build me" trigger activates autopilot.

### Bad
**User**: "fix the bug in the login page"
**Why bad**: This is a single focused fix, not a multi-phase project. Use direct executor delegation or ralph instead.

**User**: "what are some good approaches for adding caching?"
**Why bad**: This is an exploration/brainstorming request. Respond conversationally or use the plan skill.

## Resume Capability
If autopilot is interrupted, it can resume from the last completed phase:
1. Read `.omk/state/autopilot.json`
2. Identify `current_phase`
3. Continue from that phase
4. Skip already completed work
