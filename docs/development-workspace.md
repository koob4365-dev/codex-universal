# Codespaces and server development

This workspace uses Microsoft's maintained Node 24 / Debian Bookworm Dev
Container image and the official OpenAI Codex CLI, pinned to 0.161.0.
It adds Python virtual environments, ripgrep, ShellCheck and GDB. VS Code
extensions provide Python debugging, JavaScript debugging support through VS
Code's built-in debugger, linting and the Codex extension.

The original universal-image Dockerfile and its build workflow remain separate.
This configuration prepares tools; it does not install every project's dependencies
or guarantee application tests pass. Copy `.devcontainer` into the actual project
repository to debug that project, and adapt its setup to the project's lockfiles.

## GitHub Codespaces

Select the branch containing this configuration, then choose **Code → Codespaces
→ Create codespace**. The post-create check must pass. Authenticate with
`codex login --device-auth` in the Codespace terminal, following the displayed
browser instructions. Do not paste credentials into chat or commit login files.
Run `codex` from the target project's root. The extension may require its own login.
Codespaces compute and storage use your GitHub account's quota and billing.
Stop the Codespace when finished; it is not an always-on server.

## Your own server

Install Docker and VS Code Remote SSH on your client. Connect to your server,
clone this repository, select the configuration branch, and use VS Code's
**Dev Containers: Reopen in Container** command with the Dev Containers extension.
This uses the same `.devcontainer` definition as Codespaces.

For terminal-only use, install a reviewed version of `@devcontainers/cli`, then:

```bash
devcontainer up --workspace-folder .
devcontainer exec --workspace-folder . bash .devcontainer/doctor.sh
devcontainer exec --workspace-folder . codex login --device-auth
devcontainer exec --workspace-folder . codex
```

## Debugging workflow

1. Open the real project and read its instructions and CI commands.
2. Install dependencies using its lockfile; configure required local services.
3. Reproduce the defect with a failing test or a precise command.
4. Use VS Code's Run and Debug view to add a project-specific launch configuration;
   Python uses debugpy and Node uses the built-in JavaScript debugger.
5. Ask Codex to trace the cause, make a focused fix and run regression checks.
6. Review the diff and test evidence before merging.

Do not enable unattended approval bypasses. No model can guarantee professional
results from an environment configuration alone; project tests and review supply
the evidence. This chat does not migrate into the Codespace automatically.

Sources: https://github.com/devcontainers/images/tree/main/src/typescript-node
and https://github.com/openai/codex.
