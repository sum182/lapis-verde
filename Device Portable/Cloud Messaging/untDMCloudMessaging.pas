unit untDMCloudMessaging;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, REST.Backend.PushTypes,
  System.JSON, REST.Backend.KinveyPushDevice, System.PushNotification,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Backend.BindSource,
  REST.Backend.PushDevice, REST.Backend.KinveyProvider, System.Notification;

type
  TDMCloudMessaging = class(TDataModule)
    KinveyProvider: TKinveyProvider;
    PushEvents: TPushEvents;
    NotificationCenter: TNotificationCenter;
    procedure DataModuleCreate(Sender: TObject);
    procedure PushEventsPushReceived(Sender: TObject; const AData: TPushData);
    procedure RefreshAgenda(AlertBody:string);
  private
    { Private declarations }
  public
    procedure GetDeviceInfo;
    procedure CreateNotification(AlertBody:string);
  end;

var
  DMCloudMessaging: TDMCloudMessaging;
  DeviceId:String;
  DeviceToken:String;
  APushService: TPushService;
  AServiceConnection: TPushServiceConnection;
  NotificationNumber: Integer;

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

  , untDM, smMensagensFMX, untLibDevicePortable, untAgendaView, untDmGetServer,
  FMX.Forms;


{$R *.dfm}

{ TDMCloudMessaging }

procedure TDMCloudMessaging.CreateNotification(AlertBody: string);
var
  MyNotification: TNotification;
  Thread: TThread;
begin
  MyNotification := NotificationCenter.CreateNotification;
  try
    MyNotification.Name := 'Notification_' + IntToStr(NotificationNumber);
    //MyNotification.Name := 'Notification';
    MyNotification.AlertBody := AlertBody;
    // Set Icon Badge Number (for iOS) or message number (for Android) as well
    //MyNotification.Number := NotificationNumber;
    MyNotification.EnableSound := True;
    // Send message to the notification center
    NotificationCenter.PresentNotification(MyNotification);
    Inc(NotificationNumber);

    RefreshAgenda(AlertBody);
  finally
    MyNotification.DisposeOf;
  end;
end;

procedure TDMCloudMessaging.DataModuleCreate(Sender: TObject);
begin
  GetDeviceInfo;
  NotificationNumber:=1;
end;

procedure TDMCloudMessaging.GetDeviceInfo;
begin
  APushService:=TPushServiceManager.Instance.GetServiceByName(TPushService.TServiceNames.GCM);
  AServiceConnection:=TPushServiceConnection.Create(APushService);

  if smGeralFMX.IsSysOSWindows then
  begin
    DeviceId:='DeviceId-Teste-Windows';
    DeviceToken:='DeviceToken-Teste-Windows';
    Exit;
  end;

  {$IFDEF ANDROID}
  APushService.AppProps[TPushService.TAppPropNames.GCMAppID]:='279079000294';
  {$ENDIF}

  AServiceConnection.Active:=True;
  DeviceId:=APushService.DeviceIDValue[TPushService.TDeviceIDNames.DeviceID];
  DeviceToken:=APushService.DeviceTokenValue[TPushService.TDeviceTokenNames.DeviceToken];
end;

procedure TDMCloudMessaging.PushEventsPushReceived(Sender: TObject;
  const AData: TPushData);
begin
  CreateNotification(AData.Message);
end;


procedure TDMCloudMessaging.RefreshAgenda(AlertBody:string);
var
  Data:TDate;
  DataStr: String;
  ThreadMsg: TThread;
begin
 try
   ThreadMsg := TThread.CreateAnonymousThread(procedure
    begin
      try
        DataStr:= AlertBody;
        DataStr:= StringReplace(DataStr, 'Agenda: ', '', [rfReplaceAll, rfIgnoreCase]);
        DataStr:= Copy(DataStr,1,10);
        MsgPoupUpTeste('Data:' + DataStr );

        Data:= StrToDateDef (DataStr,0);

        if Data <= 0 then
          Exit;

        Dm.SyncServer := True;
        DmGetServer.GetAgenda(Data,Data);
        Dm.SyncServer := False;


        if TThread.CheckTerminated then
        begin
          TThread.Synchronize(nil, procedure
          begin
            if Assigned(frmAgendaView) then
            begin
              frmAgendaView.RefreshForm;
              MsgPoupUpTeste('TDMCloudMessaging frmAgendaView.RefreshForm - OK');
            end;

            Application.ProcessMessages;
          end);
        end;


      finally
        if not TThread.CheckTerminated then
          TThread.Synchronize(nil, procedure
          begin
            if Assigned(frmAgendaView) then
            begin
              frmAgendaView.RefreshForm;
              MsgPoupUpTeste('TDMCloudMessaging frmAgendaView.RefreshForm - OK');
            end;
            Application.ProcessMessages;
          end);
        Dm.SyncServer := False;;
      end;
    end);
  ThreadMsg.Start;
except on E:Exception do
  begin
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'DMCloudMessaging.RefreshAgenda',
                    Now,
                    'Erro na atualização da agenda' + #13 + E.Message
                  );
    Raise;
  end;
end;
end;

end.
