@echo off
title Purnjay OS - Loading...

echo Loading Purnjay OS...

set "bar="
set "max=20"

:loop
if "%bar%"=="####################" goto :done

set "bar=%bar%#"
echo [%bar%]
timeout /t 1 /nobreak >nul
cls
goto :loop

:done
echo [%bar%]
echo Purnjay OS loaded!
pause
color 0a
set "file=startup.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
title Purnjay OS ver= 0.5.1
echo Finding Kernel.........
echo Kernel Found! Booting PurnjayOS
pause

cls
echo ACCOUNT SETUP
echo _________________________________________________________            
echo what is your name?
set/p name=
echo.
cls
if exist theme.txt (
set /p line=< theme.txt
%line%)
echo ACCOUNT SETUP
echo _________________________________________________________
echo HELLO! %name%! This is the first release of Parunjay OS.
echo The trademark of T .Inc belongs to Parunjay OS and Parunjay OS Plus.
echo Select a theme.
echo 1. Red
echo 2. Blue
echo 3. Yellow.
echo 4. Green
set /p theme=

if %theme% == 1 (
  echo colour 4F > theme.txt
  color 4F
) else if %theme% == 2 (
  echo colour 1F > theme.txt
  color 1F
) else if %theme% == 3 (
  echo colour 6F > theme.txt
  color 6F
) else if %theme% == 4 (
  echo colour 2F > theme.txt
  color 2F
) else (
  echo Invalid theme!
  pause
  exit /b
)

echo Theme set!
pause

if exist theme.txt (
set /p line=< theme.txt
%line%)
echo Theme set!
pause
:menu
cls
echo What would you like to do, %name%
echo.
echo 1.System Info 2.Calc 3.Clock 4.Calendar 5.Songs 6.Antivirus

set /p input=
if %input% == 1 goto info
if %input% == 2 goto calc 
if %input% == 3 goto clock
if %input% == 4 goto calendar
if %input% == 5 goto Songs
if %input% == 6 goto antivirus

:info
echo Please wait while calculateing disc space..
SETLOCAL

FOR /F "usebackq tokens=1,2" %%f IN (`PowerShell -NoProfile -EncodedCommand "CgBnAHcAbQBpACAAVwBpAG4AMwAyAF8ATABvAGcAaQBjAGEAbABEAGkAcwBrACAALQBGAGkAbAB0AGUAcgAgACIAQwBhAHAAdABpAG8AbgA9ACcAQwA6ACcAIgB8ACUAewAkAGcAPQAxADAANwAzADcANAAxADgAMgA0ADsAWwBpAG4AdABdACQAZgA9ACgAJABfAC4ARgByAGUAZQBTAHAAYQBjAGUALwAkAGcAKQA7AFsAaQBuAHQAXQAkAHQAPQAoACQAXwAuAFMAaQB6AGUALwAkAGcAKQA7AFcAcgBpAHQAZQAtAEgAbwBzAHQAIAAoACQAdAAtACQAZgApACwAJABmAH0ACgA="`) DO ((SET U=%%f)&(SET F=%%g))

@ECHO Used: %U%
@ECHO Free: %F%

SET Num1Add=%U%
SET Num2Add=%F%
SET /A Ans=%Num1Add%+%Num2Add%
for /f "tokens=2 delims==" %%a in ('wmic ComputerSystem get TotalPhysicalMemory /value') do set "bytes=%%a"
set /a "ram_gb=%bytes%/1073741824"

echo.=======================
echo     PURNJAY__OS_+
echo.=======================
echo     DETAILS  
echo.
echo     VERSION = 0.0.2
echo.     
echo     RAM = %ram_gb%GB
echo.
echo     CORE = %PROCESSOR_IDENTIFIER%
echo.
echo     HARD_DRIVE = %Ans% GB
echo.   
echo     Kernel ver = 5.6.7
echo.  
echo    Build = %OS%
echo.
echo    Prossesor Architecture: %PROCESSOR_ARCHITECTURE%
echo.
echo.========================
echo     @Copyright P.inc
echo.========================
echo.
echo Wanna check for update?

echo  1. to check for update 
echo  2. Menu

set /p check= 

if %check% == 1 goto update

if %check% == 2 goto menu




     
:update 
cls

echo Checking for new version /Update.............
echo.
pause
cls
echo.
echo no update available,Try Againg after some time.
echo.
pause
goto menu

:clock
cls
echo What Would You Like To Do, %name%
echo.
echo 1.System Info 2.Calc 3.Clock 4.Calendar 5.Songs 6.Antivirus
echo.
echo The current time is %time%
echo The current date is %date%
timeout 1 >nul
goto clock
:calendar
color 1F
cls
echo.
echo    A problem has been detected and PurnjayOS has been shut down to prevent damage to your computer.
echo.
echo    If this is the first time you've seen this Stop error screen, restart your computer. If this screen appears again, follow these steps:
echo.
echo    Check to make sure any new hardware or software is properly installed. If this is a new installation, ask your hardware or software manufacturer for any Windows updates you might need.
echo.
echo    If problems continue, disable or remove any newly installed hardware or software. Disable BIOS memory options such as caching or shadowing. If you need to use Safe Mode to remove or disable components, restart your computer, press F8 to select Advanced Startup Options, and then select Safe Mode.
echo.
echo    Technical information:
echo.
echo    *** STOP: 0x%random%%random%A (0x%random%%random%, 0x%random%%random%, 0x%random%%random%, 0x%random%%random%)
echo.
echo    Beginning dump of physical memory
echo    Physical memory dump complete.
echo.
pause >nul
exit /b