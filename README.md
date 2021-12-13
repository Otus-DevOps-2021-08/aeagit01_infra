# aeagit01_infra

MN:![branch parameter main](https://github.com/Otus-DevOps-2021-08/aeagit01_infra/actions/workflows/run-tests.yml/badge.svg?branch=main) *** PR:![event parameter](https://github.com/Otus-DevOps-2021-08/aeagit01_infra/actions/workflows/run-tests.yml/badge.svg?event=pull_request)
#================== +++++ ===================
#gitlab-ci-1

1. Подготовил и запустил машину с установленным докером для развертывания Citlab-CI
2. Подготовил файл docker-compose.yml для запуска контейнера с Gitlab-CI
3. Запустил контецнер и проверили работу
4. Для автоматизации развертывания подготовлен плэйбук gitlab-ci.yml
5. Создал группу, проект.
6. Определение CI/CD Pipeline, отправка изменений на gitlab
7. Добавлен, зарегистрирован runner
8. проверка работы пайплайна при различных условиях
9. Проверка работы с окружениями
10. Проверка выполнения пайплайна с условиями и ограничениями
11. Тестирование работы с динамическим окружением


В текущем образе парольдля root генерируется автоматически, посмотреть можно в файле
/srv/gitlab/config/initial_root_password:

#+++ initial_root_password ++++                                                                                             WARNING: This value is valid only in the following conditions
 1. If provided manually (either via `GITLAB_ROOT_PASSWORD` environment variable or via `gitlab_rails['initial_root_password']` setting in `gitlab.rb`, it was provided before database was seeded
 2. Password hasn't been changed manually, either via UI or via command line.
If the password shown here doesn't work, you must reset the admin password following https://docs.gitlab.com/ee/security/reset_user_password.html#reset-your-root-password.

Password: INITIAL_PASSWORD
NOTE: This file will be automatically deleted in the first reconfigure run after 24 hours.
#+++EOF++++

Задать собственный пароль можно используя переменную окружения GITLAB_ROOT_PASSWORD или
создав файл /etc/gitlab/gitlab.rb в котором определяем:
gitlab_rails['initial_root_password'] = '<my_strong_password>'


#================== +++++ ===================
#Ansible-4




test
https://testinfra.readthedocs.io/en/latest/modules.html#iptables
https://github.com/pytest-dev/pytest-testinfra/blob/master/test/test_modules.py

molecule playbook
WARNING  playbook.yml was deprecated, rename it to converge.yml

Ошибка ERROR    Computed fully qualified role name of my-new-role does not follow current galaxy requirements.
Please edit meta/main.yml and assure we can correctly determine full role name:
https://githubmemory.com/index.php/@theguy147

Установка дополнительных драйверов (ставил драйвер vagrant)
https://molecule.readthedocs.io/en/latest/installation.html?highlight=driver%20vagrant#install

#================== +++++ ===================
#Ansible - 3
1. Создание каталого ролей app и db  в соотвествии с форматом ansible-galaxy
2. настрока роди db
3. настройка роли арр
4. изменение playbook для использования ролей
5. настройка окружения (environments)
6. настройка конфигураций stage && prod
7. реорганизация структуры playbook
8. подключение Community роли jdauphant.nginx
9. проверка работы Ansible Vault, подготовка credentials.yml и файла с ключом
10. настройка работы с динамическим inventory
11. настройка GitHub action
      - настройка выполнения packer validate
      - настройка выполнения terraform validate и tflint
      - настройка проверки playbooks ansible-lint
      - добавление в README.md бейджа со статусом билда
12. настройка создания файла key.examples.json в момент проведения тестов

ссылки:
- https://docs.ansible.com/ansible/devel/user_guide/vault.html
- https://docs.github.com/en/actions/learn-github-actions/environment-variables
- https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_idstepsuses

- https://medium.com/swlh/how-i-create-my-first-action-and-deployed-to-github-actions-marketplace-8ca519be1ef7
- https://github.com/marketplace/actions/create-json
  (после создания json необходимо выполнить коммит для дальнейшего использования)

#================== +++++ ===================
#Ansible - 2

1. Подготовлен playbook со сценирием установки тестового приложения
2. Подготовлено несколько сценариев с разбиением задач по блокам
3. Основной playbook разбит на несколько
4. добавлено использование terraform-inventory c github, вснесены исправления в файлы  playbook
5. созданы playbook-и для заменты bash-скриптов provision
6. Выполнена проверки работоспособности приложения

#================== +++++ ===================
#Ansible - 1

1. Установка python 2.7
2. Установка ansible
3. Создание inventory файла, проверка подключения к хостам с испоьзованием inventory
4. Создание ansible.cfg, оптимизация inventory, разнесение хостоа по группам
5. Проверка выполнения операций с группами хостов
6. Подготовка YANL inventory
7. Проверка выполнения комманд с использованием модулей command, shell, git, systemd, service
8. Создание playbook, тестирование выполнения задач с использованием playbook (при выполнении задания изменилось состояние признака changed = 1)
9. создан файл inventory.json и bash сценарий для его использования содержание сценария: #! bin/bash cat ./inventory.json
10. создан сценаний на python для получения данных от инстансах непосредственно из Yandex Cloud выводящего данные в формате json, отредактирован сценарий для использования этого сценария
11. отредактирован файл ansible.cfg, для использания динамического inventory

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
