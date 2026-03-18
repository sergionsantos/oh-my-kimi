---
name: omk-doctor
description: Diagnostica problemas de instalação e configuração
version: 1.0.0
---

# OMK Doctor Skill

## Purpose
Diagnose installation issues and verify OMK configuration. Troubleshooting assistant.

## Use When
- OMK not working as expected
- After installation
- Before reporting issues
- Verification after changes

## Diagnostics

### 1. Environment Check
- [ ] kimi-cli installed
- [ ] Node.js version >= 20
- [ ] Git available
- [ ] Shell access works

### 2. Skills Check
- [ ] Skills directory exists
- [ ] All core skills present
- [ ] Skills readable
- [ ] No conflicts

### 3. Configuration Check
- [ ] Config files valid
- [ ] AGENTS.md present (if needed)
- [ ] .omk/ directory accessible
- [ ] State management works

### 4. Agent Check
- [ ] Agent definitions readable
- [ ] No syntax errors
- [ ] All 32 agents present

### 5. Test Execution
- [ ] Can spawn subagent
- [ ] State read/write works
- [ ] File operations work

## Report Format
```markdown
## OMK Health Check

### Environment
| Check | Status | Details |
|-------|--------|---------|
| kimi-cli | ✅/❌ | [version] |
| Node.js | ✅/❌ | [version] |
| Git | ✅/❌ | [version] |

### Skills
| Skill | Status | Issues |
|-------|--------|--------|
| autopilot | ✅/❌ | [none/issues] |
| team | ✅/❌ | [none/issues] |
...

### Configuration
- Global config: [Path] - [Status]
- Project config: [Path] - [Status]

### Test Results
- Subagent spawn: [Pass/Fail]
- State management: [Pass/Fail]
- File operations: [Pass/Fail]

### Recommendations
1. [Issue]: [Fix]
```

## Fixes
Auto-fix common issues:
- Missing directories → Create
- Permission issues → Fix
- Missing skills → Suggest install
- Config errors → Repair

## Invocation

### Command
```
/omk-doctor
```

### With Fixes
```
/omk-doctor --fix
```

### Skill
```
$omk-doctor
```

## Example
```
User: omk-doctor

Kimi: Running OMK diagnostics...
      
      Environment: ✅ All OK
      Skills: ⚠️  2 issues found
        - web-clone: Missing SKILL.md
        - omk-doctor: Outdated version
      
      Configuration: ✅ Valid
      
      Recommendations:
      1. Reinstall web-clone skill
      2. Update omk-doctor: $omk-setup --update
      
      Run /omk-doctor --fix to auto-fix issues?
```
