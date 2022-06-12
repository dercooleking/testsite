@echo off
if not exist temp.txt exit
title BatchChat Log - Connecting..
color 0f
set errnet=0
set server=SERVER
:launch
cls
set message=null && set prevmsg=null
call %cd%\BatchChatConfig\config\cfg.bat
if not exist %drive%\BatchChat\chat_data\settings.bat goto err_net
if not exist %drive%\BatchChat\chat_text\text.bat goto err_net
call %drive%\BatchChat\chat_data\settings.bat
call %drive%\BatchChat\chat_data\motd.bat
echo %chat_motd%
echo.
:loop
if exist %drive%\BatchChat\chat_data\reset.txt (
	timeout /t 1 /nobreak > nul
	goto launch
)
if not exist %drive%\BatchChat\chat_data\settings.bat goto err_net
if not exist %drive%\BatchChat\chat_text\text.bat goto err_net
call %drive%\BatchChat\chat_data\settings.bat
call %drive%\BatchChat\chat_text\text.bat
if "%errnet%"=="1" (
	echo [%time%] Warning: Reconnected to chat!
	set errnet=0
)
title BatchChat Log - %chat_name%
rem call :title
if not "%message%"=="%prevmsg%" (
	set prevmsg=%message%
	echo %message% 
	
	
)
ping 1.1.1.1 -n 1 -w 500 > nul
goto loop
pause > nul
:err_net
if "%errnet%"=="1" (
	timeout /t 1 /nobreak > nul
	goto loop
)
set errnet=1
echo [%time%] {%server%} Warnung: Die Verbindung zum  Chat Server wurde 
echo unterbrochen!
goto loop

pause > nul
exit


:title
@color 07
echo (c) DBMX 2021
echo.
GOTO:eof