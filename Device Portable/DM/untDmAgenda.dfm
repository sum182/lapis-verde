object DmAgenda: TDmAgenda
  OldCreateOrder = False
  Height = 249
  Width = 656
  object fdStanStorageBinLink: TFDStanStorageBinLink
    Left = 576
    Top = 24
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
    Left = 40
    Top = 24
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
    Left = 132
    Top = 24
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
    Left = 224
    Top = 24
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
  object fdqAgendaCriar: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      '  select *'
      '  from agenda ag'
      '  where agenda_id = :agenda_id'
      '')
    Left = 40
    Top = 90
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
