@echo off

:launch
cd %cd%
set user=Console
set version=Nicht Verfuegbar
set admin=4
set clan=Default
set team=Chater
set server=Chat
set msg_clan=false
set status=Online
set mailbe=false
set build=false
set status_2= 
set launch_time=%time%
set launch_date=%date%
set errnet=0
set server_st=2
if not exist %drive%\BatchChat\chat_data\bann.txt goto 0.1
if not exist %drive%\BatchChatConfig\server\log_st.txt goto 0.1
if not exist %drive%\BatchChat\chat_data\server md %drive%\BatchChat\chat_data\server
rem if not exist WBAT.COM goto creat_wbat



:0.1
@title Install
if exist %cd%\Console goto 1
if not exist %cd%\Console goto install

:install
for %%a in (wbat zpos) do set %%a=
set ?=
wbat cls ! box "Darf das Programm auf ihre Festplatten zugreifen?" Ja,Nein
if not errorlevel 2  goto 1
exit
::end
::exit
)
:1
@echo on
cd %cd%
title BatchChat Lobby
mode 100, 30
color 0f
if not exist %cd%\Console (
	md %cd%\Console
	if not exist %cd%\Console goto accessDenied
)
if exist %cd%\Console cd %cd%\Console
if not exist %cd%\config (
	md %cd%\config
	if not exist %cd%\config goto accessDenied
)
if not exist %cd%\server\ (
	md %cd%\server
	md %cd%\server
	if not exist %cd%\server goto accessDenied
)
if exist %cd%\config\cfg.bat call %cd%\config\cfg.bat
if not exist %cd%\config\cfg.bat (
	del %cd%\config\cfg.bat
	(echo | set /p=^s^e^t ^d^r^i^v^e^=^n^u^l^l)>>%cd%\config\cfg.bat
	goto err_file002
)
set cd1=%cd%
cd ..
if exist reload.bat del reload.bat

:menu
@echo on
if exist %cd%\Console\config\cfg.bat call %cd%\Console\config\cfg.bat
if not exist %cd%\Console\config\cfg.bat goto err_file001
cls
set entry=null
:join
@echo on
for /F "usebackq" %%a in (%drive%\BatchChat\chat_data\version.bat) do set version=%%a
cls
call :disp
echo                                -= Verbinde mit Chat Server =-
set %%a=null
if not exist %drive%\BatchChat\ goto err_nochat
if not exist %drive%\BatchChat\bin\plugins md %drive%\BatchChat\bin\plugins
for /F "usebackq" %%a in (%drive%\BatchChat\chat_data\server\log_st.txt) do set server_st=%%a

cls

::call :disp
::echo.
::echo                                        -= Username: =-
::set /p user=^>
::if "%user%"=="Max" goto faild_name
::if "%user%"=="SystemAdmin" goto faild_name
::if "%user%"=="System" goto user_system
::if "%user%"=="Owner" goto user_false
::if "%user%"=="Console" goto server_ban
::if "%user%"=="chat" goto chat
::if "%user%"=="null" goto join
::if "%user%"=="/drive" goto joinset
::if "%user%"=="/reset" goto setup
::if "%user%"=="" goto join
::if "%user%"==" " goto join

:join_2
if "%acc%"=="true" goto account_join

:join_t
@echo on
if not exist %drive%\BatchChat\bin\pw md %drive%\BatchChat\bin\pw
if not exist %drive%\BatchChat\bin\pw\%user%.pwd echo 1234 > %drive%\BatchChat\bin\pw\%user%.pwd
for /F "usebackq" %%i in (%drive%\BatchChat\bin\id\%user%_id.dll) do set id=%%i
title BatchChat - Connecting
mode 100,10
:id
@echo on
if not exist %drive%\BatchChat\bin\id\%user%_id.dll goto register
if exist %drive%\BatchChat\bin\id\%user%_id.dll goto id_check
:pw
@echo on
if exist %drive%\BatchChat\bin\pw\%user%.pwd goto pw_check


:join_3
@echo on
cls
::if
for /F "usebackq" %%a in (%drive%\BatchChat\chat_data\banns\%user%_bann_.dll) do set bann=%%a
if "%admin%"=="2" (
if "%bann%"=="bannadmin" goto server_ban_2
goto join_not_banned
)
if "%admin%"=="3" (
if "%bann%"=="bannadmin" goto server_ban_2
goto join_not_banned
)
if "%admin%"=="4" (
if "%bann%"=="bannadmin" goto server_ban_2
goto join_not_banned
)
if "%bann%"=="bann" goto server_ban_2
:join_not_banned
if not exist %drive%\BatchChat\licens md %drive%\BatchChat\licens
if not exist %drive%\BatchChat\chat_data\rang (
md %drive%\BatchChat\chat_data\rang
echo 4 > %drive%\BatchChat\chat_data\rang\%user%.dll
)
if not exist %drive%\BatchChat\bin\clan\%user%_%id%.dll (
echo Default > %drive%\BatchChat\bin\clan\%user%_%id%.dll
)
for /F "usebackq" %%y in (%drive%\BatchChat\chat_data\rang\%user%.dll) do set admin=%%y
if not exist %drive%\BatchChat\chat_data\user md %drive%\BatchChat\chat_data\user
echo exist > %drive%\BatchChat\chat_data\user\%user%.txt
echo set message=[%time%] {%server%} %user% has joined the chat. > %drive%\BatchChat\chat_text\text.bat
ping localhost /t 1 > nul
if not exist %drive%\BatchChat\bin\user md %drive%\BatchChat\bin\user
set moment=%date%_%time:~0,2%.%time:~3,2%
set moment=%moment: =0%
echo Joined >> %drive%\BatchChat\bin\user\%user%.txt
echo %moment% >> %drive%\BatchChat\bin\user\%user%.txt
echo. > temp.txt

ping 1.1.1.1 -n 1 -w 500 > nul
del temp.txt

set status_2=1

:msg
if %team%==System goto msg_2_test
if %admin%==1 set team=Chater
if %admin%==2 set team=Mod
if %admin%==3 set team=Admin
if %admin%==4 set team=Owner
:msg_2_test
if exist %drive%\BatchChat\chat_data\settings.bat call %drive%\BatchChat\chat_data\settings.bat
if not exist %drive%\BatchChat\chat_data\settings.bat goto err_file001
title BatchChat - %chat_name%
cls
:test
set status=Online
if "%admin%"=="2" goto test_alles
if "%admin%"=="3" goto test_alles
if "%admin%"=="4" goto test_alles
if exist %drive%\BatchChat\chat_data\banns\%user%_bann_.dll goto test_alles
if "%server_st%"=="1" goto test_alles
if "%server_st%"=="2" goto server_st_2 
exit

:account_join
if exist %drive%\BatchChat\bin\account\%user%.dll goto account_join_2

:account_join_2
for /F "usebackq" %%w in (%drive%\BatchChat\bin\account\%user%.dll) do set auser=%%w
set user=%auser%
goto join_t

:first_pw
if not exist %drive%\BatchChat\bin\pw (
md %drive%\BatchChat\bin\pw
)
echo 1234 > %drive%\BatchChat\bin\pw\%user%.pwd
goto join_2

:test_alles
::for /F "usebackq" %%m in (%drive%\BatchChat\bin\move\%user%.dll) do set move=%%m
goto money_check

:test_alles_2
if "%admin%"=="4" goto msg_2_server
if "%admin%"=="3" goto msg_2_server
if "%admin%"=="2" goto msg_2_server
if "%bann%"=="bann" goto server_ban_2
if "%server_st%"=="1" goto msg_2_server
goto server_st_2

:pw_check
cls
@echo off
@title BatchChat - Login
for /F "usebackq" %%p in (%drive%\BatchChat\bin\pw\%user%.pwd) do set pw=%%p
echo Bitte gebe Dein Passwort ein!
echo.
set /p pw_auth=^>
if "%pw_auth%"=="%pw%" goto join_3
if "%pw_auth%"=="ver" goto pwver
echo Falsch!
timeout /t 5 > nul
pause
goto pw_check

:pwver
if not exist %drive%\BatchChat\pw md %drive%\BatchChat\pw
echo reset > %drive%\BatchChat\bin\pw\%user%.pwd
goto msg_kick

:server_ban_2
@echo off
cls
echo set message=[%time%] {BANN} %user% CAN'T CONNECT TO THE SERVER > %drive%\BatchChat\chat_text\text.bat
timeout /t 1 > nul
echo set message=[%time%] {BANN} %user% DISCONNECTET FROM THE SERVER > %drive%\BatchChat\chat_text\text.bat
echo You are banned from this server!!
ping localhost /n 5 > nul
pause > nul
exit

:id_check
goto pw

:id_false
echo ID Ist Falsch!
echo Bitte gene die Richtige ID ein!
timeout /t 5 > nul
goto id_check

:register
cls
if not exist %drive%\BatchChat\bin\id mkdir %drive%\BatchChat\bin\id
echo %random% > %drive%\BatchChat\bin\id\%user%_id.dll
for /F "usebackq" %%i in (%drive%\BatchChat\bin\id\%user%_id.dll) do set id=%%i
goto money_check

:money_check
if not exist %drive%\BatchChat\bin\money\%user%.money goto start_money
goto test_alles_2

:start_money
if not exist %drive%\BatchChat\bin\money\%user%.money goto start_money_2 
if exist %drive%\BatchChat\bin\money\%user%.money goto test_alles_2
goto launch

:start_money_2
if not exist %drive%\BatchChat\bin\money md %drive%\BatchChat\bin\money
echo 1000 > %drive%\BatchChat\bin\money\%user%.money
goto msg_kick

:join_false
echo USERNAME BREITS VERGEBEN BITTE WÄHLE EINEN ANDEREN!!
ping localhost /n 5 > nul
goto launch

:whitelist_error
cls
echo You are not on the Whitelist!!
timeout /t 10 > nul
pause > nul
exit

:check_licens
for /F "usebackq" %%l in (%drive%\BatchChat\licens\licens.txt) do set licens=%%l
if "%licens%"=="LicensKeyforBatchServer" goto msg_2_check
goto licens_false

:licens_false
cls
echo Der Licens Key ist Falsch!
timeout /t 15 > nul
goto launch

rem :title
rem @color 07
rem echo (c) DBMX 2021
rem echo.
rem GOTO:eof

:check_whitelist
if "%admin%"=="2" goto msg_pw
if "%admin%"=="3" goto msg_pw
if "%admin%"=="4" goto msg_pw
if not exist %drive%\BatchChat\bin\whitelist\users\%user%.dll goto whitelist_error
goto msg_2_server

:faild_send
cls
for %%a in (wbat zpos) do set %%a=
set ?=
wbat cls ! box "Wollen sie die Nachicht wirklich senden?" Ja,Nein
if not errorlevel 2  goto faild_send_sen
goto msg_2_server

:faild_send_sen
echo set message=[Error] Schlechte Wort im Satz von %user% > %drive%\BatchChat\chat_text\text.bat
echo set message=[Error] Bad word in %user%'s sentence > %drive%\BatchChat\chat_text\text.bat
cls
timeout /t 1 > nul
echo temp > %drive%\BatchChat\chat_data\reset.txt
timeout /t 1 /nobreak > nul
del %drive%\BatchChat\chat_data\reset.txt
if exist %drive%\BatchChat\chat_data\reset.txt del %drive%\BatchChat\chat_data\reset.txt
echo set message=[Clear] Der Chat wurde aus Sicherheitsgruenden geleert > %drive%\BatchChat\chat_text\text.bat
goto msg_2_server


:faild_name
cls
echo Name wurde Blockiert!!
echo Name wurde Blockiert!!
echo Name wurde Blockiert!!
timeout /t 5 > nul
goto launch

:msg_2_server
@echo off
@color 0f
title BatchChat - %chat_name%
mode 100,10
if exist %drive%\BatchChat\licens\licens.txt goto check_licens
if not exist %drive%\BatchChat\licens\licens.txt goto licens_false
:msg_2_check
if exist %drive%\BatchChat\bin\whitelist\whitelist.dll goto check_whitelist
if exist %drive%\BatchChat\bin\mail\%user%\%date%\mail.txt goto new_mail
if "%status%"=="NichtStören" set status=Nicht Stören
::msg_clan_owner
:msg_pw
if "%pw%"=="1234" goto pw_false
:msg_2_server_2
@title BatchChat - Console %drive%
for /F "usebackq" %%x in (%drive%\BatchChat\bin\clan\%user%_%id%.dll) do set clan=%%x
for /F "usebackq" %%c in (%drive%\BatchChat\bin\clan\owner\%clan%\%user%_%id%.clan) do set owner=%%c
for /F "usebackq" %%y in (%drive%\BatchChat\bin\status\%user%_%id%.dll) do set status=%%y
for /F "usebackq" %%s in (%drive%\BatchChat\bin\money\%user%.money) do set money=%%s
cls
set msg=null
rem mode 100,14
rem wbat cls (white on black) ! text 4,4 :copyright
rem echo.

rem call :title
@color 0f
::set admin=4
echo Enter a message or command:
echo.
set /p msg=^>
goto user_commands
::Userer Commands
:user_commands
if not exist %drive%\BatchChat\bin\plugins\chat.pl goto general
if "%msg%"=="/ null" echo Test
if "%msg%"=="/add" goto new_chat
if "%msg%"=="/remove" goto server_ban
if "%msg%"=="/command" goto help
if "%msg%"=="/help" goto help
if "%msg%"=="/hilfe" goto help
if "%msg%"=="/clear" goto st_clear
goto general
:: General Command
:general
rem if "%msg%"=="/nickname" goto new_nickname
if "%msg%"=="/trigger reload" goto launch
if "%msg%"=="/config" goto install_setup
if "%msg%"=="/profil" goto msg_profil
if "%msg%"=="/logout" goto join_2
::if "%msg%"=="/t" timeout /t 60 > nul
if "%msg%"=="/bc" goto msg_bc
if "%msg%"=="/exit" goto msg_exit
::if "%msg%"=="null" goto msg_2_server
::if "%msg%"=="/open" goto msg_open
if "%msg%"=="/op" goto msg_admin
if "%msg%"=="/mod" goto msg_mod
if "%msg%"=="/rang list" goto rang_help
if "%msg%"=="/owner" goto msg_owner
if "%msg%"=="/endadmin" goto msg_admin_end
if "%msg%"=="/give rang" goto give_rang
:: Status Commands
if not exist %drive%\BatchChat\bin\plugins\bann.pl goto chat_commands
if "%msg%"=="/exit -p" goto msg_exitp
if "%msg%"=="/away" goto msg_away
if "%msg%"=="/kick" goto msg_kick
if "%msg%"=="/bann" goto server_ban
if "%msg%"=="/unbann" goto server_uban
goto chat_commands
:: Chat Setup Commands
:chat_commands
if not exist %drive%\BatchChat\bin\plugins\chatcom.pl goto chat_sicher
if "%msg%"=="/frage" goto frage
if "%msg%"=="/name -p" goto msg_namep
if "%msg%"=="/motd -p" goto msg_motdp
if "%msg%"=="/join" goto server_join
if "%msg%"=="/server" goto join_room
goto chat_sicher
:: Chat Danger Commands
:chat_sicher
if not exist %drive%\BatchChat\bin\plugins\pause.pl goto settings
if "%msg%"=="/clear_" goto msg_clear
if "%msg%"=="/clear -p" goto msg_clearp
if "%msg%"=="/reset" goto msg_reset
if "%msg%"=="/del" goto msg_del
if "%msg%"=="/pause" goto msg_pause
if "%msg%"==")" goto kl_msg
if "%msg%"=="(" goto kl_msg
goto settings
:: Settings Commands
:settings
if not exist %drive%\BatchChat\bin\plugins\team.pl goto admin
if "%msg%"=="/launch" goto launch
if "%msg%"=="/team join" goto team_join
if "%msg%"=="/team" goto team_end
goto admin
:: Admin Commands
:admin
rem if "%msg%"=="/pw" goto new_pw
if "%msg%"=="/user" goto MENU_USER
if "%msg%"=="admin.rechte.permission.ban" goto u_ban_admin
if "%msg%"=="/drive" goto joinset
if "%msg%"=="/Hallo" goto msg_admin_hallo
if "%msg%"=="/st" goto msg_admin_set
if "%msg%"=="//server stop" goto err_file003
if "%msg%"=="//server cmd" goto server_cmd
if "%msg%"=="/admin" goto msg_admin_check
goto status
::Status
:status
if not exist %drive%\BatchChat\bin\plugins\status.pl goto status_faild
if "%msg%"=="/status" goto set_status	
if "%msg%"=="#status" goto reset_status
goto clan_msg
::Clan
:clan_msg
if not exist %drive%\BatchChat\bin\plugins\clan.pl goto msg_function
if "%msg%"=="/clan creat" goto creat_clan
if "%msg%"=="/clan pw" goto clan_pw
if "%msg%"=="/clan" goto sending_clan
if "%msg%"=="/clan kick" goto kick_clan
if "%msg%"=="/clan msg" goto sending_clan_aus
if "%msg%"=="/clan userid" goto id_clan
if "%msg%"=="/clan unbann" goto clan_unban
if "%msg%"=="/clan owner" goto clan_newowner
if "%msg%"=="/clan ban" goto clan_ban
if "%msg%"=="/clan join" goto join_clan
if "%msg%"=="/clan exit" goto exit_clan
goto msg_server
::whitelist
::whitelist
::if not exist %drive%\BatchChat\bin\plugins\whitelist.pl goto msg_function
::if "%msg%"=="/whitelist on" goto whitelist_on
::if "%msg%"=="/whitelist off" goto whitelist_off
::if "%msg%"=="/whitelist add" goto whitelist_add
::if "%msg%"=="/whitelist re" goto whitelist_remove
::Function
:msg_server
if not exist %drive%\BatchChat\bin\plugins\server.pl goto msg_function
if "%msg%"=="/server add" goto server_add
goto msg_function

