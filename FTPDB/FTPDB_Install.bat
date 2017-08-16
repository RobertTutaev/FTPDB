rem Installation FTPDB

cmdow @ /HID

reg add "HKLM\SYSTEM\ControlSet001\Services\FTPDBWeb" /v DependOnGroup /t reg_multi_sz /f
reg add "HKLM\SYSTEM\ControlSet001\Services\FTPDBWeb" /v DependOnService /t reg_multi_sz /d FirebirdServerDefaultInstance /f
reg add "HKLM\SYSTEM\ControlSet001\Services\FTPDBDaemonService" /v DependOnGroup /t reg_multi_sz /f
reg add "HKLM\SYSTEM\ControlSet001\Services\FTPDBDaemonService" /v DependOnService /t reg_multi_sz /d FirebirdServerDefaultInstance /f
reg add "HKLM\SYSTEM\ControlSet001\Services\FTPDBDaemonService" /v Description /t reg_sz /d "Scan FTP resources" /f

FTPDBDaemon\FTPDBDaemon.exe /install /silent
FTPDBWeb\FTPDBWeb.exe /install /silent

netsh firewall add allowedprogram program=FTPDBWeb\FTPDBWeb.exe name=FTPDBWeb mode=enable scope=all profile=all
netsh firewall add allowedprogram program=FTPDBDaemon\FTPDBDaemon.exe name=FTPDBDaemon mode=enable scope=all profile=all

@echo off
for /f "skip=4 tokens=3,4,5,6,7" %%a in ('reg query "HKLM\Software\Firebird Project\Firebird Server\Instances" /v DefaultInstance') do if /i not "%%a"=="" (if /i not "%%b"=="" (if /i not "%%c"=="" (if /i not "%%d"=="" (if /i not "%%e"=="" (set result=%%a %%b %%c %%d %%e) else (set result=%%a %%b %%c %%d)) else (set result=%%a %%b %%c)) else (set result=%%a %%b)) else (set result=%%a))
if /i not "%result%"=="" set result=%result%UDF\
@echo on
if /i not "%result%"=="" copy /y gdbutils.dll "%result%"

copy /y FTPDBCP.cpl "%WINDIR%"\system32\
call FTPDB_Start.bat

