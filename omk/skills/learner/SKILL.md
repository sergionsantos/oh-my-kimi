---
name: learner
description: Extrai skill reutilizável da sessão atual
version: 1.0.0
---

# Learner Skill

## Purpose
Extract reusable skill from current session. Captures patterns, solutions, and workflows for future reuse.

## Use When
- Solved a novel problem
- Created reusable workflow
- Want to capture best practice
- Building skill library

## Invocation

### Command
```
/omk-learner extract "name-for-skill"
/omk-learner extract "react-component-pattern"
```

### Skill
```
$learner extract "skill-name"
$learner list          # List extractable patterns
$learner preview       # Preview what would be extracted
```

## Extraction Process

### 1. Analyze Session
```
- Identify successful patterns
- Extract reusable code
- Document workflow steps
- Capture decision points
```

### 2. Generate Skill
Creates `skills/{name}/SKILL.md`:
```markdown
---
name: {extracted-name}
description: {auto-generated}
extracted-from: {session-id}
date: {timestamp}
---

# {Name}

## Purpose
{What this skill accomplishes}

## Pattern
{Reusable pattern}

## Usage
```
{name}: {example}
```

## Steps
1. {Step 1}
2. {Step 2}

## Examples
### {Example Name}
{Example with context}

## Notes
{Extracted insights}
```

## What Gets Extracted

| Element | Captured? |
|---------|-----------|
| Successful workflow | ✅ Yes |
| Code patterns | ✅ Yes |
| Error → Fix cycles | ✅ Yes |
| Agent compositions | ✅ Yes |
| Prompts that worked | ✅ Yes |
| Failed approaches | ❌ No |
| Project-specific code | ❌ No |

## Example

```
User: learner extract "auth-pattern"

Kimi: Analyzing session for extractable patterns...
      
      Found patterns:
      ✓ JWT authentication workflow
      ✓ Password validation approach
      ✓ Error handling pattern
      
      Extracting to: skills/auth-pattern/SKILL.md
      
      Preview:
      ---
      name: auth-pattern
      description: JWT authentication with refresh tokens
      ---
      
      ## Pattern
      1. Validate credentials
      2. Generate access token (15min)
      3. Generate refresh token (7days)
      4. Store hashed refresh token
      5. Return both tokens
      
      ## Usage
      auth-pattern: implement login
      
Create skill? [Y/n]
```

## Skill Library

Extracted skills go to `~/.kimi/skills/custom/`:
```
skills/
├── custom/
│   ├── auth-pattern/
│   ├── react-form/
│   └── api-error-handling/
```

## Usage of Extracted Skills

```
$auth-pattern "implement for new service"
```
