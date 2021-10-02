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

bastion_IP = 62.84.112.64
someinternalhost_IP = 10.128.0.5

#================== +++++ ====================
#HW 04
#cloud-testapp

testapp_IP = 62.84.117.126
testapp_port = 9292

#================== +++++ ===================
#packer base
 1. Подготовлен сценарий для создания образа packer-ом
 2. выполнено создание образа
 3. создана виртуальная машина на основании полученного образа, на ней развернуто приложение
 4. Подготовлены файлы для создания образа с развернутым приложением,
 5. создан сценарий для создания VM с использованием образа с развернутым приложением.

## Как запустить проект:
#create image whith deployed application
 - packer build -var-file=packer/variables.json packer/immutable.json
#create VM
 - ./config-scripts/create-reddit-vm.sh
=======
#create instance

yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata-from-file user-data=startup-config.yaml \
  --metadata serial-port-enable=1

#application start

http://62.84.117.126:9292
