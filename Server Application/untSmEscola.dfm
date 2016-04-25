object SmEscola: TSmEscola
  OldCreateOrder = False
  Height = 414
  Width = 671
  object fdqLoginFuncionario: TFDQuery
    Connection = SmMain.FDConnection
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
  object fdqAgenda: TFDQuery
    BeforePost = fdqAgendaBeforePost
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'select '
      '  ag.*'
      'from agenda ag'
      'inner join agenda_aluno al on (ag.agenda_id = al.agenda_id) '
      'inner join turma_aluno ta on (ta.aluno_id = al.aluno_id) '
      'inner join turma t on (t.turma_id = ta.turma_id)'
      
        'inner join funcionario f on (f.funcionario_id = t.funcionario_id' +
        ')'
      'where 1=1'
      '-- where t.funcionario_id = :funcionario_id'
      'and ag.escola_id = :escola_id'
      'and ag.data between :dt_ini and :dt_fim'
      'group by agenda_id')
    Left = 378
    Top = 336
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'DT_INI'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 42437d
      end
      item
        Name = 'DT_FIM'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 42804d
      end>
  end
  object fdqAgendaAluno: TFDQuery
    Connection = SmMain.FDConnection
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select '
      '  al.*'
      'from agenda ag'
      'inner join agenda_aluno al on (ag.agenda_id = al.agenda_id) '
      'inner join turma_aluno ta on (ta.aluno_id = al.aluno_id) '
      'inner join turma t on (t.turma_id = ta.turma_id)'
      
        'inner join funcionario f on (f.funcionario_id = t.funcionario_id' +
        ')'
      'where t.funcionario_id = :funcionario_id'
      'and ag.escola_id = :escola_id'
      'and ag.data_insert_server between :dt_ini and :dt_fim'
      'group by agenda_id')
    Left = 458
    Top = 336
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 16
      end
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = '1'
      end
      item
        Name = 'DT_INI'
        DataType = ftDateTime
        ParamType = ptInput
        Value = '08/03/2016'
      end
      item
        Name = 'DT_FIM'
        DataType = ftDateTime
        ParamType = ptInput
        Value = '10/03/2016'
      end>
    object fdqAgendaAlunoagenda_id: TStringField
      FieldName = 'agenda_id'
      Origin = 'agenda_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 100
    end
    object fdqAgendaAlunoaluno_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'aluno_id'
      Origin = 'aluno_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object fdqTurmaAluno: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'select '#10'ta.*'#10'from turma_aluno ta'#10
      'inner join turma t on (t.turma_id = ta.turma_id )'#13#10#10
      'where escola_id = :escola_id'#10)
    Left = 250
    Top = 104
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 2
      end>
  end
  object fdqTurma: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'SELECT * FROM turma t'#13#10#10
      'where escola_id = :escola_id'
      'order by nome')
    Left = 146
    Top = 104
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqAluno: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      
        'SELECT a.*, concat(coalesce(a.nome,'#39#39'),'#39' '#39', coalesce(a.sobrenome' +
        ','#39#39')) as nome_completo '
      'FROM aluno a'
      'where 1=1'#10' '#10
      'and escola_id = :escola_id'#10
      'order by nome_completo'#10)
    Left = 66
    Top = 104
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqAgendaTurma: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'select '
      '  at.*'
      'from agenda ag'
      'inner join agenda_turma at on (ag.agenda_id = at.agenda_id) '
      'inner join turma t on (t.turma_id = at.turma_id)'
      
        'inner join funcionario f on (f.funcionario_id = t.funcionario_id' +
        ')'
      'where t.funcionario_id = :funcionario_id'
      'and ag.escola_id = :escola_id'
      'and ag.data_insert_server between :dt_ini and :dt_fim'
      'group by agenda_id'
      '')
    Left = 562
    Top = 336
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 16
      end
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'DT_INI'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 42437d
      end
      item
        Name = 'DT_FIM'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 42439d
      end>
    object fdqAgendaTurmaagenda_id: TStringField
      FieldName = 'agenda_id'
      Origin = 'agenda_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 100
    end
    object fdqAgendaTurmaturma_id: TIntegerField
      FieldName = 'turma_id'
      Origin = 'turma_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object fdqResp: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'select * from responsavel r'
      'where r.escola_id = :escola_id')
    Left = 72
    Top = 224
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object fdqRespAluno: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'select ra.*'
      'from responsavel_aluno ra'
      
        'inner join responsavel r on (r.responsavel_id = ra.responsavel_i' +
        'd)'
      'where r.escola_id = :escola_id')
    Left = 160
    Top = 224
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqRespTelefone: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'select rt.*'
      'from responsavel_telefone rt'
      
        'inner join responsavel r on (r.responsavel_id = rt.responsavel_i' +
        'd)'
      'where r.escola_id = :escola_id')
    Left = 256
    Top = 224
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqFunc: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'select * from funcionario f'#13#10#10
      'where f.escola_id = :escola_id')
    Left = 72
    Top = 280
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
end
