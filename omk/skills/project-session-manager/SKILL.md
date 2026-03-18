---
name: project-session-manager
description: Ambientes de desenvolvimento isolados (PSM)
version: 1.0.0
aliases: [psm]
---

# Project Session Manager (PSM)

## Purpose
Isolated development environments. Manage multiple project contexts with separate state, configuration, and history.

## Use When
- Working on multiple projects
- Need isolated contexts
- Want separate histories
- Managing different configurations

## Concepts

### Session
An isolated environment with:
- Separate `.omk/` directory
- Independent state
- Project-specific config
- Isolated history

## Invocation

### Command
```
/omk-psm create my-project
/omk-psm switch my-project
/omk-psm list
```

### Skill
```
$project-session-manager create "name"
$psm switch "name"
$psm list
$psm delete "name"
```

## Session Structure

```
.omk-sessions/
├── my-project/
│   ├── .omk/
│   │   ├── state/
│   │   ├── plans/
│   │   └── config.json
│   └── AGENTS.md
├── another-project/
│   └── ...
```

## Commands

### Create
```
$psm create "new-project"
```
Creates new isolated session.

### Switch
```
$psm switch "project-name"
```
Switches to session context.

### List
```
$psm list
```
Shows all sessions:
```
Available sessions:
* my-project     (active)
  another-project
  legacy-api
```

### Delete
```
$psm delete "project-name"
```
Removes session (with confirmation).

### Archive
```
$psm archive "project-name"
```
Archives session to `.omk-sessions/archive/`.

## Current Session

Shows active session in prompt:
```
[my-project] $autopilot "build API"
```

## Session Config

Each session has independent:
- `.omk/config.json`
- `.omk/state/`
- `.omk/plans/`
- `AGENTS.md`

## Example Workflow

```
# Create new project session
$psm create "e-commerce-api"

# Switch to it
$psm switch "e-commerce-api"

# Work in isolated context
$autopilot "build REST API for products"

# Switch to another project
$psm switch "legacy-api"
$ralph "fix critical bug"

# List all sessions
$psm list
```

## Benefits

- No state conflicts between projects
- Independent histories
- Project-specific configurations
- Easy context switching
- Archive old projects
