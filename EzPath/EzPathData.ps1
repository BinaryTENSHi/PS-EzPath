class EzPathData {
  EzPathData() {
    $this.OriginalPath = $ENV:Path
    $this.AvailablePaths = @{}
    $this.UsedPaths = New-Object System.Collections.ArrayList
  }

  [HashTable] $AvailablePaths
  [System.Collections.ArrayList] $UsedPaths
  [String] $OriginalPath

  [String] BuildPath () {
    $Path = $this.OriginalPath

    foreach ($Key in $this.UsedPaths) {
      $Paths = $this.AvailablePaths.$Key

      [Array]::Reverse($Paths)
      foreach ($Entry in $Paths) {
        $Path = $Entry + ";" + $Path
      }
    }

    Return $Path
  }

  [Void] Add ([String] $Name, [String[]] $Paths) {
    if ($this.AvailablePaths.ContainsKey($Name)) {
      Write-Warning "Key $Name already exists!"
      Return
    }

    if ($Paths.Count -ne 0) {
      $this.AvailablePaths.Add($Name, $Paths)
    }
  }

  [String] Use ($Name) {
    if (-not $this.AvailablePaths.ContainsKey($Name)) {
      Return $null
    }

    if (-not $this.UsedPaths.Contains($Name)) {
      $this.UsedPaths.Add($Name)
    }

    Return $this.BuildPath()
  }

  [String] Unuse ($Name) {
    if (-not $this.AvailablePaths.ContainsKey($Name)) {
      Return $null
    }

    if ($this.UsedPaths.Contains($Name)) {
      $this.UsedPaths.Remove($Name)
    }

    Return $this.BuildPath()
  }

  [String] Reset () {
    $this.UsedPaths.Clear()
    Return $this.BuildPath()
  }

  [Void] Clear () {
    $this.AvailablePaths.Clear()
    $this.UsedPaths.Clear()
  }
}
