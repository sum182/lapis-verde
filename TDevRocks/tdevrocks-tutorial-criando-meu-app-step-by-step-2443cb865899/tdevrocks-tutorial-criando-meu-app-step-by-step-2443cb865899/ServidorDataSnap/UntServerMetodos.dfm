object SrvServerMetodos: TSrvServerMetodos
  OldCreateOrder = False
  Height = 433
  Width = 593
  object FDConexao: TFDConnection
    Params.Strings = (
      
        'Database=F:\projects\tutoriais-tdevrocks\Curso-Completo\DataBase' +
        '\LOCADORASERVER.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object qryTitulos: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select * from TITULOS')
    Left = 64
    Top = 88
    object qryTitulosID_TITULO: TIntegerField
      FieldName = 'ID_TITULO'
      Origin = 'ID_TITULO'
    end
    object qryTitulosTITULO: TStringField
      FieldName = 'TITULO'
      Origin = 'TITULO'
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
    object qryTitulosMINIATURA: TBlobField
      FieldName = 'MINIATURA'
      Origin = 'MINIATURA'
    end
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 504
    Top = 16
  end
  object qryAuxiliar: TFDQuery
    Connection = FDConexao
    Left = 168
    Top = 24
  end
end
