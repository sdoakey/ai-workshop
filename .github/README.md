# .github AI Customization Layout

This directory hosts repository-scoped AI customization assets used by coding agents and prompt workflows.

## Conventional Structure

```text
.github/
├── agents/
├── skills/
├── prompts/
├── hooks/
└── instructions/
```

Not every repository needs every folder on day one, but this is the conventional layout to grow into.

## Directory Roles

### `agents/`
Defines reusable agent personas or modes for specialized tasks.

Typical file naming:
- `<task-name>.agent.md`

Common contents:
- mission/scope
- constraints and guardrails
- expected outputs and report format

Examples in this repo:
- `python-review.agent.md`
- `security-audit.agent.md`

### `skills/`
Contains domain workflows the agent can invoke for repeatable, multi-step tasks.

Typical layout:
- one folder per skill
- each folder includes `SKILL.md`

Typical path:
- `skills/<skill-name>/SKILL.md`

Common contents:
- trigger phrases
- when to use / when not to use
- required inputs
- step-by-step procedure
- output format

Example in this repo:
- `skills/create-skeleton/SKILL.md`

### `prompts/`
Stores reusable prompt templates for focused analyses or generation tasks.

Typical file naming:
- `<task-name>.prompt.md`

Common contents:
- role framing
- task instructions
- output structure/checklist

Example in this repo:
- `security-review.prompt.md`

### `hooks/`
Automation scripts and policies that run around agent workflows (for example, safety checks and logging).

Typical layout:
- scripts under `hooks/scripts/`

Common use cases:
- PII/secret checks
- policy enforcement
- telemetry/logging

Examples in this repo:
- `hooks/scripts/hook-logger.sh`
- `hooks/scripts/pii-checker.sh`

### `instructions/`
Repository-specific instruction documents consumed by agents to align behavior with project rules.

Typical file naming:
- `*.instructions.md` for scoped guidance
- `copilot-instructions.md` or `AGENTS.md` for broader repository guidance

Common contents:
- coding conventions
- architecture boundaries
- testing and validation expectations
- safety/security constraints

Note:
- This repository currently uses top-level `AGENTS.md` as primary workspace guidance.
- Create `.github/instructions/` when you want additional scoped instruction files.

## Naming Conventions

- Use lowercase kebab-case file and folder names.
- Keep names task-oriented and explicit (for example, `security-audit`, `create-skeleton`).
- Prefer one concern per file.

## Authoring Guidelines

- Keep assets concise and operational.
- Document trigger phrases for discoverability.
- Include "do not use when" guidance to reduce incorrect invocation.
- Version behavior by editing the relevant file in place; avoid duplicate variants unless intentionally experimental.

## How Assets Work Together

- `instructions` define repository rules and constraints.
- `agents` define specialized personas/modes.
- `skills` encode repeatable execution playbooks.
- `prompts` provide reusable task templates.
- `hooks` enforce policy and safety before/after execution.

Used together, they provide consistent, auditable AI-assisted development workflows.
