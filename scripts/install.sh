#!/usr/bin/env bash
# MyAiStack Local Installer for macOS / Linux
# Usage: ./scripts/install.sh

set -e

TARGET_BASE="$HOME/.gemini"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

echo "========================================"
echo " 🚀 MyAiStack Local Installer"
echo " Target: $TARGET_BASE"
echo "========================================"

mkdir -p "$TARGET_BASE/config/plugins"
mkdir -p "$TARGET_BASE/antigravity/knowledge"
mkdir -p "$TARGET_BASE/antigravity/mcp"

# 1. Deploy GEMINI.md
echo "[1/5] Deploying Global Directives (GEMINI.md)..."
cp -f "$REPO_ROOT/global/GEMINI.md" "$TARGET_BASE/GEMINI.md"

# 2. Deploy Configs
echo "[2/5] Deploying config.json & mcp_config.json..."
[ -f "$REPO_ROOT/config/config.json" ] && cp -f "$REPO_ROOT/config/config.json" "$TARGET_BASE/config/config.json"
[ -f "$REPO_ROOT/config/mcp_config.json" ] && cp -f "$REPO_ROOT/config/mcp_config.json" "$TARGET_BASE/config/mcp_config.json"

# 3. Deploy Plugins
echo "[3/5] Deploying Plugins & Skills..."
cp -rf "$REPO_ROOT/plugins/"* "$TARGET_BASE/config/plugins/"

# 4. Deploy Steering & MCP
echo "[4/5] Deploying Steering Directives & MCP Schemas..."
cp -rf "$REPO_ROOT/steering/"* "$TARGET_BASE/antigravity/knowledge/"
cp -rf "$REPO_ROOT/mcp/"* "$TARGET_BASE/antigravity/mcp/"

# 5. Verification
echo "[5/5] Verifying installation..."
if [ -f "$TARGET_BASE/GEMINI.md" ] && [ -d "$TARGET_BASE/config/plugins" ]; then
    echo "----------------------------------------"
    echo "✅ Installation completed successfully!"
    echo "Restart Antigravity to activate your stack."
    echo "========================================"
else
    echo "Warning: Verification failed. Check $TARGET_BASE"
fi
