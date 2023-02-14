# 0. Самоопределение            -- ктоя
# 1. Git

  # 1.1 Основные команды

    # 1.1.1 - Инициализация пустого репозитория     -- g
    # 1.1.2 - Добавление в индекс (отслеживание)    -- ga
    # 1.1.3 - Добавление комита                     -- gcmt $args           (gcmt, gcmt "New commit")
    
  # 1.1 - Полная инициализация репо                 -- init <имя_репо>
  # 1.2 - Статус репозитория                        -- gs
  # 1.4 Git - Работа с ветками
    # 1.4.1 - Список веток                          -- gb $args
    # 1.4.2 - Переключение между ветками,           -- ch <ветка>
              # сброс файлов                        -- ch <файл> или <папка>

# 2. Работа с алиасами
  # 2.1 - Открытиые алиасов                         -- eba
  # 2.2 - Получение алиасов                         -- pd

# 3. NPM
  # 3.1  - Установка зависимостей    -- i
    #    - Установка пакета          -- i <имя_пакета>
# 4. YARN
# 5. Проекты
# 6. Работа с терминалом
# 7. SSH
  # 7.1 - Работа с ssh ключами
    # 7.1.1 - Показать ключ                       -- key
    # 7.1.2 - Скопировать ключ в буфер обмена     -- getkey  
  # 7.2 - SSH ключи
    # 7.2.1 - Подключение к big                   -- big
    # 7.2.2 - Подключение к dev                   -- dev
# 8. Проекты


# 0. Самоопределение
  
  function Get-WhoMe { Write-Host -ForegroundColor DarkGreen "Ты Михаил Гаврилюк, ты должен идти к цели!"}
  Set-Alias 'ктоя' Get-WhoMe

# 1. Git
  # 1.1 - Основый команды
    
    # 1.1.1 - Инициализация репозитория
    
      function Get-GitInit { & git init $args }
      Set-Alias 'g' Get-GitInit

    # 1.1.2 - Добавление в индекс (отслеживание)

      function Get-GitAdd { & git add .}
      Set-Alias 'ga' Get-GitAdd

    # 1.1.2 - Добавление нового комита 

      function Get-GitCommit { 
        if($args[0]){ & git commit -m 'update';}
        else { & git commit -m $args; }
        # else { & git commit -m $args; }
      }
      Set-Alias 'gcmt' Get-GitCommit

  # 1.1 - Новый репозиторий с комитом

    function Get-GitFullInit {
      $v = $args[0];g;ga;git commit -m 'init';git remote add origin git@github.com:Ameon/$v.git;git push -u origin master;
    }
    Set-Alias 'init' Get-GitFullInit

  # 1.2 - Статус репозитория

    function Get-GitStatus { & git status $args }
    Set-Alias 'gs' Get-GitStatus

  
  
  
  function Get-Gpu { & git push; }

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

    function Get-Push { Get-GitAdd; & git commit -m 'update'; Get-Gpu; }
    function Get-Push2{ Get-GitAdd; Get-GitCommitFix; Get-Gpu;}
    function Get-PushUOriginMaster { & git push -u origin master }

  # 1.4 Git - Работа с ветками 

    # 1.4.1 - Список веток
    
      function Get-GitBranch { & git branch $args}
      Set-Alias 'gb' Get-GitBranch

    # 1.4.2 - Переключение между ветками

      function Get-GitCheckout { & git checkout $args}
      Set-Alias 'ch' Get-GitCheckout

    # 1.4.3 - Переключюиться на ветку master            -- git checkout master

      function Get-CheckoutMaster { & git checkout master}
      Set-Alias 'm' Get-CheckoutMaster    # git checkout master

# 2. Работа с алиасами

  # 2.1 - Открытиые алиасов 
    function Get-EditAliases { & code $profile }
    Set-Alias 'eba' Get-EditAliases

  # 2.2 - Получаение алиасов

    function Get-PullAliases {set-location "C:/proj/settings";git pull;}
    Set-Alias 'pd' Get-PullAliases

  # 2.3 - Обновление алиасов

    function Get-UpdateAliases {set-location "C:/proj/settings";p;}
    Set-Alias 'ud' Get-UpdateAliases    # Обновление Алиасов




function Get-GoPma { & code c:/proj/phpmyadmin }



# 3. NPM

  # 3.1 - npm install

    function Get-NpmInstall { & npm install $args}
    Set-Alias 'i' Get-NpmInstall      

  # 3.2 - Set-Alias 'rs' Get-NpmRunStart    # npm run start
  function Get-NpmRunStart { & npm run start}

