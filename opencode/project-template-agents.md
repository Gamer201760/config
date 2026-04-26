## Architecture Rules (authoritative)
- Enforce SOLID and Clean Architecture boundaries
- Define interfaces at point of use; keep implementations in outer layers
- Keep dependency direction inward
- Keep decisions explicit, minimal, and testable

### Project Structure (authoritative)
Use this folder structure and respect dependency direction:
- `domain/` – (entities, value objects, domain errors)
- `usecase/` – (use cases, ports/interfaces)
- `adapter/` – (external clients like grpc, rest api, cli)
- `repository/` – (external api, DB, ...)

Dependency direction guidance:
- `domain/` depends on nothing internal
- `usecase/` may depend on `domain/`
- `adapter/` and `repository/` may depend on `usecase/` (ports) and `domain/`
- No inward layer may import outward layers

### Architecture Decisions (ADR-lite)
All meaningful architectural decisions must be recorded in `docs/`:
- 1 file per decision
- 10–20 lines maximum per file
- Keep it concise: context → decision → consequences
- Update by adding a new decision file if the decision changes (do not rewrite history)

## Code Search & Exploration Tools
Context7 for library/frameworks actual api search
chunkhound search for fast search code in project 
chunkhound research for full search code in project with reasoning
If chunkhound are unavailable, fall back to `rg`, `fd`, and `git grep` for fast local code search

## Commit Policy (authoritative)
- Task packets MUST explicitly specify whether a commit is required.
- Subagents must never assume commit behavior.
- If `commit_required=true`: exactly one commit for the task (one task = one commit).
- If `commit_required=false`: no branch/commit; deliver changes as working tree diff/patch only.
