# Code work

Read the target project's instructions, manifests, lockfiles and CI before editing.
For work on this image repository, read README.md and CONTRIBUTING.md.
Inspect git status and preserve existing changes. Use the existing checkout.

For debugging, reproduce the failure and record the command and error. Trace the
root cause before changing code. Add a focused regression check when practical,
then run the affected tests and relevant lint, type checks and build commands.
Do not claim success from a process starting, a zero-test run or an unrun check.

Keep changes scoped to the requested behavior. Use project-pinned dependencies
and frozen lockfile installation where supported. Do not disable tests or TLS
verification to make checks pass. Never commit credentials or authentication files.

Before finishing, review the diff and report changes, executed verification,
failures and remaining blockers. Commit, push and publish only when authorized.
