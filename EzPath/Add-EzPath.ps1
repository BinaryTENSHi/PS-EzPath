function Add-EzPath () {
  [CmdletBinding()]
  Param ()

  DynamicParam {
    $ParameterName = "Name"
    $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
    $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
    
    # Create and set the parameters attributes
    $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
    $ParameterAttribute.Mandatory = $true
    $ParameterAttribute.Position = 1

    # Add the attributes to the attributes collection
    $AttributeCollection.Add($ParameterAttribute)

    # Generate and set the ValidateSet
    $usings = $Script:Data.AvailablePaths.Keys
    $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($usings)

    # Add the ValidateSet to the attributes collection
    $AttributeCollection.Add($ValidateSetAttribute)

    # Create and return the dynamic parameter
    $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection)
    $RuntimeParameterDictionary.Add($ParameterName, $RuntimeParameter)
    return $RuntimeParameterDictionary
  }

  BEGIN {
    $Name = $PsBoundParameters[$ParameterName]
  }

  PROCESS {
    $NewPath = $Script:Data.Use($Name)
    if ([String]::IsNullOrWhiteSpace($NewPath)) {
      Write-Output "Could not find using with key $Name!"
      return
    }

    if ($ENV:Path -eq $NewPath) {
      Write-Output "PATH has not changed"
      return
    }

    $ENV:Path = $NewPath
    Write-Output "PATH changed"
  }
}
