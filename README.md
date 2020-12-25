# matveevelli_infra
matveevelli Infra repository
###   Lesson 6 | HomeWork 4

testapp_IP = 84.201.159.253

testapp_port = 9292

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
