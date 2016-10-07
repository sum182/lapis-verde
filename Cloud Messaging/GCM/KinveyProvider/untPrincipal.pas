unit untPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls, IPPeerClient,
  REST.Backend.PushTypes, System.JSON, System.PushNotification, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, REST.Backend.KinveyProvider, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Backend.BindSource, REST.Backend.PushDevice,
  REST.Backend.KinveyPushDevice;

type
  TForm1 = class(TForm)
    CheckBox1: TCheckBox;
    Memo1: TMemo;
    PushEvents1: TPushEvents;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    KinveyProvider1: TKinveyProvider;
    procedure PushEvents1PushReceived(Sender: TObject; const AData: TPushData);
    procedure PushEvents1DeviceTokenRequestFailed(Sender: TObject;
      const AErrorMessage: string);
    procedure PushEvents1DeviceTokenReceived(Sender: TObject);
    procedure PushEvents1DeviceRegistered(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.PushEvents1DeviceRegistered(Sender: TObject);
begin
  Memo1.Lines.Add('Device Registered');
  Memo1.Lines.Add('');
end;

procedure TForm1.PushEvents1DeviceTokenReceived(Sender: TObject);
begin
  Memo1.Lines.Add('Device Token Received');
  Memo1.Lines.Add('');
end;

procedure TForm1.PushEvents1DeviceTokenRequestFailed(Sender: TObject;
  const AErrorMessage: string);
begin
  Memo1.Lines.Add('Device Token Request Failed');
  Memo1.Lines.Add(AErrorMessage);
  Memo1.Lines.Add('');
end;

procedure TForm1.PushEvents1PushReceived(Sender: TObject;
  const AData: TPushData);
begin
  Memo1.Lines.Add('Device push received');
  Memo1.Lines.Add(AData.Message);
  Memo1.Lines.Add('');

end;

end.
