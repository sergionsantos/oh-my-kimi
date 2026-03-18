# Example: Debugging Complex Issues with OMK

This example demonstrates how to use OMK for systematic debugging.

## Scenario

Users report: "Login sometimes fails with 'Invalid credentials' even with correct password."

## Step 1: Initial Investigation

Start with the debugger agent:

```bash
$debugger "investigate intermittent login failures with correct credentials"
```

OMK will:
1. Search for authentication-related code
2. Identify the login flow
3. Look for race conditions
4. Check error handling

Sample output:
```markdown
## Bug Investigation Report

### Initial Findings
- Login logic in `auth.service.js`
- Password comparison using bcrypt
- Session stored in Redis

### Hypotheses
1. **Race condition** in session creation
2. **Timing attack** vulnerability
3. **Redis connection** issues
4. **Password hashing** inconsistency
```

## Step 2: Scientific Analysis

Use sciomc for comprehensive analysis:

```bash
$sciomc "analyze authentication flow for race conditions and timing issues"
```

OMK decomposes into stages:
```
Stage 1: Analyze login endpoint
Stage 2: Check session management
Stage 3: Review password comparison
Stage 4: Examine Redis interactions
Stage 5: Test concurrent logins
```

Parallel scientists investigate:
```
[scientist-1] ✓ Login endpoint analysis complete
[scientist-2] ✓ Session management reviewed
[scientist-3] ✓ Password comparison checked
[scientist-4] ⚠️ Redis interactions found issue
[scientist-5] ✓ Concurrent login tests done
```

## Step 3: Cross-Validation

Results synthesized:
```markdown
## Race Condition Found

### Evidence
- Redis SET and EXPIRE are separate operations
- Concurrent logins can overwrite sessions
- 0.1% of requests affected

### Root Cause
```javascript
// Problematic code
await redis.set(sessionKey, userId);
await redis.expire(sessionKey, 3600); // Race window here
```

### Fix Required
Use atomic SETEX operation instead.
```

## Step 4: Fix Implementation

```bash
$ralph "fix race condition in session creation by using atomic Redis SETEX"
```

OMK will:
1. Locate all Redis SET calls
2. Replace with SETEX
3. Add tests for race condition
4. Verify fix works

## Step 5: Verification

```bash
$ultraqa
```

OMK runs QA cycles:
```
Iteration 1: Tests running...
✓ Unit tests pass
✓ Integration tests pass
⚠️ 1 race condition test flaky

Iteration 2: Fixing flaky test...
✓ All tests pass
✓ Race condition tests stable

QA Complete! 2 iterations.
```

## Alternative: Using Tracer

For understanding complex flows:

```bash
$tracer "trace login flow from API to database"
```

Output:
```markdown
## Execution Trace

### Entry Point
POST /api/login

### Call Chain
1. auth.routes.js:15
   → auth.controller.js:23
     → auth.service.js:45
       → user.model.js:78 (DB query)
       → bcrypt.compare() [async]
     → redis.set() [async]
     → redis.expire() [async]

### Data Flow
Request → Validation → DB Lookup → Password Check → Session Create → Response

### Async Boundaries
- bcrypt.compare (CPU intensive)
- Redis operations (I/O)

### Potential Issues
⚠️ Non-atomic Redis operations
⚠️ No transaction wrapping
```

## Deep Analysis Pattern

For really tricky bugs:

```bash
# 1. Explore codebase
$explore "find all authentication-related code"

# 2. Analyze patterns
$analyst "identify all ways login can fail"

# 3. Plan investigation
$plan "systematically debug login issues"

# 4. Execute with persistence
$ralph "implement fixes for all identified issues"

# 5. Verify with team
$team 2:test-engineer,1:security-reviewer "verify login fixes"
```

## Common Debugging Patterns

### Pattern 1: Intermittent Issues
```bash
$sciomc "analyze [intermittent issue]"
# Looks for race conditions, timing issues, state problems
```

### Pattern 2: Performance Issues
```bash
$performance-reviewer "analyze [slow operation]"
$tracer "trace [operation] flow"
```

### Pattern 3: Security Issues
```bash
$security-reviewer "audit [feature]"
$sciomc "comprehensive security analysis of [feature]"
```

### Pattern 4: Integration Issues
```bash
$debugger "investigate [integration] failures"
$tracer "trace data flow from [A] to [B]"
```

## Tips for Effective Debugging

1. **Start with debugger** for focused investigation
2. **Use sciomc** for complex, multi-faceted issues
3. **Use tracer** to understand flow
4. **Always verify** with team mode or ultraqa
5. **Document findings** with note skill

## Documentation

```bash
# Save findings for future reference
$note "Login race condition: Redis SET/EXPIRE not atomic"

# Create incident report
$writer "document login bug: root cause, fix, and prevention"
```
