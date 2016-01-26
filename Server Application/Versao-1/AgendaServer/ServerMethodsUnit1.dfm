object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 259
  Width = 363
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
  object fdmAlunos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 40
    Top = 144
  end
  object fdqAlunos: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM ALUNO')
    Left = 40
    Top = 88
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 168
    Top = 112
  end
end
