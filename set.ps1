function Get-GitStatus { & git status $args }
function Get-GitAdd { & git add .} 
function Get-EditAliases { & code $profile }
function Get-GitInit { & git init $args }
function Get-GitCommit { & git commit -m "update"}
function Get-GitCommitFix { & git commit -m "fix: update"}
function Get-StartPhpMyadmin { & php -S pma.loc:52175 }
function Get-StartGoLoc { & php -S go.loc:52176 }
function Get-StartGoUpdate { & php -S go.update:52177 }
function Get-Docs { & npm run docs}
function Get-StartOldGo { & php -S oldgo.loc:52178 }
function Get-Gpu { & git push }
function Get-Gal { & git add .}
function Get-SendMaster{ & ssh master 'cd /var/projects/go/www/go.ams74.ru && git pull origin php8.1'}
function Get-SendDev{ & ssh master 'cd /var/projects/go/www/dev.go.ams74.ru && git pull origin php8.1'}
function Get-Auto { Get-GitAdd; Get-GitCommit; Get-Gpu; Get-SendMaster; }
function Get-AutoDev{ Get-GitAdd; Get-GitCommit; Get-Gpu; Get-SendDev; }
function Get-Proj { set-location "C:/proj" }
function Get-Pull { & git pull }
function Get-Push{ Get-GitAdd; Get-GitCommit; Get-Gpu; }
function Get-Push2{ Get-GitAdd; Get-GitCommitFix; Get-Gpu;}
function Get-Start { & npm run start }
function Get-StartWatch { & npm run start:watch }
function Get-StartDev { & yarn start:dev }

Set-Alias 'a' Get-Auto
Set-Alias 'adev' Get-AutoDev
Set-Alias 'c' cls
Set-Alias 'docs' Get-Docs
Set-Alias 'eba' Get-EditAliases
Set-Alias 'g' Get-GitInit
Set-Alias 'ga' Get-GitAdd
Set-Alias 'gcmt' Get-GitCommit
Set-Alias 'gol' Get-StartGoLoc
Set-Alias 'gou' Get-StartGoUpdate
Set-Alias 'gpu' Get-Gpu
Set-Alias 'gs' Get-GitStatus
Set-Alias 'oldgo' Get-StartOldGo
Set-Alias 'p' Get-Push
Set-Alias 'p2' Get-Push2
Set-Alias 'pl' Get-Pull
Set-Alias 'pma' Get-StartPhpMyadmin
Set-Alias 'proj' Get-Proj
Set-Alias 'push' Get-Push
Set-Alias 'push2' Get-Push2
Set-Alias 's' Get-Start
Set-Alias 'sd' Get-StartDev
Set-Alias 'sw' Get-StartWatch