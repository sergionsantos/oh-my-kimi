---
name: oh-my-kimi
description: Sistema de orquestração multi-agente para kimi-cli
version: 1.0.0
author: OMK Contributors
---

# Oh My Kimi (OMK) - Sistema de Orquestração Multi-Agente

> **Zero configuration required. Works out of the box with intelligent defaults.**
> 
> **Don't learn kimi-cli. Just use OMK.**

## Quick Start

```bash
# 1. Setup (run once)
/omk-setup

# 2. Use any skill
$autopilot "build a REST API for tasks"

# That's it. Everything else is automatic.
```

## What is OMK?

Oh My Kimi is a multi-agent orchestration layer for kimi-cli. It coordinates specialized agents, tools, and skills so work is completed accurately and efficiently.

### Key Features

- **Zero configuration** - Works out of the box
- **32 specialized agents** - For every type of work
- **Natural language interface** - Just describe what you want
- **Automatic parallelization** - Complex tasks distributed across agents
- **Persistent execution** - Won't give up until the job is verified complete
- **Magic keywords** - `autopilot`, `team`, `ralph`, `plan`

## Magic Keywords

Optional shortcuts for power users. Natural language works fine without them.

| Keyword | Skill | Effect | Example |
|---------|-------|--------|---------|
| `autopilot` | `$autopilot` | Full autonomous execution | `autopilot: build a todo app` |
| `team` | `$team` | Multi-agent coordination | `team 3: fix all errors` |
| `ralph` | `$ralph` | Persistence mode | `ralph: refactor auth` |
| `plan` | `$plan` | Strategic planning | `plan this feature` |
| `ralplan` | `$ralplan` | Consensus planning | `ralplan architecture` |
| `ulw` / `ultrawork` | `$ultrawork` | Maximum parallelism | `ulw fix all errors` |
| `deep-interview` | `$deep-interview` | Socratic requirements | `deep-interview "vague idea"` |
| `cancel` / `stop` | `$cancel` | Stop active modes | `cancel` |
| `sciomc` / `research` | `$sciomc` | Scientific research | `sciomc: analyze auth patterns` |

## Agent Catalog

### Build/Analysis Lane
- `/agent:explore` - Fast codebase search, file/symbol mapping
- `/agent:analyst` - Requirements clarity, acceptance criteria
- `/agent:planner` - Task sequencing, execution plans
- `/agent:architect` - System design, boundaries, interfaces
- `/agent:debugger` - Root-cause analysis, regression isolation
- `/agent:executor` - Code implementation, refactoring
- `/agent:verifier` - Completion evidence, claim validation

### Review Lane
- `/agent:style-reviewer` - Formatting, naming, idioms
- `/agent:code-reviewer` - Comprehensive review, logic defects
- `/agent:api-reviewer` - API contracts, versioning
- `/agent:security-reviewer` - Vulnerabilities, trust boundaries
- `/agent:performance-reviewer` - Hotspots, optimization

### Domain Specialists
- `/agent:dependency-expert` - SDK/API/package evaluation
- `/agent:test-engineer` - Test strategy, coverage
- `/agent:code-simplifier` - Code simplification
- `/agent:document-specialist` - External documentation
- `/agent:scientist` - Research methodology
- `/agent:tracer` - Execution tracing
- `/agent:quality-strategist` - Quality gates, release readiness
- `/agent:designer` - UX/UI architecture
- `/agent:writer` - Documentation, guides
- `/agent:qa-tester` - Interactive testing
- `/agent:git-master` - Commit strategy, history
- `/agent:researcher` - External docs, best practices
- `/agent:database-expert` - Schema design, query optimization
- `/agent:devops-engineer` - CI/CD, infrastructure
- `/agent:frontend-specialist` - React, Vue, Angular
- `/agent:backend-specialist` - APIs, services
- `/agent:mobile-developer` - iOS, Android, React Native
- `/agent:data-scientist` - Analysis, ML models

### Product Lane
- `/agent:product-manager` - Problem framing, PRDs
- `/agent:ux-researcher` - Heuristic audits, usability
- `/agent:information-architect` - Taxonomy, navigation
- `/agent:product-analyst` - Metrics, funnels, experiments

### Coordination
- `/agent:critic` - Plan/design critical challenge
- `/agent:vision` - Image/screenshot analysis

## Workflow Skills

