---
name: omk-setup
description: Instala e configura o Oh My Kimi
version: 1.0.0
---

# OMK Setup Skill

## Purpose
Install and configure Oh My Kimi. Sets up skills, agents, and configuration.

## Use When
- First time using OMK
- After OMK update
- Need to reconfigure
- Setting up new project

## Setup Steps

### 1. Check Environment
- Verify kimi-cli version
- Check Node.js version
- Verify Git installation

### 2. Install Skills
Copy skills to appropriate location:
- Global: `~/.kimi/skills/`
- Project: `./.kimi/skills/`

### 3. Configure Project
Create in project root:
- `AGENTS.md` (from template)
- `.omk/` directory structure
- `.gitignore` entries for `.omk/`

### 4. Verify Installation
Run diagnostics to ensure everything works.

## Configuration Files

### ~/.kimi/omk_config.json
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

### Project .omk/
```
.omk/
├── state/           # Runtime state
├── plans/           # Planning documents
├── specs/           # Specifications
├── logs/            # Session logs
└── config.json      # Project config
```

## Invocation

### Command
```
/omk-setup
```

### Skill
```
$omk-setup
```

## Example
```
User: omk-setup

Kimi: Setting up Oh My Kimi...
      ✓ kimi-cli detected
      ✓ Node.js v22.14.0 OK
      ✓ Git detected
      
      Installing skills...
      ✓ autopilot
      ✓ team
      ✓ ralph
      ✓ plan
      ...
      
      Creating project configuration...
      ✓ AGENTS.md created
      ✓ .omk/ directory created
      
      Setup complete! Try: $autopilot "your task"
```

## Update
To update OMK:
```
/omk-setup --update
```
