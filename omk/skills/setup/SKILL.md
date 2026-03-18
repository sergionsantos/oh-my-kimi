---
name: setup
description: Setup unificado - instalação, diagnósticos e configuração MCP
version: 1.0.0
---

# Setup Skill (Unified)

## Purpose
Unified setup entrypoint for install, diagnostics, and MCP configuration. One command to set everything up.

## Use When
- First time using OMK
- After updates
- Need to reconfigure
- New project setup

## Differences from omc-setup

| Feature | setup | omc-setup |
|---------|-------|-----------|
| Scope | Full system | OMK only |
| MCP | Includes MCP setup | OMK only |
| Diagnostics | Built-in | Separate (omc-doctor) |
| Use case | Initial setup | OMK-specific |

## Invocation

### Command
```
/omk-setup
/omk-setup --full
```

### Skill
```
$setup
$setup --full      # Complete setup with MCP
$setup --quick     # Minimal setup
$setup --check     # Check only, don't install
```

## Setup Steps

### 1. Environment Check
```
✓ Node.js >= 20
✓ Git
✓ kimi-cli
✓ Shell access
```

### 2. Install Skills
```
✓ Core skills (autopilot, team, ralph, etc.)
✓ Utility skills
✓ Custom skills
```

### 3. Configure MCP (optional)
```
? Setup MCP servers? [y/N]
✓ Filesystem
✓ Git
✓ Web search
```

### 4. Project Setup
```
✓ Create .omk/ directory
✓ Create AGENTS.md
✓ Create .gitignore entries
```

### 5. Diagnostics
```
✓ Run health check
✓ Verify installation
✓ Test agent spawning
```

## Configuration

Creates/updates:
- `~/.kimi/omk_config.json`
- `.omk/config.json`
- `.omk/mcp.json` (if MCP enabled)

## Example

```
User: setup

Kimi: 🚀 Oh My Kimi - Unified Setup
      
      [1/5] Environment Check
      ✓ Node.js v22.14.0
      ✓ Git 2.43.0
      ✓ kimi-cli 1.0.0
      
      [2/5] Install Skills
      Installing to ~/.kimi/skills/omk/
      ✓ autopilot
      ✓ team
      ✓ ralph
      ✓ ... (33 skills)
      
      [3/5] Configure MCP
      ? Setup MCP servers? Yes
      ✓ Filesystem
      ✓ Git
      ✓ Web search (Brave API key provided)
      
      [4/5] Project Setup
      ? Create AGENTS.md? Yes
      ✓ .omk/ directory
      ✓ AGENTS.md
      ✓ .gitignore updated
      
      [5/5] Diagnostics
      ✓ All agents accessible
      ✓ State management working
      ✓ MCP servers responding
      
      ╭─────────────────────────────────╮
      │ Setup Complete! 🎉              │
      │                                 │
      │ Try: $autopilot "build API"    │
      │ Docs: /omk-help                 │
      ╰─────────────────────────────────╯
```

## Flags

| Flag | Description |
|------|-------------|
| `--full` | Complete setup with all optional components |
| `--quick` | Minimal setup, skip optional steps |
| `--check` | Verify only, don't modify |
| `--force` | Overwrite existing config |
| `--mcp` | Include MCP setup |
| `--no-mcp` | Skip MCP setup |

## After Setup

Quick start:
```
$autopilot "build a REST API"
$team 3 "fix all errors"
$sciomc "analyze codebase"
```
