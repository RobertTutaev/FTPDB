CREATE TRIGGER FTP_HOST_BD FOR FTP_HOST
ACTIVE BEFORE delete POSITION 0
as
begin
  delete from dirs_snhr where host=old.kod;
  delete from ftp_files where host=old.kod;
  delete from ftp_scan1 where host=old.kod;
  delete from ftp_login where host=old.kod;
end;

CREATE TRIGGER FTP_LOGIN_BD FOR FTP_LOGIN
ACTIVE BEFORE delete POSITION 0
as
begin
  delete from ftp_dirs  where login=old.kod;  
  delete from ftp_scan2 where login=old.kod;
end;

CREATE TRIGGER FTP_LOGIN_BU FOR FTP_LOGIN
ACTIVE BEFORE update POSITION 0
as
begin
  if(new.act=2)then
    update FTP_LOGIN set act=1 where(host=new.host)and((act=2)or(act is null));
end;

CREATE TRIGGER FTP_LOGIN_BI FOR FTP_LOGIN
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if(new.act=2)then
    update FTP_LOGIN set act=1 where(host=new.host)and((act=2)or(act is null));
  if(new.plogin is null)then new.plogin='';
  if(new.ppass is null)then new.ppass='';
  if(new.phost is null)then new.phost='';
end;

CREATE TRIGGER OPTIONS_BI FOR OPTIONS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  delete from OPTIONS;
end;

CREATE TRIGGER FTP_SCAN1_AI FOR FTP_SCAN1
ACTIVE AFTER INSERT POSITION 0
as
  declare variable cnt integer;
begin
  select lrl from options into :cnt;
  delete from FTP_SCAN1 where n<new.n-:cnt+1;
end;

CREATE TRIGGER FTP_DIRS_BI FOR FTP_DIRS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if(New.KOD is Null ) then
      Execute Procedure NEWDIRS Returning_Values New.KOD ;
end;

CREATE TRIGGER DIRS_SNHR_BI FOR DIRS_SNHR
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if(New.KOD is Null) then
      Execute Procedure NEWDIRS_SNHR Returning_Values New.KOD ;
end;

CREATE TRIGGER FTP_SCAN2_AI FOR FTP_SCAN2
ACTIVE AFTER INSERT POSITION 0
as
  declare variable cnt integer;
begin
  select lrd from options into :cnt;
  delete from FTP_SCAN2 where n<new.n-:cnt+1;
end;

CREATE TRIGGER FTP_SCAN3_AI FOR FTP_SCAN3
ACTIVE AFTER INSERT POSITION 0
as
  declare variable cnt integer;
begin
  select lrs from options into :cnt;
  delete from FTP_SCAN3 where n<new.n-:cnt+1;
end;