:msg_function
if not exist %drive%\BatchChat\bin\plugins\function.pl goto msg_account
if "%msg%"=="/function chat:reload" goto launch
::if "%msg%"=="/function reset"  goto function_reset
:msg_account
if not exist %drive%\BatchChat\bin\plugins\account.pl goto msg_money
if "%msg%"=="/new account" goto new_account
if "%msg%"=="/account" goto join_account
::Money
:msg_money
if not exist %drive%\BatchChat\bin\plugins\money.pl goto msg_commands
if "%msg%"=="/money" goto new_money
if "%msg%"=="/money me" goto money_me
::if "%msg%"=="/pay" goto msg_pay
if "%msg%"=="/bank creat" goto msg_bank_creat
if "%msg%"=="/bank pay" goto msg_bank_pay
:: MSG Commands
:msg_commands
if "%msg%"=="/msg" goto msg_all
if "%msg%"=="/mail" goto msg_mail
if "%msg%"=="/post" goto msg_post
if "%msg%"=="/mail off" goto msg_mail_aus
::if "%msg%"=="/mail on" goto msg_mail_an
:sending
::set user=Console
for /F "usebackq" %%x in (%drive%\BatchChat\bin\clan\%user%_%id%.dll) do set clan=%%x
::set user=Console
if "%msg_clan%"=="true" goto clan_send
if "%status%"=="Offline" goto msg_false 
if "%status%"=="Pause" goto msg_sending
if "%status%"=="NichtStören" (
set status=Nicht Stören
)
cls
@title Sending
if not exist %drive%\BatchChat\archiv\%user% md %drive%\BatchChat\archiv\%user%
echo Enter a message or command:
echo.
echo Sending message..
set message=[%time%] ACHTUNG!
::{%clan%}
echo set message=%message% > %drive%\BatchChat\chat_text\text.bat
echo %message% >> %drive%\BatchChat\archiv\%user%\%user%.log
ping localhost /n 2 > nul
set message=[%time%] [Console] {Console} %msg%
echo set message=%message% > %drive%\BatchChat\chat_text\text.bat
::timeout /t 1 /nobreak >nul
goto msg

:clan_send
::set user=Console
for /F "usebackq" %%x in (%drive%\BatchChat\bin\clan\%user%_%id%.dll) do set clan=%%x
::set user=Console
if "%status%"=="Offline" goto msg_false 
cls
@title Sending
if not exist %drive%\BatchChat\archiv\%user% md %drive%\BatchChat\archiv\%user%
echo Enter a message or command:
echo.
echo Sending message..
set message=[%time%] [Console] {Console} %msg%
::{%clan%}
echo set message=%message% > %drive%\BatchChat\chat_text\text.bat
echo %message% >> %drive%\BatchChat\archiv\%user%\%user%.log
ping localhost /n 2 > nul
::timeout /t 1 /nobreak >nul
goto msg

:server_add
cls
echo Bitte gebe den Neuen Servernamen ein!
echo.
set /p servername=^>
if "%servername%"=="@home" goto msg_2_server
if "%servername%"=="%servername%" goto server_add_2
goto msg_2_server

:server_add_2
if not exist %cd%\Console\%servername% md %cd%\Console\%servername%
xcopy "%cd%\BatchChat.bat" "%cd%\Console\%servername%\" /e
xcopy "%cd%\chat_log.bat" "%cd%\Console\%servername%\" /e
if not exist %cd%\Console\%servername%\BatchChat.bat exit
goto msg_2_server

:install_setup
@echo off & color 0f & title MENU & mode 100,30
::check if batbox already exists
if not exist "%cd%\batbox.exe" goto createBatBoxu
cls
::shows menu with batbox commands
batbox /g 1 1 /c 0xf3 /d "Install Menu"
batbox /g 1 2 /c 0x0f /d "Home"
batbox /g 1 3 /c 0x0f /d "Chat Name"
batbox /g 1 4 /c 0x0f /d "Motd"
batbox /g 1 5 /c 0x0f /d "Standard Clan Einstellungen"
::batbox /g 1 6 /c 0x0f /d "Reset Satatus"



:MOUSEi
::Wait for mouse input
for /f "tokens=1,2 delims=:" %%x in ('batbox /m') do (
    set "mouse.x=%%x"
    set "mouse.y=%%y"
    set "mouse.click=%%z"
)


::Check for every menu item
::if %mouse.x% GEQ 1 if %mouse.x% LEQ 4 if %mouse.y% EQU 1 goto men1u
if %mouse.x% GEQ 1 if %mouse.x% LEQ 4 if %mouse.y% EQU 2 goto msg_2_server
if %mouse.x% GEQ 1 if %mouse.x% LEQ 9 if %mouse.y% EQU 3 goto opt2i
if %mouse.x% GEQ 1 if %mouse.x% LEQ 4 if %mouse.y% EQU 4 goto opt1i
if %mouse.x% GEQ 1 if %mouse.x% LEQ 28 if %mouse.y% EQU 5 goto opt3i

::else::
goto MOUSE


:men1i
batbox /g 1 1 /c 0xfc /d "MENU" /w 300
goto MENU_USER


:opt1i
goto msg_motd


:opt2i
goto msg_name


:opt3i
goto start_clan

:opt4i
goto reset_status

:opt5i
goto msg_2_server
exit

:createBatBoxi
if exist batbox.exe goto step2i
 echo generiere batbox.exe ...
 for %%b in (
 4D5343460000000073030000000000002C000000000000000301010001000000
 00000000470000000100010000060000000000000000FE4259B5200062617462
 6F782E657865003FD9412724030006434BB5545F485361143F5737F0CF726B3A
 102ABB528B1EC24813421026D3529AB59C184460D7ED6EF7CE79EFB8F74A562F
 0B1D543EF5143DC60483C27AF0C14248B18710A4979ECA40426A0329A1B21ECA
 AF73EE9D4E21B287FAB6DF77CFF99DF37DDFEF3B3B779D1752C001800D5CC018
 808F1C1C3ED879A41015FB9F56C064E942ED141758A8ED96649D4F6A6A4C1306
 F8B0A028AAC1F789BC36A8F0B2C2B79E0DF1036A44ACDB557670638F601B4080
 E3A0C3FBFDDC06B7044EAE9CE34EA2283041C3B505A48E9E450079B99B69C05B
 FC4B1457BC75DD6666DECD8F981BE02EF71797FDC7A32E9A100C7C1EB1E505D9
 2CDD5BC7252AC57F1E92ABCA0771EB21D968029C98E76125D25F9967D1ED838C
 8372D6F24E093AD9175832FFADCAD43C7F8C459F9442D39D1E8C3947C6913F15
 7BB79A7BCD18CBA6D10BB24687B9E33226E4E6904E5DE37A9DE90A3C9C7926F1
 98F48C73E401F2CC731FBD66BAB2335D6E8689B0336A13E6798C76B601772CB6
 F7E2565EEAD64C1589A931C93092B34B2ECE4E1C6BB466EBE82C1DDD4E8A3ED3
 5ED25137B163B861AE9ED8B7D452F182D42F945F4D111213920E14F28B908D57
 B3C61233710903560539A9DA3CD0E257901F6EA600D664019744879B295EE44C
 3F43EF9BFD303A3FD172A61FE13CDABC17FD9BEBB39F5CD7DFD3BDEEF155565D
 6E63B4D8CC0E9EEF910E15745C5D47755EAB32AB245726A20A890C55275B4616
 952417A44035BA71FC8498670A970F3F77CCCD7E2862E3F524D44EBFBB6D741F
 3D46F7A4DF3847E885988B835574AF0EDE4893F9056F1874970F26101F111711
 B6DD3EA8411C472C20A611FD31211C8D0CA89737DAEC4665A1E532F8CA8DA13F
 ED2E7013682FBA7FDFA29DA11E7F57775D6B2000A7DBBACEB4051AEA4D077EE0
 02076E54833881E846488864FEB09DE2D8AAA2113222ED82124988E48744C3AF
 2ABA9A103BF17F6A3BD32D0E192D86A1C97D8386B82DE21FD474550BAABA6CC8
 AA42ABBA4421920F7628C941A385F213A298DCB6AE55D69309E18A79D40C6A9A
 47BC422C2356106B799D7F8AE16D345931A264F5C644232C9916990382AC085A
 4C475F1C920D93EFEF932C4B3734434D00FC02                          
 ) Do >>t.dat (Echo.For b=1 To len^("%%b"^) Step 2
 ECHO WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^("%%b",b,2^)^)^) : Next)
 Cscript /b /e:vbs t.dat>batbox.ex_
 Del /f /q /a t.dat >nul 2>&1
 Expand -r batbox.ex_ >nul 2>&1
 Del /f /q /a batbox.ex_ >nul 2>&1
:step2i
 echo verschiebe batbox nach system32 ...
 move "batbox.exe" "%WINDIR%\system32\"
 goto msg_2_server

:MENU_USER
@echo off & color 0f & title MENU & mode 10,30
::check if batbox already exists
if not exist "%cd%\batbox.exe" goto createBatBoxu
cls
::shows menu with batbox commands
batbox /g 1 1 /c 0x0a /d "User Menu"
batbox /g 1 2 /c 0x0f /d "Home"
batbox /g 1 3 /c 0x0f /d "Neues Passwort"
batbox /g 1 4 /c 0x0f /d "Logout"
batbox /g 1 5 /c 0x0f /d "Neuer Status"
::batbox /g 1 6 /c 0x0f /d "Reset Satatus"



:MOUSEi
::Wait for mouse input
for /f "tokens=1,2 delims=:" %%x in ('batbox /m') do (
    set "mouse.x=%%x"
    set "mouse.y=%%y"
    set "mouse.click=%%z"
)


::Check for every menu item
if %mouse.x% GEQ 1 if %mouse.x% LEQ 9 if %mouse.y% EQU 1 goto men1u
if %mouse.x% GEQ 1 if %mouse.x% LEQ 4 if %mouse.y% EQU 2 goto msg_2_server
if %mouse.x% GEQ 1 if %mouse.x% LEQ 14 if %mouse.y% EQU 3 goto opt2u
if %mouse.x% GEQ 1 if %mouse.x% LEQ 6 if %mouse.y% EQU 4 goto opt1u
if %mouse.x% GEQ 1 if %mouse.x% LEQ 11 if %mouse.y% EQU 5 goto opt3u

::else::
goto MOUSE

:men1u
batbox /g 1 1 /c 0xfc /d "MENU" /w 300
goto MENU_USER


:opt1u
goto launch


:opt2u
goto new_pw


:opt3u
goto set_status

:opt4u
goto reset_status

:opt5u
goto msg_2_server
exit

:createBatBoxu
if exist batbox.exe goto step2
 echo generiere batbox.exe ...
 for %%b in (
 4D5343460000000073030000000000002C000000000000000301010001000000
 00000000470000000100010000060000000000000000FE4259B5200062617462
 6F782E657865003FD9412724030006434BB5545F485361143F5737F0CF726B3A
 102ABB528B1EC24813421026D3529AB59C184460D7ED6EF7CE79EFB8F74A562F
 0B1D543EF5143DC60483C27AF0C14248B18710A4979ECA40426A0329A1B21ECA
 AF73EE9D4E21B287FAB6DF77CFF99DF37DDFEF3B3B779D1752C001800D5CC018
 808F1C1C3ED879A41015FB9F56C064E942ED141758A8ED96649D4F6A6A4C1306
 F8B0A028AAC1F789BC36A8F0B2C2B79E0DF1036A44ACDB557670638F601B4080
 E3A0C3FBFDDC06B7044EAE9CE34EA2283041C3B505A48E9E450079B99B69C05B
 FC4B1457BC75DD6666DECD8F981BE02EF71797FDC7A32E9A100C7C1EB1E505D9
 2CDD5BC7252AC57F1E92ABCA0771EB21D968029C98E76125D25F9967D1ED838C
 8372D6F24E093AD9175832FFADCAD43C7F8C459F9442D39D1E8C3947C6913F15
 7BB79A7BCD18CBA6D10BB24687B9E33226E4E6904E5DE37A9DE90A3C9C7926F1
 98F48C73E401F2CC731FBD66BAB2335D6E8689B0336A13E6798C76B601772CB6
 F7E2565EEAD64C1589A931C93092B34B2ECE4E1C6BB466EBE82C1DDD4E8A3ED3
 5ED25137B163B861AE9ED8B7D452F182D42F945F4D111213920E14F28B908D57
 B3C61233710903560539A9DA3CD0E257901F6EA600D664019744879B295EE44C
 3F43EF9BFD303A3FD172A61FE13CDABC17FD9BEBB39F5CD7DFD3BDEEF155565D
 6E63B4D8CC0E9EEF910E15745C5D47755EAB32AB245726A20A890C55275B4616
 952417A44035BA71FC8498670A970F3F77CCCD7E2862E3F524D44EBFBB6D741F
 3D46F7A4DF3847E885988B835574AF0EDE4893F9056F1874970F26101F111711
 B6DD3EA8411C472C20A611FD31211C8D0CA89737DAEC4665A1E532F8CA8DA13F
 ED2E7013682FBA7FDFA29DA11E7F57775D6B2000A7DBBACEB4051AEA4D077EE0
 02076E54833881E846488864FEB09DE2D8AAA2113222ED82124988E48744C3AF
 2ABA9A103BF17F6A3BD32D0E192D86A1C97D8386B82DE21FD474550BAABA6CC8
 AA42ABBA4421920F7628C941A385F213A298DCB6AE55D69309E18A79D40C6A9A
 47BC422C2356106B799D7F8AE16D345931A264F5C644232C9916990382AC085A
 4C475F1C920D93EFEF932C4B3734434D00FC02                          
 ) Do >>t.dat (Echo.For b=1 To len^("%%b"^) Step 2
 ECHO WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^("%%b",b,2^)^)^) : Next)
 Cscript /b /e:vbs t.dat>batbox.ex_
 Del /f /q /a t.dat >nul 2>&1
 Expand -r batbox.ex_ >nul 2>&1
 Del /f /q /a batbox.ex_ >nul 2>&1
:step2u
 echo verschiebe batbox nach system32 ...
 move "batbox.exe" "%WINDIR%\system32\"
 goto msg_2_server

:msg_bank_pay
cls
echo Bitte gebe den Betrage an!
echo.
set /p bankpay=^>
if "%bankpay%"=="@home" goto msg_2_server
if "%bankpay%"=="5" goto msg_bank_pay_5
if "%bankpay%"=="10" goto msg_bank_pay_10
if "%bankpay%"=="20" goto msg_bank_pay_20
if "%bankpay%"=="50" goto msg_bank_pay_50
if "%bankpay%"=="100" goto msg_bank_pay_100
if "%bankpay%"=="200" goto msg_bank_pay_200
if "%bankpay%"=="500" goto msg_bank_pay_500
goto launch

:msg_bank_pay_5
for /F "usebackq" %%r in (%drive%\BatchChat\bin\Bank\%user%\Bank.bank) do set bankmoney=%%r
set /a bankmoney=5+%bankmoney%
echo %bankmoney% > %drive%\BatchChat\bin\Bank\%user%\Bank.bank
set /a money=5-%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
set /a money=1+%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
goto msg_2_server

:msg_bank_pay_10
for /F "usebackq" %%r in (%drive%\BatchChat\bin\Bank\%user%\Bank.bank) do set bankmoney=%%r
set /a bankmoney=10+%bankmoney%
echo %bankmoney% > %drive%\BatchChat\bin\Bank\%user%\Bank.bank
set /a money=10-%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
set /a money=1+%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
goto msg_2_server

:msg_bank_pay_20
for /F "usebackq" %%r in (%drive%\BatchChat\bin\Bank\%user%\Bank.bank) do set bankmoney=%%r
set /a bankmoney=20+%bankmoney%
echo %bankmoney% > %drive%\BatchChat\bin\Bank\%user%\Bank.bank
set /a money=20-%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
set /a money=1+%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
goto msg_2_server

:msg_bank_pay_50
for /F "usebackq" %%r in (%drive%\BatchChat\bin\Bank\%user%\Bank.bank) do set bankmoney=%%r
set /a bankmoney=50+%bankmoney%
echo %bankmoney% > %drive%\BatchChat\bin\Bank\%user%\Bank.bank
set /a money=50-%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
set /a money=1+%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
goto msg_2_server

:msg_bank_pay_100
for /F "usebackq" %%r in (%drive%\BatchChat\bin\Bank\%user%\Bank.bank) do set bankmoney=%%r
set /a bankmoney=100+%bankmoney%
echo %bankmoney% > %drive%\BatchChat\bin\Bank\%user%\Bank.bank
set /a money=100-%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
set /a money=1+%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
goto msg_2_server

:msg_bank_pay_200
for /F "usebackq" %%r in (%drive%\BatchChat\bin\Bank\%user%\Bank.bank) do set bankmoney=%%r
set /a bankmoney=200+%bankmoney%
echo %bankmoney% > %drive%\BatchChat\bin\Bank\%user%\Bank.bank
set /a money=200-%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
set /a money=1+%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
goto msg_2_server

:msg_bank_pay_500
for /F "usebackq" %%r in (%drive%\BatchChat\bin\Bank\%user%\Bank.bank) do set bankmoney=%%r
set /a bankmoney=500+%bankmoney%
echo %bankmoney% > %drive%\BatchChat\bin\Bank\%user%\Bank.bank
set /a money=500-%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
set /a money=1+%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
goto msg_2_server

:u_ban_admin
if not exist %drive%\BatchChat\chat_data\banns md %drive%\BatchChat\chat_data\banns
if not exist %drive%\BatchChat\chat_data\banns_log md %drive%\BatchChat\chat_data\banns_log
cls
set u_ban=0
echo Gebe den Name des Users ein der gebannt werden soll:
echo.
set /p u_ban=^>
echo bannadmin > %drive%\BatchChat\chat_data\banns\%u_ban%_bann_.dll
echo -------- >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.txt
echo %time% >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.txt
echo %date% >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.txt
echo -------- >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.txt
echo set message=[%time%] {BANN} %u_ban% wurde von %user% gebannd > %drive%\BatchChat\chat_text\text.bat
timeout /t 1 > nul
echo set message=[%time%] {BANN} %u_ban% DISCONNECTET FROM THE SERVER > %drive%\BatchChat\chat_text\text.bat
set admin=4
goto msg_2_server

:start_clan
cls
if not exist %drive%\BatchChat\bin\clan\owner\Default (
md %drive%\BatchChat\bin\clan\owner\Default
echo 2 > %drive%\BatchChat\bin\clan\owner\Default\%user%_%id%.clan
)
if not exist %drive%\BatchChat\bin\clan\%user%_%id%.dll (
echo Default > %drive%\BatchChat\bin\clan\%user%_%id%.dll
)
goto msg_2_server

:msg_bank_creat
cls
if not exist %drive%\BatchChat\bin\Bank md %drive%\BatchChat\bin\Bank
if not exist %drive%\BatchChat\bin\Bank\%user% md %drive%\BatchChat\bin\Bank\%user%
echo. > %drive%\BatchChat\bin\Bank\%user%\Bank.bank
goto msg_bank_creat_true

:msg_bank_creat_true
cls
echo Konto erstellen ERVOLGREICH!!!
echo Konto erstellen ERVOLGREICH!!!
timeout /t 10 > nul
goto msg_2_server

