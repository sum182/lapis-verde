object SmServer: TSmServer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 256
  Width = 463
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 168
    Top = 73
  end
  object FDMySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files\MySQL\MySQL Server 5.6\lib\libmysql.dll'
    Left = 48
    Top = 73
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=agendadb'
      'User_Name=admin'
      'Password=senhabdagenda'
      'Server=agendadb.cfmlnopzuyrp.sa-east-1.rds.amazonaws.com'
      'DriverID=MySQL')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    LoginPrompt = False
    Left = 42
    Top = 16
  end
  object FDConnectionLocal: TFDConnection
    Params.Strings = (
      'Database=agenda'
      'User_Name=root'
      'Password=admin'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 130
    Top = 16
  end
  object FDWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 273
    Top = 73
  end
end
