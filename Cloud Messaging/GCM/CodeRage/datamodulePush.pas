unit datamodulePush;

interface

uses
  System.SysUtils, System.Classes, GCMNotification, RestClientPost, IndyPeerImpl,


   IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL
  ;

type
  TdmPush = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private


    { Private declarations }
    {$IFDEF ANDROID}
    gcmn: TGCMNotification;
    {$ENDIF}

  public
    { Public declarations }
    function GetDeviceRegistrationId: string;
    function PushMessage(Pushmessage: string): string;
  end;

var
  dmPush: TdmPush;

const
  YOUR_GCM_SENDERID = '113606515622';
  YOUR_API_ID = 'AIzaSyAhjlQNMQG7Het495R-PKLJKlYGtdHRX5U';

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


procedure TdmPush.DataModuleCreate(Sender: TObject);
var
  isRegistered : boolean;
begin

  isRegistered := true;
  {$IFDEF ANDROID}
  try
    gcmn := TGCMNotification.Create(self);
    gcmn.SenderID := YOUR_GCM_SENDERID;
    isRegistered := gcmn.DoRegister;
  except
  end;
  {$ENDIF}
end;

procedure TdmPush.DataModuleDestroy(Sender: TObject);
begin
 {$IFDEF ANDROID}
  gcmn.Free();
  {$ENDIF}
end;

function TdmPush.GetDeviceRegistrationId: string;
begin
  {$IFDEF ANDROID}
  result := gcmn.RegistrationID;
  {$ELSE}
  result := 'Mobile Test';
  {$ENDIF}
end;


function TdmPush.PushMessage(Pushmessage : string):string;
const
  sendUrl = 'https://android.googleapis.com/gcm/send';
var
  Params: TStringList;
  AuthHeader: STring;
  idHTTP: TIDHTTP;
  SSLIOHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  idHTTP := TIDHTTP.Create(nil);
  try
    SslIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    idHTTP.IOHandler := SSLIOHandler;
    idHTTP.HTTPOptions := [];
    Params := TStringList.Create;
    try
      Params.Add('registration_id='+ GetDeviceRegistrationId());
      Params.Values['data.message'] := Pushmessage;
      idHTTP.Request.Host := sendUrl;
      AuthHeader := 'Authorization: key=' + YOUR_API_ID;
      idHTTP.Request.CustomHeaders.Add(AuthHeader);
      IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded;charset=UTF-8';
      result := idHTTP.Post(sendUrl, Params);
    finally
      Params.Free;
    end;
  finally
    FreeAndNil(idHTTP);
  end;

end;

end.
