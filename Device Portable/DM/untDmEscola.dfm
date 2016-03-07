object DmEscola: TDmEscola
  OldCreateOrder = False
  Height = 295
  Width = 466
  object fdqAluno: TFDQuery
    Connection = DM.FDConnectionDBEscola
    SQL.Strings = (
      'select * from aluno')
    Left = 24
    Top = 8
  end
  object fdqTurma: TFDQuery
    Connection = DM.FDConnectionDBEscola
    SQL.Strings = (
      'select * from turma')
    Left = 24
    Top = 56
  end
  object fdStanStorageBinLink: TFDStanStorageBinLink
    Left = 384
    Top = 8
  end
  object fdqAgenda: TFDQuery
    Connection = DM.FDConnectionDBEscola
    SQL.Strings = (
      'select * from agenda'
      'order by data_insert_local')
    Left = 96
    Top = 8
  end
  object fdqAgendaAluno: TFDQuery
    Connection = DM.FDConnectionDBEscola
    FetchOptions.AssignedValues = [evCache]
    SQL.Strings = (
      'select * from agenda_aluno'#13#10#10)
    Left = 96
    Top = 56
  end
  object fdqAgendaTurma: TFDQuery
    Connection = DM.FDConnectionDBEscola
    SQL.Strings = (
      'select * from agenda_turma '#13#10#10)
    Left = 96
    Top = 104
  end
  object fdqAgendaApply: TFDQuery
    Connection = DM.FDConnectionDBEscola
    SQL.Strings = (
      'select * from agenda a'
      'where a.data_insert_server is null'
      'order by data_insert_local')
    Left = 384
    Top = 56
    object fdqAgendaApplyagenda_id: TStringField
      FieldName = 'agenda_id'
      Origin = 'agenda_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 100
    end
    object fdqAgendaApplydescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 5000
    end
    object fdqAgendaApplydata_insert_local: TDateTimeField
      FieldName = 'data_insert_local'
      Origin = 'data_insert_local'
    end
    object fdqAgendaApplydata_insert_server: TDateTimeField
      FieldName = 'data_insert_server'
      Origin = 'data_insert_server'
    end
    object fdqAgendaApplyagenda_tipo_id: TSmallintField
      FieldName = 'agenda_tipo_id'
      Origin = 'agenda_tipo_id'
    end
    object fdqAgendaApplyfuncionario_id: TIntegerField
      FieldName = 'funcionario_id'
      Origin = 'funcionario_id'
    end
    object fdqAgendaApplyescola_id: TIntegerField
      FieldName = 'escola_id'
      Origin = 'escola_id'
    end
  end
  object fdqAgendaAlunoApply: TFDQuery
    CachedUpdates = True
    Connection = DM.FDConnectionDBEscola
    FetchOptions.AssignedValues = [evCache]
    SQL.Strings = (
      'select al.* '
      'from agenda_aluno al'
      'inner join agenda a on (al.agenda_id = a.agenda_id)'
      'where a.data_insert_server is null'
      'order by a.data_insert_local')
    Left = 384
    Top = 104
  end
  object fdqAgendaTurmaApply: TFDQuery
    CachedUpdates = True
    Connection = DM.FDConnectionDBEscola
    SQL.Strings = (
      'select  at.* '
      'from agenda_turma at'
      'inner join agenda a on (at.agenda_id = a.agenda_id)'
      'where a.data_insert_server is null'
      'order by a.data_insert_local')
    Left = 384
    Top = 154
  end
end
