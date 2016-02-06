object DM: TDM
  OldCreateOrder = False
  Height = 414
  Width = 473
  object RestConnection: TRESTClient
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Params = <>
    HandleRedirects = True
    Left = 200
    Top = 30
  end
  object RestReq: TRESTRequest
    Client = RestConnection
    Params = <>
    Response = RestResp
    SynchronizedEvents = False
    Left = 104
    Top = 142
  end
  object RestResp: TRESTResponse
    Left = 312
    Top = 142
  end
end
