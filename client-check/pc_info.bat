@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

REM Тема: Диагностика клиентского компьютера
REM Выполнил: Нацаев Сергей
REM Дата: 26.10.2026

set "REPORT=%~dp0pc_report.txt"
if exist "%REPORT%" del "%REPORT%"

echo ==================================================
echo           ДИАГНОСТИКА КОМПЬЮТЕРА
echo ==================================================
echo.
echo ================================================== >> "%REPORT%"
echo           ДИАГНОСТИКА КОМПЬЮТЕРА >> "%REPORT%"
echo ================================================== >> "%REPORT%"
echo. >> "%REPORT%"

echo --- Операционная система ---
echo --- Операционная система --- >> "%REPORT%"
powershell -NoProfile -Command "Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version | Format-List" | findstr /v "^$"
powershell -NoProfile -Command "Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version | Format-List" | findstr /v "^$" >> "%REPORT%"
echo.
echo. >> "%REPORT%"

echo --- Процессор ---
echo --- Процессор --- >> "%REPORT%"
powershell -NoProfile -Command "Get-CimInstance Win32_Processor | Select-Object Name | Format-List" | findstr /v "^$"
powershell -NoProfile -Command "Get-CimInstance Win32_Processor | Select-Object Name | Format-List" | findstr /v "^$" >> "%REPORT%"
echo.
echo. >> "%REPORT%"

echo --- Оперативная память ---
echo --- Оперативная память --- >> "%REPORT%"
powershell -NoProfile -Command "$ram = Get-CimInstance Win32_OperatingSystem; 'Всего памяти: ' + [math]::Round($ram.TotalVisibleMemorySize/1MB) + ' ГБ'; 'Свободно памяти: ' + [math]::Round($ram.FreePhysicalMemory/1MB) + ' ГБ'"
powershell -NoProfile -Command "$ram = Get-CimInstance Win32_OperatingSystem; 'Всего памяти: ' + [math]::Round($ram.TotalVisibleMemorySize/1MB) + ' ГБ'; 'Свободно памяти: ' + [math]::Round($ram.FreePhysicalMemory/1MB) + ' ГБ'" >> "%REPORT%"
echo.
echo. >> "%REPORT%"

echo --- Диск C ---
echo --- Диск C --- >> "%REPORT%"
powershell -NoProfile -Command "$disk = Get-CimInstance Win32_LogicalDisk -Filter \"DeviceID='C:'\"; 'Всего на диске: ' + [math]::Round($disk.Size/1GB) + ' ГБ'; 'Свободно на диске: ' + [math]::Round($disk.FreeSpace/1GB) + ' ГБ'"
powershell -NoProfile -Command "$disk = Get-CimInstance Win32_LogicalDisk -Filter \"DeviceID='C:'\"; 'Всего на диске: ' + [math]::Round($disk.Size/1GB) + ' ГБ'; 'Свободно на диске: ' + [math]::Round($disk.FreeSpace/1GB) + ' ГБ'" >> "%REPORT%"
echo.
echo. >> "%REPORT%"

echo --- Установленные программы ---
echo Идёт поиск программ...
echo --- Установленные программы --- >> "%REPORT%"
powershell -NoProfile -Command "Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -is [string] -and $_.DisplayName.Trim() -ne '' } | Select-Object -ExpandProperty DisplayName | Sort-Object -Unique"
powershell -NoProfile -Command "Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -is [string] -and $_.DisplayName.Trim() -ne '' } | Select-Object -ExpandProperty DisplayName | Sort-Object -Unique" >> "%REPORT%"
echo.

echo ==================================================
echo Отчёт сохранён в файл pc_report.txt!
echo ==================================================
echo ================================================== >> "%REPORT%"
echo Отчёт сохранён >> "%REPORT%"
echo ================================================== >> "%REPORT%"
pause