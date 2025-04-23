@echo off
chcp 65001 > nul
cls
title 🐳 Docker Monitoring Control

:: Главное меню
:menu
cls
echo.
echo  ╔═══════════════════════════════╗
echo  ║       УПРАВЛЕНИЕ СТЕКОМ       ║
echo  ╠═══════════════════════════════╣
echo  ║                               ║
echo  ║  [1] 🚀 Запустить все сервисы ║
echo  ║  [2] ⏹  Остановить контейнеры ║
echo  ║  [3] 🔄 Перезапустить стек    ║
echo  ║  [4] 💀 Полный сброс данных   ║
echo  ║  [5] ❌ Выход                 ║
echo  ║                               ║
echo  ╚═══════════════════════════════╝
echo.

:: Выбор действия
choice /C 12345 /N /M "Выберите действие: "
if errorlevel 5 exit
if errorlevel 4 goto reset
if errorlevel 3 goto restart
if errorlevel 2 goto stop
if errorlevel 1 goto start

:: Блоки выполнения
:start
echo 🚀 Запускаем Grafana + InfluxDB + Telegraf...
docker-compose up -d
call :check_status
echo ✅ Готово! Grafana: http://localhost:3000
set /p open="Открыть в браузере? [y/N] [д/Н]: "
if /i "%open%"=="y" start "" "http://localhost:3000"
if /i "%open%"=="д" start "" "http://localhost:3000"
echo 🔸 Нажмите любую клавишу для возврата в меню 🔸
pause >nul
goto menu

:stop
echo ⏹ Останавливаем контейнеры...
docker-compose stop
call :check_status
echo ✅ Контейнеры остановлены
echo 🔸 Нажмите любую клавишу для возврата в меню 🔸
pause >nul
goto menu

:reset
echo 💀 ВНИМАНИЕ: Это удалит ВСЕ данные!
set /p confirm="Подтвердите удаление (введите DELETE): "
if not "%confirm%"=="DELETE" (
    echo ❌ Отменено
    goto menu
)
echo 🧹 Удаляем контейнеры и тома...
docker-compose down -v
echo ✅ Все данные удалены
echo 🔸 Нажмите любую клавишу для возврата в меню 🔸
goto menu

:restart
call :stop
timeout /t 3 /nobreak > nul
call :start
echo 🔸 Нажмите любую клавишу для возврата в меню 🔸
goto menu

:check_status
echo.
echo 🔍 Текущее состояние:
docker-compose ps
echo.
goto :eof
