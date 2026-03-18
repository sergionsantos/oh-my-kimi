# Installation Guide - Oh My Kimi

## Prerequisites

- **kimi-cli** installed and working
- **Node.js** >= 20.0.0
- **Git** (for version control)

## Quick Install

### Option 1: Global Installation (Recommended)

```bash
# 1. Clone OMK
git clone https://github.com/omk/oh-my-kimi.git

# 2. Install to global skills
cp -r oh-my-kimi/omk/* ~/.kimi/skills/

# On Windows:
# xcopy /E /I "oh-my-kimi\omk\*" "%APPDATA%\kimi\skills\"
```

### Option 2: Project-Specific Installation

```bash
# In your project directory
mkdir -p .kimi/skills
cp -r /path/to/oh-my-kimi/omk/* .kimi/skills/

# On Windows:
# xcopy /E /I "path\to\oh-my-kimi\omk\*" ".kimi\skills\"
```

### Option 3: Using Setup Command

```bash
# Download OMK
# Then run in your project:
/omk-setup
```

## Verification

After installation, verify everything works:

```bash
# Check OMK health
/omk-doctor

# List all agents
/omk-agents

# List all skills
/omk-skills
```

## Configuration

### 1. Global Configuration

Create `~/.kimi/omk_config.json`:

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

### 2. Project Configuration

In your project root, create `.omk/config.json`:

```json
{
  "project_name": "my-project",
  "default_agents": ["executor", "debugger"],
  "custom_rules": []
}
```

### 3. AGENTS.md

Copy the provided `AGENTS.md` to your project root and customize it.

## Directory Structure After Install

### Global Installation
```
~/.kimi/skills/
├── oh-my-kimi/
│   ├── SKILL.md              # Main entry
│   ├── agents/
│   │   ├── architect.md
│   │   ├── executor.md
│   │   └── ... (32 agents)
│   └── skills/
│       ├── autopilot/
│       │   └── SKILL.md
│       ├── team/
│       │   └── SKILL.md
│       └── ... (14 skills)
└── omk_config.json
```

### Project Installation
```
your-project/
├── .kimi/
│   └── skills/
│       └── oh-my-kimi/
│           └── ... (same structure)
├── .omk/
│   ├── state/
│   ├── plans/
│   ├── specs/
│   └── config.json
├── AGENTS.md
└── ...
```

## First Run

Test your installation:

```bash
# Test autopilot
$autopilot "create a simple Hello World API"

# Test team mode
$team 2 "explore the codebase structure"

# Test planning
$plan "implement user authentication"
```

## Troubleshooting

### Issue: "omk-setup not found"

**Solution**: Ensure skills are in the correct directory:
```bash
# Check kimi skills path
kimi --config

# Verify OMK is in that path
ls ~/.kimi/skills/oh-my-kimi/
```

### Issue: "Agent not found"

**Solution**: Verify agent files exist:
```bash
ls ~/.kimi/skills/oh-my-kimi/agents/
# Should show 32 .md files
```

### Issue: Skills not loading

**Solution**: Check SKILL.md syntax:
```bash
# Each SKILL.md must have front matter:
# ---
# name: skill-name
# description: Description
# ---
```

### Issue: State not persisting

**Solution**: Create .omk directory:
```bash
mkdir -p .omk/state .omk/plans .omk/specs
```

## Updating OMK

```bash
# 1. Backup your config
cp ~/.kimi/omk_config.json ~/omk_config.backup.json

# 2. Remove old version
rm -rf ~/.kimi/skills/oh-my-kimi

# 3. Install new version
# (follow installation steps above)

# 4. Restore config
cp ~/omk_config.backup.json ~/.kimi/omk_config.json

# 5. Verify
/omk-doctor
```

## Uninstall

```bash
# Remove OMK skills
rm -rf ~/.kimi/skills/oh-my-kimi

# Remove config (optional)
rm ~/.kimi/omk_config.json

# Remove project state (optional)
rm -rf .omk/
```

## Getting Help

```bash
# Diagnose installation
/omk-doctor

# Show all commands
/omk-help

# Check version
/omk-version
```

## Next Steps

1. Read the [README](README.md) for usage examples
2. Check [AGENTS.md](AGENTS.md) for agent reference
3. Explore the [skills documentation](omk/skills/)

---

**You're ready to use Oh My Kimi!** 🚀
