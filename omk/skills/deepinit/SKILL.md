---
name: deepinit
description: Gera AGENTS.md hierárquico para o projeto
version: 1.0.0
---

# DeepInit Skill

## Purpose
Generate hierarchical AGENTS.md for the project. Creates a structured agent configuration based on project analysis.

## Use When
- Starting new project
- Want structured AGENTS.md
- Need to formalize team workflows
- Bootstrapping OMK configuration

## Invocation

### Command
```
/omk-deepinit
/omk-deepinit --template full
```

### Skill
```
$deepinit
$deepinit --template minimal
$deepinit --template full
```

## Templates

### Minimal
Basic structure with essential agents only.

### Full (Default)
Complete structure with all 32 agents and workflows.

## Output Structure

Creates `AGENTS.md`:
```markdown
# {Project Name} - Agent Configuration

## Project Overview
- Type: {detected type}
- Stack: {detected stack}
- Test Framework: {detected}

## Quick Commands
```
$autopilot "description"
$team N "task"
```

## Agent Catalog

### Build Lane
- `/agent:explore` - Navigation
- `/agent:architect` - Design
...

## Team Compositions

### Feature Development
```
analyst → planner → executor → test-engineer
```

### Bug Fix
```
debugger → executor → verifier
```

## Working Agreements
- [ ] Tests required for new features
- [ ] Code review before merge
...
```

## Detection

DeepInit auto-detects:
- Project type (web, mobile, API, etc.)
- Technology stack
- Test framework
- Package manager
- Git workflow

## Example

```
User: deepinit

Kimi: Analyzing project structure...
      Detected: Node.js + TypeScript + React
      Test: Jest
      Package: npm
      
      Generating AGENTS.md...
      ✓ Created full template
      ✓ Customized for React project
      ✓ Added React-specific workflows
      
AGENTS.md created! Review and customize as needed.
```

## After Init

1. Review generated `AGENTS.md`
2. Customize team compositions
3. Add project-specific rules
4. Commit to repository
