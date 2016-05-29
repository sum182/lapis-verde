object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 396
  Width = 689
  object DSServer1: TDSServer
    Left = 96
    Top = 11
  end
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    Server = DSServer1
    Filters = <>
    AuthenticationManager = DSAuthenticationManager1
    WebDispatch.PathInfo = 'datasnap*'
    Left = 96
    Top = 75
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 440
    Top = 27
  end
  object DSServerClassTeste: TDSServerClass
    OnGetClass = DSServerClassTesteGetClass
    Server = DSServer1
    Left = 440
    Top = 88
  end
  object DSServerClassEscola: TDSServerClass
    OnGetClass = DSServerClassEscolaGetClass
    Server = DSServer1
    Left = 440
    Top = 256
  end
  object DSServerClassResponsavel: TDSServerClass
    OnGetClass = DSServerClassResponsavelGetClass
    Server = DSServer1
    Left = 440
    Top = 312
  end
  object DSServerClassMain: TDSServerClass
    OnGetClass = DSServerClassMainGetClass
    Server = DSServer1
    Left = 440
    Top = 144
  end
  object DSServerClassAgenda: TDSServerClass
    OnGetClass = DSServerClassAgendaGetClass
    Server = DSServer1
    Left = 440
    Top = 200
  end
  object DSAuthenticationManager1: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManager1UserAuthenticate
    OnUserAuthorize = DSAuthenticationManager1UserAuthorize
    Roles = <>
    Left = 236
    Top = 75
  end
end
