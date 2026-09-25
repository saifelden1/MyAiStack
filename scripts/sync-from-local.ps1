<#
.SYNOPSIS
    Syncs live modifications from ~/.gemini/ back into the MyAiStack git repository.
.DESCRIPTION
    Run this script whenever you update skills or directives locally and want to commit them to git.
#>

$ErrorActionPreference = "Stop"

$SourceBase = Join-Path $HOME ".gemini"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$RepoRoot = Split-Path -Parent $ScriptDir

Write-Host "========================================" -ForegroundColor Cyan
Write-Host " 🔄 MyAiStack Reverse Sync" -ForegroundColor Cyan
Write-Host " Source: $SourceBase -> Repo: $RepoRoot" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan

# 1. Sync GEMINI.md
if (Test-Path (Join-Path $SourceBase "GEMINI.md")) {
    Copy-Item -Path (Join-Path $SourceBase "GEMINI.md") -Destination (Join-Path $RepoRoot "global\GEMINI.md") -Force
    Write-Host "[1/4] Synced GEMINI.md" -ForegroundColor Green
}

# 2. Sync Configs
$LocalConfig = Join-Path $SourceBase "config\config.json"
$LocalMcp = Join-Path $SourceBase "config\mcp_config.json"
if (Test-Path $LocalConfig) {
    Copy-Item -Path $LocalConfig -Destination (Join-Path $RepoRoot "config\config.json") -Force
}
if (Test-Path $LocalMcp) {
    Copy-Item -Path $LocalMcp -Destination (Join-Path $RepoRoot "config\mcp_config.json") -Force
}
Write-Host "[2/4] Synced configs" -ForegroundColor Green

# 3. Sync Plugins
$LocalPlugins = Join-Path $SourceBase "config\plugins"
if (Test-Path $LocalPlugins) {
    Copy-Item -Path "$LocalPlugins\*" -Destination (Join-Path $RepoRoot "plugins") -Recurse -Force
    Write-Host "[3/4] Synced plugins & skills" -ForegroundColor Green
}

# 4. Sync Steering & MCP Schemas
$LocalKnowledge = Join-Path $SourceBase "antigravity\knowledge"
$LocalMcpSchemas = Join-Path $SourceBase "antigravity\mcp"
if (Test-Path $LocalKnowledge) {
    Copy-Item -Path "$LocalKnowledge\*" -Destination (Join-Path $RepoRoot "steering") -Recurse -Force
}
if (Test-Path $LocalMcpSchemas) {
    Copy-Item -Path "$LocalMcpSchemas\*" -Destination (Join-Path $RepoRoot "mcp") -Recurse -Force
}
Write-Host "[4/4] Synced steering directives & MCP schemas" -ForegroundColor Green

Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "Sync complete! Run 'git status' and commit your changes." -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
