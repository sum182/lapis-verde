object SmEscola: TSmEscola
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 373
  Width = 460
  object fdqLoginFuncionario: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      
        'SELECT f.*, concat(coalesce(f.nome,'#39#39'),'#39' '#39', coalesce(f.sobrenome' +
        ','#39#39')) as nome_completo '
      'FROM funcionario f'
      'where 1=1'#13#10#10
      ''
      'and (f.cpf = :login) or (f.email = :login) '#13#10#10
      ''
      'and f.senha = :senha'#13#10#10
      ''
      'and ativo = '#39'S'#39
      ''
      ''
      ''
      ''
      '')
    Left = 63
    Top = 40
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = '11111111111'
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 2000
        Value = 'MTY4NTRAIypzdW0xODJAIyo5OTg3c2VuaGEgZGUgY29vcmRl'
      end>
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 284
    Top = 41
  end
  object FDMySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files\MySQL\MySQL Server 5.6\lib\libmysql.dll'
    Left = 176
    Top = 40
  end
end