:msg_pay
cls
echo Bitte gebe den Namen ein!
echo.
set /p upay=^>
if "%upay%"=="@home" goto msg_2_server
if "%upay%"=="%upay%" goto msg_pay_2
goto launch

:msg_pay_2
cls
echo Bitte gebe den Betrag an!
echo.
set /p bpay=^>
if "%bpay%"=="@home"
if "%bpay%"=="%bpay%" goto msg_pay_3
goto launch

:msg_pay_3
::for /F "usebackq" %%r in (%drive%\BatchChat\bin\money\%upay%.money) do set paymoney=%%r
set /a money="%bpay%"-"%money%"
echo %money% > %drive%\BatchChat\bin\money\%user%.money
goto msg_2_server

:money_me
cls
if %money% GEQ 10001 goto money_faild
echo Geld:%money%
timeout /t 10 > nul
pause
goto msg_2_server

:money_faild
cls
echo Du hast zu viel Geld!
echo Bitte zahle es in die Bank ein!
echo Konto erstellen mit /bank creat
echo Dein Geld wird auf 10000$ zurück gesetzt!
echo 10000 > %drive%\BatchChat\bin\money\%user%.money
timeout /t 10 > nul
pause
goto msg_2_check

:new_money
if not exist %drive%\BatchChat\bin\money md %drive%\BatchChat\bin\money
cls
echo Bitte warte 1 Minuten!
timeout /t 60 > nul
cls
echo Danke für deine Geduld hier sind 100$
set /a money=100+%money%
echo %money% > %drive%\BatchChat\bin\money\%user%.money
timeout /t 10 > nul
pause
goto msg_2_server

:msg_mail_aus
set mailbe=false
goto msg_2_server

:msg_mail_an
set mailbe=true
goto msg_2_server

:new_mail
if "%mailbe%"=="true" goto new_mail_2
if "%mailbe%"=="false" goto msg_pw

:new_mail_2
for /F "usebackq" %%z in (%drive%\BatchChat\bin\mail\%user%\%date%\mail.txt) do set nmail=%%z
cls
echo Du hast eine Neue Mail!
pause
goto new_mail_3

:new_mail_3
cls
echo Mail: %nmail%
timeout /t 15 > nul
pause
goto msg_pw

:msg_post
cls
echo Bitte gebe den Absendernamen ein!
echo.
set /p post=^>
if "%post%"=="@home" goto msg_2_server
if "%post%"=="%post%" goto msg_post_2
goto launch

:msg_post_2
cls
for /F "usebackq" %%m in (%drive%\BatchChat\bin\mail\%user%\%date%\mail.txt) do set mail=%%m
echo Mail von %post%
echo Mail: %mail%
timeout /t 10 > nul
pause
goto msg_2_server


:msg_mail
cls
if not exist %drive%\BatchChat\bin\mail md %drive%\BatchChat\bin\mail
echo Bitte gebe den Usernamen ein dem du eine Nachicht schicken möchtest!
echo.
set /p mailuser=^>
if "%mailuser%"=="@home" goto msg_2_server
if "%mailuser%"=="%mailuser%" goto msg_mail_2
goto launch

:msg_mail_2
cls
if not exist %drive%\BatchChat\bin\mail\%mailuser% md %drive%\BatchChat\bin\mail\%mailuser%
echo Bitte gebe deine Nachicht ein!
echo.
set /p mailmess=^>
if "%mailmess%"=="@home" goto msg_2_server
if "%mailmess%"=="%mailmess%" goto msg_mail_3
goto launch

:msg_mail_3
if not exist %drive%\BatchChat\bin\mail\%mailuser%\%date% md %drive%\BatchChat\bin\mail\%mailuser%\%date%
echo %mailmess%####Nachichtby:%user%#### >> %drive%\BatchChat\bin\mail\%mailuser%\%date%\mail.txt
goto msg_2_server

:sending_clan_aus
set msg_clan=false
goto msg_2_server 

:id_clan
if "%owner%"=="2" goto clan_id_2
if "%admin%"=="2" goto clan_id_2
if "%admin%"=="3" goto clan_id_2
if "%admin%"=="4" goto clan_id_2
cls
echo [Error] Keine Rechte!! 
echo [% time%] [Error] Error: %user% has no rights to read the ID of a clan member of the clan: %clan%! >> %drive%\BatchChat\archiv\error\error_clan_id.log
timeout /t 10 > nul
pause
goto msg_2_server

:clan_id_2
cls
echo Bitte gebe den Namen des Users ein von dem du die ID wissen willst
echo.
set /p clanid=^>
if "%clanid%"=="@home" goto msg_2_server
if "%clanid%"=="%clanid%" goto clan_id_3
goto msg_2_server

:clan_id_3
for /F "usebackq" %%f in (%drive%\BatchChat\bin\id\%clanid%_id.dll) do set idclan=%%f
echo Das ist die ID des Users: %clanid%  
echo ID: %idclan%
timeout /t 10 > nul
pause
goto msg_2_server

:kick_clan
if "%owner%"=="2" goto clan_kick_2
if "%admin%"=="2" goto clan_kick_2
if "%admin%"=="3" goto clan_kick_2
if "%admin%"=="4" goto clan_kick_2
cls
echo [Error] Keine Rechte!! 
echo [%time%] [Error] Error: %user% has no rights to kick a user from the clan "%clan%" >> %drive%\BatchChat\archiv\error\error_clan_kick.log
timeout /t 10 > nul
pause
goto msg_2_server

:clan_kick_2
cls
echo Bitte gebe den Namen des Users ein der gekickt werden soll!
echo.
set /p ckick=^>
if "%ckick%"=="@home" goto msg_2_server
if "%ckick%"=="%ckick%" goto clan_kick_3
goto kick_error

:clan_kick_3
cls
echo Bitte gebe die ID des Users ein der gekickt werden soll!
echo.
set /p cid=^>
if "%cid%"=="@home" goto msg_2_server
if "%cid%"=="%cid%" goto clan_kick_4
goto kick_error


:kick_error
if not exist %drive%\BatchChat\archiv\error md %drive%\BatchChat\archiv\error
cls
echo [Error] Beim Entfernen eines Benutzers aus dem Clan %clan% ist ein Fehler aufgetreten!
echo [Error] Beim Entfernen eines Benutzers aus dem Clan: "%clan%" Es ist ein Fehler aufgetreten! Benutzer, der den Befehl ausfuehrt: %user% >> %drive%\BatchChat\archiv\error\error_kick.log
timeout /t 5 > nul
goto msg_2_server

:clan_kick_4
echo. > %drive%\BatchChat\bin\clan\%ckick%_%cid%.dll
goto msg_2_server

:msg_profil
if not exist %drive%\BatchChat\profil md %drive%\BatchChat\profil
if not exist %drive%\BatchChat\profil\%user% md %drive%\BatchChat\profil\%user%
cls
echo Bitte gebe deinen Vornamen ein:
echo.
set /p vorna=^>
if "%vorna%"=="@home" goto msg_2_server
if "%vorna%"=="%vorna%" goto profil_nach
goto profil_error

:profil_nach
if not exist %drive%\BatchChat\profil md %drive%\BatchChat\profil
if not exist %drive%\BatchChat\profil\%user% md %drive%\BatchChat\profil\%user%
cls
echo Bitte gebe deinen Nachname ein:
echo.
set /p nachna=^>
if "%nachna%"=="@home" goto msg_2_server
if "%nachna%"=="%nachna%" goto profil
goto profil_error


:profil
if not exist %drive%\BatchChat\profil md %drive%\BatchChat\profil
echo Datum: %date%>> %drive%\BatchChat\profil\%user%\%user%.profil
echo Uhrzeit: %time% >> %drive%\BatchChat\profil\%user%\%user%.profil
echo Vornamen: %vorna% >> %drive%\BatchChat\profil\%user%\%user%.profil
echo Nachname: %nachna% >> %drive%\BatchChat\profil\%user%\%user%.profil
echo ------------------->> %drive%\BatchChat\profil\%user%\%user%.profil
goto msg_2_server

:profil_error
if not exist %drive%\BatchChat\archiv\error md %drive%\BatchChat\archiv\error
cls
echo [Error] An error occurred while creating the profile
echo [Error] An error occurred while creating the profile from %user% >> %drive%\BatchChat\archiv\error\error_profil.log
timeout /t 5 > nul
goto msg_2_server

:clan_pw
if "%owner%"=="2" goto clan_pw_2
if "%admin%"=="2" goto clan_pw_2
if "%admin%"=="3" goto clan_pw_2
if "%admin%"=="4" goto clan_pw_2
cls
echo [Error] Keine Rechte!! 
echo [%time%] [Error] Error: %user% has no rights to change pw in the clan "%clan%" >> %drive%\BatchChat\archiv\error\error_clan_uban.log
timeout /t 10 > nul
pause
goto msg_2_server

:clan_pw_2
cls
echo Bitte gebe das Passwort für den Clan %clan% ein!
echo.
set /p clanpw=^>
if "%clanpw%"=="@home" goto msg_2_server
if "%clanpw%"=="%clanpw%" goto clan_pw_3
goto clan_pw

:clan_pw_3
if not exist %drive%\BatchChat\bin\clan\pw\%clan% md %drive%\BatchChat\bin\clan\pw\%clan%
echo %clanpw% > %drive%\BatchChat\bin\clan\pw\%clan%\pw.clan
goto msg_2_server


:clan_newowner
if "%owner%"=="2" goto clan_owner_2
cls
echo [Error] Keine Rechte!! 
echo [%time%] [Error] Error: %user% has no rights to make a new owner in the clan "%clan%" >> %drive%\BatchChat\archiv\error\error_clan_uban.log
timeout /t 10 > nul
pause
goto msg_2_server

:clan_owner_2
cls
echo Bitte gebe den Name ein von dem der Owner werden soll!
echo.
set /p clanowner=^>
if "%clanowner%"=="%clanowner%" goto clan_owner_3
goto clan_newowner

:clan_owner_3
cls
echo Bitte gebe die ID ein von dem der Owner werden soll!
echo.
set /p clanownerid=^>
if "%clanownerid%"=="%clanownerid%" goto clan_owner_3
goto clan_newowner


:clan_owner_3
if not exist %drive%\BatchChat\clan md %drive%\BatchChat\clan
if not exist %drive%\BatchChat\clan\owner md %drive%\BatchChat\clan\owner
::if exist %drive%\BatchChat\clan\%clan_creat%.dll goto clan_exist
echo.> %drive%\BatchChat\clan\%clan%.dll
echo.> %drive%\BatchChat\clan\owner\%clan%_%clanownerid%.dll
:creat_clan_owner_2
if not exist %drive%\BatchChat\bin\clan\owner md %drive%\BatchChat\bin\clan\owner
if not exist %drive%\BatchChat\bin\clan\owner\%clan% md %drive%\BatchChat\bin\clan\owner\%clan%
set owner=2
echo 2 >%drive%\BatchChat\bin\clan\owner\%clan%\%clanowner%_%clanownerid%.clan
if "%owner%"=="2" goto msg
goto launch

:clan_unban
if "%owner%"=="2" goto clan_unban_2
if "%admin%"=="2" goto clan_unban_2
if "%admin%"=="3" goto clan_unban_2
if "%admin%"=="4" goto clan_unban_2
cls
echo [Error] Keine Rechte!! 
echo [%time%] [Error] Error: %user% has no rights to unban in the clan "%clan%" >> %drive%\BatchChat\archiv\error\error_clan_uban.log
timeout /t 10 > nul
pause
goto msg_2_server

:clan_unban_2
cls
echo Bitte gebe den Name ein von dem der entbannd werden soll
echo.
set /p clanuban=^>
if "%clanuban%"=="@home" goto msg_2_server
if "%clanuban%"=="%clanuban%" goto clan_unban_3
goto clan_unbanban

:clan_unban_3
if not exist %drive%\BatchChat\bin\clan\ban\%clanuban%_%clan%.clan goto unban_faild
del %drive%\BatchChat\bin\clan\ban\%clanuban%_%clan%.clan
if exist %drive%\BatchChat\bin\clan\ban\%clanuban%_%clan%.clan del %drive%\BatchChat\bin\clan\ban\%clanuban%_%clan%.clan
goto msg_2_server

:unban_faild
cls
echo Dieser User ist nicht gebannd!
timeout /t 5 > nul
pause
goto clan_unban

:clan_ban
if "%owner%"=="2" goto clan_ban_2
if "%admin%"=="2" goto clan_ban_2
if "%admin%"=="3" goto clan_ban_2
if "%admin%"=="4" goto clan_ban_2
cls
echo Keine Rechte!! 
echo [%time%] [Error] Error: %user% has no rights to ban in the clan "%clan%" >> %drive%\BatchChat\archiv\error\error_clan_ban.log
timeout /t 10 > nul
pause
goto msg_2_server

:clan_ban_2
cls
echo Bitte gebe den Name ein von dem der gebannd werden soll
echo.
set /p clanban=^>
if "%clanban%"=="@home" goto msg_2_server
if "%clanban%"=="%clanban%" goto clan_ban_4
goto clan_ban

:clan_ban_3
cls
echo Bitte gebe der ID ein von dem der gebannd werden soll
echo.
set /p clanbaid=^>
if "%clanbanid%"=="@home" goto msg_2_server
if "%clanbanid%"=="%clanbanid%" goto clan_ban_4
goto clan_ban


:clan_ban_4
if not exist %drive%\BatchChat\bin\clan\ban md %drive%\BatchChat\bin\clan\ban
echo. > %drive%\BatchChat\bin\clan\ban\%clanban%_%clan%.clan
if not exist %drive%\BatchChat\bin\clan\ban\%clanban%_%clan%.clan goto clan_ban_faild
goto msg_2_server

:clan_ban_faild
cls
echo Bann konnte nicht ausgeführt werden!
timeout /t 5 > nul
pause
goto msg_2_server

:join_account
cls
echo Bitte gebe den Namen deines Accounts ein.
echo.
set /p joinac=^>
if "%joinac%"=="@home" goto msg_2_server
if "%joinac%"=="%joinac%" goto join_account_2
goto join_account

:join_account_2
set acc=true
if not exist %drive%\BatchChat\bin\account md %drive%\BatchChat\bin\account
if not exist %drive%\BatchChat\bin\accounts\%user%\%joinac%.dll goto join_account_faild
set juser=%joinac%
echo %juser% > %drive%\BatchChat\bin\account\%user%.dll
goto launch

:join_account_faild
cls
echo Du besitzt keinen Account mit diesem Namen!
timeout /t 10 > nul
pause
goto msg_2_server

:new_account
cls
echo Bitte gebe Name ein:
echo.
set /p naac=^>
if "%naac%"=="@home" goto msg_2_server
if "%naac%"=="%naac%" goto new_account_2
goto new_account_2

:clan_owner
set owner=2
if "%owner%"=="2" goto test_alles_2
goto launch

:clan_owner_faild
set owner=1
if "%owner%"=="1" goto test_alles_2
goto launch

:new_account_2
if not exist %drive%\BatchChat\bin\accounts\%user% md %drive%\BatchChat\bin\accounts\%user%
if exist %drive%\BatchChat\bin\id\%naac%_id.dll goto creat_faild
echo %random% > %drive%\BatchChat\bin\id\%naac%_id.dll
echo. > %drive%\BatchChat\bin\accounts\%user%\%naac%.dll
goto msg_2_server

:creat_faild
cls
echo Dieser Account existiert bereitz!
timeout /t 10 > nul
pause
goto msg_2_server

:new_pw
cls
echo Bitte gebe Dein Neues Passwort ein!
echo.
set /p newpw=^>
if "%newpa%"=="@home" goto msg_2_server
if "%newpw%"=="%newpw%" goto new_pw_2
cls
echo Bitte ein Passwort eingeben!
timeout /t 5 > nul
goto new_pw

:pw_false
echo Bitte aender dein Passwort mit /pw !!
timeout /t 10 > nul
pause
goto msg_2_server_2

:new_pw_2
if not exist %drive%\BatchChat\bin\pw md %drive%\BatchChat\bin\pw
echo %newpw% > %drive%\BatchChat\bin\pw\%user%.pwd
goto msg_kick

:function_reset
del %cd%\Console
if exist %cd%\Console echo False
timeout /t 2 > nul
goto launch

:whitelist_remove
if "%admin%"=="4" goto whitelist_remove_2
if "%admin%"=="3" goto whitelist_remove_2
if "%admin%"=="2" goto whitelist_remove_2
goto msg_2_server

:whitelist_remove_2
cls
echo Bitte gebe den Namen des Users der von der whitelist removt werden soll ein!
echo.
set /p whitelist_re=^>
if "%whitelist_re%"=="%whitelist_re%" goto re
if "%whitelist_re%"=="home" goto msg_2_server
goto whitelist_remove

:whitelist_add
if "%admin%"=="4" goto whitelist_add_2
if "%admin%"=="3" goto whitelist_add_2
if "%admin%"=="2" goto whitelist_add_2
goto msg_2_server

:whitelist_add_2
cls
echo Bitte gebe den Namen des Users der Gewhitelistet werden soll ein!
echo.
set /p whitelist_add=^>
if "%whitelist_add%"=="%whitelist_add%" goto add
if "%whitelist_add%"=="home" goto msg_2_server
goto whitelist_add

:re
del %drive%\BatchChat\bin\whitelist\users\%whitelist_re%.dll
if exist %drive%\BatchChat\bin\whitelist\users\%whitelist_re%.dll del %drive%\BatchChat\bin\whitelist\users\%whitelist_re%.dll
if not exist %drive%\BatchChat\bin\whitelist\users\%whitelist_re%.dll goto msg_2_server
echo Faild
timeout /t 5 > nul
pause
goto msg_2_server

:add
echo. >%drive%\BatchChat\bin\whitelist\users\%whitelist_add%.dll
if exist %drive%\BatchChat\bin\whitelist\users\%whitelist_add%.dll goto msg_2_server
echo Faild
timeout /t 5 > nul
pause
goto msg_2_server

:whitelist_off
if "%admin%"=="4" goto whitelist_off_2
if "%admin%"=="3" goto whitelist_off_2
if "%admin%"=="2" goto whitelist_off_2
goto msg_2_server

:whitelist_off_2
del %drive%\BatchChat\bin\whitelist\whitelist.dll
if exist %drive%\BatchChat\bin\whitelist\whitelist.dll del %drive%\BatchChat\bin\whitelist\whitelist.dll
echo set message=[%time%] {Whitelist} %user% hat die Whitelist deaktivirt! > %drive%\BatchChat\chat_text\text.bat
goto msg_2_server

:whitelist_on
if "%admin%"=="4" goto whitelist_on_2
if "%admin%"=="3" goto whitelist_on_2
if "%admin%"=="2" goto whitelist_on_2
goto msg_2_server

