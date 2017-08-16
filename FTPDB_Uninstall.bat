rem Uninstallation FTPDB

cd "%~dps0%"
cmdow @ /HID

call FTPDB_Stop.bat

call FTPDBWeb\FTPDBWeb.exe /uninstall /silent
call FTPDBDaemon\FTPDBDaemon.exe /uninstall /silent

netsh firewall delete allowedprogram program=FTPDBWeb\FTPDBWeb.exe profile=all
netsh firewall delete allowedprogram program=FTPDBDaemon\FTPDBDaemon.exe profile=all

del "%WINDIR%"\system32\FTPDBCP.cpl
