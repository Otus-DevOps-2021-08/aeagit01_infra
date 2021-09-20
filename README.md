# aeagit01_infra
aeagit01 Infra repository

ДЗ знакомство с облачной инфораструктурой
одключение someinternalhost одной строкой:
Вариант 1
использование параметра комманды ssh -o, с указанием параметра конфигурационного файла в коммандной строке для подключения к bastion хосту
ssh -i ~/.ssh/appuser -o ProxyCommand="ssh -W %h:%p -i ~/.ssh/appuser appuser@<bastion host>" appuser@<internal host>
Вариант 2
Использование параметра ssh -J, позволяет подключаться через цепочку хостов
ssh -i ~/.ssh/appuser -J appuser@<bastion host> appuser@<internal host>

подключение в внутреннему хосту коммандой 'ssh someinternalhost':
для этого необходимо внести следующие изменения в файл ~/.ssh/cpnfig

#================== +++++ ====================
Host someinternalhost
    HostName <IP of internal host>
    Port 22
    ProxyJump <IP or name of bastion host>
    IdentityFile ~/.ssh/appuser
    User appuser
Host <IP or name bastion host>
    IdentityFile ~/.ssh/appuser
    User appuser
#================== +++++ ====================
В текущем задании:
IP bastion host  - 193.32.218.50
IP internal host - 10.128.0.5
