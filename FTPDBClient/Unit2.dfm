object FTPDB_GDB: TFTPDB_GDB
  OldCreateOrder = False
  Height = 681
  Width = 363
  object IBDatabase1: TIBDatabase
    DatabaseName = 'D:\'#1052#1077#1083#1086#1095#1100'\FTPDB\FTPDBDaemon\FTPDB.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    AfterConnect = IBDatabase1AfterConnect
    AfterDisconnect = IBDatabase1AfterDisconnect
    Left = 24
    Top = 14
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    DefaultAction = TARollback
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 104
    Top = 14
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BeforeOpen = IBQuery1BeforeOpen
    SQL.Strings = (
      '')
    Left = 184
    Top = 14
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 264
    Top = 14
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BeforeOpen = IBQuery2BeforeOpen
    SQL.Strings = (
      '')
    Left = 184
    Top = 70
  end
  object DataSource2: TDataSource
    DataSet = IBQuery2
    Left = 264
    Top = 70
  end
  object IdFTPDBScan1: TIdFTPDBScan
    AutoLogin = True
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    ReadTimeout = 0
    IBDataSet = IBQueryGet
    IdUser = 0
    Left = 264
    Top = 462
  end
  object IBDatabase2: TIBDatabase
    Left = 24
    Top = 590
  end
  object IBTable3: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction2
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
        Name = 'RDB$FOREIGN61'
        Fields = 'MAXLINEACTION'
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
    Left = 184
    Top = 126
  end
  object DataSource3: TDataSource
    DataSet = IBTable3
    Left = 264
    Top = 126
  end
  object IBTable4: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction2
    FieldDefs = <
      item
        Name = 'KOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BLN'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY59'
        Fields = 'KOD'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'S_BLN'
    Left = 184
    Top = 182
  end
  object DataSource4: TDataSource
    DataSet = IBTable4
    Left = 264
    Top = 182
  end
  object DataSource5: TDataSource
    DataSet = IBTable5
    Left = 264
    Top = 238
  end
  object DataSource6: TDataSource
    DataSet = IBTable6
    Left = 264
    Top = 294
  end
  object IBTable5: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction2
    FieldDefs = <
      item
        Name = 'KOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MAXLINEACTION'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY56'
        Fields = 'KOD'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'S_MAXLINEACTION'
    Left = 184
    Top = 238
  end
  object IBTable6: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction2
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
    Left = 184
    Top = 294
  end
  object IBTable7: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction2
    FieldDefs = <
      item
        Name = 'KOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TRANSFERTYPE'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY58'
        Fields = 'KOD'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'S_TRANSFERTYPE'
    Left = 184
    Top = 350
  end
  object DataSource7: TDataSource
    DataSet = IBTable7
    Left = 264
    Top = 350
  end
  object IBTable8: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction2
    DefaultIndex = False
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
    MasterSource = DataSource3
    StoreDefs = True
    TableName = 'FTP_LOGIN'
    Left = 184
    Top = 406
  end
  object DataSource8: TDataSource
    DataSet = IBTable8
    Left = 264
    Top = 406
  end
  object IBQueryGet: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    SQL.Strings = (
      'select kod from getlogin('#39'192.168.11.3'#39','#39'met_uszn'#39')')
    Left = 184
    Top = 462
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = IBDatabase1
    DefaultAction = TARollback
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 104
    Top = 122
  end
  object IBEvents1: TIBEvents
    AutoRegister = False
    Database = IBDatabase1
    Events.Strings = (
      'END_SCAN1')
    Registered = False
    OnEventAlert = IBEvents1EventAlert
    Left = 184
    Top = 528
  end
end
