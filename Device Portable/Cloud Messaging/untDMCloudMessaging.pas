unit untDMCloudMessaging;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, REST.Backend.PushTypes,
  System.JSON, REST.Backend.KinveyPushDevice, System.PushNotification,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Backend.BindSource,
  REST.Backend.PushDevice, REST.Backend.KinveyProvider;

type
  TDMCloudMessaging = class(TDataModule)
    KinveyProvider: TKinveyProvider;
    PushEvents: TPushEvents;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetDeviceInfo;
  end;

var
  DMCloudMessaging: TDMCloudMessaging;
  DeviceId:String;
  DeviceToken:String;
  APushService: TPushService;
  AServiceConnection: TPushServiceConnection;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses
   smGeralFMX, FMX.Dialogs

  {$IFDEF IOS}
    ,FMX.PushNotification.IOS // inject IOS push provider
  {$ENDIF}

  {$IFDEF ANDROID}
    ,FMX.PushNotification.Android // inject GCM push provider
  {$ENDIF}

  ;


{$R *.dfm}

{ TDMCloudMessaging }

procedure TDMCloudMessaging.DataModuleCreate(Sender: TObject);
begin
  GetDeviceInfo;
end;

procedure TDMCloudMessaging.GetDeviceInfo;
begin
  APushService:=TPushServiceManager.Instance.GetServiceByName(TPushService.TServiceNames.GCM);
  AServiceConnection:=TPushServiceConnection.Create(APushService);

  if smGeralFMX.IsSysOSWindows then
    Exit;

  {$IFDEF ANDROID}
  APushService.AppProps[TPushService.TAppPropNames.GCMAppID]:='279079000294';
  {$ENDIF}

  AServiceConnection.Active:=True;
  DeviceId:=APushService.DeviceIDValue[TPushService.TDeviceIDNames.DeviceID];
  DeviceToken:=APushService.DeviceTokenValue[TPushService.TDeviceTokenNames.DeviceToken];
  ShowMessage('GetDeviceInfo');
end;

end.
