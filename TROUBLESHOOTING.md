# 🔧 Troubleshooting Oh My Kimi

## Common Issues & Solutions

### 🚨 Issue: `kimi-cli` hangs or doesn't respond

**Symptoms:**
- Command `kimi-cli` freezes/hangs
- No response in interactive mode
- Process appears stuck

**Cause:** Expired authentication tokens

**Solution:**
```bash
# Logout and login again
kimi-cli logout
kimi-cli login

# Kill any hanging processes (Windows)
taskkill //F //IM kimi-cli.exe

# Test if working
kimi-cli --help
```

---

### 🚨 Issue: "oh-my-kimi skill not found"

**Symptoms:**
- OMK commands not recognized
- `/omk-setup` shows "Unknown slash command"
- Skills list doesn't show `oh-my-kimi`

**Cause:** Skills not loaded from correct directory

**Solution:**
```bash
# Use the wrapper instead
.\kimi-omk.bat -p "list skills" --print  # Windows
./kimi-omk -p "list skills" --print      # Linux/macOS

# Should show "oh-my-kimi" in the list
```

**Alternative:** Use explicit skills directory
```bash
kimi-cli --skills-dir "%APPDATA%\kimi\skills" -p "list skills" --print  # Windows
kimi-cli --skills-dir "$HOME/.config/kimi/skills" -p "list skills" --print  # Linux/macOS
```

---

### 🚨 Issue: Wrapper not found or doesn't work

**Symptoms:**
- `.\kimi-omk.bat` not found
- "command not found" error

**Cause:** Wrapper not created or not in correct location

**Solution:**

**Windows:**
```cmd
# Create wrapper manually
echo @echo off > %USERPROFILE%\kimi-omk.bat
echo kimi-cli --skills-dir "%%APPDATA%%\kimi\skills" %%* >> %USERPROFILE%\kimi-omk.bat

# Test
cd %USERPROFILE%
.\kimi-omk.bat --help
```

**Linux/macOS:**
```bash
# Create wrapper manually
cat > ~/kimi-omk << 'EOF'
#!/bin/bash
kimi-cli --skills-dir "$HOME/.config/kimi/skills" "$@"
EOF
chmod +x ~/kimi-omk

# Test
cd ~
./kimi-omk --help
```

---

### 🚨 Issue: Installation test fails

**Symptoms:**
- "Installation test failed" during setup
- OMK installed but not functional

**Cause:** Authentication or path issues

**Solution:**
1. **Restart terminal/command prompt**
2. **Refresh authentication:**
   ```bash
   kimi-cli logout
   kimi-cli login
   ```
3. **Test manually:**
   ```bash
   # Windows
   .\kimi-omk.bat -p "list skills" --print

   # Linux/macOS
   ./kimi-omk -p "list skills" --print
   ```

---

### 🚨 Issue: Permission errors (Windows)

**Symptoms:**
- "Access denied" during installation
- Files not being created

**Cause:** PowerShell execution policy or permissions

**Solution:**
```powershell
# Run PowerShell as Administrator
# Set execution policy temporarily
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

# Re-run installation
.\install.ps1
```

---

### 🚨 Issue: Skills directory not found

**Symptoms:**
- Installation fails with "skills directory not found"
- Path errors in logs

**Cause:** Environment variables or path issues

**Solution:**

**Check directories exist:**
```bash
# Windows
echo %APPDATA%\kimi\skills
dir "%APPDATA%\kimi\skills"

# Linux/macOS
ls -la ~/.config/kimi/skills
```

**Create manually if missing:**
```bash
# Windows
mkdir "%APPDATA%\kimi\skills"

# Linux/macOS
mkdir -p ~/.config/kimi/skills
```

---

### 🚨 Issue: Node.js or Git not found

**Symptoms:**
- Warning during installation
- Some features don't work

**Cause:** Missing dependencies

**Solution:**
1. **Install Node.js 20+:** https://nodejs.org
2. **Install Git:** https://git-scm.com
3. **Restart terminal** after installation
4. **Re-run OMK installation**

---

## 🔍 Diagnostic Commands

### Check OMK Installation
```bash
# Windows
dir "%APPDATA%\kimi\skills\omk"
type "%USERPROFILE%\.kimi\omk_config.json"

# Linux/macOS
ls -la ~/.config/kimi/skills/omk/
cat ~/.kimi/omk_config.json
```

### Test kimi-cli Authentication
```bash
kimi-cli info
kimi-cli -p "hello" --print
```

### Check Wrapper
```bash
# Windows
dir %USERPROFILE%\kimi-omk.bat
type %USERPROFILE%\kimi-omk.bat

# Linux/macOS
ls -la ~/kimi-omk
cat ~/kimi-omk
```

---

## 🆘 Getting Help

If none of these solutions work:

1. **Check logs:**
   - Windows: `%USERPROFILE%\.kimi\logs\`
   - Linux/macOS: `~/.kimi/logs/`

2. **Create GitHub issue:** https://github.com/sergionsantos/oh-my-kimi/issues
   - Include your OS and error messages
   - Attach logs if possible

3. **Common environment info to include:**
   - OS version
   - kimi-cli version: `kimi-cli --version`
   - Node.js version: `node --version`
   - Git version: `git --version`

---

## 🧹 Clean Reinstall

If all else fails, clean reinstall:

```bash
# 1. Remove OMK
# Windows
rmdir /s "%APPDATA%\kimi\skills\omk"
del "%USERPROFILE%\.kimi\omk_config.json"
del "%USERPROFILE%\kimi-omk.bat"

# Linux/macOS
rm -rf ~/.config/kimi/skills/omk/
rm ~/.kimi/omk_config.json
rm ~/kimi-omk

# 2. Logout kimi-cli
kimi-cli logout

# 3. Reinstall OMK
git clone https://github.com/sergionsantos/oh-my-kimi.git
cd oh-my-kimi
./install.sh         # Linux/macOS
# or
.\install.ps1        # Windows
```