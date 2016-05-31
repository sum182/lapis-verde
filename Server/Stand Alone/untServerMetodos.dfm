object SrvServerMetodos: TSrvServerMetodos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 457
  Width = 629
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
    Left = 338
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
  object fdqLoginResponsavel: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT r.*, concat(coalesce(r.nome,'#39#39'),'#39' '#39', coalesce(r.sobrenome' +
        ','#39#39')) as nome_completo'
      'FROM responsavel r'
      'where 1=1'#10#10
      'and (r.cpf = :login) or (Upper(r.email) = Upper(:login)) '#13#10#10
      ''
      'and r.senha = :senha'#13#10#10
      ''
      ''
      ''
      ''
      '')
    Left = 338
    Top = 104
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
      'SELECT r.* '#10'FROM responsavel r'#13#10#10
      'where 1=1'#10#10#10
      'and Upper(r.email) = Upper(:email)'#10)
    Left = 474
    Top = 136
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
    Left = 474
    Top = 192
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
    Left = 474
    Top = 88
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
    Left = 474
    Top = 32
    ParamData = <
      item
        Name = 'RESPONSAVEL_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqAgenda: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from agenda'
      'where agenda.agenda_id = :agenda_id'
      'and escola_id = :escola_id')
    Left = 50
    Top = 304
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ESCOLA_ID'
        ParamType = ptInput
      end>
    object fdqAgendaagenda_id: TFDAutoIncField
      FieldName = 'agenda_id'
      Origin = 'agenda_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqAgendatitulo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'titulo'
      Origin = 'titulo'
      Size = 50
    end
    object fdqAgendadescricao: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      BlobType = ftMemo
    end
    object fdqAgendadata: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = '`data`'
    end
    object fdqAgendaagenda_tipo_id: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'agenda_tipo_id'
      Origin = 'agenda_tipo_id'
    end
    object fdqAgendafuncionario_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'funcionario_id'
      Origin = 'funcionario_id'
    end
    object fdqAgendaescola_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'escola_id'
      Origin = 'escola_id'
    end
  end
  object fdqAgendaAluno: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM agenda_aluno '
      'where agenda_id = :agenda_id')
    Left = 50
    Top = 352
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqAgendaAlunoagenda_id: TIntegerField
      FieldName = 'agenda_id'
      Origin = 'agenda_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqAgendaAlunoaluno_id: TIntegerField
      FieldName = 'aluno_id'
      Origin = 'aluno_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object fdqTurmaAluno: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      #10'select '#10'  ta.*'
      'from turma_aluno ta'#13#10#10
      'where ta.turma_id = :turma_id'
      '')
    Left = 138
    Top = 352
    ParamData = <
      item
        Name = 'TURMA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqTurma: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM turma t'#13#10#10
      'where escola_id = :escola_id'
      'order by nome')
    Left = 210
    Top = 304
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqAluno: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT a.*, concat(coalesce(a.nome,'#39#39'),'#39' '#39', coalesce(a.sobrenome' +
        ','#39#39')) as nome_completo '
      'FROM aluno a'
      'where 1=1'#10' '#10
      'and escola_id = :escola_id'#10
      'order by nome_completo'#10)
    Left = 138
    Top = 304
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
