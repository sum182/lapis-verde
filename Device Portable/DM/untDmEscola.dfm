object DmEscola: TDmEscola
  OldCreateOrder = False
  Height = 267
  Width = 466
  object fdqAluno: TFDQuery
    Connection = DM.FDConnectionDBEscola
    SQL.Strings = (
      'select * from aluno')
    Left = 48
    Top = 38
  end
  object fdqTurma: TFDQuery
    Connection = DM.FDConnectionDBEscola
    SQL.Strings = (
      'select * from turma')
    Left = 48
    Top = 110
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 48
    Top = 172
  end
  object fdqAgenda: TFDQuery
    Active = True
    Connection = DM.FDConnectionDBEscola
    SQL.Strings = (
      'select * from agenda')
    Left = 120
    Top = 38
  end
end
