# 0. Самоопределение

  function Get-Whome{
    "К"
  }
  
# 1. Git


function Get-GitFullInit {
  $v = $args[0];
  git init;                                             # Инициализация
  git add .;                                            # Добавляем все в индекс
  git commit -m 'init';                                 # Коммит Инициализации
  git remote add origin git@github.com:Ameon/$v.git     # Привязка Репозитория
  git push -u origin master;                            # Привязка ветки Master
}



  function Get-GitStatus { & git status $args }

  function Get-GitInit { & git init $args }
  function Get-GitAdd { & git add .}
  function Get-GitCommit { & git commit -m 'update' }
  function Get-Gpu { & git push }

  function Get-GitRemote {
    if(!$args[0]){
      & git remote -v
    }else{
      & git remote $args
    }
  }

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
    Get-YarnBuild;
    Get-Push;
    ssh react 'cd /var/projects/crm/api_ameon && git pull && systemctl restart api_ameon'
  }
  elseif($args[0] -eq 'mse'){
    Get-Push;
    ssh ztv 'cd /var/proj/mse.su && git pull'
  }elseif($args[0] -eq 'nestjs'){
    Get-Push;ssh ztv 'cd /var/proj/nestjs.mse.su && git pull'
  }elseif($args[0] -eq 'nestjs.ru'){
    Get-Docs;
    Get-Build;
    Get-Push2;
    Get-GitDist;
    ch dist;
    Get-Push;
    ch master;
    ssh ameon 'cd ~/domains/nestjs.ru && git pull'
  }
}

function Get-OpenProject {
  if($args[0] -eq 'api'){
    code c:/proj/api.go.ams74.ru
  }elseif($args[0] -eq 'docs'){
    code c:/proj/web/docs.mse.su
  }elseif($args[0] -eq 'nest-api'){
    code c:/proj/web/nest-api
  }elseif($args[0] -eq 'all'){
    & code c:/proj/settings;
    code c:/proj/phpmyadmin;
    code c:/proj/web/docs.mse.su;
    code c:/proj/web/nest-api;
    code c:/proj/api.go.ams74.ru
    code c:/proj/web/go.update;
  }elseif($args[0] -eq 'set'){
    code c:/proj/settings;
  }elseif($args[0] -eq 'ssh'){
    code c:/users/ameon/.ssh;
  }

  
}

function Get-Web { set-location "C:/proj/web" }

# Yarn
function Get-Yarn { & yarn }
function Get-StartDev { & yarn start:dev }
function Get-YarnBuild { yarn build }



# go.ams74.ru

function Get-SendMaster{ & ssh master 'cd /var/projects/go/www/go.ams74.ru && git pull origin php8.1'}
function Get-Auto { Get-GitAdd; Get-GitCommit; Get-Gpu; Get-SendMaster; }

# dev.ams74.ru
function Get-SendDev{ & ssh master 'cd /var/projects/go/www/dev.go.ams74.ru && git pull origin php8.1'}
function Get-AutoDev{ Get-GitAdd; Get-GitCommit; Get-Gpu; Get-SendDev; }

# Nestjs.ru

function Get-Docs { & npm run docs}
function Get-GitDist { & git subtree split --branch dist --prefix dist/ }

# Работа с терминалом

function Get-EditFile {
  if($args[0] -eq 'config'){
    code $env:userprofile/.ssh/config
  }
}

function Get-Proj { set-location "C:/proj" }
function Get-Go { 
  if($args[0] -eq 'proj'){
    set-location "C:/proj" 
  }elseif($args[0] -eq 'ssh'){
    set-location "~/.ssh" 
  }elseif($args[0] -eq 'docker'){
    set-location "C:/docker"
  }

}
function Get-La { ls | ft -p name}
function Get-Master { ssh master }
function Get-React { ssh react }
function Get-ZTV { ssh ztv}
function Get-Config { & code c:/users/ameon/.ssh/config}
function ssh_copy_id([string]$sshHost)
{
    cat ~/.ssh/id_rsa.pub | ssh "$sshHost" "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"
}

# 7. SSH

  # 7.1 - Работа с ssh ключами
  
    function Get-ShowKey {
      cat ~/.ssh/id_rsa.pub
    }

    function Get-Key {
      $res = cat ~/.ssh/id_rsa.pub
      Set-Clipboard $res
    }

  # SSH ключи

    function Get-Big {
      ssh big 
    }

# 8. Работа с алиасами

  function Get-UpdateAliases {
    set-location "C:/proj/settings";
    p;
  }





# Nestjs.ru
Set-Alias 'dist' Get-GitDist    # git subtree split --branch dist --prefix dist/
Set-Alias 'docs' Get-Docs       # npm run docs

# go.ams74.ru
Set-Alias 'a' Get-Auto            # Автопуш в master


# dev.go.ams74.ru
Set-Alias 'adev' Get-AutoDev



# 6. Работа с терминалом

  Set-Alias 'c' cls
  Set-Alias 'e' Get-EditFile        # Открыть файл для редактирования
  Set-Alias 'la' Get-La
  Set-Alias 'home' Get-Home
  Set-Alias 'master' Get-Master     # ssh master
  Set-Alias 'proj' Get-Proj
  Set-Alias 'react' Get-React       # ssh react
  Set-Alias 'ztv' Get-ZTV           # ssh ztv
  Set-Alias 'config' Get-Config
  Set-Alias 'web' Get-Web
  Set-Alias 'go' Get-Go             # Перейти в папку  

# 7. SSH

  # 7.1 - Работа с ssh ключами

    Set-Alias 'key' Get-ShowKey
    Set-Alias 'getkey' Get-Key

  # 7.2 - SSH ключи
  
    Set-Alias 'big' Get-Big


# 8. Работа с алиасами

Set-Alias 'eba' Get-EditAliases
Set-Alias 'ud' Get-UpdateAliases




Set-Alias 'pma' Get-StartPhpMyadmin

Set-Alias 'push' Get-Push
Set-Alias 'push2' Get-Push2

# Git

Set-Alias 'init' Get-GitFullInit          # Полная инициализация репо
Set-Alias 'g' Get-GitInit                 # git init $args
Set-Alias 'ga' Get-GitAdd                 # git add .
Set-Alias 'gcmt' Get-GitCommit            # git commit -m "Update"
Set-Alias 'gr' Get-GitRemote              # git remote -v
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
Set-Alias 'yb' Get-YarnBuild    # yarn build

# Проекты

Set-Alias 'u' Update-Project      # Обновить проект ...
Set-Alias 'o' Get-OpenProject     # Открыть проект ...

Set-Alias 'homj' Get-Homj
Set-Alias 'oldgo' Get-StartOldGo
Set-Alias 'gopma' Get-GoPma
Set-Alias 'gol' Get-StartGoLoc
Set-Alias 'gou' Get-StartGoUpdate