---
id: kimi-cli-hang-debugging
name: kimi-cli Hang Troubleshooting
description: Diagnose and fix kimi-cli hangs caused by expired authentication tokens, especially after installing skill extensions
source: conversation
triggers: ["kimi-cli hangs", "kimi hang", "kimi freeze", "kimi no response", "kimi-cli timeout", "expired tokens kimi", "kimi-cli interactive mode stuck"]
quality: high
scope: project
---

# kimi-cli Hang Troubleshooting

## The Insight

kimi-cli authentication token expiration causes **silent hangs in interactive mode** rather than explicit auth failures. The CLI will continue to work for parameterized commands (--help, --print) but freeze when attempting to start an interactive session, because it tries to refresh expired tokens during session initialization.

This is counter-intuitive because you'd expect auth failures to produce error messages, not hangs.

## Why This Matters

When installing skill systems like oh-my-kimi, users often blame the new installation for "breaking" kimi-cli, when the actual issue is expired authentication tokens. The hang behavior masks the real cause:

- ✅ `kimi-cli --help` works (no auth required)
- ✅ `kimi-cli --print` works (short-lived operations)
- ❌ `kimi-cli` (interactive mode) hangs indefinitely
- ❌ Skills integration appears broken

Without knowing this pattern, users waste hours debugging skill configurations instead of addressing the auth issue.

## Recognition Pattern

**Primary symptom:** kimi-cli hangs when run without parameters but works with command flags

**Diagnostic sequence:**
1. **Test parameterized commands:** `kimi-cli --help` and `kimi-cli --print` work normally
2. **Test interactive mode:** `kimi-cli` (no params) hangs/freezes without error message
3. **Check for hanging processes:** `tasklist | findstr kimi` shows kimi-cli.exe processes
4. **Verify auth token age:** Check `~/.kimi/credentials/kimi-code.json` for `expires_at` timestamp

**Context clues:**
- Recently installed new skills or extensions
- kimi-cli worked before, now hangs
- No error messages, just silent hang
- Process appears in task manager but consuming minimal CPU

## The Approach

**Debugging principle:** Authentication issues in CLI tools often manifest as hangs during session initialization, not explicit errors. Always check auth state before debugging configuration.

**Resolution sequence:**
1. **Terminate hanging processes first**
   ```bash
   # Windows
   tasklist | findstr kimi-cli
   taskkill //F //PID [process_id]

   # Linux/macOS
   pkill kimi-cli
   ```

2. **Force authentication refresh**
   ```bash
   kimi-cli logout
   kimi-cli login
   ```

3. **Test with timeout to confirm fix**
   ```bash
   timeout 10 kimi-cli  # Should show prompt, not hang
   ```

4. **Verify token validity**
   ```bash
   kimi-cli info  # Should show version without hanging
   ```

**Prevention principle:** When troubleshooting "skill integration issues," always rule out auth problems first before investigating skill configurations.

## Example

**Scenario:** After installing oh-my-kimi, user reports that `kimi-cli` stopped working and skills don't load.

**Wrong approach:** Debug skill directories, installation paths, configuration files
**Right approach:**
1. Test `kimi-cli --help` (works) vs `kimi-cli` (hangs) → Auth issue pattern
2. Check credentials file: `expires_at: 1773865971` (January 2026, but now March 2026)
3. Kill hanging process, logout/login, test again
4. **Then** proceed with skill configuration if issues persist

**Key insight:** The hang happens because token refresh attempts during interactive session startup, not because skills are misconfigured. Save hours by checking auth first.