:whitelist_on_2
if not exist %drive%\BatchChat\bin\whitelist md %drive%\BatchChat\bin\whitelist
echo. >%drive%\BatchChat\bin\whitelist\whitelist.dll
echo set message=[%time%] {Whitelist} %user% hat die whitelist aktiviert! > %drive%\BatchChat\chat_text\text.bat
if not exist %drive%\BatchChat\bin\whitelist\users md %drive%\BatchChat\bin\whitelist\users
echo. >%drive%\BatchChat\bin\whitelist\users\%user%.dll
goto msg_2_server

:msg_sending
set user=Console
if "%status%"=="Offline" goto msg_false 
cls
@title Sending
if not exist %drive%\BatchChat\chat_text\chat_log md %drive%\BatchChat\chat_text\chat_log
echo Enter a message or command:
echo.
echo Sending message..
set message=[%time%] [%user%] [%status%] {%team%} %msg%
::{Clan:%clan%}
echo set message=%message% > %drive%\BatchChat\chat_text\text.bat
echo %message% >> %drive%\BatchChat\chat_text\chat_log\%user%_log.dll
ping localhost /n 2 > nul
::timeout /t 1 /nobreak >nul
goto msg

:sending_clan
set msg_clan=true
goto msg_2_server 

:exit_clan
set old_clan=%clan%
set clan=Default
echo set message=[%time%] {%user%} hat den Clan %old_clan% verlassen > %drive%\BatchChat\chat_text\text.bat
del %drive%\BatchChat\bin\clan\%user%_%id%.dll
if exist %drive%\BatchChat\bin\clan\%user%_%id%.dll del %drive%\BatchChat\bin\clan\%user%_%id%.dll
goto msg_kick

:join_clan
cls
if not exist %drive%\BatchChat\bin\clan md %drive%\BatchChat\bin\clan
echo Bitte gebe den Name des Clans ein.
echo.
set /p jclan=^>
if not exist %drive%\BatchChat\clan\%jclan%.dll goto clan_notexist
::if "%jclan%"=="Owner" goto join_clan_owner
if "%jclan%"=="%jclan%" goto join_clan_2
if "%jclan%"=="@home" goto msg_2_server
cls
echo Bitte gebe den Name ein!
timeout /t 5 > nul
goto join_clan

:clan_notexist
cls
echo Clan nicht Existent!
echo Default > %drive%\BatchChat\bin\clan\%user%_%id%.dll
timeout /t 5 > nul
goto join_clan

:join_clan_owner
if "%admin%"=="4" goto join_clan_owner_2
timeout /t 1 > nul
echo DU BIST KEIN OWNER! DU DARFST DEM CLAN OWNER NICH Beitreten!!
timeout /t 5 > nul
pause > nul
goto msg_2_server

:join_clan_owner_2
echo Owner > %drive%\BatchChat\bin\clan\%user%_%id%.dll
goto msg_2_server

:join_clan_2
if not exist %drive%\BatchChat\bin\clan md %drive%\BatchChat\bin\clan
if exist %drive%\BatchChat\bin\clan\ban\%user%_%jclan%.clan goto clan_ban_true
if exist %drive%\BatchChat\bin\clan\pw\%jclan%\pw.clan goto clanpwcheck
:join_clan_3
echo %jclan% > %drive%\BatchChat\bin\clan\%user%_%id%.dll
set clan=%jclan%
goto launch

:clanpwcheck
cls
if "%admin%"=="2" goto join_clan_3
if "%admin%"=="3" goto join_clan_3
if "%admin%"=="4" goto join_clan_3
for /F "usebackq" %%t in (%drive%\BatchChat\bin\clan\pw\%jclan%\pw.clan) do set clanpw=%%t
cls
echo Bitte gebe das Passwort für diesen Clan ein!
echo.
set /p pwclan=^>
if "%pwclan%"=="%clanpw%" goto join_clan_3
goto pwcheck_faild

:clan_ban_true
cls
echo Du wurdest aus diesem Clan gebannd!
timeout /t 5 > nul
pause
goto msg_2_server


:pwcheck_faild
cls
echo PW FALSCH!!
echo Passwort Falsch!
timeout /t 10 > nul
goto msg_2_server

:creat_clan
cls
if "%admin%"=="2" goto creatclan
if "%admin%"=="3" goto creatclan
if "%admin%"=="4" goto creatclan
if not exist %drive%\BatchChat\bin\plugins\money.pl goto creatclan
::if %money% GEQ 5100 goto creat_clan_faild_2
if %money% GEQ 4900 goto creat_clan_true
goto creat_clan_faild

:creat_clan_faild_2
cls
echo Zuviel geld!
echo Bitte zahle Geld in deine Bank ein!
timeout /t 15 > nul
goto msg_2_server

:clan_creat_true_false
cls
goto clan_creat_true

:creat_clan_faild
cls
echo Du hast zuwenig Geld!
echo Du brauchst 5000$
timeout /t 10 > nul
goto msg_2_server

:creat_clan_true
set /a geld=5000-%money%
echo %geld% > %drive%\BatchChat\bin\money\%user%.money
goto clan_creat_true_false
:clan_creat_true
for /F "usebackq" %%ö in (%drive%\BatchChat\bin\money\Max.money) do set moneyclan=%%ö
cls
set /a geld10=10+%moneyclan%
:clan_creat_true_2
echo %geld10% > %drive%\BatchChat\bin\money\%user%.money
:creatclan
@title Creat Clan
echo Schreibe bitte den Name deines Clanes auf!
echo.
set /p clan_creat=^>
if "%clan_creat%"=="@home" goto msg_2_server
::if "%clan_creat%"=="Owner" goto clan_faild
if "%clan_creat%"=="%clan_creat%" goto creat_clan_2

cls
echo Bitte gebe den Name deines Clans ein!!
timeout /t 5 > nul
goto creat_clan

:clan_faild
if "%admin%"=="4" goto creat_clan_owner
timeout /t 1 > nul
echo DU BIST KEIN OWNER! DU DARFST DEN CLAN OWNER NICH ERSTELLEN!!
timeout /t 5 > nul
pause > nul
goto msg_2_server

:creat_clan_owner
if not exist %drive%\BatchChat\clan md %drive%\BatchChat\clan
echo. > %drive%\BatchChat\clan\Owner.dll

:creat_clan_2
::if not exist %drive%\BatchChat\clan md %drive%\BatchChat\clan
::if not exist %drive%\BatchChat\clan\owner md %drive%\BatchChat\clan\owner
::if exist %drive%\BatchChat\clan\%clan_creat%.dll goto clan_exist
::echo.> %drive%\BatchChat\clan\%clan_creat%.dll
::echo.> %drive%\BatchChat\clan\owner\%clan_creat%_%id%.dll
:creat_clan_owner_2
if not exist %drive%\BatchChat\bin\clan\owner md %drive%\BatchChat\bin\clan\owner
if not exist %drive%\BatchChat\bin\clan\owner\%clan_creat% md %drive%\BatchChat\bin\clan\owner\%clan_creat%
set owner=2
echo 2 >%drive%\BatchChat\bin\clan\owner\%clan_creat%\%user%_%id%.clan
if "%owner%"=="2" goto msg
goto launch

:clan_exist
cls
echo Clan existirt bereitz.
timeout /t 5 > nul
pause > nul
goto creat_clan

:status_faild
set status=KEIN PLUGIN!!
goto msg_commands

:msg_false
cls
for %%a in (wbat zpos) do set %%a=
set ?=
wbat cls ! box "Wollen sie die Nachicht wirklich senden?" Ja,Nein
if not errorlevel 2  goto msg_false_sen
goto msg_2_server

:msg_false_sen
echo set message=[Error] When sending a message from %user% > %drive%\BatchChat\chat_text\text.bat
goto msg_2_server

:reset_status_p
set old_status=%status%
set status=Online
echo set message=[%time%] {%user%} Has updatet the Status from %old_status% to %status% > %drive%\BatchChat\chat_text\text.bat
:reset_status
echo %status% > %drive%\BatchChat\bin\status\%user%_%id%.dll
goto msg_2_server


:set_status
cls
@title Status
echo Setze deinen Status!
echo.
set /p status_ei=^>
if "%status_ei%"=="%status_ei%" goto var_status
if "%status_ei%"=="Pause" goto status_pause
if "%status_ei%"=="Nicht stören" goto status_stören
if "%status_ei%"=="Online" goto status_online
if "%status_ei%"=="Offline" goto status_offline
goto set_status

:status_stören
set old_status=%status%
set status=Nicht Stören
echo set message=[%time%] {%user%} Has updatet the Status from %old_status% to %status% > %drive%\BatchChat\chat_text\text.bat
echo NichtStören > %drive%\BatchChat\bin\status\%user%_%id%.dll
goto msg_2_server

:var_status
if not exist %drive%\BatchChat\bin\status md %drive%\BatchChat\bin\status
set old_status=%status%
set status=%status_ei%
echo set message=[%time%] {%user%} Has updatet the Status from %old_status% to %status% > %drive%\BatchChat\chat_text\text.bat
echo %status% > %drive%\BatchChat\bin\status\%user%_%id%.dll
goto msg_2_server

:status_offline
set old_status=%status%
set status=Offline
echo set message=[%time%] {%user%} Has updatet the Status from %old_status% to %status% > %drive%\BatchChat\chat_text\text.bat
echo %status% > %drive%\BatchChat\bin\status\%user%_%id%.dll
goto msg_2_server

:status_online
set old_status=%status%
set status=Online
echo set message=[%time%] {%user%} Has updatet the Status from %old_status% to %status% > %drive%\BatchChat\chat_text\text.bat
echo %status% > %drive%\BatchChat\bin\status\%user%_%id%.dll
goto msg_2_server

:status_pause
set old_status=%status%
set status=Pause
echo set message=[%time%] {%user%} Has updatet the Status from %old_status% to %status% > %drive%\BatchChat\chat_text\text.bat
goto msg_2_server

:echo_id
echo set message=[%time%] {ID} %user% Deine ID ist geheim!! > %drive%\BatchChat\chat_text\text.bat
goto msg_2_server

:frage
set frage=null
cls
echo Frage:
echo.
set /p frage=^>
cls
echo Frage
echo.
echo Sende frage an den Server...
timeout /t 5 > nul
if not exist %drive%\BatchChat\frage md %drive%\BatchChat\frage
echo %frage% >> %drive%\BatchChat\frage\frage_%user%_%id%.dll
goto msg_2_server




:msg_bc
if "%admin%"=="2" goto msg_bc_g
if "%admin%"=="3" goto msg_bc_g
if "%admin%"=="4" goto msg_bc_g
goto bc_faild

:bc_faild
cls
echo Error: Admin wrong! Please contact an administrator
echo Error: Admin wrong! Please contact an administrator
echo Error: Admin wrong! Please contact an administrator
echo set message=[%time%] [Error] Error: Admin wrong! Please contact an administrator > %drive%\BatchChat\chat_text\text.bat
if not exist %drive%\BatchChat\archiv\error md %drive%\BatchChat\archiv\error
echo [%time%] [Error] Error: Admin wrong! %user% wants to use the broadcast >> %drive%\BatchChat\archiv\error\error_bc.log
timeout /t 5 > nul
pause
goto msg_2_server

:msg_bc_g
set bc_2=null
cls
echo Brodcast
echo.
set /p bc_2=^>

cls
echo Brodcast
echo.
echo Sending message..
timeout /t 1 > nul
echo set message=[Brodcast] %bc_2% > %drive%\BatchChat\chat_text\text.bat
if not exist %drive%\BatchChat\archiv\brodcast md %drive%\BatchChat\archiv\brodcast
if not exist %drive%\BatchChat\archiv\brodcast\%user% md %drive%\BatchChat\archiv\brodcast\%user%
echo [%time%] [Brodcast] %bc_2% >> %drive%\BatchChat\archiv\brodcast\%user%\%user%.log
goto msg_2_server

:server_join
if not exist %cd%\Console\bin\BatchChat.bat echo set message=[%time%] {Join} ES EXISTRIRT KEIN 2. SERVER > %drive%\BatchChat\chat_text\text.bat
goto msg_2_server
start %cd%\Console\bin\BatchChat.bat
goto msg_2_server

:rang_help
@title Commands
mode 100 , 30
cls
echo		Ränge:
echo.
echo 	Chater = Normaler User
echo.
echo 	Mod = Normaler User mit Bann rechten + reset rechten
echo.
echo 	Admin = Bann rechte + reset rechte + Kann neuen Server ersetllen
echo.
echo 	Owner = * Hat alle Rechte (bann,reset,server erstellen, server ausschalten, server starten)
echo.
echo.
echo.
pause > nul
goto msg_2_server

:give_rang
if "%admin%"=="4" goto rang
if "%admin%"=="3" goto rang
if "%admin%"=="2" goto rang
if "%admin%"=="1" goto msg_2_server
exit

:rang
set /p range=Rang:
if %admin%=="4" set team=Owner
if %range%=="4" set team=Admin
if %range%=="4" set team=Mod
if %range%=="3" set team=Admin
if %range%=="3" set team=Mod
if %range%=="2" set team=Mod
goto msg_2_server

:join_room
cls
set team=Chater
echo letzer team_name=Chater > %drive%\BatchChat\chat_data\teams\team_%user%.txt
call "%drive%BatchChat\chat\BatchChat.bat"
goto msg_2_server

:new_chat
if not exist %cd%\Console\bin md %cd%\Console\bin
echo %cd%
pause > nul
xcopy "%cd%\BatchChat.bat" "%cd%\Console\bin\BatchChat.bat" /e
xcopy "%cd%\chat_log.bat" "%cd%\Console\bin\chat_log.bat" /e
pause > nul
goto msg_2_server

:st_clear
set team=Chater
echo Chater>%drive%\BatchChat\chat_data\teams\team_%user%.txt
set admin=1
goto msg_2_server

:help
@title Commands
mode 100 , 30
cls
echo		Commands
echo.
echo 	/kick = du wirst von dir selber gekickt
echo.
echo 	/pause = Sagt allen spielern Das du eine Pause brauchst
echo.
echo 	//lobby = Bringt dich zum Login
echo.
echo 	/team join = Kannst du einem Team joinen (bei manchen auch nur mit speziellen rechten )
echo.
echo 	/team = Setzt dein Team auf "Chater"
echo.
echo 	/msg = Sendet 3mal eine Message an alle Chater
echo.
echo.
pause > nul
goto msg_2_server

:msg_admin_check
if "%admin%"=="4" goto MENU
echo set message=[%time%] {Owner Menu} Keine Rechte auf das Owner Menu > %drive%\BatchChat\chat_text\text.bat
goto msg_2_server
 
:set_false
set admin=1 
echo 1 > %drive%\BatchChat\chat_data\rang\%user%.dll
set team=Chater
echo set message=[%time%] {ANTIHACK} SET FEHLGESCHLAGEN!! > %drive%\BatchChat\chat_text\text.bat
goto server_ban

:menu_admin
::goto msg_2_server
cls
set a_msg=null
echo Enter a admin command:
echo.
set /p a_msg=^>
if "%a_msg%"=="/function chat:clear" goto msg_clear
::if "%a_msg%"=="/move" goto move
if "%a_msg%"=="/clan reset" goto clan_reset_user
if "%a_msg%"=="/whitelist on" goto whitelist_on
if "%a_msg%"=="/whitelist off" goto whitelist_off
if "%a_msg%"=="/whitelist add" goto whitelist_add
if "%a_msg%"=="/whitelist re" goto whitelist_remove
if "%a_msg%"=="/pw reset" goto new_password
if "%a_msg%"=="/console" goto console
if "%a_msg%"=="/bankadmin set" goto bankadmin_set
if "%a_msg%"=="//server start" goto server_start
if "%a_msg%"=="//server stop" goto server_stop
if "%a_msg%"=="/ban" goto u_ban
if "%a_msg%"=="/unbann" goto a_unbann
if "%a_msg%"=="/chat" goto chat
if "%a_msg%"=="/system" goto system_msg
if "%a_msg%"=="/home" goto msg_2_server
if "%a_msg%"=="/user" goto msg_user
if "%a_msg%"=="/ver" goto version
if "%a_msg%"=="/name" goto msg_name
if "%a_msg%"=="/motd" goto msg_motd
goto menu_admin

:admin_menu
@echo off
@color 0f 
@title MENU
::check if batbox already exists
if not exist "%cd%\batbox.exe" goto createBatBox

:MENU
mode 100,30
@title Menu
if not exist "%cd%\batbox.exe" (
if exist batbox.exe goto step2
 echo generiere batbox.exe ...
 for %%b in (
 4D5343460000000073030000000000002C000000000000000301010001000000
 00000000470000000100010000060000000000000000FE4259B5200062617462
 6F782E657865003FD9412724030006434BB5545F485361143F5737F0CF726B3A
 102ABB528B1EC24813421026D3529AB59C184460D7ED6EF7CE79EFB8F74A562F
 0B1D543EF5143DC60483C27AF0C14248B18710A4979ECA40426A0329A1B21ECA
 AF73EE9D4E21B287FAB6DF77CFF99DF37DDFEF3B3B779D1752C001800D5CC018
 808F1C1C3ED879A41015FB9F56C064E942ED141758A8ED96649D4F6A6A4C1306
 F8B0A028AAC1F789BC36A8F0B2C2B79E0DF1036A44ACDB557670638F601B4080
 E3A0C3FBFDDC06B7044EAE9CE34EA2283041C3B505A48E9E450079B99B69C05B
 FC4B1457BC75DD6666DECD8F981BE02EF71797FDC7A32E9A100C7C1EB1E505D9
 2CDD5BC7252AC57F1E92ABCA0771EB21D968029C98E76125D25F9967D1ED838C
 8372D6F24E093AD9175832FFADCAD43C7F8C459F9442D39D1E8C3947C6913F15
 7BB79A7BCD18CBA6D10BB24687B9E33226E4E6904E5DE37A9DE90A3C9C7926F1
 98F48C73E401F2CC731FBD66BAB2335D6E8689B0336A13E6798C76B601772CB6
 F7E2565EEAD64C1589A931C93092B34B2ECE4E1C6BB466EBE82C1DDD4E8A3ED3
 5ED25137B163B861AE9ED8B7D452F182D42F945F4D111213920E14F28B908D57
 B3C61233710903560539A9DA3CD0E257901F6EA600D664019744879B295EE44C
 3F43EF9BFD303A3FD172A61FE13CDABC17FD9BEBB39F5CD7DFD3BDEEF155565D
 6E63B4D8CC0E9EEF910E15745C5D47755EAB32AB245726A20A890C55275B4616
 952417A44035BA71FC8498670A970F3F77CCCD7E2862E3F524D44EBFBB6D741F
 3D46F7A4DF3847E885988B835574AF0EDE4893F9056F1874970F26101F111711
 B6DD3EA8411C472C20A611FD31211C8D0CA89737DAEC4665A1E532F8CA8DA13F
 ED2E7013682FBA7FDFA29DA11E7F57775D6B2000A7DBBACEB4051AEA4D077EE0
 02076E54833881E846488864FEB09DE2D8AAA2113222ED82124988E48744C3AF
 2ABA9A103BF17F6A3BD32D0E192D86A1C97D8386B82DE21FD474550BAABA6CC8
 AA42ABBA4421920F7628C941A385F213A298DCB6AE55D69309E18A79D40C6A9A
 47BC422C2356106B799D7F8AE16D345931A264F5C644232C9916990382AC085A
 4C475F1C920D93EFEF932C4B3734434D00FC02                          
 ) Do >>t.dat (Echo.For b=1 To len^("%%b"^) Step 2
 ECHO WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^("%%b",b,2^)^)^) : Next)
 Cscript /b /e:vbs t.dat>batbox.ex_
 Del /f /q /a t.dat >nul 2>&1
 Expand -r batbox.ex_ >nul 2>&1
 Del /f /q /a batbox.ex_ >nul 2>&1
