function Import-EzPaths () {
  [CmdletBinding()]
  Param (
    # JSON File to import
    [Parameter(Mandatory = $False)]
    [String]
    $JsonFile = (Join-Path "$HOME" "ezpaths.json"),

    # Clear before importing
    [Parameter(Mandatory = $False)]
    [Switch]
    $Clear
  )

  PROCESS {
    if (-not (Test-Path $JsonFile)) {
      Write-Error "$JsonFile does not exist!"
      Return
    }

    $File = Get-Item -Path $JsonFile
    Write-Verbose "Reading paths from $File"

    $Config = (Get-Content $File | ConvertFrom-Json)
    $Keys = ($Config | Get-Member -MemberType *Property).Name | Sort-Object
    Write-Verbose "Found $($Keys.Count) keys: `n $([String]::Join(', ', $Keys))"

    if ($Clear) {
      $Script:Data.Clear()
    }

    foreach ($Key in $Keys) {
      $Script:Data.Add($Key, $Config.$Key)
    }
  }
}
