object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 250
  Width = 392
  object fdcConexao: TFDConnection
    Params.Strings = (
      'Database=$(DB_LOCADORA_SQLITE)'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = fdcConexaoBeforeConnect
    Left = 40
    Top = 24
  end
  object qryTitulos: TFDQuery
    Connection = fdcConexao
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  ID_TITULO,'
      '  TITULO,'
      '  SUBTITULO,'
      '  ANO_LANCAMENTO,'
      '  FOTO'
      'FROM'
      '  TITULOS')
    Left = 40
    Top = 72
    object qryTitulosrowid: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'rowid'
      Origin = 'rowid'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryTitulosID_TITULO: TIntegerField
      FieldName = 'ID_TITULO'
      Origin = 'ID_TITULO'
      Required = True
    end
    object qryTitulosTITULO: TStringField
      FieldName = 'TITULO'
      Origin = 'TITULO'
      Required = True
      Size = 30
    end
    object qryTitulosSUBTITULO: TStringField
      FieldName = 'SUBTITULO'
      Origin = 'SUBTITULO'
      Size = 50
    end
    object qryTitulosANO_LANCAMENTO: TIntegerField
      FieldName = 'ANO_LANCAMENTO'
      Origin = 'ANO_LANCAMENTO'
    end
    object qryTitulosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 296
    Top = 24
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 296
    Top = 80
  end
  object qryAuxiliar1: TFDQuery
    Connection = fdcConexao
    Left = 160
    Top = 24
  end
  object memTitulos: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 40
    Top = 120
  end
end
