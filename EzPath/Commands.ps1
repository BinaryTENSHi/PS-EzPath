. "$PSScriptRoot\Import-EzPaths.ps1"

. "$PSScriptRoot\Add-EzPath.ps1"
. "$PSScriptRoot\Remove-EzPath.ps1"

function Reset-EzPaths () {
  $env:Path = $Script:Data.Reset()
  Write-Output "PATH reset"
}

function Get-EzPaths () {
  $Keys = $Script:Data.AvailablePaths.Keys | Sort-Object

  foreach ($Key in $Keys) {
    $Template = "[ ] $Key"
    $Color = (Get-Host).UI.RawUI.ForegroundColor

    # When used, star it and make it green
    if ($Script:Data.UsedPaths.Contains($Key)) {
      $Template = "[*] $Key"
      $Color = "Green"
    }

    Write-Host $Template -ForegroundColor $Color
  }
}
