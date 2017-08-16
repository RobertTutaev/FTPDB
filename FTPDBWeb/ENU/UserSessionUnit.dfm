object IWUserSession: TIWUserSession
  OldCreateOrder = False
  Height = 657
  Width = 583
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'D:\'#1052#1077#1083#1086#1095#1100'\FTPDB\FTPDBDaemon\FTPDB.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    AfterConnect = IBDatabase1AfterConnect
    BeforeConnect = IBDatabase1BeforeConnect
    Left = 24
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    DefaultAction = TARollbackRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 88
    Top = 16
  end
  object IBQueryFiles: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    AfterClose = IBQueryFilesAfterClose
    AfterOpen = IBQueryFilesAfterOpen
    BeforeOpen = IBQueryFilesBeforeOpen
    SQL.Strings = (
      'select '
      '  v_all as "'#1055#1086#1083#1085#1099#1081' '#1087#1091#1090#1100'",'
      '  v_path as "'#1055#1091#1090#1100'", v_size as "'#1056#1072#1079#1084#1077#1088', '#1050#1041'", v_date as '
      
        '  "'#1044#1072#1090#1072'", v_time as "'#1042#1088#1077#1084#1103'", v_name as "'#1060#1072#1081#1083'" from GETFILES('#39'192' +
        '.168.11.3'#39', '#39'met_uszn'#39', '#39'60-4803'#39')')
    Left = 157
    Top = 65
  end
  object IBQueryLog: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    AfterOpen = IBQueryLogAfterOpen
    BeforeOpen = IBQueryLogBeforeOpen
    Left = 157
    Top = 113
  end
  object DataSourceFiles: TDataSource
    DataSet = IBQueryFiles
    Left = 279
    Top = 64
  end
  object IBTableHost: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    FieldDefs = <
      item
        Name = 'KOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'HOST'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PASSIVE'
        DataType = ftSmallint
      end
      item
        Name = 'PORT'
        DataType = ftSmallint
      end
      item
        Name = 'TRANSFERTYPE'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY47'
        Fields = 'KOD'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN62'
        Fields = 'PASSIVE'
      end
      item
        Name = 'RDB$FOREIGN63'
        Fields = 'TRANSFERTYPE'
      end>
    StoreDefs = True
    TableName = 'FTP_HOST'
    Left = 157
    Top = 16
  end
  object DataSourceHost: TDataSource
    DataSet = IBTableHost
    Left = 279
    Top = 15
  end
  object DataSourceLog: TDataSource
    DataSet = IBQueryLog
    Left = 279
    Top = 112
  end
  object IdFTPDBScan1: TIdFTPDBScan
    AutoLogin = True
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    IBDataSet = IBQueryTemp
    IdUser = 0
    Left = 279
    Top = 160
  end
  object IBQueryTemp: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 157
    Top = 161
  end
  object IBTableOptions: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    FieldDefs = <
      item
        Name = 'LOGIN'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PASS'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LAI'
        DataType = ftSmallint
      end
      item
        Name = 'DAI'
        DataType = ftSmallint
      end
      item
        Name = 'SRTO'
        DataType = ftSmallint
      end
      item
        Name = 'STO'
        DataType = ftSmallint
      end
      item
        Name = 'LRL'
        DataType = ftInteger
      end
      item
        Name = 'PORT'
        DataType = ftInteger
      end
      item
        Name = 'RSN'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN12'
        Fields = 'LAI'
      end
      item
        Name = 'RDB$FOREIGN19'
        Fields = 'RSN'
      end
      item
        Name = 'RDB$FOREIGN13'
        Fields = 'DAI'
      end>
    StoreDefs = True
    TableName = 'OPTIONS'
    Left = 157
    Top = 248
  end
  object DataSourceOptions: TDataSource
    DataSet = IBTableOptions
    Left = 276
    Top = 247
  end
  object IBTableFTP_LOGIN: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    AfterInsert = IBTableFTP_LOGINAfterInsert
    BeforeEdit = EditFTP_HOST
    BeforeInsert = EditFTP_HOST
    FieldDefs = <
      item
        Name = 'KOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'HOST'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'LOGIN'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PASS'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PLOGIN'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PPASS'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PHOST'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PPORT'
        DataType = ftSmallint
      end
      item
        Name = 'PPROXYTYPE'
        DataType = ftSmallint
      end
      item
        Name = 'READTIMEOUT'
        DataType = ftInteger
      end
      item
        Name = 'ACT'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN60'
        Fields = 'PPROXYTYPE'
      end
      item
        Name = 'RDB$PRIMARY51'
        Fields = 'KOD'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN52'
        Fields = 'HOST'
      end
      item
        Name = 'RDB$FOREIGN65'
        Fields = 'ACT'
      end>
    IndexFieldNames = 'HOST'
    MasterFields = 'KOD'
    MasterSource = DataSourceFTP_HOST
    StoreDefs = True
    TableName = 'FTP_LOGIN'
    Left = 160
    Top = 368
  end
  object DataSourceFTP_LOGIN: TDataSource
    DataSet = IBTableFTP_LOGIN
    Left = 280
    Top = 368
  end
  object DataSourceFTP_DIRS: TDataSource
    DataSet = IBTableFTP_DIRS
    Left = 280
    Top = 416
  end
  object IBTableFTP_DIRS: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    AfterInsert = IBTableFTP_DIRSAfterInsert
    BeforeEdit = EditFTP_LOGIN
    BeforeInsert = EditFTP_LOGIN
    FieldDefs = <
      item
        Name = 'LOGIN'
        DataType = ftInteger
      end
      item
        Name = 'A_ALL'
        DataType = ftString
        Size = 600
      end
      item
        Name = 'A_PATH'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'A_ATR'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'A_USER'
        DataType = ftInteger
      end
      item
        Name = 'A_GROUP'
        DataType = ftInteger
      end
      item
        Name = 'A_SIZE'
        DataType = ftInteger
      end
      item
        Name = 'A_DATE'
        DataType = ftDate
      end
      item
        Name = 'A_TIME'
        DataType = ftTime
      end
      item
        Name = 'A_NAME'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'KOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN53'
        Fields = 'LOGIN'
      end
      item
        Name = 'RDB$PRIMARY2'
        Fields = 'KOD'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'LOGIN'
    MasterFields = 'KOD'
    MasterSource = DataSourceFTP_LOGIN
    StoreDefs = True
    TableName = 'FTP_DIRS'
    Left = 160
    Top = 416
  end
  object IBTableFTP_HOST: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    AfterClose = IBTableFTP_HOSTAfterClose
    AfterInsert = IBTableFTP_HOSTAfterInsert
    AfterOpen = IBTableFTP_HOSTAfterOpen
    FieldDefs = <
      item
        Name = 'KOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'HOST'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PASSIVE'
        DataType = ftSmallint
      end
      item
        Name = 'PORT'
        DataType = ftSmallint
      end
      item
        Name = 'TRANSFERTYPE'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY47'
        Fields = 'KOD'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN62'
        Fields = 'PASSIVE'
      end
      item
        Name = 'RDB$FOREIGN63'
        Fields = 'TRANSFERTYPE'
      end>
    StoreDefs = True
    TableName = 'FTP_HOST'
    Left = 157
    Top = 321
  end
  object DataSourceFTP_HOST: TDataSource
    DataSet = IBTableFTP_HOST
    Left = 276
    Top = 320
  end
  object DataSourceS_PROXYTYPE: TDataSource
    DataSet = IBTableS_PROXYTYPE
    Left = 280
    Top = 530
  end
  object IBTableS_PROXYTYPE: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    FieldDefs = <
      item
        Name = 'KOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PROXYTYPE'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY57'
        Fields = 'KOD'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'S_PROXYTYPE'
    Left = 160
    Top = 530
  end
  object IBTableS_TRANSFERTYPE: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    TableName = 'S_TRANSFERTYPE'
    Left = 160
    Top = 480
  end
  object DataSourceS_TRANSFERTYPE: TDataSource
    DataSet = IBTableS_TRANSFERTYPE
    Left = 280
    Top = 480
  end
end
