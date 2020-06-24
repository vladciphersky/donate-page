# donate-page
Донат-страница с интеграцией DonationAlerts

## Для чего оно надо?
Если Вы автор чего-либо, и хотите чтобы у Вас на сайте была таблица с донатерами (которая обновляется сама), тогда вы можете использовать этот скрипт.

## Как запустить?
1. Скачайте скрипт себе на сервер (VPS/VDS | Также у Вас должен быть установлен Node.js версии 12.6.0)
2. Перейдите в папку, переименуйте `config.example.json` в `config.json` и поменяйте все данные под себя (не забудьте импортировать `donate-page.sql` в базу данных)
3. Запустите скрипт через `tmux` `screen` `pm2` и т.д. (`node index.js`)

## Как зайти на него под доменом, а не по IP:port?
Специально для вас скидываю конфигурацию nginx-реверс-прокси
```
server {
        listen 80;
        server_name <ваш домен>;

        location / {
                proxy_set_header Host $host;
                proxy_set_header Accept-Encoding "";
                proxy_pass http://127.0.0.1:<порт указанный в конфигурации>;
        }
}
```
P.S. Скобки **не требуются**, так что убирайте их, или будет ошибка.
<hr>Пример конфигурации на apache от <a href="https://mrlivixx.me/" target="_blank">MrLivixx</a>:

```
<VirtualHost *:80>
    ServerName <ваш домен>
    ServerAlias www.<ваш домен>
    ServerAdmin <ваша почта>
    ProxyPass / http://localhost:<порт указанный в конфигурации>/
</VirtualHost>
```
