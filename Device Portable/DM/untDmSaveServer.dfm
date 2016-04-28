object DmSaveServer: TDmSaveServer
  OldCreateOrder = False
  Height = 317
  Width = 545
  object fdqLogError: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select * from log_error l'
      'where enviado_server is null')
    Left = 48
    Top = 86
  end
  object fdqAgenda: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select * from agenda a'
      'where a.enviado_server is null'
      'and a.data_insert_server is null'
      'order by data_insert_local')
    Left = 48
    Top = 26
  end
  object fdqAgendaAluno: TFDQuery
    Connection = Dm.FDConnectionDB
    FetchOptions.AssignedValues = [evCache]
    SQL.Strings = (
      'select al.* '
      'from agenda_aluno al'
      'inner join agenda a on (al.agenda_id = a.agenda_id)'
      'where a.enviado_server is null'
      'and a.data_insert_server is null'
      'order by a.data_insert_local')
    Left = 136
    Top = 26
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
      'select  at.* '
      'from agenda_turma at'
      'inner join agenda a on (at.agenda_id = a.agenda_id)'
      'where a.enviado_server is null'
      'and a.data_insert_server is null'
      'order by a.data_insert_local')
    Left = 224
    Top = 26
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
end
