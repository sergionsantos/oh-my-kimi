# Getting Started with Oh My Kimi

This guide will help you get up and running with Oh My Kimi (OMK) in minutes.

## Prerequisites

Before you begin, ensure you have:

- [kimi-cli](https://www.kimi.com/code) installed and configured
- Node.js >= 20.0.0
- Git

## Installation

### Quick Install (Recommended)

```bash
# Clone the repository
git clone https://github.com/yourusername/oh-my-kimi.git
cd oh-my-kimi

# Run the setup wizard
/omk-setup
```

### Manual Install

```bash
# Copy OMK to your kimi skills directory
# Linux/macOS:
cp -r omk/* ~/.config/kimi/skills/

# Windows:
xcopy /E /I "omk\*" "%APPDATA%\kimi\skills\"
```

### Verify Installation

```bash
# Check if OMK is properly installed
/omk-doctor

# List all available agents
/omk-agents

# List all available skills
/omk-skills
```

## Your First OMK Session

### 1. Try Autopilot

Let OMK build something for you:

```bash
$autopilot "create a simple REST API for a todo list"
```

Watch as OMK:
1. Analyzes your requirements
2. Plans the implementation
3. Writes the code
4. Runs tests
5. Validates the result

### 2. Use Team Mode

Run multiple agents in parallel:

```bash
$team 3 "fix all TypeScript errors in the codebase"
```

This spawns 3 agents working simultaneously on different files.

### 3. Plan Before Building

For complex features, plan first:

```bash
$plan "implement user authentication with JWT"
```

Review the plan, then execute:

```bash
$ralph "implement user authentication with JWT"
```

## Common Workflows

### Building a New Feature

```bash
# 1. Clarify requirements (if vague)
$deep-interview "I want a feature that..."

# 2. Create a plan
$plan "implement the feature"

# 3. Execute with persistence
$ralph "implement the feature"
```

### Code Review

```bash
# Multi-perspective review
$team 1:security-reviewer,1:code-reviewer,1:performance-reviewer "review this PR"

# Or use CCG for comprehensive analysis
$ccg "Review this PR - architecture and implementation"
```

### Debugging

```bash
# Let the debugger investigate
$debugger "find why login fails intermittently"

# Or use sciomc for deep analysis
$sciomc "analyze the authentication flow for race conditions"
```

### Documentation

```bash
# Generate documentation
$writer "document the API endpoints"

# Create README
$deepinit  # Generates project structure and docs
```

## Configuration

### Global Configuration

Edit `~/.kimi/omk_config.json`:

```json
{
  "default_mode": "team",
  "max_parallel_agents": 6,
  "auto_save": true,
  "preferences": {
    "language": "en",
    "verbosity": "normal"
  },
  "hud": {
    "enabled": true,
    "preset": "focused"
  }
}
```

### Project Configuration

Create `.omk/config.json` in your project:

```json
{
  "project_name": "my-project",
  "default_agents": ["executor", "debugger"],
  "custom_rules": [
    "Always use TypeScript",
    "Write tests for new features"
  ]
}
```

## Next Steps

- Read the [full documentation](README.md)
- Explore [examples](../examples/)
- Learn about [creating custom skills](custom-skills.md)
- Join the community discussions

## Troubleshooting

### Common Issues

**OMK commands not found**
- Ensure skills are copied to the correct directory
- Run `/omk-doctor` to diagnose

**Agents not responding**
- Check kimi-cli is working: `kimi --version`
- Verify agent files exist in `omk/agents/`

**State not persisting**
- Ensure `.omk/` directory is writable
- Check disk space

### Getting Help

- Run `/omk-help` for quick reference
- Check [GitHub Issues](https://github.com/yourusername/oh-my-kimi/issues)
- Read the [FAQ](faq.md)
