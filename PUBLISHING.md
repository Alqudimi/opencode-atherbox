# Publishing under `Alqudimi`

The final source is prepared locally and must be pushed while authenticated as the owner of `Alqudimi` or as a collaborator with repository-creation permission.

## Owner publish commands

```bash
git clone /path/to/opencode-atherbox opencode-atherbox
cd opencode-atherbox
git init -b main
git add .
git commit -m "chore: initial publish"
gh auth login --hostname github.com
gh repo create Alqudimi/opencode-atherbox --public \
  --description "Fail-closed OpenCode v2 extension manager with TUI, profiles, verification, CI/CD, and GitHub Pages"
git remote add origin https://github.com/Alqudimi/opencode-atherbox.git
git push -u origin main
```

If the repository is created through the GitHub web UI instead, create an empty public repository with the exact name, then run the `git remote add` and `git push` commands.

## After the first push

1. Open **Settings → Pages** and select **GitHub Actions** as the source.
2. Enable the wiki and copy the files from `wiki/` into the GitHub wiki repository if a native wiki is desired.
3. Confirm the `pages.yml`, `ci.yml`, and `release.yml` workflows complete successfully.
4. Check that `https://raw.githubusercontent.com/Alqudimi/opencode-atherbox/main/install.sh` is reachable before advertising the one-command installer.
5. Create a protected `main` branch and require the CI check before merging.
