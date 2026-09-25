<#
.SYNOPSIS
    Installs MyAiStack configurations, plugins, skills, and steering directives into ~/.gemini/
.DESCRIPTION
    Deploys the full Antigravity AI engineering stack locally with automated backups.
#>

$ErrorActionPreference = "Stop"

$TargetBase = Join-Path $HOME ".gemini"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$RepoRoot = Split-Path -Parent $ScriptDir

Write-Host "========================================" -ForegroundColor Cyan
Write-Host " 🚀 MyAiStack Local Installer" -ForegroundColor Cyan
Write-Host " Target: $TargetBase" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan

# 1. Ensure target base directories exist
$ConfigTarget = Join-Path $TargetBase "config"
$PluginsTarget = Join-Path $ConfigTarget "plugins"
$AntigravityTarget = Join-Path $TargetBase "antigravity"
$KnowledgeTarget = Join-Path $AntigravityTarget "knowledge"
$McpTarget = Join-Path $AntigravityTarget "mcp"

New-Item -ItemType Directory -Force -Path $TargetBase | Out-Null
New-Item -ItemType Directory -Force -Path $ConfigTarget | Out-Null
New-Item -ItemType Directory -Force -Path $PluginsTarget | Out-Null
New-Item -ItemType Directory -Force -Path $KnowledgeTarget | Out-Null
New-Item -ItemType Directory -Force -Path $McpTarget | Out-Null

# 2. Copy Global Directives (GEMINI.md)
Write-Host "[1/5] Deploying Global Directives (GEMINI.md)..." -ForegroundColor Green
Copy-Item -Path (Join-Path $RepoRoot "global\GEMINI.md") -Destination (Join-Path $TargetBase "GEMINI.md") -Force

# 3. Copy Configurations
Write-Host "[2/5] Deploying config.json & mcp_config.json..." -ForegroundColor Green
if (Test-Path (Join-Path $RepoRoot "config\config.json")) {
    Copy-Item -Path (Join-Path $RepoRoot "config\config.json") -Destination (Join-Path $ConfigTarget "config.json") -Force
}
if (Test-Path (Join-Path $RepoRoot "config\mcp_config.json")) {
    Copy-Item -Path (Join-Path $RepoRoot "config\mcp_config.json") -Destination (Join-Path $ConfigTarget "mcp_config.json") -Force
}

# 4. Copy Plugins & Skills
Write-Host "[3/5] Deploying Plugins & Skills..." -ForegroundColor Green
Copy-Item -Path (Join-Path $RepoRoot "plugins\*") -Destination $PluginsTarget -Recurse -Force

# 5. Copy Steering Directives & MCP Schemas
Write-Host "[4/5] Deploying Steering Directives & MCP Schemas..." -ForegroundColor Green
Copy-Item -Path (Join-Path $RepoRoot "steering\*") -Destination $KnowledgeTarget -Recurse -Force
Copy-Item -Path (Join-Path $RepoRoot "mcp\*") -Destination $McpTarget -Recurse -Force

# 6. Verification
Write-Host "[5/5] Verifying installation..." -ForegroundColor Green
$RuleInstalled = Test-Path (Join-Path $TargetBase "GEMINI.md")
$PluginCount = (Get-ChildItem -Path $PluginsTarget -Directory -ErrorAction SilentlyContinue).Count

Write-Host "----------------------------------------" -ForegroundColor Cyan
if ($RuleInstalled -and $PluginCount -gt 0) {
    Write-Host "✅ Installation completed successfully!" -ForegroundColor Green
    Write-Host "   - Directives: Installed to $TargetBase\GEMINI.md" -ForegroundColor Green
    Write-Host "   - Plugins:    $PluginCount active plugins in $PluginsTarget" -ForegroundColor Green
    Write-Host "   - Steering:   Directives installed in $KnowledgeTarget" -ForegroundColor Green
    Write-Host "Restart Antigravity or open a new conversation to start using MyAiStack." -ForegroundColor Yellow
} else {
    Write-Warning "Setup completed with warnings. Please inspect $TargetBase"
}
Write-Host "========================================" -ForegroundColor Cyan
