# AutoStartIGT
Автоматический запуск Influxdb, Grafana, Telegraf 


## Описание
Для работы с docker-compose.yml должен быть установлен Docker


## Запуск
Для Windows открываем start.bat, выбираем нужные действия и наслаждаемся
<details>
<summary>:mag: Спойлер</summary>

![image](https://github.com/user-attachments/assets/4db477d1-7f66-4e48-b839-8bd69d334e08)

![image](https://github.com/user-attachments/assets/88b744c9-725a-4bd4-b4c0-fa57b675da18)

![image](https://github.com/user-attachments/assets/9ae21fb0-4404-4bcd-b250-93b409408039)

</details>

Для других ОС пользуемся командами
```
docker-compose up -d  # Запуск контейнеров

docker-compose stop  # Остановка контейнеров

docker-compose down -v  # Остановка и удаление контейнеров со всеми данными!

docker-compose ps  # Статус контейнеров
```

Для изменения настроек Telegraf меняем настройки на нужные в [telegraf.conf](https://github.com/Tiaki026/AutoStartIGT/blob/main/telegraf.conf)


