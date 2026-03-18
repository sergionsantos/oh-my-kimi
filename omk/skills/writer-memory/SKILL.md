---
name: writer-memory
description: Memória agentica para writers
version: 1.0.0
---

# Writer Memory Skill

## Purpose
Agentic memory for writers. Maintains context across writing sessions, tracks style preferences, and learns from edits.

## Use When
- Working on documentation
- Multi-session writing tasks
- Maintaining consistent style
- Collaborative writing

## Memory Types

### Style Memory
Learns and remembers:
- Tone preferences
- Formatting choices
- Vocabulary patterns
- Structure preferences

### Context Memory
Tracks:
- Topic context
- Previous sections
- Open threads
- Pending edits

### Feedback Memory
Remembers:
- Edit history
- Rejected suggestions
- Preferred phrasings
- Corrections made

## Invocation

### Command
```
/omk-writer-memory recall "previous section"
/omk-writer-memory learn "style preference"
```

### Skill
```
$writer-memory recall <topic>
$writer-memory store <information>
$writer-memory learn <from-edits>
$writer-memory suggest <for-current>
```

## Storage

`.omk/writer-memory.json`:
```json
{
  "style": {
    "tone": "professional",
    "formality": "high",
    "technicalLevel": "intermediate",
    "preferredTerms": {
      "use": "utilize",
      "avoid": ["very", "really"]
    }
  },
  "context": {
    "currentDoc": "API-Guide",
    "lastSection": "Authentication",
    "openThreads": ["Rate limiting", "Error handling"]
  },
  "history": [
    {"edit": "Changed tone", "timestamp": "..."},
    {"edit": "Added examples", "timestamp": "..."}
  ]
}
```

## Auto-Learning

Enabled by default:
```json
{
  "writerMemory": {
    "autoLearn": true,
    "trackEdits": true,
    "suggestStyle": true
  }
}
```

## Features

### Style Consistency
```
User: Write about rate limiting

Kimi: [Checking writer memory...]
      Style: Technical, formal
      Last topic: Authentication
      
      Writing with consistent style...
```

### Context Awareness
```
User: Continue from where we left off

Kimi: [Recalling context...]
      Last working on: Error handling section
      Open threads: 2 pending
      
      Continuing error handling documentation...
```

### Smart Suggestions
```
User: How should I phrase this?

Kimi: [Analyzing style memory...]
      Based on your preferences:
      - Use "utilize" instead of "use"
      - Maintain formal tone
      - Include code examples
      
      Suggested phrasing:
      "Developers should utilize the token endpoint..."
```

## Commands

### Recall Context
```
$writer-memory recall "authentication section"
```

### Store Information
```
$writer-memory store "Prefer British English spelling"
```

### Learn from Edits
```
$writer-memory learn
```
Analyzes recent edits and updates style profile.

### Get Suggestions
```
$writer-memory suggest "how to start this section"
```

### Reset Memory
```
$writer-memory reset
```
Clears learned preferences (keeps context).

## Integration

Works automatically with:
- `writer` agent
- `deep-interview` skill
- Documentation workflows
