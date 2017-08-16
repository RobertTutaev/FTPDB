CREATE TABLE "S_MAXLINEACTION"
(
  "KOD"	           INTEGER NOT NULL,
  "MAXLINEACTION"  varchar(50),
 PRIMARY KEY ("KOD")
);

insert into S_MAXLINEACTION (kod, MAXLINEACTION) values (1, 'maException');
insert into S_MAXLINEACTION (kod, MAXLINEACTION) values (2, 'maSplit');

CREATE TABLE "S_PROXYTYPE"
(
  "KOD"	           INTEGER NOT NULL,
  "PROXYTYPE"  varchar(50),
 PRIMARY KEY ("KOD")
);

insert into S_PROXYTYPE (kod, PROXYTYPE) values (1, 'fpcmNone');
insert into S_PROXYTYPE (kod, PROXYTYPE) values (2, 'fpcmHttpProxyWitHftp');
insert into S_PROXYTYPE (kod, PROXYTYPE) values (3, 'fpcmOpen');
insert into S_PROXYTYPE (kod, PROXYTYPE) values (4, 'fpcmSite');
insert into S_PROXYTYPE (kod, PROXYTYPE) values (5, 'fpcmTransparent');
insert into S_PROXYTYPE (kod, PROXYTYPE) values (6, 'fpcmUserPass');
insert into S_PROXYTYPE (kod, PROXYTYPE) values (7, 'fpcmUserSite');

CREATE TABLE "S_TRANSFERTYPE"
(
  "KOD"	           INTEGER NOT NULL,
  "TRANSFERTYPE"  varchar(50),
 PRIMARY KEY ("KOD")
);

insert into S_TRANSFERTYPE (kod, TRANSFERTYPE) values (1, 'ftBinary');
insert into S_TRANSFERTYPE (kod, TRANSFERTYPE) values (2, 'ftASCII');

CREATE TABLE "S_BLN"
(
  "KOD"	 INTEGER NOT NULL,
  "BLN"  varchar(50),
 PRIMARY KEY ("KOD")
);

insert into S_BLN (kod, BLN) values (1, 'False');
insert into S_BLN (kod, BLN) values (2, 'True');

CREATE TABLE TIME_SCAN
(TIME_SCAN INTEGER NOT NULL);

alter table ftp_host
drop MaxLineAction,
drop MaxLineLength,
drop RecvBufferSize,
drop SendBufferSize;

CREATE TABLE "S_ROWLIMIT"
(
  "KOD"	 INTEGER NOT NULL,
  "ROWLIMIT"  varchar(50),
PRIMARY KEY ("KOD")
);

insert into S_ROWLIMIT (KOD, ROWLIMIT) values (0, '50');
insert into S_ROWLIMIT (KOD, ROWLIMIT) values (1, '100');
insert into S_ROWLIMIT (KOD, ROWLIMIT) values (2, '200');
insert into S_ROWLIMIT (KOD, ROWLIMIT) values (3, '300');
insert into S_ROWLIMIT (KOD, ROWLIMIT) values (4, '500');
insert into S_ROWLIMIT (KOD, ROWLIMIT) values (5, '1000');
insert into S_ROWLIMIT (KOD, ROWLIMIT) values (6, '2000');
insert into S_ROWLIMIT (KOD, ROWLIMIT) values (7, '5000');
insert into S_ROWLIMIT (KOD, ROWLIMIT) values (8, '<...>');

CREATE TABLE "S_PARAMS"
(
  "KOD"	    SMALLINT NOT NULL,
  "PARAMS"  varchar(50),
 PRIMARY KEY ("KOD")
);

insert into S_PARAMS (kod, PARAMS) values (0, 'prmNotExists');
insert into S_PARAMS (kod, PARAMS) values (1, 'prmOnlyNew');
insert into S_PARAMS (kod, PARAMS) values (2, 'prmAll');
