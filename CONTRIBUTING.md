# Contributing to Oh My Kimi

First off, thank you for considering contributing to Oh My Kimi! It's people like you that make this tool better for everyone.

## Code of Conduct

This project and everyone participating in it is governed by our commitment to:
- Be respectful and inclusive
- Welcome newcomers
- Focus on constructive feedback
- Respect different viewpoints and experiences

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues to see if the problem has already been reported. When you are creating a bug report, please include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples to demonstrate the steps**
- **Describe the behavior you observed and what behavior you expected**
- **Include screenshots if applicable**

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

- **Use a clear and descriptive title**
- **Provide a step-by-step description of the suggested enhancement**
- **Provide specific examples to demonstrate the enhancement**
- **Explain why this enhancement would be useful**

### Contributing Code

#### Setting Up Development Environment

1. Fork the repository
2. Clone your fork: `git clone https://github.com/your-username/oh-my-kimi.git`
3. Install OMK locally for testing
4. Create a branch for your changes: `git checkout -b feature/my-feature`

#### Creating New Skills

To create a new skill:

1. Create a new directory under `omk/skills/{skill-name}/`
2. Add a `SKILL.md` file with the following structure:

```markdown
---
name: skill-name
description: Brief description of what this skill does
version: 1.0.0
---

# Skill Name

## Purpose
What this skill accomplishes and when to use it.

## Use When
- Specific condition 1
- Specific condition 2

## Do Not Use When
- Condition where this skill is inappropriate

## Workflow
1. Step one
2. Step two
3. Step three

## Invocation
```
/skill-name "task description"
```

## Examples
### Example 1
```
User: skill-name "example task"
Kimi: [Expected response]
```
```

3. Test your skill locally
4. Update the skill registry in README.md
5. Submit a pull request

#### Creating New Agents

To create a new agent:

1. Create a new file under `omk/agents/{agent-name}.md`
2. Follow the existing agent template:

```markdown
# Agent Name

## Identity
Brief description of who this agent is.

## Role
What this agent does.

## Responsibilities
- Responsibility 1
- Responsibility 2

## When to Invoke
- Condition 1
- Condition 2

## Output Format
```markdown
## Expected output structure
```

## Guidelines
- Guideline 1
- Guideline 2

## Example Invocation
```
/agent-name "task"
```
```

3. Test the agent with various tasks
4. Update the agent catalog in README.md
5. Submit a pull request

### Pull Request Process

1. Update the README.md with details of changes if applicable
2. Update documentation in `docs/` if you're changing functionality
3. Ensure your code follows the existing style
4. Include examples of how to use new features
5. Link any related issues

## Style Guidelines

### Markdown Style
- Use clear, concise language
- Include code examples
- Use proper heading hierarchy
- Keep lines under 100 characters when possible

### Agent Design
- Agents should have a clear, specific purpose
- Output formats should be consistent
- Include examples in all agent definitions

### Skill Design
- Skills should be composable
- Include clear triggers
- Document dependencies on other skills/agents

## Community

- Join discussions in GitHub Issues
- Share your OMK workflows and tips
- Help others in the community

## Recognition

Contributors will be recognized in our README.md and release notes.

Thank you for contributing! 🚀
