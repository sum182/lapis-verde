object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 401
  Width = 759
  object FDConnectionDB: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\Agenda\BD\SQLite\db.s3db'
      'LockingMode=Normal'
      'OpenMode=ReadWrite'
      'CacheSize=90000'
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    LoginPrompt = False
    Left = 40
    Top = 8
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 648
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 648
    Top = 61
  end
  object fgActivityDialog: TfgActivityDialog
    Left = 648
    Top = 111
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://54.200.116.223:8080/datasnap/rest/TSrvServerMetodos'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 528
    Top = 8
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 520
    Top = 111
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'text/html'
    Left = 520
    Top = 61
  end
  object fdqLogError: TFDQuery
    Connection = FDConnectionDB
    SQL.Strings = (
      'select * from log_error l'
      'where l.log_error_id = :log_error_id')
    Left = 40
    Top = 216
    ParamData = <
      item
        Name = 'LOG_ERROR_ID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDCreateDB: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\Agenda\BD\SQLite\db.s3db'
      'LockingMode=Normal'
      'CacheSize=90000'
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    LoginPrompt = False
    Left = 131
    Top = 8
  end
  object fdqProcessoAtualizacao: TFDQuery
    IndexFieldNames = 'processo'
    Connection = FDConnectionDB
    SQL.Strings = (
      'SELECT * FROM processo_atualizacao'
      'where ((escola_id = :escola_id) or (escola_id = 0))'
      '')
    Left = 131
    Top = 216
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object TimerSyncBasico: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TimerSyncBasicoTimer
    Left = 648
    Top = 216
  end
  object TimerSyncGeral: TTimer
    Enabled = False
    Interval = 3600000
    OnTimer = TimerSyncGeralTimer
    Left = 648
    Top = 164
  end
  object fdqAluno: TFDQuery
    Connection = FDConnectionDB
    SQL.Strings = (
      'select a.*,'
      
        '       coalesce(a.nome,'#39#39') || '#39' '#39' || coalesce(a.sobrenome,'#39#39') as' +
        ' nome_completo '#10
      'from aluno a'
      'where escola_id = :escola_id'
      'order by nome')
    Left = 40
    Top = 61
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqTurma: TFDQuery
    Connection = FDConnectionDB
    SQL.Strings = (
      'select * from turma'
      'where escola_id = :escola_id'
      'order by nome')
    Left = 131
    Top = 61
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
    Connection = FDConnectionDB
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select '#10'ta.*'#10'from turma_aluno ta'#10
      'inner join turma t on (t.turma_id = ta.turma_id )'#13#10#10
      'where escola_id = :escola_id'#10)
    Left = 211
    Top = 61
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        ParamType = ptInput
      end>
  end
  object fdqResp: TFDQuery
    Connection = FDConnectionDB
    SQL.Strings = (
      'select * from responsavel r'
      'where r.escola_id = :escola_id')
    Left = 40
    Top = 111
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object fdqRespAluno: TFDQuery
    Connection = FDConnectionDB
    SQL.Strings = (
      'select ra.*'
      'from responsavel_aluno ra'
      
        'inner join responsavel r on (r.responsavel_id = ra.responsavel_i' +
        'd)'
      'where r.escola_id = :escola_id')
    Left = 131
    Top = 111
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqRespTelefone: TFDQuery
    Connection = FDConnectionDB
    SQL.Strings = (
      'select rt.*'
      'from responsavel_telefone rt'
      
        'inner join responsavel r on (r.responsavel_id = rt.responsavel_i' +
        'd)'
      'where r.escola_id = :escola_id')
    Left = 211
    Top = 111
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqRespTipo: TFDQuery
    Connection = FDConnectionDB
    SQL.Strings = (
      'select rt.*'#10'from responsavel_tipo rt'#10)
    Left = 299
    Top = 111
  end
  object fdqFunc: TFDQuery
    Connection = FDConnectionDB
    SQL.Strings = (
      'select * from funcionario f'#13#10#10
      'where f.escola_id = :escola_id')
    Left = 40
    Top = 164
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object fdqFuncTipo: TFDQuery
    Connection = FDConnectionDB
    SQL.Strings = (
      'select ft.*'#10'from funcionario_tipo ft')
    Left = 131
    Top = 164
  end
end
