@echo off
title Install Game

:install
cls
echo Install Game

set /p game_name=Enter the name of the game file (without .bat): 
if "%game_name%"=="" goto main_menu

echo Now, paste the game's batch code below. Press Ctrl+Z and Enter when finished.

:loop
set "line="
set /p "line="
if not defined line goto save

echo %line% >> games\%game_name%.bat
goto loop

:save
echo Game "%game_name%.bat" installed!
pause
goto main_menu

:main_menu
goto main