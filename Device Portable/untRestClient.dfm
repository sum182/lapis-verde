object RestClient: TRestClient
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 415
  object DSRestConnection1: TDSRestConnection
    Host = 'localhost'
    Port = 8080
    UrlPath = 'lapis_verde'
    LoginPrompt = False
    PreserveSessionID = False
    Left = 56
    Top = 40
    UniqueId = '{4F60CF93-9F71-4D79-9871-2DBBE4BC6725}'
  end
  object DSRestConnectionLocal: TDSRestConnection
    Host = 'localhost'
    Port = 8080
    UserName = 'lapisverde_us_2017'
    Password = 'lapisverde_pw_2017'
    LoginPrompt = False
    PreserveSessionID = False
    Left = 56
    Top = 96
    UniqueId = '{4F60CF93-9F71-4D79-9871-2DBBE4BC6725}'
  end
  object DSRestConnectionAWS: TDSRestConnection
    Host = '54.200.116.223'
    Port = 8080
    UserName = 'lapisverde_us_2017'
    Password = 'lapisverde_pw_2017'
    LoginPrompt = False
    PreserveSessionID = False
    Left = 56
    Top = 160
    UniqueId = '{4F60CF93-9F71-4D79-9871-2DBBE4BC6725}'
  end
  object DSRestConnectionApacheLocal: TDSRestConnection
    Host = 'localhost'
    Port = 8080
    UrlPath = 'lapis_verde'
    LoginPrompt = False
    PreserveSessionID = False
    Left = 200
    Top = 40
    UniqueId = '{4F60CF93-9F71-4D79-9871-2DBBE4BC6725}'
  end
  object DSRestConnectionApacheAWS: TDSRestConnection
    Host = '54.200.116.223'
    Port = 8080
    UrlPath = 'lapis_verde'
    LoginPrompt = False
    PreserveSessionID = False
    Left = 200
    Top = 88
    UniqueId = '{4F60CF93-9F71-4D79-9871-2DBBE4BC6725}'
  end
end
