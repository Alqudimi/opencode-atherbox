# Security model

The manager is fail-closed: missing OpenCode v2, V1-only packages, unresolved names, and unreviewed build paths stop or remain excluded. Installs use exact package versions or immutable commits. Removal uses a state file and does not remove unrelated plugins.

Review third-party source and package integrity before production use. Keep API keys, OAuth tokens, cookies, and provider credentials outside the repository. Source builds require an explicit flag and a full commit pin.
