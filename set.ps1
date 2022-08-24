function Get-GitStatus { & git status $args }
function Get-GitAdd { & git add $args }
function Get-EditAliases { & code $profile }
function Get-GitInit { & git init $args }


Set-Alias 'c' cls
Set-Alias 'gs' Get-GitStatus
Set-Alias 'ga' Get-GitAdd
Set-Alias 'eba' Get-EditAliases
Set-Alias 'g' Get-GitInit
