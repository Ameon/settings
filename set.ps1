function Get-GitStatus { & git status $args }
function Get-GitAdd { & git add .} 
function Get-EditAliases { & code $profile }
function Get-GitInit { & git init $args }
function Get-GitCommit { & git commit -m "update"}
function Get-StartPhpMyadmin { & php -S pma.loc:52175 }
function Get-StartGoLoc { & php -S go.loc:52176 }
function Get-StartGoUpdate { & php -S go.update:52177 }
function Get-StartOldGo { & php -S oldgo.loc:52178 }
function Get-Gpu { & git push }
function Get-Gal { & git add .}
function Get-SendMaster{ & ssh master 'cd /var/projects/go/www/go.ams74.ru && git pull origin php8.1'}
function Get-Auto { 
  Get-GitAdd;
  Get-GitCommit;
  Get-Gpu;
  Get-SendMaster;
}


Set-Alias 'c' cls
Set-Alias 'eba' Get-EditAliases
Set-Alias 'g' Get-GitInit
Set-Alias 'gpu' Get-Gpu
Set-Alias 'gcmt' Get-GitCommit
Set-Alias 'ga' Get-GitAdd
Set-Alias 'gol' Get-StartGoLoc
Set-Alias 'gou' Get-StartGoUpdate
Set-Alias 'gs' Get-GitStatus
Set-Alias 'oldgo' Get-StartOldGo
Set-Alias 'pma' Get-StartPhpMyadmin
Set-Alias 'a' Get-Auto


