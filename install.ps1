[CmdletBinding()]
param([Parameter(ValueFromRemainingArguments=$true)][string[]]$Arguments)
$ErrorActionPreference = 'Stop'
$base = if ($env:OPENCODE_V2_EXTENSIONS_BASE_URL) { $env:OPENCODE_V2_EXTENSIONS_BASE_URL } else { 'https://raw.githubusercontent.com/Alqudimi/opencode-atherbox/main' }
$target = Join-Path $env:LOCALAPPDATA 'OpenCodeAtherbox\opencode-v2-extensions.ps1'
New-Item -ItemType Directory -Force -Path (Split-Path $target) | Out-Null
Invoke-WebRequest -UseBasicParsing -Uri "$base/bin/opencode-v2-extensions.ps1" -OutFile $target
if ($Arguments.Count -eq 0) { & $target tui } else { & $target @Arguments }
exit $LASTEXITCODE
