object ServerContainer: TServerContainer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 381
  Width = 455
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 200
    Top = 19
  end
  object DSServerClassTeste: TDSServerClass
    OnGetClass = DSServerClassTesteGetClass
    Server = DSServer1
    Left = 200
    Top = 88
  end
  object DSServerClassEscola: TDSServerClass
    OnGetClass = DSServerClassEscolaGetClass
    Server = DSServer1
    Left = 200
    Top = 256
  end
  object DSServerClassResponsavel: TDSServerClass
    OnGetClass = DSServerClassResponsavelGetClass
    Server = DSServer1
    Left = 200
    Top = 312
  end
  object DSServerClassMain: TDSServerClass
    OnGetClass = DSServerClassMainGetClass
    Server = DSServer1
    Left = 200
    Top = 144
  end
  object DSServerClassAgenda: TDSServerClass
    OnGetClass = DSServerClassAgendaGetClass
    Server = DSServer1
    Left = 200
    Top = 200
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=dbdev'
      'User_Name=admin'
      'Password=senhadbdevlapisverde'
      'Server=dbdev.c8jh4twad1hp.sa-east-1.rds.amazonaws.com'
      'DriverID=MySQL')
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 90
    Top = 104
  end
  object DSServer1: TDSServer
    OnDisconnect = DSServer1Disconnect
    Left = 88
    Top = 43
  end
  object FDConnectionLocal: TFDConnection
    Params.Strings = (
      'Database=agenda'
      'User_Name=root'
      'Password=admin'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 90
    Top = 160
  end
end
