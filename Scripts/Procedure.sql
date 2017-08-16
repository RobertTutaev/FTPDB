CREATE PROCEDURE GETHOST (HOST varCHAR(50), PORT smallint, PASSIVE smallint)
RETURNS (kod integer)
AS
  declare variable login_auto smallint;
  declare variable vport smallint;
  declare variable vpassive smallint;
BEGIN
if((HOST='')or(HOST is Null))then Exit;
SELECT LAI FROM OPTIONS INTO :login_auto;
SELECT kod, port, passive FROM ftp_host WHERE(host=:host)INTO :kod, :vport, :vpassive;
if((kod is null)and(login_auto=2))then
begin
  kod=Gen_id(g_host,1);
  insert into ftp_host (kod, host, port, passive) values (:kod, :host, :port, :passive);
  suspend;
  exit;
end

if((kod is not null)and((port<>vport)or(passive<>vpassive)))then
  update ftp_host set port=:port, passive=:passive where kod=:kod;
suspend;
END;

CREATE PROCEDURE SETHOST (HOST varCHAR(50), PORT smallint, PASSIVE smallint)
RETURNS (kod integer)
AS
BEGIN
if((HOST='')or(HOST is Null))then Exit;
select * from GETHOST(:HOST, :PORT, :PASSIVE) into :kod;
insert into ftp_scan1 (N, host) values (Gen_id(g_scan1,1), :kod);
suspend;
END;

CREATE PROCEDURE GETLOGIN (HOST varchar(50), LOGIN varchar(50), PASS varchar(50), PORT smallint, PASSIVE smallint)
RETURNS (kod integer)
AS
  DECLARE VARIABLE HST INTEGER;
  declare variable login_auto smallint;
  DECLARE VARIABLE VPASS varchar(50);
BEGIN
if((HOST='')or(HOST is Null)or(LOGIN='')or(LOGIN is Null))then Exit;
select * from GETHOST(:HOST, :PORT, :PASSIVE) into :HST;
SELECT LAI FROM OPTIONS INTO :login_auto;
SELECT kod, pass FROM ftp_login WHERE(host=:hst)and(login=:login)INTO :kod, :vpass;
if((kod is null)and(login_auto=2))then
begin
  kod=Gen_id(g_login,1);
  insert into ftp_login (kod, host, login, pass) values (:kod, :hst, :login, :pass);
  suspend;
  Exit;
end

if((kod is not null)and(pass<>vpass))then
  update ftp_login set pass=:pass where kod=:kod;
suspend;
END;

CREATE PROCEDURE SETLOGIN (HOST varchar(50), LOGIN varchar(50), PASS varchar(50), PORT smallint, PASSIVE smallint)
RETURNS (kod integer)
AS
BEGIN
if((HOST='')or(HOST is Null)or(LOGIN='')or(LOGIN is Null))then Exit;
select * from GETlogin(:HOST, :LOGIN, :PASS, :PORT, :PASSIVE) into :kod;
insert into ftp_scan2 (N, login) values (Gen_id(g_scan2,1), :kod);
suspend;
END;

CREATE PROCEDURE NEWHOST
RETURNS (kod integer)
AS
BEGIN
  KOD=gen_id(g_host,1);
  suspend;
END;

CREATE PROCEDURE NEWLOGIN
RETURNS (kod integer)
AS
BEGIN
  KOD=gen_id(g_login,1);
  suspend;
END;

CREATE PROCEDURE NEWDIRS
RETURNS (kod integer)
AS
BEGIN
  KOD=gen_id(g_dirs,1);
  suspend;
END;

CREATE PROCEDURE NEWDIRS_SNHR
RETURNS (kod integer)
AS
BEGIN
  KOD=gen_id(g_dirs_snhr,1);
  suspend;
END;