object SmTeste: TSmTeste
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 448
  object fdqAlunos: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      'SELECT * FROM aluno ')
    Left = 48
    Top = 40
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 250
    Top = 41
  end
  object FDMySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files\MySQL\MySQL Server 5.6\lib\libmysql.dll'
    Left = 144
    Top = 40
  end
end
