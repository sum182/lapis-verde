object DmEscola: TDmEscola
  OldCreateOrder = False
  Height = 407
  Width = 592
  object fdqAluno: TFDQuery
    Active = True
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select a.*,'
      
        '       coalesce(a.nome,'#39#39') || '#39' '#39' || coalesce(a.sobrenome,'#39#39') as' +
        ' nome_completo '#10
      'from aluno a'
      'where escola_id = :escola_id'
      'order by nome')
    Left = 24
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
    Active = True
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select * from turma'
      'where escola_id = :escola_id'
      'order by nome')
    Left = 24
    Top = 56
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdStanStorageBinLink: TFDStanStorageBinLink
    Left = 464
    Top = 16
  end
  object fdqAgenda: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select '
      'ag.* ,'
      'strftime("%d/%m/%Y",data_insert_local) as data'
      'from agenda ag'
      ''
      'where date(data_insert_local) = :data'
      'order by data_insert_local desc')
    Left = 120
    Top = 8
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
    Left = 120
    Top = 56
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
    Left = 120
    Top = 104
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
    Left = 464
    Top = 64
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
    Left = 464
    Top = 112
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
    Left = 464
    Top = 162
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
      #10'select '#10'  ta.*'
      'from turma_aluno ta'#13#10#10
      'where ta.turma_id = :turma_id'
      '')
    Left = 26
    Top = 168
    ParamData = <
      item
        Name = 'TURMA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = 8
      end>
  end
  object dsTurmaAluno: TDataSource
    DataSet = fdqTurma
    Left = 24
    Top = 112
  end
end
