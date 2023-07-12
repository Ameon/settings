$PSDefaultParameterValues['Out-File:Encoding'] = 'UTF8'
$OutputEncoding = [System.Text.Encoding]::UTF8

Import-Module ControlAliases
Import-Module ControlFiles
Import-Module ControlFolders
Import-Module ControlSshConfig
Import-Module CSharp
Import-Module Git
Import-Module GitBranches
Import-Module NPM
Import-Module Projects
Import-Module SshAliases
Import-Module Settings
Import-Module Terminal
Import-Module ControlVirtualBox
Import-Module PSMenu
Import-Module Yarn