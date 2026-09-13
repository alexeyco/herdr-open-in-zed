# AGENTS.md

Plugin for [herdr](https://herdr.dev) that opens the current workspace in [Zed](https://zed.dev). Rust; sources under `src/`; single runtime dependency: `serde_json`.

## Commands

Checks: see [docs/development.md](docs/development.md) → Checks.

Dev loop: `herdr plugin link .`, then `herdr plugin action invoke open-in-zed.open`, logs via `herdr plugin log list --plugin open-in-zed`. Rebuild before invoking; `plugin link` does not build.

## Gotchas

- The version appears in `Cargo.toml` and `herdr-plugin.toml`; keep both in sync (release tags verify both).
- Build the release binary before `herdr plugin link` testing; a linked plugin does not rebuild itself.
- The Zed CLI cannot install itself via a flag; the correct hint is Zed's command palette command `cli: install cli binary` (https://zed.dev/docs/reference/cli).
- If the plugin ever needs to call back into herdr, use `HERDR_BIN_PATH`, not a bare `herdr`.
- `min_herdr_version` is checked against the running herdr binary; an older local herdr refuses to link.
