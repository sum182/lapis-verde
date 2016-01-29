object SrvServerMetodos: TSrvServerMetodos
  OldCreateOrder = False
  Height = 300
  Width = 385
  object fdqAlunos: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from aluno')
    Left = 40
    Top = 96
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=agenda'
      'User_Name=root'
      'Password=admin'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 42
    Top = 32
  end
  object FDMySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files\MySQL\MySQL Server 5.6\lib\libmysql.dll'
    Left = 136
    Top = 32
  end
  object FDWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 226
    Top = 32
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 136
    Top = 97
  end
end