| Skill | Description | Best For |
|-------|-------------|----------|
| `$autopilot` | Full autonomous execution | End-to-end features |
| `$team` | N coordinated agents | Parallel work |
| `$ralph` | Persistence loop | Must-complete tasks |
| `$plan` | Strategic planning | Breaking down work |
| `$deep-interview` | Socratic clarification | Vague requirements |
| `$ralplan` | Consensus planning | High-risk projects |
| `$ultrawork` | Maximum parallelism | Bulk operations |
| `$ultraqa` | QA cycling | Quality validation |
| `$ecomode` | Token-efficient | Cost-conscious |
| `$web-clone` | Website cloning | Learning/replication |
| `$ai-slop-cleaner` | Code cleanup | Refining AI output |
| `$sciomc` | Scientific research | Deep codebase analysis |
| `$external-context` | External docs | Documentation lookup |
| `$ask` | Ask other AIs | Query Claude/Codex/Gemini |
| `$ccg` | Tri-model advisor | Claude+Codex+Gemini synthesis |
| `$note` | Persistent notes | Save session notes |
| `$deepinit` | Project init | Generate AGENTS.md |
| `$hud` | HUD display | Real-time status display |
| `$learner` | Skill extraction | Learn from sessions |
| `$mcp-setup` | MCP servers | Configure MCP tools |
| `$project-session-manager` | Isolated envs | Manage project sessions |
| `$trace` | Execution tracing | Timeline and stats |
| `$release` | Release workflow | Automated releases |
| `$skill` | Skill management | Manage local skills |
| `$configure-notifications` | Notifications | Discord/Slack/Telegram |
| `$writer-memory` | Writer memory | Persistent writing context |
| `$ralph-init` | Ralph PRD init | Initialize structured ralph |
| `$setup` | Unified setup | Complete system setup |
| `$cancel` | Stop execution | Emergency stop |

## Usage Examples

### Build something from scratch
```
$autopilot "build a REST API for managing tasks with TypeScript and Express"
```

### Fix all errors in parallel
```
$team 3 "fix all TypeScript errors in the codebase"
```

### Must-complete refactoring
```
$ralph "refactor the authentication module to use JWT"
```

### Plan before building
```
$plan "implement OAuth authentication"
```

### Clarify vague requirements
```
$deep-interview "I want to build something like Airbnb but for cars"
```

### Multi-perspective review
```
$team 1:security-reviewer,1:code-reviewer "review this PR"
```

## Project Structure

OMK uses `.omk/` directory for persistent state:

```
.omk/
├── state/           # Mode state files (JSON)
├── plans/           # Planning documents
├── specs/           # Specifications
├── logs/            # Audit logs
└── config.json      # Project configuration
```

## Configuration

### Global Config: `~/.kimi/omk_config.json`
```json
{
  "version": "1.0.0",
  "default_mode": "team",
  "max_parallel_agents": 6,
  "auto_save": true,
  "preferences": {
    "language": "pt",
    "verbosity": "normal"
  }
}
```

### Project Config: `.omk/config.json`
```json
{
  "project_name": "my-project",
  "default_agents": ["executor", "debugger"],
  "custom_rules": []
}
```

## Commands Reference

| Command | Description |
|---------|-------------|
| `/omk-setup` | Install and configure OMK |
| `/omk-doctor` | Diagnose issues |
| `/omk-cancel` | Stop active mode |
| `/omk-status` | Show current status |
| `/omk-agents` | List all agents |
| `/omk-skills` | List all skills |

## Best Practices

1. **Start with exploration** - Use explore agent on unfamiliar codebases
2. **Clarify before building** - Use deep-interview for vague requirements
3. **Plan significant work** - Use plan or ralplan before major features
4. **Parallelize when possible** - Use team or ultrawork for independent tasks
5. **Verify completion** - Always include verification before claiming done

## Troubleshooting

### Issue: Agents not responding
```bash
/omk-doctor --fix
```

### Issue: State corruption
```bash
# Clear state
/omk-cancel
rm -rf .omk/state/*
```

### Issue: Need to resume
```bash
$autopilot --resume
$ralph --resume
```

## Integration with Projects

Add to your project's `AGENTS.md`:

```markdown
# Project Agents

This project uses OMK multi-agent orchestration.

## Quick Commands
```
$autopilot "description"
$team N "task"
$ralph "must-complete task"
```

## Team Compositions

Feature Development:
```
analyst → planner → executor → test-engineer → code-reviewer
```

Bug Fix:
```
debugger → executor → test-engineer → verifier
```
```

## License

MIT - See LICENSE file
