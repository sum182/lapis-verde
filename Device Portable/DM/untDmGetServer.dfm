object DmGetServer: TDmGetServer
  OldCreateOrder = False
  Height = 427
  Width = 610
  object fdStanStorageBinLink: TFDStanStorageBinLink
    Left = 533
    Top = 24
  end
  object fdqAluno: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select a.*,'
      
        '       coalesce(a.nome,'#39#39') || '#39' '#39' || coalesce(a.sobrenome,'#39#39') as' +
        ' nome_completo '#10
      'from aluno a'
      'where escola_id = :escola_id'
      'order by nome')
    Left = 48
    Top = 9
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
    Left = 123
    Top = 9
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqTurmaAluno: TFDQuery
    MasterFields = 'turma_id'
    DetailFields = 'turma_id'
    Connection = Dm.FDConnectionDB
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select '#10'ta.*'#10'from turma_aluno ta'#10
      'inner join turma t on (t.turma_id = ta.turma_id )'#13#10#10
      'where escola_id = :escola_id'#10)
    Left = 211
    Top = 9
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        ParamType = ptInput
      end>
  end
  object fdqResp: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select * from responsavel r'
      'where r.escola_id = :escola_id')
    Left = 48
    Top = 65
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
    Left = 211
    Top = 73
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
    Left = 299
    Top = 73
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqFunc: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select * from funcionario f'#13#10#10
      'where f.escola_id = :escola_id')
    Left = 42
    Top = 233
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
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
    Left = 48
    Top = 127
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
    Left = 123
    Top = 127
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqAgendaTurma: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select * from agenda_turma at'
      'where at.agenda_id = :agenda_id'
      '')
    Left = 211
    Top = 127
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqAgendaKeysInsert: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      '  select *'
      '  from agenda ag'
      '  where ag.data between :dt_ini and :dt_fim'
      '  and ag.enviado_server ='#39'S'#39
      '  and ag.data_insert_server is not null'
      '  order by ag.data_insert_local')
    Left = 314
    Top = 127
    ParamData = <
      item
        Name = 'DT_INI'
        DataType = ftDate
        ParamType = ptInput
        Value = 42477d
      end
      item
        Name = 'DT_FIM'
        DataType = ftDate
        ParamType = ptInput
        Value = 42478d
      end>
  end
  object fdqRespEscola: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select re.*'
      'from responsavel_escola re'
      'where re.ativo = '#39'S'#39)
    Left = 120
    Top = 72
  end
  object fdqRespTipo: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select rt.*'#10'from responsavel_tipo rt'#10)
    Left = 379
    Top = 71
  end
  object fdqConfiguracoes: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'select * from configuracoes')
    Left = 48
    Top = 296
  end
  object fdqProcessoAtualizacao: TFDQuery
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'SELECT * FROM processo_atualizacao')
    Left = 48
    Top = 184
  end
end
