# Project Agents Configuration

This project uses **Oh My Kimi (OMK)** multi-agent orchestration.

---

## 🚀 Quick Commands

```bash
# Full autonomous execution
$autopilot "description of what you want built"

# Multi-agent team
$team 3 "task description"

# Must-complete persistence mode
$ralph "task that must be finished"

# Strategic planning
$plan "complex feature to plan"

# Clarify requirements
$deep-interview "vague idea"

# Stop execution
$cancel
```

---

## 👥 Agent Catalog

Use `/agent:name` to invoke specialized agents:

### Build & Analysis
| Agent | Use For | Example |
|-------|---------|---------|
| `/agent:explore` | Codebase navigation | "Find all auth code" |
| `/agent:analyst` | Requirements | "Clarify these specs" |
| `/agent:planner` | Task sequencing | "Plan this feature" |
| `/agent:architect` | System design | "Design the API" |
| `/agent:debugger` | Bug investigation | "Find the root cause" |
| `/agent:executor` | Implementation | "Build this feature" |
| `/agent:verifier` | Validation | "Verify this is done" |

### Review
| Agent | Use For | Example |
|-------|---------|---------|
| `/agent:style-reviewer` | Code style | "Check formatting" |
| `/agent:code-reviewer` | Quality review | "Review this PR" |
| `/agent:api-reviewer` | API design | "Review endpoints" |
| `/agent:security-reviewer` | Security audit | "Check for vulnerabilities" |
| `/agent:performance-reviewer` | Optimization | "Find bottlenecks" |

### Domain Specialists
| Agent | Use For | Example |
|-------|---------|---------|
| `/agent:dependency-expert` | Package evaluation | "Evaluate Prisma vs TypeORM" |
| `/agent:test-engineer` | Test strategy | "Design test suite" |
| `/agent:quality-strategist` | Release readiness | "Assess release quality" |
| `/agent:designer` | UI/UX design | "Design this screen" |
| `/agent:writer` | Documentation | "Write README" |
| `/agent:qa-tester` | Manual testing | "Test this flow" |
| `/agent:git-master` | Version control | "Organize commits" |
| `/agent:researcher` | External knowledge | "Research best practices" |
| `/agent:database-expert` | Database design | "Design schema" |
| `/agent:devops-engineer` | Infrastructure | "Setup CI/CD" |
| `/agent:frontend-specialist` | Frontend dev | "Build React component" |
| `/agent:backend-specialist` | Backend dev | "Build API endpoint" |
| `/agent:mobile-developer` | Mobile apps | "Build mobile screen" |
| `/agent:data-scientist` | Data/ML | "Analyze data" |

### Product
| Agent | Use For | Example |
|-------|---------|---------|
| `/agent:product-manager` | Product strategy | "Define MVP" |
| `/agent:ux-researcher` | Usability | "Audit UX" |
| `/agent:information-architect` | Navigation | "Design navigation" |
| `/agent:product-analyst` | Metrics | "Analyze funnel" |

### Coordination
| Agent | Use For | Example |
|-------|---------|---------|
| `/agent:critic` | Challenge plans | "Challenge this design" |
| `/agent:vision` | Visual analysis | "Analyze screenshot" |

---

## 🎛️ Workflow Skills

| Skill | Description | When to Use |
|-------|-------------|-------------|
| `$autopilot` | Full autonomous execution | End-to-end features |
| `$team` | N coordinated agents | Parallel work |
| `$ralph` | Persistence mode | Must-complete tasks |
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
| `$cancel` | Stop execution | Emergency stop |

---

## 🔄 Common Workflows

### Feature Development
```
analyst → planner → architect → executor → test-engineer → code-reviewer → verifier
```

### Bug Investigation
```
explore → debugger → executor → test-engineer → verifier
```

### Code Review
```
style-reviewer + code-reviewer + api-reviewer + security-reviewer
```

### Refactoring
```
explore → planner → executor → test-engineer → verifier
```

### Documentation
```
researcher → writer → reviewer
```

---

## 📝 Working Agreements

- Write a cleanup plan before modifying code
- Prefer deletion over addition
- Reuse existing utilities and patterns first
- No new dependencies without explicit request
- Keep diffs small and reversible
- Run lint, typecheck, tests after changes
- Final reports include: changed files, simplifications, remaining risks

---

## ⚙️ Configuration

### Project Config: `.omk/config.json`
```json
{
  "project_name": "real-estate-lab",
  "default_agents": ["executor", "debugger", "architect"],
  "custom_rules": [
    "Always use TypeScript",
    "Follow existing naming conventions",
    "Write tests for new features"
  ]
}
```

---

## 🆘 Getting Help

```bash
# Diagnose issues
/omk-doctor

# Show status
/omk-status

# List all agents
/omk-agents

# List all skills
/omk-skills

# Cancel execution
/omk-cancel
```

---

*This project uses Oh My Kimi (OMK) - Multi-agent orchestration for kimi-cli*
