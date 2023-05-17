@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

rem hello

echo how many characters?
set /p length=

echo do you want capital letters? (y/n)
set /p capital=

echo do you want symbols? (y/n)
set /p symbols=

echo do you want numbers? (y/n)
set /p numbers=

set characters=abcdefghijklmnopqrstuvwxyz

if /i "%capital%"=="y" (
    set characters=%characters%ABCDEFGHIJKLMNOPQRSTUVWXYZ
)

if /i "%symbols%"=="y" (
    set characters=%characters%^@#*+-&?!%
)

if /i "%numbers%"=="y" (
    set characters=%characters%^0123456789
)

set pwd=

FOR /L %%b IN (1, 1, %length% ) DO (
    SET /A rnd_num=!RANDOM! * 62 / 32768 + 1
    for /F %%c in ('echo %%characters:~!rnd_num!^,1%%') do set pwd=!pwd!%%c
)

set master-password= %pwd:ECHO=%%
echo|set/p=%master-password%|clip
cls

echo %master-password%
echo WAS COPIED TO CLIPBOARD
endlocal

pause
