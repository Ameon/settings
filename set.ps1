$PSDefaultParameterValues['Out-File:Encoding'] = 'UTF8'
$OutputEncoding = [System.Text.Encoding]::UTF8

Import-Module ControlAliases
Import-Module ControlFiles
Import-Module ControlFolders
Import-Module ControlSshConfig
Import-Module CSharp
Import-Module Docker
Import-Module DockerCompose
Import-Module Docs
Import-Module Edit
Import-Module Git
Import-Module GitBranches
Import-Module Navigation
Import-Module NPM
Import-Module Projects
Import-Module SshAliases
Import-Module Servers
Import-Module Settings
Import-Module Terminal
Import-Module ControlVirtualBox
Import-Module PSMenu
Import-Module Yarn

function prompt {
    # Определение цветов и элементов приглашения
    $userColor = "Cyan"
    $atColor = "Green"
    $hostColor = "Green"
    $dirColor = "Yellow"
    $timeColor = "White"

    # Получение имени хоста и его кастомизация
    $hostname = $env:COMPUTERNAME.ToLower()
    switch ($hostname) {
        "ameon_home" { $hostname = 'home' }
    }

    # Вывод имени пользователя цветом Cyan
    Write-Host -NoNewline "["
    Write-Host -NoNewline "$env:USERNAME" -ForegroundColor Blue
    # Вывод символа @ и имени хоста зеленым цветом, текущей директории желтым и времени белым
    Write-Host -NoNewline "@" -ForegroundColor Green
    Write-Host -NoNewline $hostname
    Write-Host -NoNewline " => " -ForegroundColor Green
    Write-Host -NoNewline "$(Get-Location | Split-Path -Leaf)" -ForegroundColor DarkYellow
    Write-Host -NoNewline " $(Get-Date -Format "HH:mm:ss")]" -ForegroundColor White

    # Возврат символа > как части строки приглашения
    return "`n> "
}



