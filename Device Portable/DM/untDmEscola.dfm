object DmEscola: TDmEscola
  OldCreateOrder = False
  Height = 408
  Width = 718
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
    Left = 616
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
  object fdqAgendaSaveServer: TFDQuery
    Connection = DM.FDConnectionDBEscola
    SQL.Strings = (
      'select * from agenda a'
      'where a.enviado_server is null'
      'order by data_insert_local')
    Left = 616
    Top = 56
  end
  object fdqAgendaAlunoSaveServer: TFDQuery
    Connection = DM.FDConnectionDBEscola
    FetchOptions.AssignedValues = [evCache]
    SQL.Strings = (
      'select al.* '
      'from agenda_aluno al'
      'inner join agenda a on (al.agenda_id = a.agenda_id)'
      'where a.enviado_server is null'
      'order by a.data_insert_local')
    Left = 616
    Top = 104
  end
  object fdqAgendaTurmaSaveServer: TFDQuery
    Connection = DM.FDConnectionDBEscola
    SQL.Strings = (
      'select  at.* '
      'from agenda_turma at'
      'inner join agenda a on (at.agenda_id = a.agenda_id)'
      'where a.enviado_server is null'
      'order by a.data_insert_local')
    Left = 616
    Top = 154
  end
end
