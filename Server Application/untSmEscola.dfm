object SmEscola: TSmEscola
  OldCreateOrder = False
  Height = 446
  Width = 610
  object fdqLoginFuncionario: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      
        'SELECT f.*, concat(coalesce(f.nome,'#39#39'),'#39' '#39', coalesce(f.sobrenome' +
        ','#39#39')) as nome_completo '
      'FROM funcionario f'
      'where 1=1'#13#10#10
      'and (f.cpf = :login) or (f.email = :login) '#13#10#10
      'and f.senha = :senha'#13#10#10
      ''
      ''
      ''
      '')
    Left = 63
    Top = 40
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = '11111111111'
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 2000
        Value = 'MTY4NTRAIypzdW0xODJAIyo5OTg3c2VuaGEgZGUgY29vcmRl'
      end>
  end
  object fdqAgenda: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'select * from agenda'
      'where agenda.agenda_id = :agenda_id'
      'and escola_id = :escola_id')
    Left = 154
    Top = 384
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ESCOLA_ID'
        ParamType = ptInput
      end>
  end
  object fdqAgendaAluno: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'select '
      '  ag.*'
      'from agenda ag'
      'inner join agenda_aluno al on (ag.agenda_id = al.agenda_id) '
      'where 1=1'
      'and  ag.agenda_id >= :agenda_id'
      'and  ag.escola_id = :escola_id'
      'and  al.aluno_id = :aluno_id')
    Left = 66
    Top = 168
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'ALUNO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 19
      end>
  end
  object fdqTurmaAluno: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      #10'select '#10'  ta.*'
      'from turma_aluno ta'#13#10#10
      'where ta.turma_id = :turma_id'
      '')
    Left = 58
    Top = 384
    ParamData = <
      item
        Name = 'TURMA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqTurma: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'SELECT * FROM turma t'#13#10#10
      'where escola_id = :escola_id'
      'order by nome')
    Left = 138
    Top = 104
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqAluno: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      
        'SELECT a.*, concat(coalesce(a.nome,'#39#39'),'#39' '#39', coalesce(a.sobrenome' +
        ','#39#39')) as nome_completo '
      'FROM aluno a'
      'where 1=1'#10' '#10
      'and escola_id = :escola_id'#10
      'order by nome_completo'#10)
    Left = 66
    Top = 104
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqAgendaTurma: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'select '
      '  ag.*'
      'from agenda ag'
      'inner join agenda_turma at on (ag.agenda_id = at.agenda_id) '
      'where 1=1'
      'and  ag.agenda_id >= :agenda_id'
      'and  ag.escola_id = :escola_id'
      'and  at.turma_id = :turma_id')
    Left = 154
    Top = 168
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'TURMA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
end
