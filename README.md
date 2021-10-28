# aeagit01_infra
MN:![branch parameter main](https://github.com/Otus-DevOps-2021-08/aeagit01_infra/actions/workflows/run-tests.yml/badge.svg?branch=main) *** PR:![event parameter](https://github.com/Otus-DevOps-2021-08/aeagit01_infra/actions/workflows/run-tests.yml/badge.svg?event=pull_request)
#================== +++++ =================== #Ansible - 3




#================== +++++ =================== #Ansible - 2

Подготовлен playbook со сценирием установки тестового приложения
Подготовлено несколько сценариев с разбиением задач по блокам
Основной playbook разбит на несколько
добавлено использование terraform-inventory c github, вснесены исправления в файлы  playbook
созданы playbook-и для заменты bash-скриптов provision
Выполнена проверки работоспособности приложения

#================== +++++ =================== #Ansible - 1

Установка python 2.7
Установка ansible
Создание inventory файла, проверка подключения к хостам с испоьзованием inventory
Создание ansible.cfg, оптимизация inventory, разнесение хостоа по группам
Проверка выполнения операций с группами хостов
Подготовка YANL inventory
Проверка выполнения комманд с использованием модулей command, shell, git, systemd, service
Создание playbook, тестирование выполнения задач с использованием playbook (при выполнении задания изменилось состояние признака changed = 1)
создан файл inventory.json и bash сценарий для его использования содержание сценария: #! bin/bash cat ./inventory.json
создан сценаний на python для получения данных от инстансах непосредственно из Yandex Cloud выводящего данные в формате json, отредактирован сценарий для использования этого сценария
отредактирован файл ansible.cfg, для использания динамического inventory

#================== +++++ ===================
#Terraform - 2
1. Сценарии из предыдущего ДЗ разбиты на модули.
2. Выполнено тестирование сборки инстансов и из работоспособности
3. Созданы пакеты prod и stage использующие сделанные модули
4. Проверка правильности сборки и работы обоих пакетов
5. Выполнена настройка для сохранения state файла в Yandex Object Storage
6. Проверка работы пакетов при сохранении state в облаке
7. добавлено отключение Provisioner в зависимости от установки переменной
   тестировалось 2 варианта:
    - передача переменной окружения на ВМ и выполнения сценария установовки приложения
      в зависимости от ее состояния. Недостаток - на ВМ все равно приходиться копировать файлы.
    - использование ресурса с типом "null_resource" и переменной count. Недостаток - есть вероятность,
      что при использовании более старых версий терраформ выдаст ошибку.

#================== +++++ ===================
#Terraform - 1

1. Подготовлен файл main.tf создания инстанса с использованием ранее подготовленного образа.
2. main.tf переделан с использованием variables, созданы и настроены файлы variables.tf, terraform.tfvars.example
3. подготовлен файл output.tf для вывода полученных инстансами ip адресов
4. подготовлен файл lb.tf для создания балансировщика, и подключения к нему созданного инстанса
5. изменен main.tf для создания 2-х истансов, оба подключены к балансировщику. Проверка работы балансировщика путем пременного выключение инстансов.
6. переделан сценарий для создания инстансов с использованием переменной count



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


#================== +++++ ===================

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
