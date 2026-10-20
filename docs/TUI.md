# Interactive TUI

The Unix runner has a dependency-light terminal interface. It uses standard shell input and works without `dialog` or `whiptail`, so the same command works in SSH, CI terminals, macOS Terminal, Linux shells, and WSL.

```bash
./bin/opencode-v2-extensions tui
```

The menu supports install, managed removal, doctor, status, and configuration rendering. Installation asks for a profile, whether reviewed-risk entries are allowed, and whether to run a dry-run. The default is preview-only until the user explicitly confirms.

The TUI refuses to continue if `opencode` is missing, if the detected version is not v2, or if the OpenCode plugin manager is unavailable. It never installs OpenCode.
