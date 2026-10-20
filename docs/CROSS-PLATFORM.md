# Cross-platform bootstrap

The canonical bootstrap is `install.sh` for POSIX shells and WSL. It downloads the pinned runner into the user's cache directory and passes all arguments through.

```bash
curl -fsSL https://raw.githubusercontent.com/Alqudimi/opencode-atherbox/main/install.sh | sh
curl -fsSL https://raw.githubusercontent.com/Alqudimi/opencode-atherbox/main/install.sh | sh -s -- doctor
```

PowerShell users can download `install.ps1`. It performs the same fail-closed OpenCode v2 preflight and opens a small TUI. The full manifest-driven runner is authoritative in the POSIX/WSL script because OpenCode's official plugin CLI is cross-platform there; Windows users can use WSL for the complete install/remove workflow.

Neither bootstrap installs OpenCode. If OpenCode v2 is absent, the command exits with an actionable error.
