@echo off
title My Simple OS

:main
cls
echo My Simple OS - Main Menu
echo 1. View Files
echo 2. Create File
echo 3. Games
echo 4. About
echo 5. Exit

set /p choice=Enter your choice:

if %choice%==1 goto view_files
if %choice%==2 goto create_file
if %choice%==3 goto games
if %choice%==4 goto about
if %choice%==5 exit

goto main

:view_files
cls
echo My Simple OS - Files

if not exist files\ md files

dir files /b
echo.
set /p file_name=Enter file name to open (or press enter to return):
if not "%file_name%"=="" notepad files\%file_name%
goto main

:create_file
cls
echo My Simple OS - Create File

if not exist files\ md files

set /p file_name=Enter file name:
if not "%file_name%"=="" notepad files\%file_name%
goto main

:games
cls
echo My Simple OS - Games

if not exist games\ md games

dir games /b
echo.
set /p game_name=Enter game name to play (or press enter to return):
if not "%game_name%"=="" call games\%game_name%
goto main

:about
cls
goto about_section

:about_section
cls
echo My Simple OS - About

echo. ------------------------
echo Computer Name: %computername%
echo Operating System: %os%
echo Processor Architecture: %PROCESSOR_ARCHITECTURE%
echo User Name: %username%
echo ------------------------

pause
goto main