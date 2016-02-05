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
end
