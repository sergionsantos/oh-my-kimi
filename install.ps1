# Oh My Kimi Installation Script for Windows
# Run in PowerShell as Administrator

$OMK_VERSION = "1.0.0"
$ErrorActionPreference = "Stop"

Write-Host "🚀 Oh My Kimi v${OMK_VERSION} Installer" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-not $isAdmin) {
    Write-Host "⚠️  Warning: Not running as Administrator. Some features may not work." -ForegroundColor Yellow
}

# Detect Windows version
$OS = "windows"
$SKILLS_DIR = Join-Path $env:APPDATA "kimi\skills"

Write-Host "Detected OS: Windows" -ForegroundColor Green
Write-Host "Skills directory: $SKILLS_DIR" -ForegroundColor Gray
Write-Host ""

# Check prerequisites
Write-Host "🔍 Checking prerequisites..." -ForegroundColor Cyan

$kimi = Get-Command kimi -ErrorAction SilentlyContinue
if (-not $kimi) {
    Write-Host "❌ kimi-cli not found. Please install it first:" -ForegroundColor Red
    Write-Host "   https://www.kimi.com/code" -ForegroundColor Gray
    exit 1
}
Write-Host "✓ kimi-cli found" -ForegroundColor Green

$node = Get-Command node -ErrorAction SilentlyContinue
if (-not $node) {
    Write-Host "⚠️  Node.js not found. Some features may not work." -ForegroundColor Yellow
} else {
    $NODE_VERSION = (node --version).Substring(1, 2)
    if ([int]$NODE_VERSION -lt 20) {
        Write-Host "⚠️  Node.js version < 20. Consider upgrading." -ForegroundColor Yellow
    } else {
        Write-Host "✓ Node.js $(node --version)" -ForegroundColor Green
    }
}

$git = Get-Command git -ErrorAction SilentlyContinue
if (-not $git) {
    Write-Host "⚠️  Git not found. Some features may not work." -ForegroundColor Yellow
} else {
    Write-Host "✓ Git $(git --version)" -ForegroundColor Green
}

Write-Host ""

# Create skills directory
Write-Host "📁 Creating skills directory..." -ForegroundColor Cyan
New-Item -ItemType Directory -Force -Path $SKILLS_DIR | Out-Null
Write-Host "✓ Skills directory created" -ForegroundColor Green
Write-Host ""

# Install OMK
Write-Host "📦 Installing Oh My Kimi..." -ForegroundColor Cyan

$OMK_DIR = $PSScriptRoot
if (-not $OMK_DIR) {
    $OMK_DIR = Get-Location
}

if (Test-Path (Join-Path $OMK_DIR "omk")) {
    # Local installation
    Write-Host "📂 Installing from local directory..." -ForegroundColor Gray
    Copy-Item -Path (Join-Path $OMK_DIR "omk") -Destination $SKILLS_DIR -Recurse -Force
    Write-Host "✓ Copied from local directory" -ForegroundColor Green
} else {
    # Remote installation
    Write-Host "📥 Downloading from GitHub..." -ForegroundColor Gray
    $TEMP_DIR = Join-Path $env:TEMP "omk-install-$(Get-Random)"
    git clone --depth 1 https://github.com/sergio-ventura/oh-my-kimi.git $TEMP_DIR
    Copy-Item -Path (Join-Path $TEMP_DIR "omk") -Destination $SKILLS_DIR -Recurse -Force
    Remove-Item -Path $TEMP_DIR -Recurse -Force
    Write-Host "✓ Downloaded and installed" -ForegroundColor Green
}

Write-Host ""

# Count components
$AGENT_COUNT = (Get-ChildItem -Path (Join-Path $SKILLS_DIR "omk\agents") -Filter "*.md" -ErrorAction SilentlyContinue).Count
$SKILL_COUNT = (Get-ChildItem -Path (Join-Path $SKILLS_DIR "omk\skills") -Filter "SKILL.md" -Recurse -ErrorAction SilentlyContinue).Count

Write-Host "📊 Installed:" -ForegroundColor Cyan
Write-Host "   • $AGENT_COUNT agents" -ForegroundColor Gray
Write-Host "   • $SKILL_COUNT skills" -ForegroundColor Gray
Write-Host ""

# Create global config
$CONFIG_FILE = Join-Path $env:USERPROFILE ".kimi\omk_config.json"
if (-not (Test-Path $CONFIG_FILE)) {
    Write-Host "⚙️  Creating default configuration..." -ForegroundColor Cyan
    New-Item -ItemType Directory -Force -Path (Split-Path $CONFIG_FILE) | Out-Null
    $CONFIG = @{
        version = $OMK_VERSION
        default_mode = "team"
        max_parallel_agents = 6
        auto_save = $true
        preferences = @{
            language = "en"
            verbosity = "normal"
        }
    } | ConvertTo-Json -Depth 3
    $CONFIG | Out-File -FilePath $CONFIG_FILE -Encoding UTF8
    Write-Host "✓ Configuration created" -ForegroundColor Green
} else {
    Write-Host "ℹ️  Configuration already exists" -ForegroundColor Yellow
}

Write-Host ""

# Verify installation
Write-Host "🔍 Verifying installation..." -ForegroundColor Cyan

$mainSkill = Join-Path $SKILLS_DIR "omk\SKILL.md"
if (Test-Path $mainSkill) {
    Write-Host "✓ OMK main skill found" -ForegroundColor Green
} else {
    Write-Host "❌ Installation failed - main skill not found" -ForegroundColor Red
    exit 1
}

$agentsDir = Join-Path $SKILLS_DIR "omk\agents"
if (Test-Path $agentsDir) {
    Write-Host "✓ Agents directory found" -ForegroundColor Green
} else {
    Write-Host "❌ Installation failed - agents directory not found" -ForegroundColor Red
    exit 1
}

$skillsDir = Join-Path $SKILLS_DIR "omk\skills"
if (Test-Path $skillsDir) {
    Write-Host "✓ Skills directory found" -ForegroundColor Green
} else {
    Write-Host "❌ Installation failed - skills directory not found" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Final message
Write-Host "✅ Installation Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""
Write-Host "🎉 Oh My Kimi is ready to use!" -ForegroundColor Green
Write-Host ""
Write-Host "Quick start:" -ForegroundColor Cyan
Write-Host '  $autopilot "build a REST API"' -ForegroundColor Yellow
Write-Host '  $team 3 "fix all errors"' -ForegroundColor Yellow
Write-Host "  /omk-help" -ForegroundColor Yellow
Write-Host ""
Write-Host "Documentation:" -ForegroundColor Cyan
Write-Host "  https://github.com/sergio-ventura/oh-my-kimi#readme" -ForegroundColor Gray
Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan

Pause
