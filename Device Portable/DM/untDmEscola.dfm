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
    object fdqAlunoaluno_id: TIntegerField
      FieldName = 'aluno_id'
      Origin = 'aluno_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdqAlunonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 150
    end
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
end
