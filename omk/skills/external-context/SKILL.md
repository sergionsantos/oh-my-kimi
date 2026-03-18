---
name: external-context
description: Pesquisa documentação externa e referências usando agentes especialistas paralelos
version: 1.0.0
---

# External Context Skill

## Purpose
Fetch external documentation, references, and context for a query. Decomposes into 2-5 facets and spawns parallel researcher agents to gather comprehensive external information.

## Use When
- Need official documentation
- Comparing technologies
- Latest best practices
- Researching external libraries
- User asks about external tools
- "What does the docs say about..."

## Do Not Use When
- Question can be answered from codebase
- Purely internal code question
- No external context needed

## Protocol

### Step 1: Facet Decomposition

Given a query, decompose into 2-5 independent search facets:

```markdown
## Search Decomposition

**Query:** <original query>

### Facet 1: <facet-name>
- **Search focus:** What to search for
- **Sources:** Official docs, GitHub, blogs

### Facet 2: <facet-name>
...
```

### Step 2: Parallel Agent Invocation

Fire independent facets in parallel via Task tool:

```
Task(subagent_name="researcher", description="Search for: <facet 1>. Find official documentation and examples. Cite all sources with URLs.")

Task(subagent_name="researcher", description="Search for: <facet 2>. Find official documentation and examples. Cite all sources with URLs.")
```

**Maximum 5 parallel agents** (concurrency limit).

### Step 3: Synthesis

Aggregate findings into structured report.

## Invocation

### Command
```
/external-context What are the best practices for JWT token rotation in Node.js?
/external-context Compare Prisma vs Drizzle ORM for PostgreSQL
/external-context Latest React Server Components patterns
```

### Skill
```
$external-context "search query"
```

## Output Format

```markdown
## External Context: <query>

### Key Findings
1. **<finding>** - Source: [title](url)
2. **<finding>** - Source: [title](url)

### Detailed Results

#### Facet 1: <name>
<aggregated findings with citations>

#### Facet 2: <name>
<aggregated findings with citations>

### Sources
- [Source 1](url)
- [Source 2](url)
```

## Example Session

```
User: external-context What are the best practices for JWT token rotation?

Kimi: Fetching external context...
      
      [DECOMPOSITION]
      Facet 1: JWT rotation strategies
      Facet 2: Token refresh patterns
      Facet 3: Security considerations
      
      [PARALLEL SEARCH]
      Firing 3 researcher agents...
      
      Agent 1: Found 5 sources on rotation
      Agent 2: Found 3 patterns for refresh
      Agent 3: Found 4 security best practices
      
      [SYNTHESIS]
      
      ## External Context: JWT Token Rotation
      
      ### Key Findings
      1. **Rotate tokens on every request for high-security apps** - Source: [Auth0](url)
      2. **Use refresh tokens with longer expiry** - Source: [JWT.io](url)
      3. **Invalidate old tokens server-side** - Source: [OWASP](url)
      
      ### Sources
      - [Auth0 Docs](url)
      - [JWT.io Best Practices](url)
      - [OWASP Guidelines](url)
```

## Limits

- **Max 5 parallel agents**
- **Explicit invocation only** (no magic keyword)
- **Uses SearchWeb tool** for external queries

## State

```json
{
  "mode": "external-context",
  "query": "search query",
  "facets": ["facet1", "facet2"],
  "sources": ["url1", "url2"],
  "status": "complete"
}
```
