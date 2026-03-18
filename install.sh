#!/bin/bash

# Oh My Kimi Installation Script
# Supports Linux, macOS, and Windows (via Git Bash/WSL)

set -e

OMK_VERSION="1.0.0"
OMK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Oh My Kimi v${OMK_VERSION} Installer"
echo "========================================"
echo ""

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
    SKILLS_DIR="${HOME}/.config/kimi/skills"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
    SKILLS_DIR="${HOME}/.config/kimi/skills"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    OS="windows"
    SKILLS_DIR="${APPDATA}/kimi/skills"
else
    echo "❌ Unsupported OS: $OSTYPE"
    exit 1
fi

echo "Detected OS: $OS"
echo ""

# Check prerequisites
echo "🔍 Checking prerequisites..."

if ! command -v kimi &> /dev/null; then
    echo "❌ kimi-cli not found. Please install it first:"
    echo "   https://www.kimi.com/code"
    exit 1
fi
echo "✓ kimi-cli found"

if ! command -v node &> /dev/null; then
    echo "⚠️  Node.js not found. Some features may not work."
else
    NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
    if [ "$NODE_VERSION" -lt 20 ]; then
        echo "⚠️  Node.js version < 20. Consider upgrading."
    else
        echo "✓ Node.js $(node --version)"
    fi
fi

if ! command -v git &> /dev/null; then
    echo "⚠️  Git not found. Some features may not work."
else
    echo "✓ Git $(git --version | cut -d' ' -f3)"
fi

echo ""

# Create skills directory
echo "📁 Creating skills directory..."
mkdir -p "$SKILLS_DIR"
echo "✓ Skills directory: $SKILLS_DIR"
echo ""

# Install OMK
echo "📦 Installing Oh My Kimi..."

if [ -d "${OMK_DIR}/omk" ]; then
    # Local installation (from cloned repo)
    cp -r "${OMK_DIR}/omk" "$SKILLS_DIR/"
    echo "✓ Copied from local directory"
else
    # Remote installation (download from GitHub)
    echo "📥 Downloading from GitHub..."
    TEMP_DIR=$(mktemp -d)
    git clone --depth 1 https://github.com/sergionsantos/oh-my-kimi.git "$TEMP_DIR"
    cp -r "$TEMP_DIR/omk" "$SKILLS_DIR/"
    rm -rf "$TEMP_DIR"
    echo "✓ Downloaded and installed"
fi

echo ""

# Count components
AGENT_COUNT=$(find "$SKILLS_DIR/omk/agents" -name "*.md" 2>/dev/null | wc -l)
SKILL_COUNT=$(find "$SKILLS_DIR/omk/skills" -name "SKILL.md" 2>/dev/null | wc -l)

echo "📊 Installed:"
echo "   • $AGENT_COUNT agents"
echo "   • $SKILL_COUNT skills"
echo ""

# Create global config if doesn't exist
CONFIG_FILE="${HOME}/.kimi/omk_config.json"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "⚙️  Creating default configuration..."
    mkdir -p "$(dirname "$CONFIG_FILE")"
    cat > "$CONFIG_FILE" << EOF
{
  "version": "${OMK_VERSION}",
  "default_mode": "team",
  "max_parallel_agents": 6,
  "auto_save": true,
  "preferences": {
    "language": "en",
    "verbosity": "normal"
  }
}
EOF
    echo "✓ Configuration created: $CONFIG_FILE"
else
    echo "ℹ️  Configuration already exists: $CONFIG_FILE"
fi

echo ""

# Verify installation
echo "🔍 Verifying installation..."
if [ -f "$SKILLS_DIR/omk/SKILL.md" ]; then
    echo "✓ OMK main skill found"
else
    echo "❌ Installation failed - main skill not found"
    exit 1
fi

if [ -d "$SKILLS_DIR/omk/agents" ]; then
    echo "✓ Agents directory found"
else
    echo "❌ Installation failed - agents directory not found"
    exit 1
fi

if [ -d "$SKILLS_DIR/omk/skills" ]; then
    echo "✓ Skills directory found"
else
    echo "❌ Installation failed - skills directory not found"
    exit 1
fi

echo ""

# Final message
echo "✅ Installation Complete!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "🎉 Oh My Kimi is ready to use!"
echo ""
echo "Quick start:"
echo "  $autopilot \"build a REST API\""
echo "  $team 3 \"fix all errors\""
echo "  /omk-help"
echo ""
echo "Documentation:"
echo "  https://github.com/sergionsantos/oh-my-kimi#readme"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
