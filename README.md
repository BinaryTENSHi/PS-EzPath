# EzPath
An 'ez' PATH manager for PowerShell 5.0

## Installation
Run in PowerShell 5.0
```
PS> Install-Module -Name EzPath
```

## Configuration
* Create a file _.ezpaths.json_ in your $HOME
* Fill it
* Edit your _Microsoft.PowerShell_profile.ps1_ to include the following
```
Import-EzPaths
```

You can add the following aliases to make adding and removing paths easier on the hands
```
New-Alias -Name use   -Value Add-EzPath    -Scope Global
New-Alias -Name unuse -Value Remove-EzPath -Scope Global
```

## Usage
Import a json file
```
Import-EzPaths [[-JsonFile] <File>] [-Clear] [-Verbose]
```

Use a pathset
```
Add-EzPath [-Name] <Name>

use <Name>
```

Remove a pathset
```
Remove-EzPath [-Name] <Name>

unuse <Name>
```

Reset
```
Reset-EzPaths
```

List available and used pathsets
```
Get-EzPaths
```

### Example Configuration
```
{
  "vs": [
    "C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\Common7\\IDE\\CommonExtensions\\Microsoft\\TestWindow",
    "C:\\Program Files (x86)\\MSBuild\\14.0\\bin",
    "C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\Common7\\IDE\\",
    "C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\VC\\BIN",
    "C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\Common7\\Tools",
    "C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319",
    "C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\VC\\VCPackages",
    "C:\\Program Files (x86)\\HTML Help Workshop",
    "C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\Team Tools\\Performance Tools",
    "C:\\Program Files (x86)\\Windows Kits\\8.1\\bin\\x86",
    "C:\\Program Files (x86)\\Microsoft SDKs\\Windows\\v10.0A\\bin\\NETFX 4.6.1 Tools\\",
    "C:\\Program Files (x86)\\WiX Toolset v3.10\\bin",
    "C:\\Program Files (x86)\\Microsoft SDKs\\F#\\4.0\\Framework\\v4.0\\"
  ],
  "hg": [
    "C:\\Program Files\\TortoiseHg"
  ],
  "nunit": [
    "C:\\Program Files (x86)\\NUnit.org\\nunit-console"
  ],
  "chocolatey": [
    "C:\\ProgramData\\chocolatey\\bin"
  ],
  "cygwin": [
    "C:\\cygwin\\bin"
  ],
  "git": [
    "C:\\Program Files\\Git\\bin"
  ]
}
```
