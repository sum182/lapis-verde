object ModuloCliente: TModuloCliente
  OldCreateOrder = False
  Height = 271
  Width = 415
  object DSRestConnection1: TDSRestConnection
    Host = '54.200.116.223'
    Port = 8080
    LoginPrompt = False
    Left = 48
    Top = 40
    UniqueId = '{4F60CF93-9F71-4D79-9871-2DBBE4BC6725}'
  end
  object DSRestConnectionLocal: TDSRestConnection
    Host = 'localhost'
    Port = 8080
    LoginPrompt = False
    Left = 56
    Top = 96
    UniqueId = '{4F60CF93-9F71-4D79-9871-2DBBE4BC6725}'
  end
  object DSRestConnectionAWS: TDSRestConnection
    Host = '54.200.116.223'
    Port = 8080
    LoginPrompt = False
    Left = 56
    Top = 152
    UniqueId = '{4F60CF93-9F71-4D79-9871-2DBBE4BC6725}'
  end
end