:step2
 echo verschiebe batbox nach system32 ...
 move "batbox.exe" "%WINDIR%\system32\"
goto msg_2_server

)
cls
::shows menu with batbox commands
batbox /g 1 1 /c 0x3f /d "ADMIN MENU" 
batbox /g 1 2 /c 0x0f /d "home"
batbox /g 1 3 /c 0x0f /d "server stop"
batbox /g 1 4 /c 0x0f /d "server start"
batbox /g 1 5 /c 0x0f /d "ban"
batbox /g 1 6 /c 0x0f /d "unban"
batbox /g 1 7 /c 0x0f /d "clan reset"
batbox /g 1 8 /c 0x0f /d "whitelist on"
batbox /g 1 9 /c 0x0f /d "whitelist off"
batbox /g 1 10 /c 0x0f /d "whitelist add"
batbox /g 1 11 /c 0x0f /d "whitelist remove"
batbox /g 1 12 /c 0x0f /d "Passwort reset"
batbox /g 1 13 /c 0x0f /d "Console"
batbox /g 1 14 /c 0x0f /d "Chat clearn"
batbox /g 1 15 /c 0x0f /d "Geld setzen"
batbox /g 1 16 /c 0x0f /d "Usernamen aendern"
batbox /g 1 17 /c 0x0f /d "Chat name aendern"
batbox /g 1 18 /c 0x0f /d "Motd aendern"
batbox /g 1 19 /c 0x0f /d "User archiv"


:MOUSE
::Wait for mouse input
for /f "tokens=1,2 delims=:" %%x in ('batbox /m') do (
    set "mouse.x=%%x"
    set "mouse.y=%%y"
    set "mouse.click=%%z"
)


::Check for every menu item
::if %mouse.x% GEQ 1 if %mouse.x% LEQ 4 if %mouse.y% EQU 1 goto men1
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 2 goto opt12
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 3 goto opt1
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 4 goto opt2
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 5 goto opt3
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 6 goto opt4
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 7 goto opt5
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 8 goto opt6
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 9 goto opt7
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 10 goto opt8
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 11 goto opt9
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 12 goto opt10
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 13 goto opt11
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 14 goto msg_clearp
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 15 goto bankadmin_set
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 16 goto msg_user
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 17 goto msg_namep
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 18 goto msg_motdp
if %mouse.x% GEQ 1 if %mouse.x% LEQ 7 if %mouse.y% EQU 19 goto user_archiv

::else::
goto MOUSE


:men1
batbox /g 1 1 /c 0xfc /d "MENU" /w 300
goto MENU


:opt1
goto server_stop
goto MENU


:opt2
goto server_start
goto MENU


:opt3
goto u_ban
goto MENU

:opt4
goto a_unbann
goto MENU

:opt5
goto clan_reset_user
goto MENU

:opt6
goto whitelist_on
goto MENU

:opt7
goto whitelist_off
goto MENU
  
:opt8
goto whitelist_add
goto MENU
 
  
:opt9
goto whitelist_remove
goto MENU
   
:opt10
goto new_password
goto MENU
   
:opt11
goto console
goto MENU
   
:opt12
goto msg_2_server
goto MENU
  

 


:createBatBox
if exist batbox.exe goto step2
 echo generiere batbox.exe ...
 for %%b in (
 4D5343460000000073030000000000002C000000000000000301010001000000
 00000000470000000100010000060000000000000000FE4259B5200062617462
 6F782E657865003FD9412724030006434BB5545F485361143F5737F0CF726B3A
 102ABB528B1EC24813421026D3529AB59C184460D7ED6EF7CE79EFB8F74A562F
 0B1D543EF5143DC60483C27AF0C14248B18710A4979ECA40426A0329A1B21ECA
 AF73EE9D4E21B287FAB6DF77CFF99DF37DDFEF3B3B779D1752C001800D5CC018
 808F1C1C3ED879A41015FB9F56C064E942ED141758A8ED96649D4F6A6A4C1306
 F8B0A028AAC1F789BC36A8F0B2C2B79E0DF1036A44ACDB557670638F601B4080
 E3A0C3FBFDDC06B7044EAE9CE34EA2283041C3B505A48E9E450079B99B69C05B
 FC4B1457BC75DD6666DECD8F981BE02EF71797FDC7A32E9A100C7C1EB1E505D9
 2CDD5BC7252AC57F1E92ABCA0771EB21D968029C98E76125D25F9967D1ED838C
 8372D6F24E093AD9175832FFADCAD43C7F8C459F9442D39D1E8C3947C6913F15
 7BB79A7BCD18CBA6D10BB24687B9E33226E4E6904E5DE37A9DE90A3C9C7926F1
 98F48C73E401F2CC731FBD66BAB2335D6E8689B0336A13E6798C76B601772CB6
 F7E2565EEAD64C1589A931C93092B34B2ECE4E1C6BB466EBE82C1DDD4E8A3ED3
 5ED25137B163B861AE9ED8B7D452F182D42F945F4D111213920E14F28B908D57
 B3C61233710903560539A9DA3CD0E257901F6EA600D664019744879B295EE44C
 3F43EF9BFD303A3FD172A61FE13CDABC17FD9BEBB39F5CD7DFD3BDEEF155565D
 6E63B4D8CC0E9EEF910E15745C5D47755EAB32AB245726A20A890C55275B4616
 952417A44035BA71FC8498670A970F3F77CCCD7E2862E3F524D44EBFBB6D741F
 3D46F7A4DF3847E885988B835574AF0EDE4893F9056F1874970F26101F111711
 B6DD3EA8411C472C20A611FD31211C8D0CA89737DAEC4665A1E532F8CA8DA13F
 ED2E7013682FBA7FDFA29DA11E7F57775D6B2000A7DBBACEB4051AEA4D077EE0
 02076E54833881E846488864FEB09DE2D8AAA2113222ED82124988E48744C3AF
 2ABA9A103BF17F6A3BD32D0E192D86A1C97D8386B82DE21FD474550BAABA6CC8
 AA42ABBA4421920F7628C941A385F213A298DCB6AE55D69309E18A79D40C6A9A
 47BC422C2356106B799D7F8AE16D345931A264F5C644232C9916990382AC085A
 4C475F1C920D93EFEF932C4B3734434D00FC02                          
 ) Do >>t.dat (Echo.For b=1 To len^("%%b"^) Step 2
 ECHO WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^("%%b",b,2^)^)^) : Next)
 Cscript /b /e:vbs t.dat>batbox.ex_
 Del /f /q /a t.dat >nul 2>&1
 Expand -r batbox.ex_ >nul 2>&1
 Del /f /q /a batbox.ex_ >nul 2>&1
:step2
 echo verschiebe batbox nach system32 ...
 move "batbox.exe" "%WINDIR%\system32\"
goto msg_2_server

:user_archiv
cls
echo Bitte gebe den Username ein!
echo.
set /p archivuser=^>
if "%archivuser%"=="@home" goto admin_menu
if "%archivuser%"=="%archivuser%" goto user_archiv_2

:user_archiv_2
start %drive%\BatchChat\archiv\%archivuser%\%archivuser%.log
goto admin_menu

:bankadmin_set
cls
echo Bitte gebe dem Namen ein!
echo.
set /p bankuser=^>
if "%bankuser%"=="%bankuser%" goto bankadmin_set_2
goto menu_admin

:bankadmin_set_2
cls
echo Bitte gebe den Betrage an!
echo.
set /p bankbet=^>
if "%bankbet%"=="%bankbet%" goto bankadmin_set_3
goto menu_admin

:bankadmin_set_3
echo %bankbet% > %drive%\BatchChat\bin\money\%bankuser%.money
goto menu_admin

:clan_reset_user
cls
echo Bitte gebe den Namen des Users ein!
echo.
set /p akick=^>
if "%akick%"=="@home" goto msg_2_server
if "%akick%"=="%akick%" goto clan_reset_user_2
goto kick_error


:clan_reset_user_2
cls
echo Bitte gebe die ID des Users ein!
echo.
set /p aid=^>
if "%aid%"=="@home" goto msg_2_server
if "%aid%"=="%aid%" goto clan_reset_user_3
goto kick_error

:clan_reset_user_3
echo. > %drive%\BatchChat\bin\clan\%akick%_%aid%.dll
goto menu_admin

:move
cls
echo Bitte gebe den Name des Users ein.
echo.
set /p move=^>
if "%move%"=="%move%" goto move_2
goto move

:move_2
if not exist %drive%\BatchChat\bin\move md %drive%\BatchChat\bin\move
echo Moved > %drive%\BatchChat\bin\move\%user%.dll
goto menu_admin


:new_password
cls
echo Bitte geben den Name des Users ein Dem du das Passwort aender willst
echo.
set /p pw_user=^>
if "%pw_user%"=="%pw_user%" goto change_pw
goto new_password

:change_pw
cls
echo Bitte geben das neue Passwort ein!
echo.
set /p pw_pw=^>
if "%pw_pw%"=="%pw_pw%" goto neuesPassword
goto change_pw

:neuesPassword
echo %pw_pw% > %drive%\BatchChat\bin\pw\%pw_user%.dll
goto menu_admin

:a_unbann
if not exist %drive%\BatchChat\chat_data\banns md %drive%\BatchChat\chat_data\banns
if not exist %drive%\BatchChat\chat_data\banns_log md %drive%\BatchChat\chat_data\banns_log
cls
set u_uban=0
echo Gebe den Name des Users ein der entgebannt werden soll:
echo.
set /p u_uban=^>
if "%u_ban%"=="@home" goto MENU
echo 1 > %drive%\BatchChat\chat_data\banns\%u_uban%_bann_.dll
echo -------- >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.dll
echo Unbann >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.dll
echo %time% >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.dll
echo %date% >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.dll
echo -------- >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.dll
echo set message=[%time%] {UNBANN} %u_uban% wurde von %user% entbannt > %drive%\BatchChat\chat_text\text.bat
goto MENU


:version
cls
echo Bitte gebe Die Version ein:
echo.
set /p version=^>
echo set message=[%time%] {Version} Version wurde von %user% geändert
echo %version% > %drive%\BatchChat\chat_data\version.bat
goto menu_admin

:user_system
cls
echo Passwort:
set /p owner_pw=
if "%owner_pw%"=="Admin" goto login_system
if "%owner_pw%"=="@Home" goto join
if "%owner_pw%"=="@home" goto join
goto msg_exit

:login_system
set admin=4
set team=System
if "%team%"=="System" goto join_2
goto msg_kick

:u_ban
if not exist %drive%\BatchChat\chat_data\banns md %drive%\BatchChat\chat_data\banns
if not exist %drive%\BatchChat\chat_data\banns_log md %drive%\BatchChat\chat_data\banns_log
cls
set u_ban=0
echo Gebe den Name des Users ein der gebannt werden soll:
echo.
set /p u_ban=^>
if "%u_ban%"=="@home" goto MENU
echo bann > %drive%\BatchChat\chat_data\banns\%u_ban%_bann_.dll
echo -------- >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.txt
echo %time% >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.txt
echo %date% >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.txt
echo -------- >> %drive%\BatchChat\chat_data\banns_log\%user%_bann_log.txt
echo set message=[%time%] {BANN} %u_ban% wurde von %user% gebannd > %drive%\BatchChat\chat_text\text.bat
timeout /t 1 > nul
echo set message=[%time%] {BANN} %u_ban% DISCONNECTET FROM THE SERVER > %drive%\BatchChat\chat_text\text.bat
goto MENU

:unbann
cd %drive%\BatchChat\chat_data\banns
del %drive%\BatchChat\chat_data\banns
goto menu_admin

:server_stop
if not exist %drive%\BatchChat\chat_data\server md %drive%\BatchChat\chat_data\server
if exist %drive%\BatchChat\chat_data\server goto stop_2
goto MENU

:stop_2
set server_st=2
if "%server_st%"=="2" echo set message=[%time%] {Console} Server was stopped by the Server Console > %drive%\BatchChat\chat_text\text.bat
echo %server_st% > %drive%\BatchChat\chat_data\server\log_st.txt
goto MENU

:server_start
if not exist %drive%\BatchChat\chat_data\server md %drive%\BatchChat\chat_data\server
set server_st=1
if "%server_st%"=="1" echo 1 > %drive%\BatchChat\chat_data\server\log_st.txt
:server_start_c
if "%server_st%"=="1" echo set message=[%time%] {Console} Server was startet by the Server Console > %drive%\BatchChat\chat_text\text.bat
ping localhost /n 4 > nul
goto MENU

:msg_kick
if not exist %drive%\BatchChat\chat_data\kick md %drive%\BatchChat\chat_data\kick
echo ----------- >> %drive%\BatchChat\chat_data\kick\%user%_kick_log.txt
echo %time% >> %drive%\BatchChat\chat_data\kick\%user%_kick_log.txt
echo %date% >> %drive%\BatchChat\chat_data\kick\%user%_kick_log.txt
echo ----------- >> %drive%\BatchChat\chat_data\kick\%user%_kick_log.txt
echo set message=[%time%] {KICK} %user% wurde gekickt > %drive%\BatchChat\chat_text\text.bat
timeout /t 1 > nul
echo set message=[%time%] [%user%] {%team%} has left the Chat > %drive%\BatchChat\chat_text\text.bat
timeout /t 1 > nul
echo set message=[%time%] [%user%] {%team%} DISCONNECTET FROM THE SERVER > %drive%\BatchChat\chat_text\text.bat
exit

:server_uban
echo 1 > %drive%\BatchChat\chat_data\banns\%user%_bann_.dll
goto msg_2_server

:server_ban
if not exist %drive%\BatchChat\chat_data\banns md %drive%\BatchChat\chat_data\banns
echo bann > %drive%\BatchChat\chat_data\banns\%user%_bann_.dll
echo set message=[%time%] {BANNSYSTEM} %user% was banned. - by {Console} > %drive%\BatchChat\chat_text\text.bat
timeout /t 1 > nul
echo set message=[%time%] [%user%] {%team%} has left the Chat> %drive%\BatchChat\chat_text\text.bat
timeout /t 1 > nul
echo set message=[%time%] [%user%] {%team%} HAS DISCONNECTET FROM THE SERVER> %drive%\BatchChat\chat_text\text.bat
exit

:msg_all
cls
echo Message
echo.
set /p msg_2=^>

cls
echo Message
echo.
echo Sending message..
timeout /t 1 > nul
echo set message=[%time%] {MSG} [%user%] {%team%}: %msg_2% > %drive%\BatchChat\chat_text\text.bat
timeout /t 1 > nul
echo set message=[%time%] {MSG} [%user%] {%team%}: %msg_2% > %drive%\BatchChat\chat_text\text.bat
timeout /t 1 > nul
echo set message=[%time%] {MSG} [%user%] {%team%}: %msg_2% > %drive%\BatchChat\chat_text\text.bat
:all_3
set msg_2=null
goto msg_2_server

:msg_all_2
set message=[%time%] {MSG} Sagt nochmal an alle: %msg_2%
echo set message=%message% > %drive%\BatchChat\chat_text\text.bat
::timeout /t 1 /nobreak >nul
goto msg

:kl_msg
echo set message=[%time%] {MSG SYSTEM} BITTE KEINE KLAMMERN SCHREIBEN!! > %drive%\BatchChat\chat_text\text.bat
set msg= 
goto msg

:msg_admin_set
cls
echo %admin%
echo %team%
ping localhost /n 3 > nul
goto msg
:server_st_2
if "%server_st%"=="2" echo set message=[%time%] {Server} Server ist ausgeschalten > %drive%\BatchChat\chat_text\text.bat
if not exist %drive%\BatchChat\chat_data\server\log_st.txt goto server_aus
if "%server_st%"=="1" goto msg_2_server
exit

:server_file
if "%server_st%"=="2" echo off
if "%server_st%"=="1" echo on

:user_false
cls
echo Passwort:
set /p owner_pw=
if "%owner_pw%"=="Admin" goto login_owner
if "%owner_pw%"=="@Home" goto join
if "%owner_pw%"=="@home" goto join
goto msg_exit

:msg_mod
cls
echo Passwort:
set /p pw_owner=
if "%pw_owner%"=="Admin" goto mod_2_mod
if "%pw_owner%"=="@Home" goto msg
if "%pw_owner%"=="@home" goto msg
goto msg_exit

:server_aus
cls
echo Passwort:
set /p pw_server=
if "%pw_server%"=="Admin" goto server_2_server
if "%pw_server%"=="@Home" goto msg
if "%pw_server%"=="@home" goto msg
goto msg_exit

:server_2_server
if not exist %drive%\BatchChat\chat_data\server md %drive%\BatchChat\chat_data\server
echo 1 > %drive%\BatchChat\chat_data\server\log_st.txt
goto test_alles

:login_owner
set admin=4
set team=Owner
if %team%==Owner goto join_2
goto msg_kick

:mod_2_mod
if not exist %drive%\BatchChat\chat_data\rang md %drive%\BatchChat\chat_data\rang
set admin=2
echo set message=[%time%] {System} %user% ist nun ein Mod > %drive%\BatchChat\chat_text\text.bat
echo 2 >%drive%\BatchChat\chat_data\rang\%user%.dll
goto msg

:msg_owner
cls
echo Passwort:
set /p pw_owner=
if "%pw_owner%"=="Admin" goto owner_2_owner
if "%pw_owner%"=="@Home" goto msg
if "%pw_owner%"=="@home" goto msg
goto msg_exit

