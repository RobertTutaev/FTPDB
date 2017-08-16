object DataModuleFTPDBDaemon: TDataModuleFTPDBDaemon
  OldCreateOrder = False
  Height = 67
  Width = 317
  object IBDatabase1: TIBDatabase
    AfterConnect = IBDatabase1AfterConnect
    Left = 22
    Top = 13
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 96
    Top = 13
  end
  object IBTableOptions: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    TableName = 'OPTIONS'
    Left = 168
    Top = 13
  end
end
