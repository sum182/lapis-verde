object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 273
  Width = 393
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    Server = ServerContainer.DSServer1
    Filters = <>
    AuthenticationManager = DSAuthenticationManager1
    WebDispatch.PathInfo = 'datasnap*'
    Left = 96
    Top = 75
  end
  object DSAuthenticationManager1: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManager1UserAuthenticate
    OnUserAuthorize = DSAuthenticationManager1UserAuthorize
    Roles = <>
    Left = 236
    Top = 75
  end
end
