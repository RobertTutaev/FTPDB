object DataModuleOptions: TDataModuleOptions
  OldCreateOrder = False
  Height = 89
  Width = 252
  object IBDatabase1: TIBDatabase
    DatabaseName = 'D:\'#1052#1077#1083#1086#1095#1100'\FTPDB\FTPDBDaemon\FTPDB.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    AfterConnect = IBDatabase1AfterConnect
    BeforeConnect = IBDatabase1BeforeConnect
    Left = 24
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 104
    Top = 16
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
      end
      item
        Name = 'RLIMIT'
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
      end
      item
        Name = 'RDB$FOREIGN9'
        Fields = 'RLIMIT'
      end>
    StoreDefs = True
    TableName = 'OPTIONS'
    Left = 184
    Top = 16
  end
end
