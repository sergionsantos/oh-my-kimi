# Creating Custom Skills

This guide teaches you how to create your own skills for Oh My Kimi.

## What is a Skill?

A skill is a reusable workflow template that:
- Defines a specific task or workflow
- Can be invoked via commands
- May include automatic triggers (keywords)
- Composes agents and tools

## Skill Structure

```
omk/skills/{skill-name}/
└── SKILL.md
```

## Skill Template

```markdown
---
name: my-skill
description: Brief description of what this skill does
version: 1.0.0
triggers:
  - "my-keyword"
  - "another trigger"
---

# My Skill

## Purpose
Explain what this skill accomplishes and why it exists.

## Use When
- Specific situation 1
- Specific situation 2
- User says specific keywords

## Do Not Use When
- Situation where this skill is inappropriate
- Another skill would be better

## Workflow

### Step 1: Analysis
Describe what happens first.

### Step 2: Execution
Describe the main execution phase.

### Step 3: Validation
Describe how results are validated.

## State Management

```json
{
  "mode": "my-skill",
  "active": true,
  "current_step": "execution",
  "started_at": "2026-03-18T10:00:00Z"
}
```

## Invocation

### Command
```
/omk-my-skill "task description"
```

### Skill
```
$my-skill "task description"
```

### Keyword
```
my-keyword: do something
```

## Examples

### Example 1: Basic Usage
```
User: my-skill "simple task"

Kimi: Starting my-skill...
      Step 1: Analyzing...
      Step 2: Executing...
      Step 3: Validating...
      Complete!
```

### Example 2: With Options
```
User: my-skill "complex task" --option value

Kimi: Starting my-skill with options...
      [Output]
```

## Integration with Other Skills

This skill can be chained with:
- `$plan` for complex tasks
- `$ralph` for must-complete tasks
- `$team` for parallel execution

## Configuration

Optional configuration in `.omk/config.json`:

```json
{
  "my-skill": {
    "option1": "value1",
    "option2": "value2"
  }
}
```

## Testing

Test your skill with various inputs:

```bash
# Test basic functionality
$my-skill "test task"

# Test edge cases
$my-skill "edge case"

# Test error handling
$my-skill "invalid input"
```

## Best Practices

### 1. Clear Purpose
- Each skill should do one thing well
- Name should indicate what it does
- Description should be specific

### 2. Composability
- Design skills to work together
- Accept input from other skills
- Output in formats other skills can use

### 3. State Management
- Always track state for resumability
- Clean up state on completion
- Handle interruptions gracefully

### 4. Documentation
- Include multiple examples
- Document all options
- Explain when NOT to use

### 5. Error Handling
- Define what happens on failure
- Provide clear error messages
- Suggest next steps on errors

## Example: Custom Deployment Skill

```markdown
---
name: deploy
description: Deploy application to specified environment
version: 1.0.0
triggers:
  - "deploy"
  - "ship it"
---

# Deploy Skill

## Purpose
Deploy the application to staging or production environment with safety checks.

## Use When
- Code is ready to deploy
- Tests are passing
- Need automated deployment workflow

## Do Not Use When
- Tests are failing
- Uncommitted changes exist
- Emergency hotfix needed (use direct deploy)

## Workflow

### Step 1: Pre-deploy Checks
- Check git status (no uncommitted changes)
- Run test suite
- Verify environment configuration

### Step 2: Build
- Build production bundle
- Run build tests
- Generate source maps

### Step 3: Deploy
- Deploy to target environment
- Run smoke tests
- Verify health checks

### Step 4: Post-deploy
- Monitor error rates
- Run verification tests
- Notify team

## Invocation

```
$deploy staging
$deploy production --force
```

## Examples

```
User: deploy staging

Kimi: Starting deployment to staging...
      ✓ Git status clean
      ✓ Tests passing
      ✓ Build successful
      ✓ Deployed to staging
      ✓ Smoke tests passed
      
Deployment complete! URL: https://staging.example.com
```
```

## Sharing Your Skills

### Option 1: Local Skills
Place in `~/.kimi/skills/custom/`

### Option 2: Project Skills
Place in `./.kimi/skills/`

### Option 3: Contribute to OMK
Submit a pull request to the main repository!

## Advanced Topics

### Skill Composition
Chain skills together:

```markdown
## Pipeline
This skill automatically chains:
1. $plan (create detailed plan)
2. $ralph (execute with persistence)
3. $ultraqa (validate with QA cycles)
```

### Conditional Logic
```markdown
## Workflow
1. Check if tests exist
   - If yes: Run tests
   - If no: Create test plan first
2. Proceed with main task
```

### Parallel Execution
```markdown
## Workflow
```
Task(agent1, "subtask 1")
Task(agent2, "subtask 2")
Task(agent3, "subtask 3")
```
```

Happy skill building! 🚀
