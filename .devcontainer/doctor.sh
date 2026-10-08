#!/usr/bin/env bash
set -euo pipefail
node --version
npm --version
python3 --version
python3 -m venv /tmp/codex-venv-check
/tmp/codex-venv-check/bin/python -m pip --version
git --version
rg --version
shellcheck --version
gdb --version
codex --version
printf '%s\n' 'Tool checks passed. Authenticate Codex separately, then run project-specific setup and tests.'
