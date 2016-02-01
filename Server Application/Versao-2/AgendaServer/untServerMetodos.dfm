object SrvServerMetodos: TSrvServerMetodos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 324
  Width = 467
  object fdqAlunos: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM aluno ')
    Left = 40
    Top = 96
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
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=agendadb'
      'User_Name=admin'
      'Password=senhabdagenda'
      'Server=agendadb.cfmlnopzuyrp.sa-east-1.rds.amazonaws.com'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 42
    Top = 32
  end
  object FDConnectionLocal: TFDConnection
    Params.Strings = (
      'Database=agenda'
      'User_Name=root'
      'Password=admin'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 42
    Top = 152
  end
end
