# fnm setting
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

if (-not (Test-Path $profile)) { New-Item $profile -Force }

# antfu/ni
# Remove-Item Alias:ni -Force -ErrorAction Ignore

if (-not (Test-Path $profile)) {
  New-Item -ItemType File -Path (Split-Path $profile) -Force -Name (Split-Path $profile -Leaf)
}

$profileEntry = 'Remove-Item Alias:ni -Force -ErrorAction Ignore'
$profileContent = Get-Content $profile
if ($profileContent -notcontains $profileEntry) {
  ("`n" + $profileEntry) | Out-File $profile -Append -Force -Encoding UTF8
}

# starship setting
Invoke-Expression (&starship init powershell)