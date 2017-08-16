rem Prepare to create install

cd "%~dps0%"

::copy /y help.doc FTPDB
copy /y gdbutils.dll FTPDB
copy /y FTPDB.GDB FTPDB
copy /y FTPDB.zip FTPDB
copy /y FTPDB_Install.bat FTPDB
copy /y FTPDB_Uninstall.bat FTPDB
copy /y FTPDB_Start.bat FTPDB
copy /y FTPDB_Stop.bat FTPDB

copy /y FTPDBCP\Icon.ico FTPDB
copy /y FTPDBCP\FTPDBCP.cpl FTPDB

copy /y FTPDBWeb\FTPDBWeb.exe FTPDB\FTPDBWeb
copy /y FTPDBWeb\Files\Exit.htm FTPDB\FTPDBWeb\Files
copy /y FTPDBWeb\Files\*.bmp FTPDB\FTPDBWeb\Files
copy /y FTPDBWeb\Files\BSHOW.GIF FTPDB\FTPDBWeb\Files
copy /y FTPDBWeb\Files\MAINPIC.GIF FTPDB\FTPDBWeb\Files

copy /y FTPDBDaemon\FTPDBDaemon.exe FTPDB\FTPDBDaemon

copy /y Help\FTPDBHelp.chm
copy /y Help\FTPDBHelp.chm FTPDB

copy /y FTPDBWeb.log FTPDB\FTPDBWeb

copy /y cmdow.exe FTPDB
copy /y License.txt FTPDB
