# Python Profile

Language-specific guidance for Python projects.

## Scope
- Apply only when changing Python code
- In conflicts, this file overrides generic agent guidance

## Style
- Target Python 3.14+
- Use type hints on public functions and methods
- Keep imports at top-level unless framework requires lazy loading
- Keep modules focused and small
- Keep names simple
- Detailed errors
- Keep `__init__.py` empty
- Prefer explicit wiring over magic
- Do not expand scope without user approval
- Do not `from __future__ import annotations`
- Do not `from importlib import import_module`
- Do not `importlib`
- Do not `cast`

## Architecture Guardrails
- Keep dependency direction inward (domain -> use cases -> adapters)
- Define interfaces where consumed; implement in outer layers
- Raise explicit domain errors instead of returning ambiguous sentinels

## Testing
- Preferred framework: `pytest`
- Test behavior, not internal implementation details
- Mock external I/O boundaries (network, filesystem, DB)

## Commands
- Format: `ruff format .`
- Lint: `ruff check .`
- Type-check: `mypy .`
- Test: `pytest -q`

## Dependencies
- Use one package manager consistently per project `uv`
- Avoid introducing heavy dependencies for small utility needs

## Anti-patterns
- Large god modules
- Hidden side effects in imports
- Broad `except Exception` without clear handling

## Quick Checklist
- Types and style updated
- Lint/type/test checks passed
- Architecture boundaries preserved
