@ECHO OFF
SET /A DELAY=1
:REP
SET /A DELAY=DELAY+1
IF %DELAY% LSS %1% GOTO REP
@ECHO ON