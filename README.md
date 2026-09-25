# 🧠 MyAiStack

> Production-grade configuration framework, behavioral directives, and verified skill stack for Google Antigravity.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform: Cross-Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey.svg)](#-quick-start)
[![Antigravity](https://img.shields.io/badge/Antigravity-Ready-brightgreen.svg)](#-included-stack)

---

## ⚡ Quick Start

Clone the repository and run the 1-click installer:

### Windows (PowerShell)
```powershell
git clone https://github.com/saifelden1/MyAiStack.git
cd MyAiStack
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

### macOS / Linux (Bash)
```bash
git clone https://github.com/saifelden1/MyAiStack.git
cd MyAiStack
chmod +x ./scripts/install.sh && ./scripts/install.sh
```

### Or Configure via Antigravity Chat
Clone the repo into any workspace, open Antigravity, and paste:
```markdown
Configure this Antigravity instance using this repository:
1. Copy `global/GEMINI.md` to `~/.gemini/GEMINI.md`.
2. Copy all files from `config/` to `~/.gemini/config/`.
3. Copy all folders in `plugins/` to `~/.gemini/config/plugins/`.
4. Copy all folders in `steering/` to `~/.gemini/antigravity/knowledge/`.
5. Copy all folders in `mcp/` to `~/.gemini/antigravity/mcp/`.
6. Adopt the directives in GEMINI.md and verify active plugins.
```

---

## 🏛️ Architecture & Directory Structure

```text
MyAiStack/
├── global/
│   └── GEMINI.md               # Global directives (ADHD mode, Karpathy rules, safety gates)
├── config/
│   ├── config.json             # Core settings and plugin enablement
│   └── mcp_config.json         # MCP server definitions
├── plugins/                    # Production Antigravity plugins & skills
│   ├── aistack/                # Core engineering, embedded, and architecture skills
│   ├── council/                # Multi-agent deliberation framework
│   ├── google-antigravity-sdk/ # Antigravity agent SDK patterns
│   └── science/                # Scientific research workflows
├── steering/                   # Behavioral and language-specific steering patterns
├── mcp/                        # MCP tool schemas (Konnect, Chrome DevTools)
├── scripts/
│   ├── install.ps1             # Automated Windows deployment
│   ├── install.sh              # Automated Unix deployment
│   └── sync-from-local.ps1     # Live reverse-sync from ~/.gemini/ back to Git
├── INSTRUCTIONS.md             # Chat setup prompt
└── README.md                   # Stack documentation
```

---

## 🎯 Core Directives (`global/GEMINI.md`)

When installed, Antigravity adheres to four strict principles across all workspaces:

1. **ADHD-Optimized Output**:
   - Leads directly with command, path, or code.
   - Strictly suppresses preambles, recaps, and closing pleasantries.
   - Caps lists to 5 items and sequences work into single-step actions.
   - Always concludes with one concrete next action doable in under 2 minutes.

2. **Strict Pre-Action Gate (Zero Action Without Agreement)**:
   - Stops and asks before modifying files, running mutating commands, or switching branches.
   - Prevents unprompted speculative refactors.

3. **Karpathy Guidelines**:
   - Surgical changes: touches only the necessary lines.
   - Simplicity first: minimum viable abstraction.
   - Goal-driven execution: verifiable completion criteria.

4. **Modular Dynamic Skills**:
   - Progressively loads skills on demand to protect context windows.

---

## 🧩 Included Plugins & Skills

| Plugin | Key Skills | Focus Area |
| :--- | :--- | :--- |
| **`aistack`** | `samcs`, `engineer`, `esp-idf`, `esp-idf-n`, `docker-patterns`, `cv-generator`, `karpathy-guidelines` | Autonomous systems, embedded firmware, RTOS, Docker, and core engineering workflows. |
| **`council`** | `council` | Multi-perspective architectural deliberation, triad reviews, and duo debates. |
| **`google-antigravity-sdk`** | `google-antigravity-sdk` | Multi-agent orchestration, subagent delegation, and agent tool design. |
| **`science`** | `reactome`, `string_database`, `uniprot`, `ucsc_conservation`, `unibind` | Computational and biological workflows. |

---

## 🔄 Maintaining Your Stack (Reverse-Sync)

As you improve your skills or tune settings in Antigravity, prevent config drift with the built-in sync script:

```powershell
# Pull live modifications from ~/.gemini back into the repository
powershell -ExecutionPolicy Bypass -File .\scripts\sync-from-local.ps1

# Commit and push
git add .
git commit -m "feat: sync updated skills and directives"
git push origin main
```

---

## 🛡️ License

Released under the [MIT License](LICENSE).
