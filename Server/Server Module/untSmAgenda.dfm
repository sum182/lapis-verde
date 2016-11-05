object SmAgenda: TSmAgenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 365
  Width = 615
  object fdqAgenda: TFDQuery
    BeforePost = fdqAgendaBeforePost
    AfterPost = fdqAgendaAfterPost
    Connection = ServerContainer.FDConnection
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
    Left = 66
    Top = 93
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
    Connection = ServerContainer.FDConnection
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
    Left = 146
    Top = 93
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
  object fdqAgendaTurma: TFDQuery
    Connection = ServerContainer.FDConnection
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
    Left = 250
    Top = 93
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
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 264
    Top = 33
  end
  object FDMySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files\MySQL\MySQL Server 5.6\lib\libmysql.dll'
    Left = 152
    Top = 32
  end
  object fdqAluno: TFDQuery
    Connection = ServerContainer.FDConnection
    SQL.Strings = (
      
        'SELECT a.*, concat(coalesce(a.nome,'#39#39'),'#39' '#39', coalesce(a.sobrenome' +
        ','#39#39')) as nome_completo '
      'FROM aluno a'
      'where 1=1'#10' '#10
      'and escola_id = :escola_id'#10
      'and ativo = '#39'S'#39
      'order by nome_completo'#10)
    Left = 66
    Top = 162
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
