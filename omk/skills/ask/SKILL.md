---
name: ask
description: Pergunta a Claude, Codex ou Gemini via omc ask e captura o artifact
version: 1.0.0
---

# Ask Skill

## Purpose
Ask Claude, Codex, or Gemini via `omc ask` and capture a markdown artifact under `.omc/artifacts/ask/`.

## Use When
- Need advice from another AI model
- Want cross-validation from multiple perspectives
- Need external model's opinion
- Want to compare answers from different models

## Supported Providers
- `claude` - Claude (Anthropic)
- `codex` - Codex (OpenAI)
- `gemini` - Gemini (Google)

## Invocation

### Command
```
/omk-ask claude "review this architecture"
/omk-ask codex "check for security issues"
/omk-ask gemini "suggest UI improvements"
```

### Skill
```
$ask claude "question"
$ask codex "question" --prompt "detailed instructions"
$ask gemini "question" --agent-prompt executor
```

### Options
```
--prompt <text>         # Custom prompt context
--agent-prompt <role>   # Use specific agent role
--output <filename>     # Custom output filename
```

## Output
Creates `.omk/artifacts/ask/{provider}-{timestamp}.md`:

```markdown
# Ask: {provider}

**Question:** {question}
**Timestamp:** {ISO timestamp}

## Response
{AI response}

## Context
- Provider: {provider}
- Agent prompt: {role}
- Original task: {task}
```

## Example

```
User: ask claude "review this authentication implementation"

Kimi: Asking Claude...
      
      Question: review this authentication implementation
      Provider: claude
      
      [Claude's response captured]
      
      Artifact saved to: .omk/artifacts/ask/claude-20260318-161245.md
      
Claude's review identified 2 security issues and suggested improvements.
```

## Cross-Validation Workflow

```bash
# Ask multiple providers same question
$ask claude "review this PR"
$ask codex "review this PR"
$ask gemini "review this PR"

# Then synthesize findings
Synthesis: All three providers agree on X, but differ on Y...
```

## Environment Variables

```bash
OMC_ASK_ADVISOR_SCRIPT     # Path to advisor script
OMC_ASK_ORIGINAL_TASK      # Original task context
```