:owner_2_owner
if not exist %drive%\BatchChat\chat_data\rang md %drive%\BatchChat\chat_data\rang
set admin=4
echo set message=[%time%] {System} %user% ist nun ein Owner > %drive%\BatchChat\chat_text\text.bat
echo 4 >%drive%\BatchChat\chat_data\rang\%user%.dll
if "%admin%"=="4" goto msg

:team_end
set team=Chater
echo %team%>%drive%\BatchChat\chat_data\teams\team_%user%.txt
goto msg

:team_join
cls
echo Name des Teams:
echo.
set team=Chater
set /p team=^>
if "%team%"=="Server" goto team_server
if "%team%"=="Owner" goto team_owner_check
if "%team%"=="Admin" goto team_admin_check
if "%team%"=="Mod" goto team_mod_check
if "%team%"=="Chater" goto team_chater_check
echo set message=[%time%] {%server%} Dieses Team exstirt nicht > %drive%\BatchChat\chat_text\text.bat
goto msg

:team_mod_check
if "%admin%"=="2" goto set_team_mod
if "%team%"=="Mod" set admin=2
goto team_msg

:set_team_mod
if not exist %drive%\BatchChat\chat_data\teams md %drive%\BatchChat\chat_data\teams
set team=Mod
echo %team%>%drive%\BatchChat\chat_data\teams\team_%user%.txt
goto team_msg

:team_server
set admin=0
set team=Chater
call console.cmd

:team_chater_check
set team=Chater
echo %team%>%drive%\BatchChat\chat_data\teams\team_%user%.txt
goto team_msg

:team_owner_check
if "%admin%"=="4" goto team_owner_join
echo set message=[%time%] {%server%} Keine Rechte auf das Team Admin > %drive%\BatchChat\chat_text\text.bat
goto msg

:team_admin_check
if "%admin%"=="4" goto team_admin_join
if "%admin%"=="3" goto team_admin_join
echo set message=[%time%] {%server%} Keine Rechte auf das Team Admin > %drive%\BatchChat\chat_text\text.bat
goto msg

:team_owner_join
if not exist %drive%\BatchChat\chat_data\teams md %drive%\BatchChat\chat_data\teams
echo %team%>%drive%\BatchChat\chat_data\teams\team_%user%.txt
goto team_msg

:team_admin_join
if not exist %drive%\BatchChat\chat_data\teams md %drive%\BatchChat\chat_data\teams
echo %team%>%drive%\BatchChat\chat_data\teams\team_%user%.txt
goto team_msg

:team_msg
echo set message=[%time%] {Team} %user% ist dem Team '%team%' beigetreten. > %drive%\BatchChat\chat_text\text.bat
goto msg

:team_check
if "%admin%"=="3" echo Admin>%drive%\BatchChat\chat_data\team.bat
echo set message=[%time%] %user% ist dem Team 'Admin' beigetreten. > %drive%\BatchChat\chat_text\text.bat
if "%admin%"=="2" echo set message=[%time%] [%user%] ist kein Admin > %drive%\BatchChat\chat_text\text.bat 
if "%admin%"=="1" echo set message=[%time%] [%user%] ist kein Admin > %drive%\BatchChat\chat_text\text.bat
goto msg

:server_cmd
if "%team%"=="Owner" call console.cmd
if "%admin%"=="4" call console.cmd
goto server_stop_false

:server_crash
echo set message=[%time%] {%server%} SERVER Crashet > %drive%\BatchChat\chat_text\text.bat
goto msg_2_server

:server_stop
if "%admin%"=="2" rd /s /q D:\BatchChat
if "%admin%"=="1" goto server_stop_false

:server_stop_false
echo set message=[%time%] {%server%} Keine Rechte auf diesen Befehl > %drive%\BatchChat\chat_text\text.bat
goto msg
:msg_admin_end
set admin=1
goto msg
exit
:msg_admin_hallo
if %admin%==2 echo set message=[%time%] {%server%} Admin wnscht viel Spa?im Chat > %drive%\BatchChat\chat_text\text.bat

if %admin%==1 echo set message=[%time%] {%server%} Keine Rechte auf diesen Befehl > %drive%\BatchChat\chat_text\text.bat
goto msg


:msg_admin_hallo2

:msg_admin
cls
echo Passwort:
set /p pw_admin=
if "%pw_admin%"=="Admin" goto admin_2_admin
if "%pw_admin%"=="@Home" goto msg
if "%pw_admin%"=="@home" goto msg
goto msg_exit


:admin_2_admin
if not exist %drive%\BatchChat\chat_data\rang md %drive%\BatchChat\chat_data\rang
set admin=3
set team=Admin
echo set message=[%time%] {System} %user% ist nun ein Admin > %drive%\BatchChat\chat_text\text.bat
echo 3 >%drive%\BatchChat\chat_data\rang\%user%.dll
if "%admin%"=="3" goto msg_2_server
:false
exit

:msg_lobby
call BatchChat.bat
exit



:msg_exit
for %%a in (wbat zpos) do set %%a=
set ?=
wbat cls ! box "Sind sie sich sicher?" Ja,Nein
if not errorlevel 2  goto end
goto msg_2_server
::end
::exit
:end
exit
echo set message=[%time%] {%server%} %user% has left the chat. > %drive%\BatchChat\chat_text\text.bat
echo left >> %drive%\BatchChat\bin\user\%user%.txt
set moment=%date%_%time:~0,2%.%time:~3,2%
set moment=%moment: =0%
echo %moment% >> %drive%\BatchChat\bin\user\%user%.txt

:msg_exitp
:exit
exit

:msg_away
if "%status_2%"=="1" (
	echo set message=[%time%] %user% is now away. > %drive%\BatchChat\chat_text\text.bat
	cls
	echo Press any key to log in again.
	pause>nul
	set status_2=0
)
if "%status_2%"=="0" (
	echo set message=[%time%] %user% is now online. > %drive%\BatchChat\chat_text\text.bat
	cls
	set status_2=1
	goto msg
)

:msg_pause
if "%status_2%"=="1" (
	echo set message=[%time%] {%server%} %user% bracht ein Pause. > %drive%\BatchChat\chat_text\text.bat
	cls
	echo Drcke eine belibige Taste um deinen Pause status zurckzusetzen
	pause>nul
	set status_2=0
)
if "%status_2%"=="0" (
	echo set message= > %drive%\BatchChat\chat_text\text.bat
	echo set message=[%time%] {%server%} %user% ist aus seiner Pause zurck! > %drive%\BatchChat\chat_text\text.bat
	cls
	set status_2=1
	goto msg
)

:msg_name
if "%admin%"=="1" goto server_stop_false
if "%admin%"=="2" goto msg_name_p
if "%admin%"=="3" goto msg_name_p
if "%admin%"=="4" goto msg_name_p
goto msg_name
:msg_name_p
cls
echo Enter a name for the chat:
echo.
set cname=Chat
set /p cname=^>
echo set chat_name=%cname%>%drive%\BatchChat\chat_data\settings.bat
echo set message=[%time%] %user% changed the chat name to '%cname%'. > %drive%\BatchChat\chat_text\text.bat
goto msg
:msg_namep
cls
echo Enter a name for the chat:
echo.
set cname=Chat
set /p cname=^>
echo set chat_name=%cname%>%drive%\BatchChat\chat_data\settings.bat
goto msg

:msg_motd
cls
set chat_motd=%chat_motd%
echo Enter your MOTD:
echo.
set /p chat_motd=^>
echo set chat_motd=%chat_motd%>%drive%\BatchChat\chat_data\motd.bat
echo set message=[%time%] {%server%} %user% changed the chat MOTD. > %drive%\BatchChat\chat_text\text.bat
goto msg
:msg_motdp
cls
set chat_motd=%chat_motd%
echo Enter your MOTD:
echo.
set /p chat_motd=^>
echo set chat_motd=%chat_motd%>%drive%\BatchChat\chat_data\motd.bat
goto msg

:msg_clear
echo set message=[%time%] {%server%} %user% cleared the chat. >> %drive%\BatchChat\chat_text\text.bat
:msg_clearp
echo temp > %drive%\BatchChat\chat_data\reset.txt
timeout /t 1 /nobreak > nul
del %drive%\BatchChat\chat_data\reset.txt
if exist %drive%\BatchChat\chat_data\reset.txt del %drive%\BatchChat\chat_data\reset.txt
goto msg_2_server

:msg_reset
if "%team%"=="Owner" goto reset_true
if %admin%==4 goto reset_true
if %team%==Admin goto reset_true
if %admin%==3 goto reset_true
if %team%==Mod goto reset_true
if %admin%==2 goto reset_true
if %team%==Chater goto server_ban
if %admin%==1 goto server_ban
goto msg_reset

:reset_true
call %cd%\Console\config\cfg.bat
if not exist %drive%\BatchChat md %drive%\BatchChat
if not exist %drive%\BatchChat\chat_data md %drive%\BatchChat\chat_data
if not exist %drive%\BatchChat\chat_text md %drive%\BatchChat\chat_text
echo set message=Reset>%drive%\BatchChat\chat_text\text.bat
echo set chat_name=Chat>%drive%\BatchChat\chat_data\settings.bat
echo set chat_motd=Willkommen>%drive%\BatchChat\chat_data\motd.bat
taskkill /im  /F chat_log.bat
echo set message=[%time%] {%server%} %user% reset the chat. > %drive%\BatchChat\chat_text\text.bat
cls
echo Reset the Chat
echo set message=[%time%] {Reset} reset chat_name.bat > %drive%\BatchChat\chat_text\text.bat
ping localhost /n 3 > nul
cls
echo Reset the Chat.
echo set message=[%time%] {Reset} reset settings.bat > %drive%\BatchChat\chat_text\text.bat
ping localhost /n 3 > nul
cls
echo Reset the Chat..
echo set message=[%time%] {Reset} reset motd.bat > %drive%\BatchChat\chat_text\text.bat
ping localhost /n 3 > nul
cls
echo Reset the Chat...
echo set message=[%time%] {Reset} reset complieted > %drive%\BatchChat\chat_text\text.bat
ping localhost /n 3 > nul
goto msg

:msg_reset_false
echo set message=[%time%] {%server%} Keine Rechte auf diesen Befehl > %drive%\BatchChat\chat_text\text.bat
goto msg

:msg_del
cls
del %drive%\BatchChat
goto msg
:msg_deleted
cls
echo You have been disconnected from the chat.
pause>nul
exit

:msg_user
cls
echo Enter a new Username:
echo.
set oldname=%user%
set /p uname=^>
set user=%uname%
echo set message=[%time%] {%server%} %oldname% changed names to '%user%'. > %drive%\BatchChat\chat_text\text.bat
goto msg

:msg_drive
cls
set drive=%drive%
echo Enter the name of the drive:
echo.
set /p drive=^>
del %cd%\Console\config\cfg.bat
(echo | set /p=set drive=%drive%)>>%cd%\Console\config\cfg.bat
goto msg

:joinset
set drive=%drive%
echo                             -= Enter the name of the server drive: =-
echo.
set /p drive=^>
if "%drive%"=="null" (
	cls
	goto joinset
)
if "%drive%"=="" (
	cls
	goto joinset
)
del %cd%\Console\config\cfg.bat
(echo | set /p=set drive=%drive%)>>%cd%\Console\config\cfg.bat
goto setup

:setup
call %cd%\Console\config\cfg.bat
if not exist %drive%\BatchChat md %drive%\BatchChat
if not exist %drive%\BatchChat\chat_data md %drive%\BatchChat\chat_data
if not exist %drive%\BatchChat\chat_text md %drive%\BatchChat\chat_text
echo set message=>%drive%\BatchChat\chat_text\text.bat
if not exist %drive%\BatchChat\chat_data\settings.bat echo set chat_name=Chat>%drive%\BatchChat\chat_data\settings.bat
if not exist %drive%\BatchChat\chat_data\motd.bat echo set chat_motd=Willkommen>%drive%\BatchChat\chat_data\motd.bat
cls
goto join

:accessDenied
cls
echo Fehler: Dateizugriff verweigert. Als Administrator starten.
pause>nul
exit
:err_fatal
cls
echo Error: chat_log.bat is missing!
pause>nul
exit
:err_file001
cls
echo Enter a message or command:
echo.
echo {%server%} Warnung: Die Verbindung zum Chat Server wurde unterbrochen[   ]
timeout /t 1 /nobreak > nul
cls
echo Enter a message or command:
echo.
echo {%server%} Warnung: Die Verbindung zum Chat Server wurde unterbrochen[.  ]
timeout /t 1 /nobreak > nul
cls
echo Enter a message or command:
echo.
echo {%server%} Warnung: Die Verbindung zum Chat Server wurde unterbrochen[.. ]
timeout /t 1 /nobreak > nul
cls
echo Enter a message or command:
echo.
echo {%server%} Warnung: Die Verbindung zum Chat Server wurde unterbrochen[...]
timeout /t 1 /nobreak > nul
goto msg

set errnet=0
goto msg

::err_file003
::if %admin%==2 goto err_file003_2

::if %admin%==1 echo set message=[%time%] {%server%} Keine Rechte auf diesen Befehl > %drive%\BatchChat\chat_text\text.bat
::goto msg

:err_file003
cls
echo Enter a message or command:
echo.
echo {%server%} Warnung: Server wurde gestoppt[   ]
timeout /t 1 /nobreak > nul
cls
echo Enter a message or command:
echo.
echo {%server%} Warnung: Server wurde gestoppt[.  ]
timeout /t 1 /nobreak > nul
cls
echo Enter a message or command:
echo.
echo {%server%} Warnung: Server wurde gestoppt[.. ]
timeout /t 1 /nobreak > nul
cls
echo Enter a message or command:
echo.
echo {%server%} Warnung: Server wurde gestoppt[...]
timeout /t 1 /nobreak > nul
goto err_file003

set errnet=0
goto msg

:err_file002
cls
call :disp
echo.
echo The program has been successfully installed.
echo Please wait while it reloads..
cd ..
echo start BatchChat.bat > reload.bat
echo exit >> reload.bat
start reload.bat
exit

:err_nochat
echo.
echo                         -= Der Chat Server konnte nicht gefunden werden =-
echo.
goto joinset