Set-Alias 's' Get-Start           # npm run start
Set-Alias 'sw' Get-StartWatch     # npm run start:watch
Set-Alias 'b' Get-Build           # npm run build:prod 

# Yarn

Set-Alias 'y' Get-Yarn          # yarn
Set-Alias 'sd' Get-StartDev     # yarn start:dev
Set-Alias 'yb' Get-YarnBuild    # yarn build


function Get-Build { & npm run build:prod }

function Get-Start { & npm run start }
function Get-StartWatch { & npm run start:watch }


#

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


function Get-Dev { ssh dev }
function Get-React { ssh react }
function Get-ZTV { ssh ztv}
function Get-Config { & code c:/users/ameon/.ssh/config}
function ssh_copy_id([string]$sshHost)
{
    cat ~/.ssh/id_rsa.pub | ssh "$sshHost" "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"
}

# 6. Работа с терминалом

  # 6.1 - Очистка терминала
  
    Set-Alias 'c' cls
    Set-Alias 'с' cls

  # 6.2 - Открыть файл для редактирования
  
    function Get-EditFile {
      if($args[0] -eq 'config'){
        code $env:userprofile/.ssh/config
      }
    }
    Set-Alias 'e' Get-EditFile        

  # 6.3 - Список файлов столбиков

    function Get-La { ls | ft -p name}
    Set-Alias 'la' Get-La

  # 6.4 - Перейти в домашнюю папку пользователя

    Set-Alias 'home' Get-Home
    
    function Get-Master { ssh master }
    Set-Alias 'master' Get-Master     # ssh master

    function Get-Vpn { ssh vpn }
    Set-Alias 'vpn' Get-Vpn

  Set-Alias 'dev' Get-Dev           # ssh dev
  Set-Alias 'proj' Get-Proj
  Set-Alias 'react' Get-React       # ssh react
  Set-Alias 'ztv' Get-ZTV           # ssh ztv
  Set-Alias 'config' Get-Config
  Set-Alias 'web' Get-Web
  Set-Alias 'go' Get-Go             # Перейти в папку  
  
# 7. SSH

  # 7.1 - Работа с ssh ключами

    # 7.1.1 - Показать ключ 

      function Get-ShowKey { cat ~/.ssh/id_rsa.pub }
      Set-Alias 'key' Get-ShowKey

    # 7.1.2 - Скопировать ключ в буфер обмена

      function Get-Key {$res = cat ~/.ssh/id_rsa.pub;Set-Clipboard $res}
      Set-Alias 'getkey' Get-Key

  # 7.2 - SSH ключи

    # 7.2.1 - Подключиться к big

      function Get-Big { ssh big }
      Set-Alias 'big' Get-Big

    # 7.2.2 - Подключиться к dev

      function Get-Dev { ssh dev }
      Set-Alias 'dev' Get-Dev

  # SSH ключи

    




  # 7.1 - Работа с ssh ключами

    
    

  
  

  




















Set-Alias 'pma' Get-StartPhpMyadmin

Set-Alias 'push' Get-Push
Set-Alias 'push2' Get-Push2

# Git





Set-Alias 'gr' Get-GitRemote              # git remote -v

Set-Alias 'gpu' Get-Gpu                   # git push
Set-Alias 'p' Get-Push                    # ga gcmt p
Set-Alias 'p2' Get-Push2
Set-Alias 'pl' Get-Pull                   # git pull
Set-Alias 'puom' Get-PushUOriginMaster    # git push -u origin master






# Проекты

Set-Alias 'u' Update-Project      # Обновить проект ...
Set-Alias 'o' Get-OpenProject     # Открыть проект ...

Set-Alias 'homj' Get-Homj
Set-Alias 'oldgo' Get-StartOldGo
Set-Alias 'gopma' Get-GoPma
Set-Alias 'gol' Get-StartGoLoc
Set-Alias 'gou' Get-StartGoUpdate


# Nestjs.ru
Set-Alias 'dist' Get-GitDist    # git subtree split --branch dist --prefix dist/
Set-Alias 'docs' Get-Docs       # npm run docs

# go.ams74.ru
Set-Alias 'a' Get-Auto            # Автопуш в master


# dev.go.ams74.ru
Set-Alias 'adev' Get-AutoDev



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
    Get-Docs;Get-Build;Get-Push2;Get-GitDist;ch dist;Get-Push;ch master;ssh ameon 'cd ~/domains/nestjs.ru && git pull'
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