. "$PSScriptRoot\EzPath\EzPathData.ps1"
. "$PSScriptRoot\EzPath\Commands.ps1"

# Data
$Script:Data = New-Object EzPathData

# Exports
Export-ModuleMember Import-EzPaths
Export-ModuleMember Add-EzPath
Export-ModuleMember Remove-EzPath
Export-ModuleMember Reset-EzPaths
Export-ModuleMember Get-EzPaths
