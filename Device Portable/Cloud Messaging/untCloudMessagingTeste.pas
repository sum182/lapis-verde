unit untCloudMessagingTeste;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls, IPPeerClient,
  REST.Backend.PushTypes, System.JSON, System.PushNotification, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, REST.Backend.KinveyProvider, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Backend.BindSource, REST.Backend.PushDevice,
  REST.Backend.KinveyPushDevice, FMX.Edit, FMX.Layouts;

type
  TfrmCloudMessagingTeste = class(TForm)
    CheckBox1: TCheckBox;
    Memo1: TMemo;
    PushEvents1: TPushEvents;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    KinveyProvider1: TKinveyProvider;
    ToolBar1: TToolBar;
    btnGetDeviceInfo: TButton;
    Layout1: TLayout;
    procedure PushEvents1PushReceived(Sender: TObject; const AData: TPushData);
    procedure PushEvents1DeviceTokenRequestFailed(Sender: TObject;
      const AErrorMessage: string);
    procedure PushEvents1DeviceTokenReceived(Sender: TObject);
    procedure PushEvents1DeviceRegistered(Sender: TObject);
    procedure btnGetDeviceInfoClick(Sender: TObject);
  private
    procedure GetDeviceInfo;
  public
    { Public declarations }
  end;

var
  frmCloudMessagingTeste: TfrmCloudMessagingTeste;

implementation

uses
{$IFDEF IOS}
  FMX.PushNotification.IOS; // inject IOS push provider
{$ENDIF}

{$IFDEF ANDROID}
  FMX.PushNotification.Android; // inject GCM push provider
{$ENDIF}

{$R *.fmx}

var
  APushService: TPushService;
  AServiceConnection: TPushServiceConnection;

procedure TfrmCloudMessagingTeste.btnGetDeviceInfoClick(Sender: TObject);
begin
  GetDeviceInfo;
end;

procedure TfrmCloudMessagingTeste.GetDeviceInfo;
var
  DeviceId:String;
  DeviceToken:String;
begin

  APushService:=TPushServiceManager.Instance.GetServiceByName(TPushService.TServiceNames.GCM);

{$IFDEF ANDROID}
  APushService.AppProps[TPushService.TAppPropNames.GCMAppID]:='279079000294';
{$ENDIF}

  AServiceConnection:=TPushServiceConnection.Create(APushService);
  AServiceConnection.Active:=True;
  DeviceId:=APushService.DeviceIDValue[TPushService.TDeviceIDNames.DeviceID];
  DeviceToken:=APushService.DeviceTokenValue[TPushService.TDeviceTokenNames.DeviceToken];

  Memo1.Lines.Add('');
  Memo1.Lines.Add('DeviceId: ' + DeviceId);
  Memo1.Lines.Add('');
  Memo1.Lines.Add('DeviceToken: ' + DeviceToken);
  Memo1.Lines.Add('');
  Memo1.Lines.Add('--');


end;

procedure TfrmCloudMessagingTeste.PushEvents1DeviceRegistered(Sender: TObject);
begin
  Memo1.Lines.Add('Device Registered');
  Memo1.Lines.Add('');
end;

procedure TfrmCloudMessagingTeste.PushEvents1DeviceTokenReceived(Sender: TObject);
begin
  Memo1.Lines.Add('Device Token Received');
  Memo1.Lines.Add('');
end;

procedure TfrmCloudMessagingTeste.PushEvents1DeviceTokenRequestFailed(Sender: TObject;
  const AErrorMessage: string);
begin
  Memo1.Lines.Add('Device Token Request Failed');
  Memo1.Lines.Add(AErrorMessage);
  Memo1.Lines.Add('');
end;

procedure TfrmCloudMessagingTeste.PushEvents1PushReceived(Sender: TObject;
  const AData: TPushData);
begin
  Memo1.Lines.Add('Device push received');
  Memo1.Lines.Add(AData.Message);
  Memo1.Lines.Add('');

end;

end.
