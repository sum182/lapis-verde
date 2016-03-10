object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 455
  Width = 510
  object FDConnectionDB: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\Agenda\BD\SQLite\db.s3db'
      'LockingMode=Normal'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 64
    Top = 32
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 64
    Top = 96
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 64
    Top = 152
  end
  object ImageList1: TImageList
    Source = <
      item
        MultiResBitmap.LoadSize = 2
        MultiResBitmap = <
          item
            Scale = 1.500000000000000000
            Width = 24
            Height = 24
            PNG = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              002F49444154484BEDD1B10D00300C02419CFD7776AC880D285CE4AF797A04C4
              CA7D7A78466A78EAB8D8C3C91FE06440BAA12D0C0AE43C56C80000000049454E
              44AE426082}
            FileName = 
              'C:\Projetos\Agenda\Imagens\ic_menu\ic_menu_white_24dp\ic_menu_wh' +
              'ite_24dp\android\drawable-mdpi\ic_menu_white_24dp.png'
          end>
        Name = 'ic_menu_white_24dp'
      end>
    Destination = <
      item
        Layers = <
          item
            Name = 'ic_menu_white_24dp'
          end>
      end>
    Left = 248
    Top = 152
  end
  object fgActivityDialog: TfgActivityDialog
    Left = 168
    Top = 152
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://54.200.116.223:8080/datasnap/rest/TSrvServerMetodos'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 80
    Top = 288
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 80
    Top = 384
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'text/html'
    Left = 80
    Top = 336
  end
  object FDConnectionDBEscola: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\Agenda\BD\SQLite\dbEscola.s3db'
      'LockingMode=Normal'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 192
    Top = 32
  end
  object FDConnectionDBResponsavel: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\Agenda\BD\SQLite\dbResponsavel.s3db'
      'LockingMode=Normal'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 328
    Top = 32
  end
  object fdqLogError: TFDQuery
    Connection = FDConnectionDB
    SQL.Strings = (
      'select * from log_error l'
      'where l.log_error_id = :log_error_id')
    Left = 176
    Top = 288
    ParamData = <
      item
        Name = 'LOG_ERROR_ID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqLogErrorSaveServer: TFDQuery
    Connection = FDConnectionDB
    SQL.Strings = (
      'select * from log_error l'
      'where enviado_server is null')
    Left = 288
    Top = 288
  end
end
