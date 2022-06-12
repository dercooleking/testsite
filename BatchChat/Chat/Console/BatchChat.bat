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
echo USERNAME BREITS VERGEBEN BITTE W�HLE EINEN ANDEREN!!
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
if "%status%"=="NichtSt�ren" set status=Nicht St�ren
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
if "%status%"=="NichtSt�ren" (
set status=Nicht St�ren
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
echo Dein Geld wird auf 10000$ zur�ck gesetzt!
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
echo Danke f�r deine Geduld hier sind 100$
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
echo Bitte gebe den Usernamen ein dem du eine Nachicht schicken m�chtest!
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
echo Bitte gebe das Passwort f�r den Clan %clan% ein!
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
echo Bann konnte nicht ausgef�hrt werden!
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
echo Bitte gebe das Passwort f�r diesen Clan ein!
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
for /F "usebackq" %%� in (%drive%\BatchChat\bin\money\Max.money) do set moneyclan=%%�
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
if "%status_ei%"=="Nicht st�ren" goto status_st�ren
if "%status_ei%"=="Online" goto status_online
if "%status_ei%"=="Offline" goto status_offline
goto set_status

:status_st�ren
set old_status=%status%
set status=Nicht St�ren
echo set message=[%time%] {%user%} Has updatet the Status from %old_status% to %status% > %drive%\BatchChat\chat_text\text.bat
echo NichtSt�ren > %drive%\BatchChat\bin\status\%user%_%id%.dll
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
echo		R�nge:
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
echo set message=[%time%] {Version} Version wurde von %user% ge�ndert
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
if %admin%==2 echo set message=[%time%] {%server%} Admin w�nscht viel Spa?im Chat > %drive%\BatchChat\chat_text\text.bat

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
	echo Dr�cke eine belibige Taste um deinen Pause status zur�ckzusetzen
	pause>nul
	set status_2=0
)
if "%status_2%"=="0" (
	echo set message= > %drive%\BatchChat\chat_text\text.bat
	echo set message=[%time%] {%server%} %user% ist aus seiner Pause zur�ck! > %drive%\BatchChat\chat_text\text.bat
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
echo ��,��������             ��������             ,WBAT ver 2.50 (c) 1999-2005, Horst SchaefferFor information run Demo.bat
echo $�~w*��~  tvV�n ���S�+��[�S*���[�PS*���[X�PS����[X�Q��-���Y�Q��-�� ���Y����RU��]���Z�U��-*���� ��F	��$<t<u���F	�@ �ۊ� �È^�<u��v���V]Ê�U��-�F�F����f+��Ä�u&����]ÊfRU� ��F]P�P��*�����XZ�������������������&��FF���ÊN+�*�Q���Y��:vr�ÊN+�*�Q���Y��:vr�ÊN+�*�Q��Y��:vr��*�*�V�����:vr��N�}��*�*�V�����:vr��N�u��W�A����_Êf� ��WS�.� ʄ�t&�G��t&�%G��[_ÊfQ� ���Y�WSP�����&�%�&%X[_Ê� �:vsQ�N*���Y��8�r��W���&�_�R� �3��������Z���-�u�PSQR� �3��u��&�-�ZY[X���-�u������-@t�! �3����-�+���-t
echo ��-u�
echo ���@ ��&�l À�-���-�u�3�5�!��	�t���� �3���t����-������r�������-�u� �3�P��-�u� �3X���t�À�t�Ft�
echo ݀f��;N
echo t�Ft�N� ���Fu�;Vt��Fu��+F= v	�N�
echo ��+�Àf�;N
echo t�f������t���u�Ft��+F= s�!���
echo ݀N�S����[�t����u���U��-+��F�u(SQR���N
echo �����+��Ft�5������t�VZY[]�SRU��+��C��F
echo ](�r(�r	:Fs:f�s��Z[� QR*��+o-�
 echo �⹶ ��+q-r+���ZYÊ&S�t�&T�<�u��v*��+���������/�����u�O�<uU��-�z�]s�>l- u+���u$�>q- t���t;t-s�t-U��-��]뷡v-�#= �tP�>q- t�>t- tU��-�k]�q-  X�5��9�v��� �À9 u�Å�tK����+�*�9 tC9�r�� ���S���9�[r�J�S9�s�C��[C�9�r�6��C��u� �K�9 t�Q��*�K�9�w�YÀ��u���u+����s���8�u��^� �Àf�Q��-�Ft�����Y�*�F���Q:Nv�N*Ҭ��t
echo �Ft�*�f����� �8�Y�<�t< r<u��u;�������u6�Ft�&�Ft	< t+�� 8�s�Ft����-��< t�a�+��<u	��t�(��g= Gu+��^= Ku��tK�R= Ru�v�G= Ou���== Mu�9 tC�0���t= Su�Fu
echo =u��t+�� �= Su����= �u+��:^v�^�F *�*��N��Ft�= u8^v�^��*Fv8Fs�F�����*ҋ�*Fr�����������t�����f���t�����ÊF*�� �@�!�����w� �@�!�<w<ar<zw$��S�  :�u���
echo �� tC��r�[�<0r<9v0<@r<Zv(<ar<zv <�r<�v<�r<�v<$t<-t<_t<?u����RSQ��+��
echo  �*��08�sF�����;�Y[Z�V����ج< t�<,t�N�����[;�À<t�<
echo u��<
echo uFõ
echo *�����tP���X��0���*ɀ<%u�F�<%u
echo À<0r	�<9wF*��RS�, ����  �ր<%u&�==t;������&����FG:�t� � �&�= u�+ɉ߉ր<
echo t�<%u���%GA���FG+�&�G��t�CA���[Z:��WV�, �  �޹  �|� t� � �&�= u�+��NO+�&�� ��tC��^_ì<=u��  �8 tC��É�NVFF�< t�N<0r<9v<]u�IN���< v<,t
echo <]t�*����N�= �O�y��< t�<,t�N�|�=� v�� �ň�8�s�ˉ�<]t<
echo u�NX��)�u8�s���8�v��*�ϰ ��WCB ��V�[
echo ����u�O�Ȫ^�= �O���0�=1u��*��WRB= ��QV��
echo ����u�O���^Y�<1r:�v�1*�ì<
echo u��<
echo uF�< t�<	t�N<
echo t�<;t��+ۀ9 t� �X�:uC��C�9 u����0�y�����<t��< t�W���t�}�= t�= u���< t�<	t�<:t�<=t�N<
echo t<;t�_�}��R�, K��&� ��� ��u9&�= u�]+ɉ�&�C�G<\u�τ�u����+ۊ �C�8 v�8;u�� ���Zð@�=�!r��؃���?�!r�P�>�![� 
echo �@�    * *  ***  *(2666..?0:0$<8???<6,???� �=�!rǉ� �ش?�!����>�!����� � �< t�<	t�N��t�=? v�? �����Ju�ÍuC��s�0 ��W�}��0r��1v����_WW� ���<r�� �Z���� ��� �_� +ۍU���S���]�[r���uV� FF� �FFJu�^U� +ҋ�*��]��+ BRIGHT LIGHT BLACK  RED GREEN BLUE BROWN MAGENTA CYAN WHITE GREY GRAY YELLOW  ON �< t�N����tG�= u��


echo ����=t�����ù �����< t�N�
echo ������< t�<)t�N���u���ø��F��*Ҋ<
echo t8�t��u �������F� ���ì< t�<	t�N�+��~�u��t�F�~�u��t�f�< t�<	t�N<"u�@���@� ���<[uF�< r��<]uF�i-��ÿ�?� �< t�N<:u�W�< v<,t�2��F�� �_�Label not found��?�= t	�} u� �É��w�׀<u��!�<:u
echo ��u�< w:������.BAT PATH%��+�*Ɋ��t<\u��+�<.u��G���R��u����u���׊��:u�FG��u��u�ڹ �N�!r�>�ެ���u�ú V�׾W�Y�� ��ր< t�>�׀< t�<;t���\�V�ެ���u�� �N�!^r��File not found�f��>�׬< t�N�,��+uF� �< v<(t<,t<:u��u�|\u�����;�v� �V��U�֬���u���U�>��+u������:t� �N�!s���^�>�@�=�!s�����؉^��U�����?�!r��;�s�N��Fu�����r�R���չ���^��B�!�����ZË^�>�!Ê$�F��T�r�N��K�r�NÀN)�>�r�N%s�f)���/�r�N$��&�r�N?���r�N���r�N!���r�N ���r�N"����r�N#ÀN*���r�Ns�f*��	���t�f*�ÿ�U�<'t�<"u���ÿ>�<+uF����À< v
echo �<;t�r�t��� �ÿH>�ٿ�>�Ԁ<'t�<"uF�F����< t��u*�������t�g-������t�h-������t�j-À<0u�f+�À<1u�N)@À<0u�l- À<0u�f)�À<1u�N+À<1u�N+À<1u��-��t���t�z-À<1u��-@�BOXFRAME ]SOURCEFILE nPALFILE �FONTFILE �CHECKSYMBOL �RADIOSYMBOL �BLINKMODE �KEYBFLUSH �ELVAR �RIGHTESC �DRAGANIM �ERRORPAUSE ESCINPUT NOHIDECURSOR LISTHOTTICKS #HISYMBOL �MOUSERESET .SCREEN �BOXTITLE 6BOXHI $BOX �DIVIDER  SHADOW �BUTTON 	HOTKEY ?BAR TEXTHI TEXTTITLE - WBAT.INI �i��@�=�!s��U��r�@�=�!r�ع ��U���r	�9��U�I��WBAT.TXT
echo +SANSERIF.FNT
echo +PAL.INI
echo �������������ÿ�U�9�< t.���ڰW�����u�O�= �O�����t��� �
echo ���׃��́��Uv���~�þ�E�f�~� �<�uó �<#u
echo �|#uF��^F*Ҭ��t:j-u:uF��������N(�v� ���t�N� *�����f��:vr�ÊN�N�F��+�+ɬ< t�N<(u$F�< t�N��t�Ь< t�<)t�N��v�r�N�����t��t�̈f��t�ȈF빉6m-ì< t�<,t�N<#u�F� ���-u��F�< t�N<+t<-u��F�< t�N���N�< t�<,t�N�r�=v��q-�< t�N<u�T�F�*�*�<,t2<
echo t.<!t*<#t&F<&u:�t���᪀�&t��u	��F
echo �N�����Ȁ�&u�F
 echo �}� uO��u���F! U��#��@�n+Ҭ< t�<,t�N<
echo t4<!t0<#t,��G����uO�݈��8�s���F	�f�^ ���f�^ �� �F	 ]�v!ù ��E���O��@U��#� �V��**��� N(ʰ �F(��ʰ �< t
echo ��� ����θ ��]�S+ۀ8 tC����[�Ft
echo �V(�s*�����þ�E� �<�u�����:�s�F�����Ëv�<u�Å�t��<
echo u�<
echo t�NKu��Invalid temp VAR file (W.BAT)�H?�"�=�!s����~-�|-� �ش?�!r�;�v���װ
echo �=
echo uG�=@t�>|-+�+ҋ~-� �B�!�W�>|-��|-_�W�>|-�<
echo t����>|-_�
echo ����
echo ����W�>|-����u�O�>|-_ù
 echo +����tR���Z��0����ú�Ջ|-)ы~-�@�!+�+ɴ@�!�|-��Ë~-��v�>�!�+�*�*��C,t���C, u
echo �{, t������~dr�n��f# ���C	uÊ{����r��C(�*��t
echo �<t��F��*�K*��[)م�t�x� t��Ku�0���< v
echo �U�r������set WBAT= ����d����þ���~�t�^�D�s���û  �< uF���8
echo t�8tC���t	�x� uKu��t
echo �<=u� ��Ku����set  �  �C,u�C,t1�{01u+�y���s-V�&��t	�x� uKu��  ^���t�L����e����{, u��U��#*��F	t�Ft�v
echo ���< t�N��u�������~	 u�]÷ U��#��F	t��8�s
echo �����~	 u� ��]�set ?= �Ft�P����X��t�����Ë>|-�>|-�<:u�>�? u�<t��l�w���t���|�
echo u���Ã~ t�QR�V*�s-��-����ZYù
 echo +����tR���Z��0�ڊ��i��Ã~ t�SQR�^�����*^:s-�s-s� �C�ZY[ÊN��� �f
echo � �<�V*s*Ҁ>i- t��s*����s��n���͊F����8�s��u�þ�U�^���˶ *Ҭ��N���������t:�s����:vrھ@�< t�z��>i- t(*��V���>@ u�>�U t�ʰ[��i-��]���Ft�*��V��Nw��f������������:vs� �����f�����:Vv�Ê~	U�*�*ҊN�G��F	t�~
echo  t
echo ��*��V�Y�]��+���E�^�~
echo ��<�t.�<��<u������<�u�f���F$�
echo �Ą�t�������Ϳ# �����{	 u�ÊfU��N�F	t�v
echo �u�˄�t:Nv�N�>�-u+��k�*�+���]Ë�-8Vv�V8vv�v*V*v����8Vv�V8vv�v�����~�u��V�~�u��v�����t��u�f��Ft����t��8Vv�V8vv�v��Fu��F u<
echo u��< u�WS������Ft���U�n ��]*Fs*��F��������Ft���I�[_+�����r/��u+�F*F<�|�>i- u����>i- t�o�<
echo u� ;�������t�U��#��*���s�Ã��~	 u����?�<
echo u� ��4��F	t<
echo u��]���t��r�s+�ÊN��:�v� P��u� Q���u� H��u� I���<
echo u���+�Ä�t
echo �N��:�v+���̈� F9�u������+��U�W�v
echo ����<
echo u� �r
echo 8�s�؀f����N�l�_]<
echo u�	=�u�
echo �=
echo �t< t<
echo u�	�S�s
echo �^�4[� �<1u�g-U�*� ���]+��=
echo �t< t<
echo u�	À�0t�SW��E�$�+��{,u� 8K0u�h-U�k#*� ��]���{, u�+�_[�0. !"#$%&21/-,�Ft߄�u�  8��tF��r�Ë�A< v��~	��U��#� �F	t< t:F
echo u���
echo  ����ǀ~	 u�]Ê~!��=
	u:�s����t*�<	t��Mu:�s���� À�t��Ku��t�����À�Gu� À�Ou��À�Pt��Hu����ߊj� ��#t8j�u	���������Pu���ǀz	 u*��8jv�j�$��#u�^!��Ã��ϊj��#t8j�u�������t���z	 t8ju����u��+����+�+���PS�`�r�A*���x-)б;z-w�= t�= tG�����ZX���*���A��t�<u��u����v+��<
echo u�<
echo uFB���< t�N+ۀ9 t� ��:uC��뾉�+�ËN!I��Pu9�sC��Hu��tK�V*�����Qu�9�v�ـ�Iu+�s+ۀ�Gu+ۀ�Ou����6��^��r��-���<
echo t<t8�s�f�<���<
echo t�N�F����8�r�ËN�F��+�v)F�V�� ��)�vN���F+F@�F&à�U�~ t�+���F!+F�v����u8�v����U�v��*���ËF;F!r�v-+��F�*���o-����y��# �������f��^���u�2������u	�N;^t�PS���[X< s��u���^��A  ��,�r�^��ku�<
t<u��*���o-�s��f-����f# �����C	t�K�Fu�C	t�����X��C	t<
u���f��^���u������u	�N:^t�P�V��^��f# ��X�C	t����C	t�K
����X����^P��f# ��X��ku���t�~!u�{	t<
u
�C	 t��<t�B���F	�<?uF�N	 � ���&�<
t6<t2<]uF�+F<&u
8u���*����ݪ< t��&u	��F
�V�����İ ���&u�F
 ��F	W�>c-�~
