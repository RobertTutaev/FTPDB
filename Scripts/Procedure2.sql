CREATE PROCEDURE GETFILES 
         (HOST varchar(50), 
          LOGIN varchar(50), 
          PASS varchar(50), 
          PORT smallint, 
          PASSIVE smallint)
RETURNS (
  VHOST          INTEGER,
  V_ALL          VARCHAR(600),
  V_PATH	 VARCHAR(1000),
  V_ATR	         VARCHAR(10),
  V_USER	 INTEGER,
  V_GROUP        INTEGER,
  V_SIZE	 INTEGER,
  V_DATE         DATE,
  V_TIME	 TIME,
  V_NAME	 VARCHAR(1000))
AS
  declare variable VLOGIN INTEGER;
  declare variable VCOUNT INTEGER;
  declare variable VPORT  VARCHAR(20);
BEGIN
  if((:HOST='')or(:HOST is Null)or(:LOGIN='')or(:LOGIN is Null))then Exit;
  select * from GETHOST(:HOST, :PORT, :PASSIVE) into :VHOST;
  select * from GETLOGIN(:HOST, :LOGIN, :PASS, :PORT, :PASSIVE) into :VLOGIN;
  VPORT=Cast(Port as VARCHAR(20));

  for select * from ftp_files where(HOST=:VHOST)into
    :VHOST, :V_ALL, :V_PATH, :V_ATR, :V_USER, :V_GROUP, :V_SIZE, :V_DATE, :V_TIME, :V_NAME do
  begin
    V_ALL=LOCASE(V_ALL);
    select count(LOGIN) from ftp_dirs where(LOGIN=:VLOGIN)and(:V_ALL starting with LOCASE(A_ALL))into :VCOUNT;
    V_PATH='<a href="ftp://'||LOGIN||':'||PASS||'@'||HOST||':'||VPORT||V_PATH||'" title="Open" target="_blank">'||V_PATH||'</a>';
    V_NAME='<a href="ftp://'||LOGIN||':'||PASS||'@'||HOST||':'||VPORT||V_ALL||'" title="Load" target="_blank">'||V_NAME||'</a>';
    if(VCOUNT>0)then suspend;
  end
END;

CREATE PROCEDURE EV_GEN (TEXT VARCHAR(100))
AS
BEGIN
  post_event text;
END ; 

CREATE PROCEDURE GETFILES_SNHR 
        (HOST VARCHAR(50), KOD INTEGER)
returns
        (V_PATH  VARCHAR(600),         
         V_DATE  DATE,
         V_TIME  TIME)
AS 
     declare variable VHOST INTEGER;    
     declare variable VCOUNT INTEGER;     
begin
  select KOD from FTP_HOST where HOST=:HOST into :VHOST;
  for select A_ALL, A_DATE, A_TIME from ftp_files where(HOST=:VHOST)into
    :V_PATH, :V_DATE, :V_TIME do
  begin
    V_PATH=LOCASE(V_PATH); 
    select count(HOST) from dirs_snhr where(HOST=:VHOST)and(KOD=:KOD)and(:V_PATH starting with LOCASE(A_PATH))and(A_PATH<>'')into :VCOUNT;        
    if(VCOUNT>0)then suspend;
  end
end;

CREATE PROCEDURE GETDIRECTORIES_SNHR 
        (HOST VARCHAR(50), KOD INTEGER)
returns
        (V_PATH  VARCHAR(600),         
         V_DATE  DATE,
         V_TIME  TIME)
AS 
     declare variable VHOST INTEGER;    
     declare variable VCOUNT INTEGER;     
begin
  select KOD from FTP_HOST where HOST=:HOST into :VHOST;
  for select A_ALL, A_DATE, A_TIME from ftp_directories where(HOST=:VHOST)into
    :V_PATH, :V_DATE, :V_TIME do
  begin
    V_PATH=LOCASE(V_PATH); 
    select count(HOST) from dirs_snhr where(HOST=:VHOST)and(KOD=:KOD)and(:V_PATH starting with LOCASE(A_PATH))and(A_PATH<>'')into :VCOUNT;        
    if(VCOUNT>0)then suspend;
  end
end;