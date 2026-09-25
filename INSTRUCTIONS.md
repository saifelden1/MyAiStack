# 🤖 MyAiStack Direct Prompt Setup

If you prefer to configure Antigravity directly via chat instead of running a script, clone this repository and paste the prompt below into the Antigravity chat:

```markdown
Configure this Antigravity instance using this repository:
1. Copy `global/GEMINI.md` to `~/.gemini/GEMINI.md`.
2. Copy all files from `config/` to `~/.gemini/config/`.
3. Copy all folders in `plugins/` to `~/.gemini/config/plugins/`.
4. Copy all folders in `steering/` to `~/.gemini/antigravity/knowledge/`.
5. Copy all folders in `mcp/` to `~/.gemini/antigravity/mcp/`.
6. Enforce ADHD Output Style and Karpathy Guidelines defined in `~/.gemini/GEMINI.md`.
7. Verify that plugins and skills are loaded, then confirm completion.
```
