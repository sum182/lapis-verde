unit formMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit;

type
  TfrmMain = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses datamodulePush;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  edit1.Text := dmPush.GetDeviceRegistrationId();
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  dmPush.PushMessage(edit2.Text);
end;

end.
