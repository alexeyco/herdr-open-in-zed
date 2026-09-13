# Development

Development happens against a locally linked plugin; no GitHub install needed.

## Dev loop

```
make build                       # produces ./target/release/herdr-open-in-zed
herdr plugin link .              # register the working directory as a plugin
herdr plugin action list --plugin open-in-zed
herdr plugin action invoke open-in-zed.open
herdr plugin log list --plugin open-in-zed
```

`plugin link` does not run build commands, so rebuild after every source change. Unlink with `herdr plugin unlink open-in-zed`.

## Checks

```
make lint        # cargo fmt --check + cargo clippy
make test        # cargo test
make build       # release build
make fmt-check   # prettier check
```

`make check` runs all of them. CI runs the same commands verbatim (it does not use make); see [.github/workflows/ci.yml](../.github/workflows/ci.yml).

## Version sync

The version lives in two files that must match:

- `Cargo.toml`
- `herdr-plugin.toml`

Bump both in the same commit. A release is cut by pushing a tag `v<version>` (e.g. `v0.1.0`); the release workflow fails if the tag does not match both files. For release steps, see [CONTRIBUTING.md](../CONTRIBUTING.md).

## Notes

- herdr validates `min_herdr_version` against the running herdr binary; linking with an older herdr is refused.
- Usage and requirements are documented in the [README](../README.md); behavior details in [how-it-works.md](how-it-works.md).
