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
    ToolBar1: TToolBar;
    btnGetDeviceInfo: TButton;
    Layout1: TLayout;
    procedure btnGetDeviceInfoClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmCloudMessagingTeste: TfrmCloudMessagingTeste;

implementation

uses
   smGeralFMX

  {$IFDEF IOS}
    ,FMX.PushNotification.IOS // inject IOS push provider
  {$ENDIF}

  {$IFDEF ANDROID}
    ,FMX.PushNotification.Android // inject GCM push provider
  {$ENDIF}

  , untDMCloudMessaging;

{$R *.fmx}



procedure TfrmCloudMessagingTeste.btnGetDeviceInfoClick(Sender: TObject);
begin
  Memo1.Lines.Add('');
  Memo1.Lines.Add('DeviceId: ' + DeviceId);
  Memo1.Lines.Add('');
  Memo1.Lines.Add('DeviceToken: ' + DeviceToken);
  Memo1.Lines.Add('');
  Memo1.Lines.Add('--');
end;


end.
