object SmResponsavel: TSmResponsavel
  OldCreateOrder = False
  Height = 446
  Width = 707
  object fdqValidarEmailResponsavel: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'SELECT r.* '#10'FROM responsavel r'#13#10#10
      'where 1=1'#10#10#10
      'and Upper(r.email) = Upper(:email)'#10)
    Left = 66
    Top = 144
    ParamData = <
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object fdqValidarCPFResponsavel: TFDQuery
    Connection = SmMain.FDConnection
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
    Left = 66
    Top = 200
    ParamData = <
      item
        Name = 'CPF'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0.000000000000000000
      end>
  end
  object fdqResponsavel: TFDQuery
    Connection = SmMain.FDConnection
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
    Left = 66
    Top = 96
    ParamData = <
      item
        Name = 'RESPONSAVEL_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqResponsavelTelefone: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'SELECT rt.* '
      'FROM responsavel_telefone rt'
      'where 1=1'#10#10
      'and rt.responsavel_id = :responsavel_id')
    Left = 66
    Top = 40
    ParamData = <
      item
        Name = 'RESPONSAVEL_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqLoginResponsavel: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      
        'SELECT r.*, concat(coalesce(r.nome,'#39#39'),'#39' '#39', coalesce(r.sobrenome' +
        ','#39#39')) as nome_completo'
      'FROM responsavel r'
      'where 1=1'#10#10
      'and (r.cpf = :login) or (Upper(r.email) = Upper(:login)) '#13#10#10
      ''
      ''
      'and r.senha = :senha'#13#10#10
      ''
      ''
      'and ativo = '#39'S'#39
      ''
      ''
      '')
    Left = 58
    Top = 256
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
end
