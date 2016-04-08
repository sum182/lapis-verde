object DmEscola: TDmEscola
  OldCreateOrder = False
  Height = 421
  Width = 665
  object fdqAluno: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select a.*,'
      
        '       coalesce(a.nome,'#39#39') || '#39' '#39' || coalesce(a.sobrenome,'#39#39') as' +
        ' nome_completo '#10
      'from aluno a'
      'where escola_id = :escola_id'
      'order by nome')
    Left = 32
    Top = 8
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqTurma: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select * from turma'
      'where escola_id = :escola_id'
      'order by nome')
    Left = 104
    Top = 8
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdStanStorageBinLink: TFDStanStorageBinLink
    Left = 552
    Top = 8
  end
  object fdqAgenda: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      '  select'
      '    ag.*,'
      '    strftime("%d/%m/%Y",ag.data_insert_local) as data_criacao,'
      '    strftime("%H:%M",data_insert_local) as hora_criacao,'
      '    f.nome as funcionario_nome,'
      '    ft.descricao as funcionario_tipo,'
      '    r.nome as responsavel_nome,'
      '    rt.descricao as responsavel_tipo    '
      ''
      '  from agenda ag'
      
        '  left outer join funcionario f on (f.funcionario_id = ag.funcio' +
        'nario_id)'
      
        '  left outer join funcionario_tipo ft on (ft.funcionario_tipo_id' +
        ' = f.funcionario_tipo_id)'
      '  '
      
        '  left outer join responsavel r on (r.responsavel_id = ag.respon' +
        'savel_id)'
      
        '  left outer join responsavel_tipo rt on (rt.responsavel_tipo_id' +
        ' = r.responsavel_tipo_id)'
      '  '
      '  where date(data_insert_local) = :data'
      '  order by ag.data_insert_local')
    Left = 32
    Top = 66
    ParamData = <
      item
        Name = 'DATA'
        DataType = ftDate
        ParamType = ptInput
        Value = 42453d
      end>
  end
  object fdqAgendaAluno: TFDQuery
    Connection = Dm.FDConnectionDB
    FetchOptions.AssignedValues = [evCache]
    SQL.Strings = (
      'select * from agenda_aluno al'
      'where al.agenda_id = :agenda_id')
    Left = 104
    Top = 66
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqAgendaAlunoagenda_id: TStringField
      FieldName = 'agenda_id'
      Origin = 'agenda_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 100
    end
    object fdqAgendaAlunoaluno_id: TIntegerField
      FieldName = 'aluno_id'
      Origin = 'aluno_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object fdqAgendaTurma: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select * from agenda_turma at'
      'where at.agenda_id = :agenda_id'
      '')
    Left = 192
    Top = 66
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
      Required = True
    end
  end
  object fdqAgendaSaveServer: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select * from agenda a'
      'where a.enviado_server is null'
      'order by data_insert_local')
    Left = 552
    Top = 66
  end
  object fdqAgendaAlunoSaveServer: TFDQuery
    Connection = Dm.FDConnectionDB
    FetchOptions.AssignedValues = [evCache]
    SQL.Strings = (
      'select al.* '
      'from agenda_aluno al'
      'inner join agenda a on (al.agenda_id = a.agenda_id)'
      'where a.enviado_server is null'
      'order by a.data_insert_local')
    Left = 552
    Top = 118
    object fdqAgendaAlunoSaveServeragenda_id: TStringField
      FieldName = 'agenda_id'
      Origin = 'agenda_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 100
    end
    object fdqAgendaAlunoSaveServeraluno_id: TIntegerField
      FieldName = 'aluno_id'
      Origin = 'aluno_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object fdqAgendaTurmaSaveServer: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select  at.* '
      'from agenda_turma at'
      'inner join agenda a on (at.agenda_id = a.agenda_id)'
      'where a.enviado_server is null'
      'order by a.data_insert_local')
    Left = 552
    Top = 168
    object fdqAgendaTurmaSaveServeragenda_id: TStringField
      FieldName = 'agenda_id'
      Origin = 'agenda_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 100
    end
    object fdqAgendaTurmaSaveServerturma_id: TIntegerField
      FieldName = 'turma_id'
      Origin = 'turma_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object fdqTurmaAluno: TFDQuery
    MasterSource = dsTurmaAluno
    MasterFields = 'turma_id'
    DetailFields = 'turma_id'
    Connection = Dm.FDConnectionDB
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select '#10'ta.*'#10'from turma_aluno ta'#10
      'inner join turma t on (t.turma_id = ta.turma_id )'#13#10#10
      'where escola_id = :escola_id'#10)
    Left = 192
    Top = 8
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        ParamType = ptInput
      end>
  end
  object dsTurmaAluno: TDataSource
    DataSet = fdqTurma
    Left = 272
    Top = 8
  end
  object fdqResp: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select * from responsavel r'
      'where r.escola_id = :escola_id')
    Left = 32
    Top = 118
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object fdqRespAluno: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select ra.*'
      'from responsavel_aluno ra'
      
        'inner join responsavel r on (r.responsavel_id = ra.responsavel_i' +
        'd)'
      'where r.escola_id = :escola_id')
    Left = 104
    Top = 118
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqRespTelefone: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select rt.*'
      'from responsavel_telefone rt'
      
        'inner join responsavel r on (r.responsavel_id = rt.responsavel_i' +
        'd)'
      'where r.escola_id = :escola_id')
    Left = 192
    Top = 118
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqRespTipo: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select rt.*'#10'from responsavel_tipo rt'#10)
    Left = 280
    Top = 118
  end
  object fdqFunc: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select * from funcionario f'#13#10#10
      'where f.escola_id = :escola_id')
    Left = 32
    Top = 168
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqFuncTipo: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select ft.*'#10'from funcionario_tipo ft')
    Left = 104
    Top = 168
  end
  object TimerSyncBasico: TTimer
    Interval = 30000
    OnTimer = TimerSyncBasicoTimer
    Left = 32
    Top = 216
  end
  object fdqAgendaCriar: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      '  select *'
      '  from agenda ag'
      '  where agenda_id = :agenda_id'
      '')
    Left = 280
    Top = 66
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
