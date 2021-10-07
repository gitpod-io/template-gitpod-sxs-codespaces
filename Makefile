SHELL:=/bin/bash
all: restore build run

clean:
	cargo clean

restore:
	cargo update

build: restore
	cargo build

run: restore build
	cargo run -- --help
	echo .
	@if [ -z ${GITPOD_WORKSPACE_ID+x} ]; then \
		cargo run -- -t "Gitpod workspace: ${GITPOD_WORKSPACE_ID}"; \
	fi
	@if [ -z ${CODESPACE_NAME+x} ]; then \
		cargo run -- -t "GitHub Codespaces workspace: ${CODESPACE_NAME}"; \
	fi
