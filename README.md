# matveevelli_infra
matveevelli Infra repository

###   Lesson 11 | HomeWork 9

- Созданы отдельные роли для app и db на основе ansible-galaxy
- Добавлена таска для вывода информации об актуальном окружении
- Плейбуки перенесены в каталог playbooks
- Старые файлы перенесены в каталог old, отредактированы конфиги packer
- Улучшен файл ansible.cfg
- Добавлена роль nginx из ansible-galaxy, приложение доступно по 80 порту
- Добавлен плейбук для создания пользователей, конфигурация зашифрована с помощью ansible vault

###   Lesson 10 | HomeWork 8

- Написан деплой по принципу "один playbook, один сценарий" - `ansible/reddit_app_one_play.yml`
- Написан деплой по принципу "один playbook, несколько сценариев" - `ansible/reddit_app_multiple_plays.yml`
- Написан деплой по принципу "несколько playbooks" - ansible/site.yml, ansible/db.yml, ansible/app.yml, `ansible/deploy.yml`
- добавлено автообнаружение db_instance прииспользовании плейбука app.yml
- изменен провижинг в packer на ansible

###   Lesson 9 | HomeWork 7

- установлен `ansible` на локальной машине
- запущена инфраструктура terraform из stage
- создан `ansible.cfg` с необходимыми параметрами
- создан файл статического inventory в INI-формате
удалённые хосты и группы доступны по команде ping
- создан и выполнен простой playbook
команда для запуска `ansible-playbook clone.yml`
- после повторного выполнения playbook результат - `changed=0`
т.к. ожидаемый результат уже был достигнут на хосте - менять нечего
- после удаления каталога и повторного запуска плейбука - `changed=1`, т.к ожидаемый результат достигнут с изменениями

Задание со *

приложен bash-скрипт файл `dyn_inv.sh` во время выполнения генерирующий динамический инвертори для ansible. IP-адрса определяются в соответствии с названиями инстансов в yc: reddit-app и reddit-db

**Опции скрипта.**
- `--list` - Возвращает список групп, хостов, а также переменных в формате JSON.

- `--host` - Поддержка этой опции необязательна и не используется (указана пустая секция _meta). Cкрипт возвращает элемент верхнего уровня с именем _meta, в котором могут быть перечислены все переменные для хостов.

- приложен файл динамического inventory.json созданный командой `./dyn_inv.sh --list > inventory.json`

- При запуске Ansible скрипт динамического инвентори вызывается с помощью ключей `-i` или `--inventory`

- Скрипт добавил в `ansible.cfg,` чтобы постоянно не ссылаться на него при запуске Ansible.

проверена доступность всех хостов с помощью динамического и статическогоинвентори командой `ansible all -m ping`

**Отличия схем JSON для динамического и статического инвентори**

Пример статического инвентори в JSON приведен здесь: https://linuxhint.com/ansible_inventory_json_format/ Имеются отличия в синтаксисе файлов, например в JSON динамического инвентори хосты перечисляются в квадратных скобках. Кроме того, в динамическом инвентори используется секция `_meta`, которой нет в статическом инвентори.

###   Lesson 9 | HomeWork 7

определение зависимости и порядок создания ресурсов

создание новых образов с ruby и бд отдельно

структурирование ресурсов, разнесение по файлам

перенес в модули, работает

перенес конфигурацию в stage и prod

###   Lesson 8 | HomeWork 6

установлен terraform

поднята ВМ из образа созданного через packer

поднят балансировщик

поднято 2 ВМ с полным описанием каждой - проблема в том что БД разные между ВМ

балансировщик распределяет между нодами

поднято 2 ВМ через **count * 2**

**name = "reddit-app-${count.index}"**

###   Lesson 7 | HomeWork 5

установлен packer

создан сервисный аккаунт и вм при помощи yc

создан IAM key

создан файл-шаблон **ubuntu16.json**

создан базовый образ с помощью packer + с этим образом поднята ВМ, установлено приложение reddit

параметризован шаблон с переменными в **variables.json**

"запечен" образ **reddit-full** с предустановленным приложением reddit

создан скрипт **./config-scripts/create-reddit-vm.sh** для поднятия ВМ с приложением из запеченного образа **reddit-full**

###   Lesson 6 | HomeWork 4

testapp_IP = 84.201.129.36

testapp_port = 9292

для запуска сборки:



    yc compute instance create \
      --name reddit-app \
      --hostname reddit-app \
      --memory=4 \
      --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
      --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
      --metadata serial-port-enable=1 \
      --metadata-from-file user-data=./metadata.yaml

###   Lesson 5 | HomeWork 3

bastion_IP = 130.193.48.231

someinternalhost_IP = 10.130.0.26

для подключения командой **ssh someinternalhost**
создаём файл **~/.ssh/config** и добавляем в него алиас с удалённой командой

    Host someinternalhost
            Hostname 130.193.48.231
            Port 22
            User appuser
            IdentityFile ~/.ssh/appuser.pub
            RequestTTY force
            ForwardAgent yes
            RemoteCommand ssh appuser@10.130.0.26

### SSL
для установки самоподписанного сертификата нужно добавить адрес в панели управления Pritunl
`130.193.48.231.sslip.io` в `settings > Let's Encrypt Domain`
