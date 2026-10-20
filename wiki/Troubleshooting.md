# Troubleshooting

## OpenCode v2 is missing

Install OpenCode v2 using the official OpenCode documentation, then run `doctor` again. The manager intentionally refuses to install OpenCode.

## A package fetch fails

Retry the exact pinned install. Network/proxy failures are not silently converted into unpinned installs. Inspect the output and use the per-extension report in `research/`.

## A provider credential is missing

This is an external-service requirement, not necessarily a V2 compatibility failure. Put credentials in the provider's supported environment variable or OpenCode integration storage; never commit them.
