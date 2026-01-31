param(
  [Parameter(Mandatory=$true)]
  [string]$Name,

  [string]$Destination = (Get-Location).Path
)

$ErrorActionPreference = 'Stop'

$src = Join-Path $PSScriptRoot '..\RV_EVAL_TEMPLATE'
$src = (Resolve-Path $src).Path

$out = Join-Path $Destination $Name
if (Test-Path $out) {
  throw "Destination already exists: $out"
}

New-Item -ItemType Directory -Path $out | Out-Null
Copy-Item -Path (Join-Path $src '*') -Destination $out -Recurse -Force

Write-Host "Created RV evaluation folder: $out"
Write-Host "Next: copy your listing media into:"
Write-Host "  $out\inputs\media\images"
Write-Host "  $out\inputs\media\videos"
