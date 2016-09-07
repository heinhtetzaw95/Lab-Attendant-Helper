:: This batch program is intended for checking computers at Spellmann Computer Lab in Lindenwood Unviersity
:: Using this app on other networks will not work otherwise tricked.
:: This program is FREE for all lab attendants.

:: Written by Hein

:: Use this at your own risk. ** This program does not work PERFECTLY. Please 

@ECHO OFF

SET first=1
SET last=100

ECHO Automated Computer Checking System for Spellmann Computer Lab
ECHO.

SET connected=0
SET counter=%first%
SET pcName=SomeName

ECHO.

:loop

IF /I %counter% LSS 10 SET pcName=CL0%counter%
IF /I %counter% GEQ 10 SET pcName=CL%counter%

FOR /f "tokens=1 delims=[]" %%A in ('ping -a %pcName%.lindenwood.edu -n 1 ^| find "Pinging"') do set connected=1

IF %connected%==1 ECHO Checking the computer "%pcName%" ---------- OK!
IF %connected%==0 ECHO Checking the computer "%pcName%" ---------- ***** NOT OK! *****

:skip

SET /A counter=%counter%+1
SET /A connected=0

IF /I %counter% LEQ %last% GOTO loop

ECHO.
ECHO.

PAUSE
