function Get-GitPull { & git pull $args }
function Get-GitStatus { & git status $args }
function Get-GitBranch{ & git branch $args }
# Docker
function cdt { set-location "C:/proj" }

Set-Alias dcd 'docker-compose down'
Set-Alias dcl 'docker-compose logs -f -t'
Set-Alias dcr 'docker-compose restart'
Set-Alias dcu 'docker-compose up'
Set-Alias dnl 'docker network ls'
Set-Alias dps 'docker-pretty-ps'
Set-Alias dockps 'docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'
Set-Alias dockports 'docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}"'

Set-Alias dp 'cd /var/projects/dev/ameon/www/go.ams74.ru'
Set-Alias recrt 'docker-compose up --build --force-recreate --no-deps -d'

# Проекты
Set-Alias projects 'cd /var/projects'
Set-Alias proj cdt

# Demo сайт
Set-Alias demo 'cd /var/www/demo-vds.ams74.ru'

# Dev
Set-Alias dev 'cd /var/www/dev.go.ams74.ru'

Set-Alias du 'du -ch'


Set-Alias go.loc 'cd /var/www/go.loc'
#Set-Alias gp 'git push'
#Set-Alias gps 'git push && master "cd /var/projects/go/www/go.ams74.ru && git pull origin php8.1"'

# GIT
Set-Alias ga 'git add .'
Set-Alias gb Get-GitBranch
#Set-Alias gc 'git commit -m "Update"'
Set-Alias gpl Get-GitPull
Set-Alias gs Get-GitStatus

Set-Alias key 'cat ~/.ssh/id_rsa.pub'
Set-Alias la 'ls -a1'

#Set-Alias lgid 'getent group | awk -F: '"'"'{print $3." -",$1}'"'"' | sort -n'
Set-Alias loc 'cd /var/projects/localhost'

#Set-Alias luid 'echo "Список пользователей (сортировка по id):";getent passwd | awk -F: '"'"'{print $3." -",$1}'"'"' | sort -n'
Set-Alias master 'ssh master'
#Set-Alias mp 'cd /var/projects/go/master/www/go.ams74.ru'
Set-Alias ra 'stat -c "%a %n"'



Set-Alias rpf 'systemctl restart php-fpm'

# Nginx
Set-Alias rn 'systemctl restart nginx'


# Linux

Set-Alias c "clear"
Set-Alias с "clear"
#Set-Alias del 'rm -f'
Set-Alias df 'df -H'            # Свободное место
Set-Alias free 'free -h'        # Оперативная память
#Set-Alias h 'cd ~'
Set-Alias home 'cd ~/'
#Set-Alias lu 'echo "Список групп (сортировка по наименованию):";getent passwd | awk -F: '"'"'{print $1}'"'"' | sort -n | awk '"'"'{print NR" - "$1}'"'"''
Set-Alias release 'cat /etc/os-release'
#Set-Alias version 'cat /etc/*-release'  # Версия

# Работа с dotfiles

Set-Alias eb 'exec bash'
Set-Alias eba 'nano ~/.bash_Set-Aliases'
#Set-Alias ud 'cd ~/.dotfiles && ga && gc && gp'
Set-Alias gd 'cd ~/.dotfiles && git pull'