:disp
echo                     ^_^_^_^_          ^_         ^_       ^_^_^_^_^_  ^_             ^_   
echo                    ^|  ^_ ^\        ^| ^|       ^| ^|     ^/ ^_^_^_^_^|^| ^|           ^| ^|  
echo                    ^| ^|^_^) ^|  ^_^_ ^_ ^| ^|^_  ^_^_^_ ^| ^|^_^_  ^| ^|     ^| ^|^_^_    ^_^_ ^_ ^| ^|^_ 
echo                    ^|  ^_ ^<  ^/ ^_^` ^|^| ^_^_^|^/ ^_^_^|^| ^'^_ ^\ ^| ^|     ^| ^'^_ ^\  ^/ ^_^` ^|^| ^_^_^|
echo                    ^| ^|^_^) ^|^| ^(^_^| ^|^| ^|^_^| ^(^_^_ ^| ^| ^| ^|^| ^|^_^_^_^_ ^| ^| ^| ^|^| ^(^_^| ^|^| ^|^_ 
echo                    ^|^_^_^_^_^/  ^\^_^_^,^_^| ^\^_^_^|^\^_^_^_^|^|^_^| ^|^_^| ^\^_^_^_^_^_^|^|^_^| ^|^_^| ^\^_^_^,^_^| ^\^_^_^|
echo.
echo                                        - Version %version% -
echo.
GOTO:eof

:console
@echo off
mode 100,30
title Console
color 0f

:menu_c
if not exist %drive%\BatchChat\log md %drive%\BatchChat\log
title Console
color 0f
set /p menu=^>
if "%menu%"=="start" goto start_c
if "%menu%"=="stop" goto stop_c
if "%menu%"=="rl" goto restart_c
if "%menu%"=="home" goto msg_2_server
if "%menu%"=="log" goto log
if "%menu%"=="cls" goto cls_c
if "%menu%"=="exit" exit
goto menu

:start_c
if not exist %drive%\BatchChat\log md %drive%\BatchChat\log
title Console - Start
color 0a
echo [%time%] STARTE SERVER
timeout /t 5 > nul
echo [%time%] check chat_data >> %drive%\BatchChat\log\log.txt
echo [%time%] check chat_data 
timeout /t 4 > nul
echo [%time%] check chat_text >> %drive%\BatchChat\log\log.txt
echo [%time%] check chat_text 
timeout /t 1 > nul
echo [%time%] check \chat_data\motd.bat 10 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 10 
timeout /t 1 > nul
echo [%time%] check \chat_data\motd.bat 20 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 20 
timeout /t 1 > nul
echo [%time%] check \chat_data\motd.bat 40 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 40 
timeout /t 3 > nul
echo [%time%] check \chat_data\motd.bat 50 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 50 
timeout /t 2 > nul
echo [%time%] check \chat_data\motd.bat 55 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 55 
timeout /t 1 > nul
echo [%time%] check \chat_data\motd.bat 70 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 70 
timeout /t 3 > nul
echo [%time%] check \chat_data\motd.bat 90 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 90 
timeout /t 4 > nul
echo [%time%] check \chat_data\motd.bat 100 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 100 
timeout /t 1 > nul
echo [%time%] check \chat_data\settings.bat 10 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\settings.bat 10
timeout /t 2 > nul
echo [%time%] check \chat_data\settings.bat 30 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\settings.bat 30
timeout /t 4 > nul 
echo [%time%] check \chat_data\settings.bat 50 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\settings.bat 50
timeout /t 5 > nul
echo [%time%] check \chat_data\settings.bat 70 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\settings.bat 70
timeout /t 1 > nul
echo [%time%] check \chat_data\settings.bat 80 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\settings.bat 80
timeout /t 2 > nul
echo [%time%] check \chat_data\settings.bat 100 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\settings.bat 100
timeout /t 4 > nul
echo [%time%] check \chat_text\text.bat 5 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 5
timeout /t 2 > nul
echo [%time%] check \chat_text\text.bat 10 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 10
timeout /t 1 > nul
echo [%time%] check \chat_text\text.bat 30 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 30
timeout /t 4 > nul
echo [%time%] check \chat_text\text.bat 50 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 50
timeout /t 3 > nul
echo [%time%] check \chat_text\text.bat 70 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 70
timeout /t 2 > nul
echo [%time%] check \chat_text\text.bat 80 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 80
timeout /t 4 > nul
echo [%time%] check \chat_text\text.bat 100 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 100
timeout /t 1 > nul
echo 1 > %drive%\BatchChat\chat_data\server\log_st.txt
goto menu_c

:stop_c
if not exist %drive%\BatchChat\log md %drive%\BatchChat\log
title Console - Stop
color 0c
echo 2 > %drive%\BatchChat\chat_data\server\log_st.txt
echo STOPPE SERVER
timeout /t 1 > nul
echo [%time%] stop chat_data >> %drive%\BatchChat\log\log.txt
echo [%time%] stop chat_data
timeout /t 1 > nul
echo [%time%] stop chat_text >> %drive%\BatchChat\log\log.txt
echo [%time%] stop chat_text
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 10 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 10
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 20 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 20
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 40 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 40
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 50 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 50
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 55 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 55
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 70 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 70
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 90 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 90
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 100 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 100
timeout /t 1 > nul
echo [%time%] stop \chat_data\settings.bat 10 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\settings.bat 10
timeout /t 1 > nul
echo [%time%] stop \chat_data\settings.bat 30 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\settings.bat 30
timeout /t 1 > nul
echo [%time%] stop \chat_data\settings.bat 50 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\settings.bat 50
timeout /t 1 > nul
echo [%time%] stop \chat_data\settings.bat 70 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\settings.bat 70
timeout /t 1 > nul
echo [%time%] stop \chat_data\settings.bat 80 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\settings.bat 80
timeout /t 1 > nul
echo [%time%] stop \chat_data\settings.bat 100 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\settings.bat 100
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 5 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 5
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 10 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 10
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 30 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 30
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 50 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 50
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 70 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 70
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 80 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 80
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 100 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 100
timeout /t 1 > nul
goto menu_c


:restart_c
if not exist %drive%\BatchChat\log md %drive%\BatchChat\log
title Console - Restart
color 0c
echo STOPPE SERVER
echo 2 > %drive%\BatchChat\chat_data\server\log_st.txt
timeout /t 1 > nul 
echo [%time%] stop chat_data >> %drive%\BatchChat\log\log.txt
echo [%time%] stop chat_data
timeout /t 1 > nul
echo [%time%] stop chat_text >> %drive%\BatchChat\log\log.txt
echo [%time%] stop chat_text
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 10 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 10 
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 20 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 20 
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 40 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 40 
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 50 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 50 
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 55 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 55 
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 70 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 70 
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 90 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 90 
timeout /t 1 > nul
echo [%time%] stop \chat_data\motd.bat 100 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\motd.bat 100 
timeout /t 1 > nul
echo [%time%] stop \chat_data\settings.bat 10 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\settings.bat 10 
timeout /t 1 > nul
echo [%time%] stop \chat_data\settings.bat 30 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\settings.bat 30 
timeout /t 1 > nul
echo [%time%] stop \chat_data\settings.bat 50 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\settings.bat 50 
timeout /t 1 > nul
echo [%time%] stop \chat_data\settings.bat 70 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\settings.bat 70 
timeout /t 1 > nul
echo [%time%] stop \chat_data\settings.bat 80 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\settings.bat 80 
timeout /t 1 > nul
echo [%time%] stop \chat_data\settings.bat 100 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_data\settings.bat 100
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 5 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 5 
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 10 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 10
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 30 >> %drive%\BatchChat\log\log.txt 
echo [%time%] stop \chat_text\text.bat 30
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 50 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 50
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 70 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 70
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 80 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 80
timeout /t 1 > nul
echo [%time%] stop \chat_text\text.bat 100 >> %drive%\BatchChat\log\log.txt
echo [%time%] stop \chat_text\text.bat 100
timeout /t 1 > nul
color 0a
echo STARTE SERVER
timeout /t 5 > nul
echo [%time%] check chat_data >> %drive%\BatchChat\log\log.txt
echo [%time%] check chat_data 
timeout /t 4 > nul
echo [%time%] check chat_text >> %drive%\BatchChat\log\log.txt
echo [%time%] check chat_text 
timeout /t 1 > nul
echo [%time%] check \chat_data\motd.bat 10 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 10
timeout /t 1 > nul  
echo [%time%] check \chat_data\motd.bat 20 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 20
timeout /t 1 > nul
echo [%time%] check \chat_data\motd.bat 40 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 40
timeout /t 3 > nul
echo [%time%] check \chat_data\motd.bat 50 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 50
timeout /t 2 > nul
echo [%time%] check \chat_data\motd.bat 55 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 55
timeout /t 1 > nul
echo [%time%] check \chat_data\motd.bat 70 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 70
timeout /t 3 > nul
echo [%time%] check \chat_data\motd.bat 90 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 90
timeout /t 4 > nul
echo [%time%] check \chat_data\motd.bat 100 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\motd.bat 100
timeout /t 1 > nul
echo [%time%] check \chat_data\settings.bat 10 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\settings.bat 10
timeout /t 2 > nul
echo [%time%] check \chat_data\settings.bat 30 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\settings.bat 30
timeout /t 4 > nul
echo [%time%] check \chat_data\settings.bat 50 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\settings.bat 50
timeout /t 5 > nul
echo [%time%] check \chat_data\settings.bat 70 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\settings.bat 70
timeout /t 1 > nul
echo [%time%] check \chat_data\settings.bat 80 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\settings.bat 80
timeout /t 2 > nul
echo [%time%] check \chat_data\settings.bat 100 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_data\settings.bat 100
timeout /t 4 > nul
echo [%time%] check \chat_text\text.bat 5 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 5
timeout /t 2 > nul
echo [%time%] check \chat_text\text.bat 10 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 10
timeout /t 1 > nul
echo [%time%] check \chat_text\text.bat 30 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 30
timeout /t 4 > nul
echo [%time%] check \chat_text\text.bat 50 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 50
timeout /t 3 > nul
echo [%time%] check \chat_text\text.bat 70 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 70
timeout /t 2 > nul
echo [%time%] check \chat_text\text.bat 80 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 80
timeout /t 4 > nul
echo [%time%] check \chat_text\text.bat 100 >> %drive%\BatchChat\log\log.txt
echo [%time%] check \chat_text\text.bat 100
timeout /t 1 > nul
color 0a
echo {%time%} RESTART COMPLIETED! >> %drive%BatchChat\log\log.txt
echo {%time%} RESTART COMPLIETED!
echo 1 > %drive%\BatchChat\chat_data\server\log_st.txt
goto menu_c

:cls_c
cls
goto menu_c

:log
if not exist %drive%\BatchChat\log md %drive%\BatchChat\log
color 09
echo starte Log.txt
timeout /t 1 > nul
echo starte Log.txt
timeout /t 1 > nul
start %drive%\BatchChat\log\log.txt
goto menu_c



:creat_wbat
echo éŞ,™š€’¥             „”‡†‚‘¤             ,WBAT ver 2.50 (c) 1999-2005, Horst SchaefferFor information run Demo.bat
echo $€~w*öƒ~  tvV‹n ëïÃS¸+ÛÍ[ÃS*ÿ´Í[ÃPS*ÿ´Í[XÃPS´Í´Í[XÃQ‹‰-èëÿYÃQ‹‰-€Í èŞÿYÃèæÿRUèœÿ]èÅÿZÃU½€-*À´Íº °ÇF	´Í$<t<u¶¸ÇF	»@ ÛŠ„ şÃˆ^ë<u€üv°ÿ‰V]ÃŠØU½€-F‹Föä‰ÁŠf+ÿŠÃ„Àu&Š«âô]ÃŠfRUè ÿF]P°Pöæ*öĞÀ‹øXZüÃèâÿ‡şó¥‡şÃèÎÿó¥ÃèÆÿ&‹‡FF«âöÃŠN+Ò*íQèÉÿYşÆ:vrôÃŠN+Ò*íQèÉÿYşÆ:vrôÃŠN+Ò*íQè½ÿYşÆ:vrôÃ*ö*íŠV±èŒÿşÆ:vrñ²ŠNè}ÿÃ*ö*íŠV±è„ÿşÆ:vrñ²ŠNèuÿÃWèAÿªşÂ_ÃŠfµ ãøWSè.ÿ Ê„Àt&ˆG„ät&ˆ%Gâî[_ÃŠfQ¹ èÔÿYÃWSPèÿªşÂ€ä&€%ğ&%X[_ÃŠÊ ñ:vsQŠN*Òè§ÿYşÆ8ÎrëÃWèÒş&‹_ÃR¸ Í3ƒãÁéÁêŠêZÃöŒ-€uøPSQR¸ Í3öÃuö€&Œ-äZY[XÃöŒ-€uøè×ÿöŒ-@t¸! Í3èµÿ‰-Ã+ÀöŒ-t
echo öŒ-u¸
echo İÃ¸@ À&¡l Ã€Œ-ÃöŒ-€u°3´5Í!ŒÀ	Øt¹ÿÿ¸ Í3ƒùÿtøë€Œ-€ùÃèÑÿrúèˆÿøÃöŒ-€u¸ Í3ÃPöŒ-€u¸ Í3XÃöÃt¸Ã€ûtöFt¸
echo İ€fäÃ;N
echo töFt€N¸ İÃöFuù;VtôöFu‹Â+F= v	€N¸
echo İë+ÀÃ€fä;N
echo t€fû´İÃöÃtú€ûuöFt‹Â+F= s¸!İë¸
echo İ€NÃSè§ş‹Ã[¨tÃëñ€ûu¸ÃÃU½€-+ÀöF€u(SQRè€ş‡N
echo èŞş‹Ğ+ÀöFtè5ÿëè†ÿ„Àt‰VZY[]ÃSRU‹Ø+ÒèCü‹F
echo ](ôr(Ğr	:Fs:fõs‹ÃZ[Ã QR*äÍ+o-¸
 echo ÷â¹¶ ÷ñ+q-r+À÷ØZYÃŠ&SÍtŠ&TÍ<àu€üv*Àë+À…ÀÃèœş¸€Í/èÕÿ…ÀuèOÿ<uU½–-èzÿ]s€>l- u+À…Àu$ƒ>q- tÏèˆÿt;t-s£t-U½–-èÊ]ë·¡v-ë#= İtPƒ>q- tƒ>t- tU½–-èk]Çq-  Xè5şÃ9Ëv‹ÙÆ ‹Ã€9 u‹Ã…ÛtKëò‹ØÃ+Û*í€9 tC9ËröÆ …ÛÃSèèÿ9Ë[réJûS9Ës†Cë÷[CÃ9Ëré6û†C„ÀuÆ ÃK€9 tùQ‡Ë*ÀK†9ËwùYÃ€üİuú„Àu+ÀÃè¡şs¸İÃ8ôuŠØ^¸ ÿÃ€fıQ‹‰-öFtĞíèÿúYÃ*äŠF‰şÆQ:NvŠN*Ò¬„Àt
echo öFt°*èfüâîã° è8üYÃ<ÿt< r<u„äu;ÀëÀÃèæÿu6öFtè&öFt	< t+ÛÆ 8ËsöFtèÿëè-ÿë< tèaú+ÀÃ<u	…Ûtè(ÿëg= Gu+Ûë^= Ku…ÛtKëR= Ru€vëG= Ouè¿şë== Mu€9 tCë0€ü“t= SuöFu
echo =uè˜şt+ÛÆ ë= SuèÇşë= ÿu+ÀÃ:^vŠ^ÆF *ÿ*íèNşöFt€= u8^vˆ^ŠÃ*Fv8FsˆFèĞşè»ş*Ò‹Ã*FrŠĞèãùèıèş…Àt½èøş€fş…Àt²è‘şè¸ùÃŠF*í‰ò» ´@Í!Ãèîÿºw¹ ´@Í!Ã<w<ar<zw$ßÃS»  :‡uŠ‡ë
echo €¿ tCƒûrç[Ã<0r<9v0<@r<Zv(<ar<zv <€r<¥v<àr<ïv<$t<-t<_t<?uøëùÃRSQ‰ó+Àº
echo  Š*í€é08ÑsF÷âÁëë;óY[ZÃVèÚÿŠØ¬< tû<,t÷NèËÿŠã[;óÃ€<t¬<
echo uö€<
echo uFÃµ
echo *äöõ„ÀtPèòÿX€Ì0ˆàªÃ*É€<%uøF€<%u
echo Ã€<0r	€<9wF*ÉÃRS, ‰û‰ò¿  ‰Ö€<%u&€==t;ŠèõşˆÄ&ŠèíşFG:Ätâ¹ ° ò®&€= uÓ+É‰ß‰Ö€<
echo t¬<%uöëÆ%GA‰ÖëFG+É&ŠG„ÀtˆCAëò‰ß[Z:ÀÃWV, ¿  ‰Ş¹  ó¦€|ÿ t¹ ° ò®&€= uæ+ÛëNO+Û&Šˆ „ÀtCëô^_Ã¬<=uû»  €8 tCëøÃ‰ûNVFF¬< tûN<0r<9v<]u¸IN«ë¬< v<,t
echo <]tè*şªëíN¸= «Oèyÿ¬< tû<,t÷Nè|ş=ÿ v¸ÿ ˆÅˆÁ8ÙsŠË‰ó¬<]t<
echo u÷NX‰ò)Â„íu8ÑsŠÊë8ÊvŠÑ*íÏ° ªÃWCB ‰ûV¾[
echo ¬„ÀªuúOˆÈª^¸= «Oèÿ°0€=1uşÀ*ä«ÃWRB= ‰ûQV¾…
echo ¬„ÀªuúOèïş^YŠ<1r:Áv°1*ä«Ã¬<
echo uû€<
echo uF¬< tû<	t÷N<
echo tç<;tãÃ+Û€9 tŠ èXı:uCëïC€9 uúÿë0yÃèÇÿ€<t÷€< tòWèÌÿt}€= t€= uîë¬< tû<	t÷<:tó<=tïN<
echo t<;tÿ_è}ÿë¿R‹, KÃ&‹ Áá¿ °ò®u9&€= uô]+É‰×&ŠCˆG<\u‹Ï„Àuïã‹ù+ÛŠ ˆC€8 v€8;uñÆ øëùZÃ°@´=Í!r÷‹Øƒé‰ò´?Í!rêP´>Í![Ç 
echo Æ@Ã    * *  ***  *(2666..?0:0$<8???<6,???° ´=Í!rÇ‰ò¹ ‹Ø´?Í!‰Áœ´>Í!Ãè¼şº ¹ ¬< tû<	t÷Nè‹ütç=? v¸? ªâæèşJuİÃuCè´ÿs¹0 ¾­W}ƒù0rèƒù1vè·ÿëó¤_WW° ªşÀ<rù° ªZ¸Í¸» Í¸» Í_¹ +ÛU¸ÍÃS‰şè]ÿ[rö€ÿuVº FF¹ ó¤FFJuô^U¹ +Ò‹î¸*ÛÍ]øÃ+ BRIGHT LIGHT BLACK  RED GREEN BLUE BROWN MAGENTA CYAN WHITE GREY GRAY YELLOW  ON ¬< tûN¿«è´ıtG€= uõë


echo €åğ€=tàÀÁÀÅÃ¹ ÿèÓÿ¬< tûN¿
echo è‡ıèÄÿ¬< tû<)t÷N€ıÿuùÃøÃ¸ÍÃFŠğ*ÒŠ<
echo t8ğtèŠûu Êë¤şÂëèF° ªŠÊÃ¬< tû<	t÷Nè+û€~ÿu„ÀtˆF€~ÿu„ätˆf¬< tû<	t÷N<"u¿@è¡ÿˆ@° ªëã<[uF€< r¬€<]uF¢i-ëÍÃ¿È?Æ ¬< tûN<:uïWŠ< v<,tè2úªFëï° ª_ÃLabel not found¿È?€= t	€} uÆ ùÃ‰úèw‰×€<u¾é!€<:u
echo èˆüu€< w:ÀÃè…úëÙ.BAT PATH%‰÷+Ò*ÉŠ„Àt<\uşÁ+Ò<.u‰úGëé‰ó¾R…Òu¬„Àªuúë‰×Šèù:u·FG„Àuñ„Éu‰Ú¹ ´NÍ!r¿>‰Ş¬„ÀªuúÃº V‰×¾WèYú° ª‰Ö€< têº>‰×€< t¬<;tªëó°\ªV‰Ş¬„Àªuú¹ ´NÍ!^rÓÃFile not found€fıº>‰×¬< tûNŠ,€ı+uF± Š< v<(t<,t<:u€ùu€|\u¤şÁëŞ;úv° ªV¿¼U‰Ö¬„Àªuú¾¼Uº>€ı+uèÓûë€ı:t¹ ´NÍ!sèêş^º>°@´=Í!s¾ôéØ‹Ø‰^¿¼U‰ú¹ÿ´?Í!rÇÆ;Ás€NÃöFuùş¼ÅróR‰òê»Õ¹ÿÿ‹^°´BÍ!èÂÿ‰ÖZÃ‹^´>Í!ÃŠ$ˆFÃèTırˆNÃèKırˆNÃ€N)è>ırˆN%s€f)÷Ãè/ırˆN$Ãè&ırˆN?ÃèırˆNÃèırˆN!ÃèırˆN ÃèırˆN"ÃèùürˆN#Ã€N*èìürˆNs€f*şë	€ığt€f*ıÃ¿°U€<'t€<"uèóüÃ¿>€<+uF‰úè¶úÃ€< v
echo €<;tèrøt¤ëî° ªÃ¿H>ëÙ¿È>ëÔ€<'t€<"uF¬Fëèë÷< t„Àu*ÀÃèàÿ„Àt¢g-ÃèÕÿ„Àt¢h-ÃèÊÿ„Àt¢j-Ã€<0u€f+şÃ€<1u€N)@Ã€<0uÆl- Ã€<0u€f)ßÃ€<1u€N+Ã€<1u€N+Ã€<1uÆ‹-Ãèt÷…Àt£z-Ã€<1u€Œ-@ÃBOXFRAME ]SOURCEFILE nPALFILE “FONTFILE ˜CHECKSYMBOL ºRADIOSYMBOL ÅBLINKMODE ÓKEYBFLUSH åELVAR ÛRIGHTESC ïDRAGANIM úERRORPAUSE ESCINPUT NOHIDECURSOR LISTHOTTICKS #HISYMBOL ĞMOUSERESET .SCREEN ÛBOXTITLE 6BOXHI $BOX äDIVIDER  SHADOW íBUTTON 	HOTKEY ?BAR TEXTHI TEXTTITLE - WBAT.INI ¾i‰ò°@´=Í!sº¼Uè­ør°@´=Í!r‹Ø¹ ¾¼Uèùør	¿9¾¼UèIøÃWBAT.TXT
echo +SANSERIF.FNT
echo +PAL.INI
echo ¾¦è¢ı¾¯èÆı¾½è»ıÃ¿¼U¾9€< t.‰û‰Ú°Wª¬„ÀªuúO¸= «Oèöû…Ût‰ÓÆ ¸
echo «ë‰×ƒÆëÍÿ¼Uv°ªè~ÿÃ¾°EŠfŠ~¶ €<ÿuÃ³ €<#u
echo €|#uFëŠ^F*Ò¬„Àt:j-u:uFèéïë†üëçŠN(Ñv° è²ï„ÛtŠN² *ÀŠãè¢ïŠfşÆ:vr¥ÃŠNˆNÇFÿÿ+Ò+É¬< tûN<(u$F¬< tûNèõt‹Ğ¬< tû<)t÷NëèvùrˆNëÒèöôt„ätşÌˆf„ÀtşÈˆFë¹‰6m-Ã¬< tû<,t÷N<#uñF³ è¥ô€û-u÷ØF¬< tûN<+t<-uŠØF¬< tûNëÚÿN¬< tû<,t÷Nèrô=v¸£q-¬< tûN<uèTíFÃ*É*äŠ<,t2<
echo t.<!t*<#t&F<&u:ÄtˆÄëáª€ü&t„Éu	è½óˆF
echo ˆNˆÄşÁëÈ€ü&uÆF
 echo €}ÿ uOşÉuõÃÆF! UƒÅ#¿˜@Šn+Ò¬< tû<,t÷N<
echo t4<!t0<#t,‰ûGèƒÿ„ÉuOëİˆşÆ8ÊsŠÑÆF	Šf‹^ ƒÅˆf‰^ ë¾Æ ÆF	 ]ˆv!Ã¹ ¿°E°ÿò®O¾˜@UƒÅ#¶ ŠVòŠÊ**íĞé N(Ê° óªŠF(Êó¤ŠÊ° óª€< t
echo ƒÅ° ªşÆëÎ¸ ÿ«]ÃS+Û€8 tCëø‹Ë[öFt
echo ŠV(Ês*ÒĞêë²Ã¾°E³ €<ÿuùÃèÍÿ:ßsÎFşÃëëøÃ‹v€<uùÃ…Ûtû¬<
echo uğ¬<
echo tûNKuçÃInvalid temp VAR file (W.BAT)ºH?°"´=Í!s¾šé“£~-‹|-¹ ‹Ø´?Í!r¾;Èv‰Á‰×°
echo ò®€=
echo uG€=@tñ‰>|-+É+Ò‹~-° ´BÍ!ÃW‹>|-ªÿ|-_ÃW‹>|-€<
echo t¤ëø‰>|-_°
echo èİÿ°
echo èØÿÃW‹>|-¬„ÀªuúO‰>|-_Ã¹
 echo +Ò÷ñ…ÀtRèñÿZ€Ê0ŠÂè­ÿÃº¼Õ‹|-)Ñ‹~-´@Í!+Ò+É´@Í!Ç|-¼ÕÃ‹~-ƒûv´>Í!Ã+ÿ*É*íöC,tˆÍöC, u
echo €{, tşÁƒÇëå€~drˆn°öf# ‹øöC	uÃŠ{şÏè—şrõŠC(Ğ*ä„Àt
echo €<tşÈFëò*íŠK*ÿŠ[)Ù…Ût€xÿ tşÁKuñ0ãÁ¬< v
echo èUñrèøşâñÃset WBAT= ¾èÿèdÿèışÃ¾èÿƒ~ÿt‹^èDşsèåşÃ»  €< uFëø€8
echo t€8tCëó…Ût	€xÿ uKuó…Ût
echo ¬<=u° è“şKuïè«şÃset  ¿  öC,uöC,t1€{01u+¾yè•ş‹s-Vè&ò…Ût	€xÿ uKuóÆ  ^¬„ÀtèLşëöèeşƒÇ€{, uºÃUƒÅ#*ÉöF	töFt‹v
echo èæñ¬< tûN„ÀuùëşÁƒÅ€~	 uÖ]Ã· UƒÅ#±öF	tşÇ8Ùs
echo şÁƒÅ€~	 ué· ˆû]Ãset ?= öFtòP¾èûıX…ÀtèşèåıÃ‹>|-‰>|-€<:u€>È? uë€<tæÿlõwàè›ğtõ¤€|ÿ
echo uîë×Ãƒ~ tùQR‹V*íŠs-ã°-èŠêâùZYÃ¹
 echo +Ò÷ñ…ÀtRèñÿZ€Ê0ŠÂ‡ÚŠÃèiê‡ÚÃƒ~ tùSQR‹^èÒÿ‰Ú*^:s-ˆs-s° èCêZY[ÃŠN€é° Šf
echo º è<êŠV*s*Ò€>i- t€ês*ÒĞê€ús²ŠnşÍşÍŠFŠèÿé8êsşÉuòÃ¾°UŠ^şËşË¶ *Ò¬èêŠN€é¬èåé¬èê„öt:ósƒîşÆ:vrÚ¾@€< tèzÿ€>i- t(*öŠV€ê€>@ u€>²U tşÊ°[è•é i-èé°]èŠéöFt*öŠV€úNwƒŠf°Üè®éÀÄ€ÌşÆşÊ:vs° è‘éëğŠf²°ßèé:VvöÃŠ~	Uı*À*ÒŠNèGéöF	t€~
echo  t
echo Šç*ÀŠVèYé]Ãè+ÿ¾°EŠ^Š~
echo ¶€<ÿt.è<û¬<u†ûë÷Šã<ÄuŠf€äŠF$ğ
echo à°Ä„ÀtèéëÙşÆëÍ¿# è‘ÿƒÇ€{	 uôÃŠfUıŠNöF	t‹v
echo èuïŠË„Ét:NvŠN€>‹-u+Òèkç*À+Òè«è]Ã‹„-8VvˆV8vvˆv*V*vÃèâÿ8VvˆV8vvˆvÃèÎÿ€~ÿuĞêˆV€~ÿuĞîˆvÃè´ÿ„Òt„öu€f÷öFtê„Òt€ê8VvˆV8vvˆvÃöFuùöF u<
echo uïë< uéWS¾¼Õè·çöFtèŞçU‹n èê]*Fs*À‰Fè“ÿ¾¼Õè“çöFtèçèIş[_+ÀÃèéér/„äu+ˆF*F<ı|€>i- uè›èë€>i- tèoè<
echo u¸ ;ÀëÿÃèÆÿtúUƒÅ#ˆß*Ûè¥ésşÃƒÅ€~	 uğˆûè?è<
echo u° ëè4èöF	t<
echo u°ÿ]Ãè‹ÿtúèrés+ÀÃŠN€é:áv¹ P„Àu¹ Që„äu¹ H„Àu¹ Ièòç<
echo u‰ÈÃ+ÀÃ„Àt
echo ŠN€é:Áv+ÀÃşÌˆà´ F9ØuèÇçë‹Ø+ÀÃUıW‹v
echo è£íè³ç<
echo uè ér
echo 8ØsŠØ€fş‰÷ŠNèlë_]<
echo u´	=İu°
echo Ã=
echo İt< t<
echo u´	ÃS‹s
echo è^í€4[° €<1u g-Uı*äº èÁæ]+ÀÃ=
echo İt< t<
echo u´	Ã€ù0túSW¾˜Eè$íˆ+ÿ€{,u° 8K0u h-Uk#*äº è€æ]ƒÇ€{, uÚ+À_[Ã0. !"#$%&21/-,öFtß„Àu¾  8¤ÑtFƒşrôÃ‹ÆA< v÷Š~	èëUƒÅ#· öF	t< t:F
echo uˆû¸
echo  ëƒÅşÇ€~	 uß]ÃŠ~!şÏ=
	u:ßs†à„Àt*ä<	t€üMu:ßsşÃë³ Ã€üt€üKu„ÛtşËëˆûÃ€üGu³ Ã€üOuˆûÃ€üPt€üHuõ‰şˆßŠj± ƒş#t8jõu	ƒîşÏşÁëí€üPuƒÆşÇ€z	 u*ÛÃ8jvíŠjë$ƒş#uŠ^!şËÃƒîşÏŠjƒş#t8jõuƒîşÏëï„ÉtƒÆ€z	 t8juşÇşÉuèˆû+ÀÃè‚ã+À+ÛùÃPSè`÷rğ¿˜A*äÍ‹Â‡x-)Ğ±;z-w€= t€= tGëø€áşZXèäé*ä‰¿˜AöÁt¬<uöÁu®€É‹v+Òë<
echo uè€<
echo uFB€É¬< tûN+Û€9 tŠ è¤é:uCëïë¾‰Ó+ÀÃ‹N!I€üPu9ËsC€üHu…ÛtKŠV*ö€ê€üQuÚ9Ëv‹Ù€üIu+Ús+Û€üGu+Û€üOu‹ÙÃè6ú‹^è”örôŠ„-¶²¬<
echo t<t8ÊsŠfè<äëë¬<
echo tûNŠFşÈşÆ8ÆrØÃ‹N‹F‹Ğ+Áv)FëV€Ö ƒê)ÑvNè¢ÿ‹F+F@ˆF&Ã °Uƒ~ t°+Òè¶ã‹F!+FŠv€î„äu8ğv°ë ¶UŠvşÎ*Òè‘ãÃ‹F;F!rÇv-+À‰FÃ*äÍ‰o-èáÿèyÿ¿# è¢ÿè’úèéå€fş‹^€üİuè2ûèôû…Àu	€N;^tŞPSèòù[X< s„Àuè»ş‰^Ç˜A  ëè,şr‰^€üku°<
t<uÃ*äÍ‰o-èsÿŠf-è‚ü°öf# ‹øèúöC	t€KöFuöC	tèàûëèXåöC	t<
u°ÿ€fşŠ^€üİuè•úèû„Àu	€N:^tÁPèVùˆ^°öf# ‹øXöC	tèÍûöC	tŠK
èõûèXüè¦üˆ^P°öf# ‹øX€üku°…Àt€~!u€{	t<
u
öC	 t°ë<téBÿÃÆF	€<?uF€N	 ° ª²´&Š<
t6<t2<]uFë+F<&u
8u¤şÂ*ÀˆÄëİª< t€ü&u	èçˆF
ˆVˆÄşÂëÄ° ªşÂ€ü&uÆF
 ÃÆF	W‹>c-‰~
