$PSDefaultParameterValues['Out-File:Encoding'] = 'UTF8'
$OutputEncoding = [System.Text.Encoding]::UTF8

Import-Module ControlSshConfig
Import-Module ControlFolders
Import-Module Git
Import-Module GitBranches
Import-Module Projects
Import-Module SshAliases
Import-Module Settings
Import-Module Terminal