��>c-�N�f V�ެ< t�<,t�N���<Uu�NF��<Pu�NF��<!u�NF��</uF��^_V�ʋv
�7謄�t�Ft�*�D������ �^�"Max 9 checkboxes or radio buttons!�F	�e-�e-��9v��!�xW�>c-�~
�p� <1u�g-�>c-_�[��ȪF�]���<
t�<]uF�F�<
t
���<]t��� ���F	�F
�E�f-�f-��9v��!��N
�(�� �F�)���<
t�<]uF�F�<
t
���<]t��� �Ên)�^#��fU��#�V�F�n�^ F�<$u����<!u�'��
�<.u�z�����VV�v�F ]�FÉ��0�u��<_t ��+��ۀ<_uFC���*�)�r�˰ ���:��Text too largeMin 2 radio buttons!�F �@���>i- t���N�<:t���E���<tU<
tQ<^u	�|
uF�D�<[u�|[uF����/�Y�t*�<#?u�V�  �FF������&j-8$u
F8$t���������8Vs�V�ư ��<
t�N�<
t�N<t<:u�>�? u	:6�-s�p�����F�F!�ƈv��-8fw8Fv��"�l	�f-��0t��1u�#�X	��E��f-Év�@���>i- u�>@ u�i-x���N�F  �F,�F0 �F: �  �*�<
t<t����F������8Vs�VA�<
t�N�<
t�N<t<:u�>�? t������r���"����uI�N!��-8Fv�F�F���ȈF'AA��-,�f���t:�v�Ĉf�� *�:�v���N��F  ��E� ��<:t� �<t$<
t ���t�<^u�<
u� �:j-u8u���֊�*�-v*�)�(° �8Vs�V�F�<
t�N�<
t�N<t<:u�>�? u��-8Fr����ÿ�E�F  �<"t�<'tÊ$F�F� 8Vs�V�<
t�:�t<^t��Pr	N� ��F�ڪ���װ �� ���6m-ÀN���~ t�F�F�F�F�F&���R��Z�6m-�~! t������s����ӊ���,8Fs�F�V(���F�v&�  �s&�S%�['�C(���{, t�������v��ì< t�N�Z�v��t���ά< t�<+t�<,t�N�>���+҉V�@��F �����u�2�< t�N�f<(uF��r�̉6m-�F���É6m-�H>��U��ì< t�N���6m-�>�> t�<!u�!S��>��U��[rԊ>�-��-:�t�v���� �f�}���V��:�v�މV��ì< t�<,t�N�/��ʉ6m-�~��:vv�v Ί�(��:�v��*҉V�wڝv�+۴�����+ɋV�����[C$
   
$�FډӺK'�	�!���6�*Ӏ�u ���!�< t�N�<
t<!t�д�!��N��k-�O'�	�!�6m-�TEMP%WSCREEN. �< t�N���<�v���؉6m-�H?��'�O�� v	�}�\t�\���'����u�O����� ���-������V�����^��Q�H?+ɴ<�!Yr纼Ջش@�!�>�!����H?*��=�!r�Ջش?�!�>�!�H?�A�!����l��No itemsSyntax error�< t�<,t�N<@uF��Fu<:t<+u����`��_�6m-��U��r����A��4�+���F ���~ t���u".�-�fn��u���������U�ÀN�F@t� �!���Ft�N�N)�Ft�F	$�f)���
ĈF	�Fu�N)�N	�L�u�
���Ft�M(�;���~! u�D(�,�p�����_��Ft������<u�d�^��o�s�N�3���^����k-�Fu����H��Ft�o��ڀ>H? t�'�>~- t�>k-du�Ft����o�k-*��s���ÀN�F@t� �!��N�N)�f���u�3���M(�y���������Ft��؃~! v�������<u	���F���� �k-�Fu������Ft����iـ>H? t�{�>~- t
���F@�����à�-�F�6��u�΄�u�ʡ�-�^8�v��8�v�؉^)�8�v��8�v�ЉV��E+۬< t�N<"u�����< t�N<+uF��݊؉6m-��u� *�*ҊN�U���:vr�ö ��E��t����������*ҊN�< u��E��M���u���:vr��No file�Q�t��*�K�+��B�ì< t�N�y݉6m-�k-��  �FILL �-R*CLS �-_&CLEAR �-g&CURSOR �-�&PAL �-�&FONT �-�&ANSI? �-U'TEXT �-�(BOX �-�(MENU �-�(LIST �-�)STDOUT �-+SAVE �-�'RESTORE �-(EL �-+ FIX WBAT �k- ��E���U �f)��F  �< t�N��+���u�N)�< t�N��+��ެ< t�N�.+���t���= u�M(�ܾZ�AU�-�U]�6m-�< t�<,t�N<
t�<!u��< t�N<
u�� � FV�H?�D,���^�׹@ � �O�< u�W� �.��BA��T ��<
t�<"u� F���WBAT (any key to continue)��-� � ���ԉV�տ�=��� 󪿰U�	 � 󪾁 �<\u�< t� F���< t�N<$u�\����������6׋^�_� D� �!�u�~- �� ���b齀-�V�����Ԁ>k-�u(�>�  t!V��,��ھ� ���^����F+t
��,��ڴ�!�L�k-�!�k-�봘A00x* ~ �      ��

   ��      P� �           �-   �����_��   (             �- p       �Video mode not supported��=�� �< t�N�</?t<
u�-�$ھZ���O��\�J�!��Ls�!�ȸ �= t
�S�T��<�u��-�%���=��!��-�^� > WBAT.COM

