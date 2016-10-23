object DMCloudMessaging: TDMCloudMessaging
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 298
  Width = 433
  object KinveyProvider: TKinveyProvider
    ApiVersion = '3'
    AppKey = 'kid_SJi09wSR'
    AppSecret = 'a125926f5648469b890d00d93a10d466'
    MasterSecret = '3e6e4e94a8314dcaa5d908c280bf9d90'
    UserName = 'user-kinvei'
    Password = 'passkvlpvr'
    AndroidPush.GCMAppID = '279079000294'
    Left = 46
    Top = 37
  end
  object PushEvents: TPushEvents
    Provider = KinveyProvider
    Left = 142
    Top = 37
  end
end
