# Git

function Get-GitStatus { & git status $args }

function Get-GitInit { & git init $args }
function Get-GitAdd { & git add .}
function Get-GitCommit { & git commit -m 'update' }
function Get-Gpu { & git push }

function Get-GitCommitFix { & git commit -m "fix: update"}

function Get-Pull { & git pull }

# Git - Объединенные команды
function Get-Push{ Get-GitAdd; Get-GitCommit; Get-Gpu; }
function Get-Push2{ Get-GitAdd; Get-GitCommitFix; Get-Gpu;}
function Get-PushUOriginMaster { & git push -u origin master }

# Git - Работа с ветками

function Get-GitBranch { & git branch $args}
function Get-CheckoutMaster { & git checkout master}

# Работа с алиасами

function Get-EditAliases { & code $profile }

function Get-Gps { & git init $args }


function Get-GitCheckout { & git checkout $args}

function Get-GoPma { & code c:/proj/phpmyadmin }


# NPM
function Get-NpmInstall { & npm install $args}
function Get-Build { & npm run build:prod }
function Get-NpmRunStart { & npm run start}
function Get-Start { & npm run start }
function Get-StartWatch { & npm run start:watch }


# Проекты
function Get-StartOldGo { & php -S oldgo.loc:52178 }
function Get-StartPhpMyadmin { & php -S pma.loc:52175 }
function Get-StartGoLoc { & php -S go.loc:52176 }
function Get-StartGoUpdate { & php -S go.update:52177 }
function Get-Homj { & php -S homj.loc:52191 }
function Update-Project{
  if($args[0] -eq 'docs'){
    Get-Push;ssh ztv 'cd /var/proj/docs.mse.su && git pull'
  }elseif($args[0] -eq 'api'){
    Get-Push;ssh react 'cd /var/projects/crm/api_ameon && git pull'
  }
}


# Yarn
function Get-Yarn { & yarn }
function Get-StartDev { & yarn start:dev }



# go.ams74.ru

function Get-SendMaster{ & ssh master 'cd /var/projects/go/www/go.ams74.ru && git pull origin php8.1'}
function Get-Auto { Get-GitAdd; Get-GitCommit; Get-Gpu; Get-SendMaster; }

# dev.ams74.ru
function Get-SendDev{ & ssh master 'cd /var/projects/go/www/dev.go.ams74.ru && git pull origin php8.1'}
function Get-AutoDev{ Get-GitAdd; Get-GitCommit; Get-Gpu; Get-SendDev; }

# Nestjs.ru
function Get-Docs { & npm run docs}

# Работа с терминалом

function Get-Proj { set-location "C:/proj" }
function Get-Master { ssh master }
function Get-React { ssh react }
function Get-ZTV { ssh ztv}
function Get-Config { & code c:/users/ameon/.ssh/config}




# Nestjs.ru
Set-Alias 'dist' Get-GitDist    # git subtree split --branch dist --prefix dist/
Set-Alias 'docs' Get-Docs       # npm run docs

# go.ams74.ru
Set-Alias 'a' Get-Auto            # Автопуш в master


# dev.go.ams74.ru
Set-Alias 'adev' Get-AutoDev



# Работа с терминалом

Set-Alias 'c' cls
Set-Alias 'home' Get-Home
Set-Alias 'master' Get-Master     # ssh master
Set-Alias 'react' Get-React       # ssh react
Set-Alias 'ztv' Get-ZTV           # ssh ztv
Set-Alias 'config' Get-Config

# Работа с алиасами
Set-Alias 'eba' Get-EditAliases

Set-Alias 'master' Get-Master



Set-Alias 'pma' Get-StartPhpMyadmin
Set-Alias 'proj' Get-Proj
Set-Alias 'push' Get-Push
Set-Alias 'push2' Get-Push2

# Git

Set-Alias 'g' Get-GitInit                 # git init $args
Set-Alias 'ga' Get-GitAdd                 # git add .
Set-Alias 'gcmt' Get-GitCommit            # git commit -m "Update"
Set-Alias 'gs' Get-GitStatus              # git status
Set-Alias 'gpu' Get-Gpu                   # git push
Set-Alias 'p' Get-Push                    # ga gcmt p
Set-Alias 'p2' Get-Push2
Set-Alias 'pl' Get-Pull                   # git pull
Set-Alias 'puom' Get-PushUOriginMaster    # git push -u origin master

# Git - Работа с ветками 

Set-Alias 'gb' Get-GitBranch        # git branch $args
Set-Alias 'ch' Get-GitCheckout      # git checkout $args
Set-Alias 'm' Get-CheckoutMaster    # git checkout master


# Npm

Set-Alias 'i' Get-NpmInstall      # npm install
Set-Alias 'rs' Get-NpmRunStart    # npm run start
Set-Alias 's' Get-Start           # npm run start
Set-Alias 'sw' Get-StartWatch     # npm run start:watch
Set-Alias 'b' Get-Build           # npm run build:prod 

# Yarn

Set-Alias 'y' Get-Yarn          # yarn
Set-Alias 'sd' Get-StartDev     # yarn start:dev

# Проекты

Set-Alias 'u' Update-Project
Set-Alias 'homj' Get-Homj
Set-Alias 'oldgo' Get-StartOldGo
Set-Alias 'gopma' Get-GoPma
Set-Alias 'gol' Get-StartGoLoc
Set-Alias 'gou' Get-StartGoUpdate