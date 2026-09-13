.PHONY: fmt fmt-check lint test build check

fmt:
	npx --yes prettier --write "**/*.md"

fmt-check:
	npx --yes prettier --check "**/*.md"

lint:
	cargo fmt --check
	cargo clippy --all-targets --locked -- -D warnings

test:
	cargo test --locked

build:
	cargo build --release --locked

check: lint fmt-check test build
