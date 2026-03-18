---
name: skill
description: Gerencia skills locais
version: 1.0.0
---

# Skill Management Skill

## Purpose
Manage local skills. List, install, update, and remove skills from your local library.

## Use When
- Managing custom skills
- Installing new skills
- Updating existing skills
- Removing unused skills

## Invocation

### Command
```
/omk-skill list
/omk-skill install https://github.com/user/skill-repo
/omk-skill remove skill-name
```

### Skill
```
$skill list
$skill install <url-or-path>
$skill update <name>
$skill remove <name>
$skill info <name>
$skill create <name>    # Create new skill template
```

## Commands

### List Skills
```
$skill list

Local Skills:
✓ autopilot      (builtin)
✓ team          (builtin)
✓ ralph         (builtin)
✓ my-custom     (custom)
✓ auth-pattern  (custom)
```

### Install Skill
```
$skill install https://github.com/user/omk-skill-name
$skill install ./local/path/to/skill
```

Installs to `~/.kimi/skills/custom/`.

### Update Skill
```
$skill update my-custom
```
Pulls latest version from source.

### Remove Skill
```
$skill remove my-custom
```
Removes skill (with confirmation).

### Skill Info
```
$skill info autopilot

Name: autopilot
Version: 1.0.0
Source: builtin
Description: Full autonomous execution
Path: ~/.kimi/skills/autopilot/SKILL.md
```

### Create New Skill
```
$skill create my-skill
```
Creates template:
```
skills/my-skill/
└── SKILL.md
```

## Skill Sources

| Source | Location |
|--------|----------|
| Builtin | `~/.kimi/skills/omk/*` |
| Custom | `~/.kimi/skills/custom/*` |
| Project | `./.kimi/skills/*` |

## Marketplace

Browse community skills:
```
$skill marketplace list
$skill marketplace search "auth"
$skill marketplace install popular-skill
```

## Skill Development

### Create Template
```
$skill create my-skill --template full
```

### Test Skill
```
$skill test my-skill
```

### Validate
```
$skill validate my-skill
```

Checks:
- YAML frontmatter
- Required sections
- Valid triggers
- No conflicts

## Example

```
User: skill create payment-flow

Kimi: Creating skill template...
      
      Created: skills/payment-flow/SKILL.md
      
      Edit the file to define:
      - Purpose
      - Workflow
      - Triggers
      
      Test with: $skill test payment-flow
```
