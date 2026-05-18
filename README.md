# AiStack — Model-Agnostic AI Engineering Framework

> **One onboarding file. Any model. Same outcome.**

AiStack is a portable, model-agnostic configuration framework that ensures **every AI coding assistant** — regardless of vendor, architecture, or training data — arrives at the **same understanding, same behavior, and same project context** after reading a single onboarding file.

---

## Why AiStack?

| Problem | AiStack's Answer |
|---|---|
| Different AI models produce inconsistent results on the same project | A single onboarding protocol forces all models to sync to the same state before writing code |
| Project context is scattered across `.cursorrules`, `CLAUDE.md`, `.github/copilot-instructions.md` | One source of truth (`.ai/`) propagates to every native config automatically |
| Switching AI tools means re-teaching the project from scratch | Read the onboarding file once — any model is instantly up to speed |
| AI assistants make assumptions and hide confusion | Karpathy-style "Think Out Loud" rule mandates visible chain-of-thought before execution |

---

## How It Works

The framework is built on **three pillars**:

### 1. Onboarding Protocol (`onboarding.md`)

The entry point. When any AI agent starts a session, it reads [`onboarding.md`](onboarding.md) and follows a strict initialization sequence:

1. **Identity & Reasoning** — Load the Engineer skill, enable visible chain-of-thought
2. **State Synchronization** — Index project specs (requirements, design, tasks)
3. **Native Config Generation** — Create or update the environment-specific config file (`CLAUDE.md`, `.cursorrules`, `.github/copilot-instructions.md`, etc.)
4. **Sync Report** — Report current task, methodology, and sub-task breakdown before any code is written
5. **Environment Detection** — Identify which IDE/CLI is running and target the correct native file
6. **Data Propagation** — Any new spec or rule created during a session is automatically synced to the native config

**Result:** Whether you're using Claude Code, Cursor, GitHub Copilot, or any future AI tool — after onboarding, they all share the same project knowledge and behavioral constraints.

### 2. Structured Specs (`.ai/specs/`)

| File | Purpose |
|---|---|
| [`requirements.md`](specs/requiremnts.md) | Project scope and constraints |
| [`design.md`](specs/design.md) | Architecture decisions |
| [`tasks.md`](specs/tasks.md) | Current progress and next action |

These three files are the **single source of truth**. Every AI agent must read them before implementation and update them as work progresses.

### 3. Steering & Skills (`.ai/steering/`, `.ai/skills/`)

- **Steering files** define behavioral guardrails (simplicity first, surgical changes, no speculative abstractions)
- **Skills** define domain-specific execution patterns (engineering workflow, testing, security, etc.)

Both are loaded automatically during onboarding and enforce consistent behavior across all models.

---

## Quick Start

### For a New Project

1. Copy the `.ai/` directory into your project root
2. Fill in [`specs/requirements.md`](specs/requiremnts.md), [`specs/design.md`](specs/design.md), and [`specs/tasks.md`](specs/tasks.md) with your project details
3. Open your preferred AI tool and point it to the project
4. The AI reads [`onboarding.md`](onboarding.md) and self-initializes — no manual setup needed

### For an Existing Project

1. Add the `.ai/` directory to your existing repo
2. Document your current state in the spec files
3. Any AI session from any tool now starts with full context awareness

### Switching AI Tools

No re-configuration needed. The onboarding protocol detects your environment and generates the appropriate native config:

| Environment | Native Config Target |
|---|---|
| Claude Code CLI | `CLAUDE.md` |
| Cursor IDE | `.cursorrules` |
| GitHub Copilot | `.github/copilot-instructions.md` |
| Generic / Web | `.ai/SESSION_LOG.md` |

Switch from Claude to Cursor? Just open Cursor — it reads the same `.ai/` and generates its own native file. Same knowledge. Same behavior.

---

## Core Principles

### Model-Agnostic by Design

AiStack does not rely on any model-specific features, prompt formats, or proprietary APIs. The entire framework is **plain Markdown files** — readable by any language model, any tool, any version.

**The guarantee:** After reading [`onboarding.md`](onboarding.md), any sufficiently capable AI model will:
- Know the project scope, architecture, and current task
- Follow the same behavioral constraints (simplicity, surgical changes, think-out-loud)
- Maintain the same documentation integrity rules
- Sync new knowledge to the same native config files

### Simplicity First (Karpathy Guidelines)

- Minimum code that solves the problem — nothing speculative
- No abstractions for single-use code
- If 200 lines could be 50, rewrite it
- Surgical changes only — touch what you must, match existing style

### Transparent Execution

Every AI agent must **think out loud** before acting:
- State methodology and reasoning visibly
- Surface assumptions and ambiguities instead of hiding them
- Break large tasks into atomic, verifiable mini-tasks
- Define success criteria before implementation

### Single Source of Truth

All project knowledge lives in `.ai/`. Native config files (`CLAUDE.md`, `.cursorrules`, etc.) are **derived artifacts** — generated and synced from `.ai/`, never edited independently. This prevents drift and ensures consistency.

---

## Directory Structure

```
.ai/
├── README.md              ← You are here
├── onboarding.md          ← Entry point for any AI agent
├── specs/
│   ├── requiremnts.md     ← Project scope & constraints
│   ├── design.md          ← Architecture decisions
│   └── tasks.md           ← Current progress & next action
├── steering/
│   ├── Engineer.md        ← Core behavioral directives
│   ├── development-workflow.md
│   ├── git-workflow.md
│   ├── patterns.md
│   └── ...                ← Domain-specific guardrails
├── skills/
│   ├── engineer/SKILL.md  ← Primary engineering skill
│   ├── coding-standards/
│   ├── security-review/
│   └── ...                ← Domain-specific execution patterns
├── hooks/
│   └── Engineer.md        ← IDE-level directives
└── docs/                  ← Supplementary documentation
```

---

## The Convergence Guarantee

This is the core promise of AiStack:

> **After reading the onboarding file, any AI model — Claude, GPT, Gemini, Llama, Mistral, or any future model — will converge to the same project understanding and follow the same behavioral rules.**

The framework achieves this through:
1. **Mandatory initialization sequence** — no model can skip steps
2. **Plain Markdown format** — no proprietary syntax, universally parseable
3. **Explicit behavioral constraints** — written as rules, not implied by training
4. **State-driven execution** — tasks and specs drive behavior, not model preferences

The onboarding file is the **contract** between you and every AI assistant you'll ever use. It's not prompt engineering — it's **protocol engineering**.

---

## Contributing

To extend AiStack for your own workflows:

1. Add new skills in `.ai/skills/<name>/SKILL.md` with the standard frontmatter format
2. Add new steering rules in `.ai/steering/<name>.md`
3. Update [`onboarding.md`](onboarding.md) if the new skill/steering should be loaded during initialization
4. The framework will auto-propagate changes to native configs on next session

---

## License

This framework is provided as-is for use in any project. No restrictions on adoption, modification, or distribution.