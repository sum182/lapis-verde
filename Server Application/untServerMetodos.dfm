object SrvServerMetodos: TSrvServerMetodos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 330
  Width = 602
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
  object fdqLoginFuncionario: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT f.*, concat(coalesce(f.nome,'#39#39'),'#39' '#39', coalesce(f.sobrenome' +
        ','#39#39')) as nome_completo '
      'FROM funcionario f'
      'where 1=1'#13#10#10
      'and (f.cpf = :login) or (f.email = :login) '#13#10#10
      'and f.senha = :senha'#13#10#10
      ''
      ''
      ''
      '')
    Left = 50
    Top = 208
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
  object fdqLoginResponsavel: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT r.*, concat(coalesce(r.nome,'#39#39'),'#39' '#39', coalesce(r.sobrenome' +
        ','#39#39')) as nome_completo'
      'FROM responsavel r'
      'where 1=1'#10#10
      'and (r.cpf = :login) or (r.email = :login) '#13#10#10
      'and r.senha = :senha'#13#10#10
      ''
      ''
      ''
      '')
    Left = 162
    Top = 208
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
  object fdqValidarEmailResponsavel: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT r.* '
      'FROM responsavel r'
      'where 1=1'#10#10
      'and r.email = :email'
      ''
      ''
      ''
      ''
      '')
    Left = 402
    Top = 192
    ParamData = <
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object fdqValidarCPFResponsavel: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT r.* '
      'FROM responsavel r'
      'where 1=1'#10#10
      'and r.cpf = :cpf'
      ''
      ''
      ''
      ''
      '')
    Left = 402
    Top = 248
    ParamData = <
      item
        Name = 'CPF'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0.000000000000000000
      end>
  end
  object fdqResponsavel: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT r.* '
      'FROM responsavel r'
      'where 1=1'#10#10
      'and r.responsavel_id = :responsavel_id'
      ''
      ''
      ''
      ''
      '')
    Left = 402
    Top = 144
    ParamData = <
      item
        Name = 'RESPONSAVEL_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqResponsavelTelefone: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT rt.* '
      'FROM responsavel_telefone rt'
      'where 1=1'#10#10
      'and rt.responsavel_id = :responsavel_id')
    Left = 402
    Top = 88
    ParamData = <
      item
        Name = 'RESPONSAVEL_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
