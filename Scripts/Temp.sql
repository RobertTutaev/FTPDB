drop PROCEDURE GETFILES2;

SET TERM !! ;
CREATE PROCEDURE GETFILES2 (HOST varchar(50), LOGIN varchar(50))
RETURNS (
  VHOST          INTEGER,
  V_ALL          VARCHAR(800),
  V_PATH	 VARCHAR(560),
  V_ATR	         VARCHAR(10),
  V_USER	 INTEGER,
  V_GROUP        INTEGER,
  V_SIZE	 INTEGER,
  V_DATE         DATE,
  V_TIME	 TIME,
  V_NAME	 VARCHAR(300))
AS
  declare variable VLOGIN INTEGER;
  declare variable VCOUNT INTEGER;
  declare variable V VARCHAR(100);
BEGIN
  if((:HOST='')or(:HOST is Null)or(:LOGIN='')or(:LOGIN is Null))then Exit;
  select * from GETHOST(:HOST) into :VHOST;
  select * from GETLOGIN(:HOST, :LOGIN) into :VLOGIN;
  V='ftp://';
  V=V+HOST;

  for
    select
    HOST, A_ALL, A_PATH, A_ATR, A_USER, A_GROUP, A_SIZE, A_DATE, A_TIME, A_NAME
    from ftp_files where(HOST=:VHOST)into
    :VHOST, :V_ALL, :V_PATH, :V_ATR, :V_USER, :V_GROUP, :V_SIZE, :V_DATE, :V_TIME, :V_NAME do
  begin
    
    select count(LOGIN) from ftp_dirs where(LOGIN=:VLOGIN)and(:V_ALL starting with A_ALL)into :VCOUNT;
    if(VCOUNT>0)then suspend;
  end
END !!
SET TERM ; !!
