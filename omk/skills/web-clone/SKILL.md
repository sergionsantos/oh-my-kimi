---
name: web-clone
description: Clonagem de websites com verificação visual e funcional
version: 1.0.0
---

# Web Clone Skill

## Purpose
URL-driven website cloning with visual + functional verification. Replicates websites from references.

## Use When
- User says "web-clone", "clone site", "clone website", "copy webpage"
- Need to replicate a design
- Learning from existing sites
- Creating similar layouts

## Execution Phases

### Phase 1: Analysis
1. Fetch target URL
2. Analyze structure
3. Identify components
4. Extract assets (images, fonts)
5. Note styling patterns

### Phase 2: Implementation
1. Create HTML structure
2. Implement CSS styling
3. Add interactivity (JavaScript)
4. Responsive adjustments

### Phase 3: Verification
1. Visual comparison
2. Functional testing
3. Responsive check
4. Performance check

### Phase 4: Refinement
Fix discrepancies identified in verification.

## State
```json
{
  "mode": "web-clone",
  "active": true,
  "url": "https://example.com",
  "current_phase": "implementation",
  "started_at": "2026-03-18T15:30:00Z"
}
```

## Invocation

### Keyword
```
web-clone https://example.com
clone site https://example.com
```

### Command
```
/omk-web-clone https://example.com
```

### Skill
```
$web-clone https://example.com
```

## Output
Creates:
- `cloned/index.html`
- `cloned/styles.css`
- `cloned/script.js`
- `cloned/assets/` (images, fonts)

## Example
```
User: web-clone https://stripe.com

Kimi: Starting web clone...
      Fetching: https://stripe.com
      Analyzing structure...
      Found: Hero, Features, Pricing, Footer
      Implementing components...
      [Progress updates...]
      Verification: 94% match
      Refining...
      Complete! Cloned to ./cloned/
```

## Note
Respects copyright. Use for learning and practice only.
