<div align="center">

# 🧠 AiStack

### Model-Agnostic AI Engineering Framework

**One onboarding file. Any model. Same outcome.**

[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)

---

> *"After reading the onboarding file, any AI model — Claude, GPT, Gemini, Llama, Mistral, or any future model — will converge to the same project understanding and follow the same behavioral rules."*

[🚀 Quick Start](#-quick-start) · [📖 How It Works](#-how-it-works) · [🧩 Core Principles](#-core-principles) · [📁 Directory Structure](#-directory-structure) · [🔄 The Convergence Guarantee](#-the-convergence-guarantee)

</div>

---

## 🎯 Why AiStack?

Every AI coding assistant has its own config format, its own assumptions, its own way of interpreting instructions. This creates **chaos** when you switch tools or work across teams.

AiStack eliminates that chaos with a **single protocol** that every model follows.

<table>
<tr>
<td width="50%" align="center"><h3>❌ Without AiStack</h3></td>
<td width="50%" align="center"><h3>✅ With AiStack</h3></td>
</tr>
<tr>
<td>

```
Claude → reads CLAUDE.md
Cursor → reads .cursorrules
Copilot → reads copilot-instructions.md
Result → 3 different interpretations
```

</td>
<td>

```
Any Model → reads onboarding.md
           → syncs to .ai/specs/
           → generates native config
Result → 1 unified understanding
```

</td>
</tr>
<tr>
<td align="center">🤯 Fragmented context, inconsistent behavior</td>
<td align="center">🎯 Unified context, consistent behavior</td>
</tr>
</table>

---

## 🚀 Quick Start

### For a New Project

```bash
# 1. Copy the .ai/ directory into your project root
cp -r .ai/ /your-project/

# 2. Fill in the spec files with your project details
#    .ai/specs/requirements.md  → Scope & constraints
#    .ai/specs/design.md        → Architecture decisions
#    .ai/specs/tasks.md         → Current progress & next action

# 3. Open your preferred AI tool — it self-initializes
#    No manual setup needed!
```

### For an Existing Project

```bash
# 1. Add .ai/ to your existing repo
git add .ai/

# 2. Document your current state in the spec files

# 3. Any AI session from any tool now starts with full context
```

### Switching AI Tools — Zero Re-Configuration

| Environment | Native Config Target | Auto-Generated? |
|:---|:---|:---:|
| 🟠 Claude Code CLI | `CLAUDE.md` | ✅ |
| 🔵 Cursor IDE | `.cursorrules` | ✅ |
| 🟣 GitHub Copilot | `.github/copilot-instructions.md` | ✅ |
| ⚪ Generic / Web | `.ai/SESSION_LOG.md` | ✅ |

> Switch from Claude to Cursor? Just open Cursor — it reads the same `.ai/` and generates its own native file. **Same knowledge. Same behavior. Zero friction.**

---

## 📖 How It Works

The framework is built on **three pillars** that work together to guarantee model convergence:

### Pillar 1️⃣ — Onboarding Protocol

The entry point. When any AI agent starts a session, it reads [`onboarding.md`](onboarding.md) and follows a **strict initialization sequence**:

```
┌─────────────────────────────────────────────────────────┐
│                  ONBOARDING PROTOCOL                     │
│                                                         │
│  Step 1 ──▶ Load Identity (Engineer Skill)              │
│  Step 2 ──▶ Enable Visible Chain-of-Thought             │
│  Step 3 ──▶ Index Project Specs (reqs, design, tasks)   │
│  Step 4 ──▶ Detect Environment (Claude? Cursor? Copilot?)│
│  Step 5 ──▶ Generate/Sync Native Config File            │
│  Step 6 ──▶ Report Status, Methodology & Sub-tasks      │
│  Step 7 ──▶ Propagate New Data to Native Config         │
│                                                         │
│  ✅ Ready to implement — with full project context       │
└─────────────────────────────────────────────────────────┘
```

<details>
<summary>📋 View the full onboarding sequence</summary>

```markdown
## 1. IDENTITY & REASONING ENGINE
- Primary Skill: Load .ai/skills/Engineer.md
- Think Out Loud: Visible Chain-of-Thought required before execution

## 2. STATE SYNCHRONIZATION
- Index Project: Read .ai/specs/requirements.md, design.md, and tasks.md
- Locate Pointer: Identify the active task in tasks.md

## 3. NATIVE CONFIGURATION
- Generate/Update native intelligence file (CLAUDE.md, .cursorrules, etc.)
- Instruction: "Always perform visible step-by-step breakdown before implementation"

## 4. INITIAL SYNC REPORT
- Status: Which task are we starting?
- Methodology: "Thinking Out Loud" analysis
- Sub-tasks: Breakdown of mini-steps

## 5. ENVIRONMENT DETECTION
- Claude Code CLI → Target CLAUDE.md
- Cursor IDE → Target .cursorrules
- GitHub Copilot → Target .github/copilot-instructions.md
- Generic/Web → Target .ai/SESSION_LOG.md

## 6. THE SYNC COMMAND
- Load Identity → Read .ai/skills/Engineer.md
- Scan State → Read all files in .ai/specs/
- Generate/Sync → Update native config if missing or outdated

## 7. DATA PROPAGATION
- New specs or rules → Must propagate to native config
- Future sessions are "born" with that knowledge
```

</details>

### Pillar 2️⃣ — Structured Specs

Three files form the **single source of truth** for every project:

| File | Purpose | Analogy |
|:---|:---|:---|
| [`requirements.md`](specs/requiremnts.md) | Scope & constraints | 🎯 **"What we're building"** |
| [`design.md`](specs/design.md) | Architecture decisions | 🏗️ **"How we're building it"** |
| [`tasks.md`](specs/tasks.md) | Current progress & next action | 📋 **"Where we are right now"** |

> Every AI agent must read these before implementation and **update them as work progresses**. No model can skip this step.

### Pillar 3️⃣ — Steering & Skills

```
┌──────────────────┐     ┌──────────────────┐
│   STEERING FILES  │     │     SKILLS        │
│                   │     │                   │
│ • Simplicity First│     │ • Engineer        │
│ • Surgical Changes│     │ • Coding Standards│
│ • No Assumptions  │     │ • Security Review │
│ • Think Out Loud  │     │ • API Design      │
│ • Git Workflow    │     │ • Docker Patterns │
│ • Testing Rules   │     │ • Python Patterns │
│                   │     │ • Frontend Patterns│
│  = BEHAVIORAL     │     │  = EXECUTION      │
│    GUARDRAILS     │     │    PATTERNS       │
└──────────────────┘     └──────────────────┘
         │                        │
         └────────┬───────────────┘
                  ▼
      ┌─────────────────────┐
      │  CONSISTENT BEHAVIOR │
      │  ACROSS ALL MODELS   │
      └─────────────────────┘
```

---

## 🧩 Core Principles

### 🔄 Model-Agnostic by Design

AiStack does not rely on any model-specific features, prompt formats, or proprietary APIs. The entire framework is **plain Markdown files** — readable by any language model, any tool, any version.

```
    Claude ──┐
    GPT ────┤
    Gemini ──┤──▶ onboarding.md ──▶ Same Understanding ──▶ Same Behavior
    Llama ───┤
    Mistral ─┤
    Future ──┘
```

**The guarantee:** After reading [`onboarding.md`](onboarding.md), any sufficiently capable AI model will:
- ✅ Know the project scope, architecture, and current task
- ✅ Follow the same behavioral constraints (simplicity, surgical changes, think-out-loud)
- ✅ Maintain the same documentation integrity rules
- ✅ Sync new knowledge to the same native config files

### ✨ Simplicity First (Karpathy Guidelines)

| Rule | Meaning |
|:---|:---|
| **Think & Surface** | Don't hide assumptions. If ambiguous, pause and clarify |
| **Simplicity First** | Minimum code that solves the problem. Nothing speculative |
| **Surgical Changes** | Touch only what you must. Match existing style perfectly |
| **Goal-Driven** | Define success criteria. Loop until verified |

> *"If you write 200 lines and it could be 50, rewrite it."*

### 🔍 Transparent Execution

Every AI agent must **think out loud** before acting:

```
┌──────────────────────────────────────────┐
│         THINK OUT LOUD PROTOCOL           │
│                                          │
│  1. 📣 State methodology & reasoning     │
│  2. 📣 Surface assumptions explicitly    │
│  3. 📣 Break into atomic mini-tasks      │
│  4. 📣 Define success criteria upfront   │
│  5. 📣 Identify risks & edge cases       │
│                                          │
│  THEN ──▶ Write code                     │
└──────────────────────────────────────────┘
```

### 📌 Single Source of Truth

All project knowledge lives in `.ai/`. Native config files are **derived artifacts**:

```
  .ai/ (SOURCE)          Native Configs (DERIVED)
  ┌──────────┐           ┌──────────────┐
  │ specs/   │──────────▶│ CLAUDE.md    │
  │ steering/│──────────▶│ .cursorrules │
  │ skills/  │──────────▶│ copilot-*.md │
  │ onboarding│──────────▶│ SESSION_LOG  │
  └──────────┘           └──────────────┘
       │                       │
       │    Auto-synced        │
       │◀──────────────────────│
       │  (never edit directly)│
```

> Native configs are **generated and synced** from `.ai/`, never edited independently. This prevents drift and ensures consistency across all tools.

---

## 📁 Directory Structure

```
.ai/
│
├── 📄 README.md                 ← You are here (framework documentation)
├── 📄 onboarding.md             ← Entry point for any AI agent
│
├── 📂 specs/                    ← Single Source of Truth
│   ├── 📄 requiremnts.md        ← Project scope & constraints
│   ├── 📄 design.md             ← Architecture decisions
│   └── 📄 tasks.md              ← Current progress & next action
│
├── 📂 steering/                 ← Behavioral Guardrails
│   ├── 📄 Engineer.md           ← Core behavioral directives
│   ├── 📄 development-workflow.md
│   ├── 📄 git-workflow.md
│   ├── 📄 patterns.md
│   ├── 📄 security.md
│   ├── 📄 testing.md
│   ├── 📄 performance.md
│   ├── 📄 lessons-learned.md
│   └── 📄 ...                   ← Domain-specific guardrails
│
├── 📂 skills/                   ← Execution Patterns
│   ├── 📂 engineer/
│   │   └── 📄 SKILL.md          ← Primary engineering skill
│   ├── 📂 coding-standards/
│   ├── 📂 security-review/
│   ├── 📂 api-design/
│   ├── 📂 backend-patterns/
│   ├── 📂 frontend-patterns/
│   ├── 📂 docker-patterns/
│   ├── 📂 python-patterns/
│   ├── 📂 golang-patterns/
│   ├── 📂 e2e-testing/
│   ├── 📂 cv-generator/
│   ├── 📂 spice/
│   ├── 📂 esp-idf/
│   └── 📂 ...                   ← Domain-specific execution patterns
│
├── 📂 hooks/                    ← IDE-Level Directives
│   └── 📄 Engineer.md           ← Master IDE directives
│
└── 📂 docs/                     ← Supplementary documentation
```

---

## 🔄 The Convergence Guarantee

This is the **core promise** of AiStack:

<div align="center">

```
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║   ANY MODEL ──▶ onboarding.md ──▶ SAME UNDERSTANDING        ║
║                                                              ║
║   Claude  ──▶ onboarding.md ──▶ ✅ Same project context     ║
║   GPT     ──▶ onboarding.md ──▶ ✅ Same behavioral rules    ║
║   Gemini  ──▶ onboarding.md ──▶ ✅ Same task awareness      ║
║   Llama   ──▶ onboarding.md ──▶ ✅ Same execution pattern   ║
║   Mistral ──▶ onboarding.md ──▶ ✅ Same documentation rules ║
║   Future  ──▶ onboarding.md ──▶ ✅ Same convergence point   ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

</div>

The framework achieves this through **four mechanisms**:

| # | Mechanism | How It Works |
|:---:|:---|:---|
| 1 | **Mandatory initialization** | No model can skip the onboarding steps — they're enforced as a protocol |
| 2 | **Plain Markdown format** | No proprietary syntax — universally parseable by any language model |
| 3 | **Explicit behavioral constraints** | Written as rules, not implied by training data |
| 4 | **State-driven execution** | Tasks and specs drive behavior, not model preferences or defaults |

> The onboarding file is the **contract** between you and every AI assistant you'll ever use. It's not prompt engineering — it's **protocol engineering**.

---

## 🛠️ Extending AiStack

To add new workflows or domain patterns:

```bash
# 1. Create a new skill
.ai/skills/<name>/SKILL.md    # Use standard frontmatter format

# 2. Create a new steering rule
.ai/steering/<name>.md        # Add inclusion: always/auto header

# 3. Update onboarding.md if the new skill/steering should load during init

# 4. Framework auto-propagates changes to native configs on next session
```

<details>
<summary>📝 SKILL.md Frontmatter Template</summary>

```yaml
---
name: your-skill-name
description: Brief description of what this skill provides
---

# Skill Title

## 1. Initialization
Steps to set up before execution...

## 2. Execution Protocol
How to carry out the skill...

## 3. Verification
How to confirm success...
```

</details>

<details>
<summary>📝 Steering.md Frontmatter Template</summary>

```yaml
---
inclusion: always  # or: auto
description: Brief description of this steering rule
---

# Rule Title

Behavioral constraints and guidelines...
```

</details>

---

## 📊 Comparison with Alternatives

| Feature | AiStack | `.cursorrules` only | `CLAUDE.md` only | `.github/copilot-instructions.md` only |
|:---|:---:|:---:|:---:|:---:|
| Model-agnostic | ✅ | ❌ Cursor only | ❌ Claude only | ❌ Copilot only |
| Auto-sync to native configs | ✅ | ❌ | ❌ | ❌ |
| Structured project state | ✅ Specs | ❌ | ❌ | ❌ |
| Behavioral guardrails | ✅ Steering | ⚠️ Partial | ⚠️ Partial | ⚠️ Partial |
| Domain-specific skills | ✅ 15+ | ❌ | ❌ | ❌ |
| Think-out-loud enforcement | ✅ | ❌ | ❌ | ❌ |
| Zero re-config on tool switch | ✅ | ❌ | ❌ | ❌ |

---

<div align="center">

## 🤝 Contributing & License

This project is licensed under the **MIT License** — free to use, modify, and distribute.
See [LICENSE](../LICENSE) for full details.

Contributions welcome! Fork, branch, and PR.

---

**Built with the principle that the best AI workflow is one that doesn't depend on which AI you use.**

[⬆ Back to Top](#-aistack--model-agnostic-ai-engineering-framework)

</div>