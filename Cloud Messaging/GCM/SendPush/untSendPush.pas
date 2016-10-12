unit untSendPush;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.JSON
  ;

type
  TForm2 = class(TForm)
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    edtMessage: TEdit;
    Label1: TLabel;
    memResponse: TMemo;
    Label2: TLabel;
    btnSendMessage: TButton;
    procedure btnSendMessageClick(Sender: TObject);
  private
    { Private declarations }
  public
   procedure SendMessage(msg:String);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }

procedure TForm2.btnSendMessageClick(Sender: TObject);
begin
  SendMessage(edtMessage.Text);
end;

procedure TForm2.SendMessage(msg: String);
var
  AJson: TJSONObject;
  AJsonData: TJSONObject;
  ARegisterIds: TJSONArray;
  AData, AResponseContent: TStringStream;
  DeviceToken: string;
begin
  ARegisterIds := TJSONArray.Create();
  AJson := TJSONObject.Create();
  try

    //Celular Alvaro
    // Set Device token
    DeviceToken:='APA91bFIdMvO6U-gM2KodISW3jkNaaivjP3Geul1DqonW6Xf3gRdt3f2OXBr8MosZiURR4tvkectEoMAVeOvbu_nfYjCp6pR1wj39c6RdXN0RAREXcfPeQ0cEVRqaCr9m_okI1DTeVJ5';
    // Set the device token..
    ARegisterIds.Add(DeviceToken);

    //Celular Vanessa
    DeviceToken:='APA91bGHZGTmGe5z8cn4beE6QrIskXJX-HlCsYnOcz2Px2c5Oh8EF5QATLcez06sQ_BXoGlmdLFUMaHKrDyP09TTuk1fnbWwjDtN-5zX3-Qq0BjZtrnoWVqTATIJExWg04sli7LFSDyq';
    // Set the device token..
    ARegisterIds.Add(DeviceToken);

    //Tablet
    DeviceToken:='APA91bEc7yib72snGDn02TYsuud87gv6K1CTyH1-AdEfY-lja0KyA64dQf4Gb45ZF5_goEmxzHcMM3aOei9gXkiylbY-EFoZSGzOLWIsExemUQdyHOAtCTbz-iTdF2HsVaIpQg-hnPjm';
    // Set the device token..
    ARegisterIds.Add(DeviceToken);

    // Create Json to Send!
    AJsonData := TJSONObject.Create();
    AJsonData.AddPair('id','');
    AJsonData.AddPair('message',msg);
    // Add the information to send GCM server;
    AJson.AddPair('registration_ids',ARegisterIds);
    AJson.AddPair('data',AJsonData);
    // Set the Header.
    IdHTTP1.Request.ContentType := 'application/json';
    // Set the Key for Server Apllication
    IdHTTP1.Request.CustomHeaders.AddValue('Authorization','key=AIzaSyCU7YtJK0A4LDfFrvicS58RdHoTi814uR4');
    AData := TStringStream.Create(AJson.ToString);
    AData.Position := 0;
    AResponseContent := TStringStream.Create();
    // Send the notification
    IdHTTP1.Post('https://android.googleapis.com/gcm/send',AData,AResponseContent);
    AResponseContent.Position := 0;
    memResponse.Lines.Add(AResponseContent.DataString);
  finally
  end;
end;

end.
