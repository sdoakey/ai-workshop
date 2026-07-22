# AGENTS.md

This document defines practical guidance for AI coding agents and contributors working in this repository.

## 1. Repository Intent

This is an AI-assisted coding workshop repository. Work should optimize for:
- fast learning loops,
- clear examples,
- safe defaults,
- reproducible local and containerized workflows.

Primary areas:
- `requirements/`: project briefs and acceptance criteria.
- `skeletons/`: minimal starter templates (backend and frontend).
- `examples/`: reference implementations.
- `scripts/bootstrap.sh`: interactive scaffold generator from skeletons.

## 2. Working Principles For Agents

- Make the smallest change that satisfies the request.
- Preserve existing project structure and naming conventions.
- Keep skeletons minimal and ready-to-run.
- Prefer Makefile targets when present over ad-hoc commands.
- Update documentation when behavior, commands, or structure changes.
- Never commit secrets, tokens, or credentials.

## 3. Where To Work

- Requirement or acceptance-criteria tasks: start in `requirements/`.
- New starter template work: edit under `skeletons/backend/` or `skeletons/frontend/`.
- Demo/reference app tasks: edit under `examples/`.
- New project bootstrap flow: use and update `scripts/bootstrap.sh`.

If a task does not specify a target area, ask for the intended scope before making broad cross-directory changes.

## 4. Standard Commands

Run commands from the directory of the project you are changing.

### Appointment Booking Example (Node.js + Angular)
Directory: `examples/appointment-booking-nodejs`

- `make help`: list available targets.
- `make install`: install API and frontend dependencies.
- `make dev`: run Postgres and Keycloak in Docker, API + frontend locally with live reload.
- `make up`: build and run everything in Docker.
- `make down`: stop services.
- `make clean`: remove local build artifacts.

### Todo Example (Flask)
Directory: `examples/todo-app-python`

Typical local flow:
1. `python3 -m venv .venv`
2. `source .venv/bin/activate`
3. `pip install -r requirements.txt`
4. `docker-compose up -d`
5. `python app.py`

Stop with `docker-compose down`.

### Skeletons
Directory pattern: `skeletons/<backend|frontend>/<framework-skeleton>`

- `make dev`: primary local development entrypoint.
- `make build`: production build.
- `make test`: test suite (or explicit not-yet-implemented failure).
- `make install`: dependency installation.
- `make clean`: cleanup artifacts.

## 5. Skeleton Authoring Rules

When adding or updating skeletons, align with `.github/skills/create-skeleton/SKILL.md`:
- include required project files (`README.md`, `Makefile`, `Dockerfile`, `docker-compose.yml`, `.gitignore`, and framework entry point),
- keep dependencies minimal,
- support hot reload in `make dev`,
- expose conventional framework ports,
- provide clear README setup instructions for local and Docker workflows.

## 6. Agent Assets In This Repository

Custom agents and prompts are available under `.github/`:
- `.github/agents/python-review.agent.md`
- `.github/agents/security-audit.agent.md`
- `.github/prompts/security-review.prompt.md`

Expected outputs:
- Python review output file: `PYTHON_REVIEW.md`
- Security audit output file: `SECURITY_AUDIT.md`

If you run these review flows, write findings in those files at the root of the reviewed project.

## 7. Quality And Safety Checklist

Before finishing changes:
- run the relevant build/test/dev command for the touched area,
- verify docs and commands still match real behavior,
- keep diffs focused and avoid unrelated refactors,
- confirm no secrets were introduced,
- call out any unverified assumptions in the final summary.

## 8. Non-Goals

- Do not turn skeletons into fully featured production apps.
- Do not add heavy infrastructure unless the task explicitly requires it.
- Do not perform repo-wide rewrites when the request is local.