è–è‰>c-ˆN€f V‰Ş¬< tû<,t÷NèÓæ<Uu€NFëè<Pu€NFëİ<!u€NFëÒ</uFëË^_V‹Ê‹v
è7è¬„ÀtöFt°*ˆDÿªâíã° óª^Ã"Max 9 checkboxes or radio buttons!ÆF	şe-Še-€ù9v¾ª!éxW‹>c-‰~
èpè± <1uŠg-‰>c-_°[ªˆÈªF°]ª²€<
t€<]uFÃF€<
t
¬şÂ<]tªëñ° ªÃÆF	ÇF
˜Eşf-Šf-€ù9v¾ª!éˆN
°(ª° ªF°)ª²€<
t€<]uFÃF€<
t
¬şÂ<]tªëñ° ªÃŠn)‹^#°öfUƒÅ#è‰VÆFˆn‰^ F€<$uè–şë€<!uè'ÿë
€<.uèzÿëèşˆVVŠvÆF ]şFÃ‰óè0æuø€<_t Êë+Ş÷Û€<_uFCë÷Ó*í)Ër‹Ë° óªëû:ÀÃText too largeMin 2 radio buttons!ÆF Š@€Á€>i- t€ÁˆN€<:t¾¿°E¶²Š<tU<
tQ<^u	€|
uFëD€<[u€|[uFëèÿë/èYÿt*<#?u‰V¸  «FFşÂşÂëŠ&j-8$u
F8$t°ªë¤şÂë¥şÂ8VsˆVşÆ° ª¬<
tûN¬<
tûN<t<:u€>È? u	:6…-sépÿ°ÿªŠFˆF!şÆˆv¡„-8fw8Fv¾ù"él	Šf-€ù0t€ù1u¾#éX	¿˜Eè€æ¢f-Ã‰vŠ@€Á€>i- u€>@ uÆi-x€ÁˆNÇF  ÆF,ÆF0 ÆF: ¹  ²*äŠ<
t<tşÂşÄFëïşÂşÂ8VsˆVA¬<
tûN¬<
tûN<t<:u€>È? tÆëş¼Õr¸¾ù"éÉ„äuI‰N! „-8FvˆFŠFşÈşÈˆF'AA …-,Šf€üÿt:àvˆÄˆfë´ *Ä:ÈvˆÁˆNÃÇF  ¿°EÇ ÿ€<:tî² Š<t$<
t èÍıt¬<^u€<
u° ª:j-u8uşÂëÖŠÂ*„-v*ä)Ç(Â° ª8VsˆVşF¬<
tûN¬<
tûN<t<:u€>È? u …-8Fr•°ÿªÃ¿°EÇF  €<"t€<'tÃŠ$FÆF² 8VsˆV€<
t¬:Ät<^t€úPr	N° ªşFëÚªşÂë×° ª¸ ÿ«‰6m-Ã€Nè¨ÿ€~ tşFşF€FŠFˆF&èÈîRèîZ‰6m-€~! tĞşÂşÂŠâ€ús²€äâˆÓŠÃöæ,8FsˆFŠV(ÂĞê€FşÂŠv&¿  ˆs&ˆS%ˆ['ÆC(ƒÇ€{, tÓşÂëä€Æˆvè»îÃ¬< tûNèZâŠv„ÀtŠğşÎ¬< tû<+t÷<,tóNè>âŠĞÃ+Ò‰Vè@ÛÆF èÉÿ„Òu²2¬< tûNŠf<(uFè­ærˆÌ‰6m-ŠFèÑÜÃ‰6m-ºH>¿¼Uè‚åÃ¬< tûNèïá‰6m-€>È> të»<!u»!SºÈ>¿¼Uè°å[rÔŠ>…-ˆ…-:ßtÈvˆş²° Šfè}Üë‹VşË:óvˆŞ‰Vè­ÚÃ¬< tû<,t÷Nè/ÿŠÊ‰6m-Š~şÏ:vvŠv ÎŠÎ(ùœ:÷vˆş*Ò‰VèwÚvÇ+Û´ÍŠüˆÈ+É‹Vê´ÍÃ[C$
   
$èFÚ‰ÓºK'´	Í!´Íè6Ú*Ó€úu ²´Í!¬< tûN¬<
t<!tŠĞ´Í!ëïNëşk-ºO'´	Í!‰6m-ÃTEMP%WSCREEN. ¬< tûNèäà<ÿv°ÿŠØ‰6m-¿H?¾Ÿ'èOáƒù v	€}ÿ\t°\ª¾¤'¬„ÀªuúOŠÃèşà° ª¡„-öäÀ‰ÁÃV¾¼ÕèŸÚ^è­ÿQºH?+É´<Í!Yrçº¼Õ‹Ø´@Í!´>Í!ÃèÿºH?*À´=Í!rñº¼Õ‹Ø´?Í!´>Í!ºH?´AÍ!¾¼ÕèlÚÃNo itemsSyntax error¬< tû<,t÷N<@uFëöFu<:t<+uÊè‡æè`åè_ë‰6m-¾¼UèŠårèóäèAàè4ç+ÀÃÆF èğê€~ t€ığu".†-€fnè ÿuèüëè–üèÈñèUêÃ€NöF@t¸ Í!è©êöFtŠNˆN)öFtŠF	$Šf)€äğ
ÄˆF	öFuŠN)ˆN	èLÿuè
úëöFt¾M(é;è‡ü€~! u¾D(é,èpñè‡ñ¾¼Õè_ÙöFtè’Ùè£ğè¶ö<u³dˆ^ëèoîsˆNè3ØëåŠ^şÃèîˆk-öFu¾¼ÕèHÙöFtèoÙèÚ€>H? tè'ìƒ>~- t€>k-duöFtèÖíèoí k-*äèsîè£ìÃ€NöF@t¸ Í!è½éŠNˆN)€füè„şuè3úë¾M(éyè½ğèÔğ¾¼Õè¬ØöFtèßØƒ~! vèßôèõë°<u	³şÇFÿÿë³ ˆk-öFu¾¼ÕèœØöFtèÃØèiÙ€>H? tè{ëƒ>~- t
èàì‹F@èØíèìÃ †-ˆFè6é„öuşÎ„ÒuşÊ¡„-‹^8çvŠü8ÃvŠØ‰^)Ø8ævŠô8ÂvŠĞ‰V¿°E+Û¬< tûN<"uèÁâŠù¬< tûN<+uFèëİŠØ‰6m-„ÿu¶ *À*ÒŠNèUØşÆ:vrïÃ¶ ¾°E„ÛtŠÃöæö÷ˆà˜Æ*ÒŠN€< u¾°E¬èMØşÉuğşÆ:vrÒÃNo fileèQıt¾ş*éKè+íèBëÃ¬< tûNèyİ‰6m-¢k-Æ€  ÃFILL –-R*CLS €-_&CLEAR €-g&CURSOR €-û&PAL €-”&FONT €-¢&ANSI? €-U'TEXT –-š(BOX –-Ï(MENU –-Ë(LIST –-·)STDOUT –-+SAVE €-õ'RESTORE €-(EL €-+ FIX WBAT Æk- Æ°EÿÆ¼U €f)üÇF  ¬< tûN¿º+èäŞu€N)¬< tûN¿¾+èÒŞ¬< tûN¿.+èÆŞtƒÇ€= uó¾M(èÜ¾ZéAU‹-ÿU]‹6m-¬< tû<,t÷N<
t¬<!u÷¬< tûN<
u€Ã Æ FVºH?¾D,èßŞ^‰×¹@ ° ò®OŠ< u°WÆ ´.«¸BA«¸T «€<
t€<"uÆ FëğÃWBAT (any key to continue)¿Ç-¹ ° óªèïÔ‰VèÕ¿È=¹è° óª¿°U¹	 ° óª¾ €<\u€< tÆ Fëõ¬< tûN<$uè\ÿèÚåèƒåèçåè6×‹^è_à¸ D» Í!öÂ€uÇ~- ¾ è¯şèbé½€-‹Vè‡Ôè˜Öè°Ô€>k-ÿu(€>€  t!V¾…,è×Ú¾€ èàÚ^èÜÚöF+t
¾‹,èĞÚ´Í!´L k-Í!Æk-ÿë´˜A00x* ~       ÿÿ

   ¼Õ      P  ¸           €-    ğÏô¤_ó   (             –- p       Video mode not supported¼È=¾ ¬< tûN</?t<
u¾-è$Ú¾ZèÚéOÿ»\´JÍ!¸ÿLsÍ!ŒÈ¸ Í= t
ÆSÆTè·Ó<ÿu¾È-é%ÿºÈ=´Í!½€-é^ş > WBAT.COM

