[CmdletBinding()]
param([Parameter(Position=0)][ValidateSet('install','remove','status','doctor','render','list-profiles','tui')][string]$Action='tui',[string]$Profile='safe',[switch]$DryRun,[switch]$Yes,[switch]$AllowRisky)
$ErrorActionPreference='Stop'
function Fail($m){ Write-Error "[opencode-v2-extensions] ERROR: $m"; exit 1 }
function Require-OpenCode { $cmd=Get-Command opencode -ErrorAction SilentlyContinue; if(-not $cmd){ Fail 'OpenCode v2 is required. Install OpenCode v2 first; this tool never installs it.' }; $v=& opencode --version 2>$null; if($v -notmatch '(^|[^0-9])2([.]|[^0-9]|$)'){ Fail "OpenCode v2 is required; detected: $v" }; return $v }
function Tui { Require-OpenCode | Out-Null; Write-Host "`nOpenCode Atherbox`n1) Install safe profile`n2) Remove managed extensions`n3) Doctor`n4) Status`n0) Exit`n"; $c=Read-Host 'Choice'; switch($c){ '1' { & $PSCommandPath install -Profile (Read-Host 'Profile [safe]') -Yes }; '2' { & $PSCommandPath remove -Yes }; '3' { & $PSCommandPath doctor }; '4' { & $PSCommandPath status }; default {} } }
if($Action -eq 'tui'){ Tui; exit }
$v=Require-OpenCode
if($Action -eq 'doctor'){ Write-Host "OpenCode v2 detected: $v"; exit }
if($Action -eq 'list-profiles'){ Write-Host "safe`nsafe-search`nsafe-operations`nproductivity`nmemory`nui`nworkflow"; exit }
if($Action -eq 'install'){ Write-Host 'For the full manifest-driven installer, use WSL or a Unix shell; the Windows bootstrap performs the same OpenCode v2 preflight and never installs OpenCode.'; exit 0 }
if($Action -eq 'remove'){ Write-Host 'For managed removal, use WSL or a repository checkout so the same state file and manifest are used.'; exit 0 }
Write-Host "Action '$Action' is available in the repository Unix runner."
