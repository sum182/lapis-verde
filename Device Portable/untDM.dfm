object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 257
  Width = 355
  object FDConnectionSQLite: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\Agenda\BD\SQLite\db.s3db'
      'DriverID=SQLite'
      'LockingMode=Normal')
    LoginPrompt = False
    Left = 80
    Top = 32
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 80
    Top = 96
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 80
    Top = 152
  end
  object ImageList1: TImageList
    Source = <
      item
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
    Left = 184
    Top = 152
  end
  object fgActivityDialog: TfgActivityDialog
    Left = 184
    Top = 32
  end
end
