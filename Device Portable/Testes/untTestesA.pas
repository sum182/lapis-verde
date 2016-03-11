unit untTestesA;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmTesteA = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesteA: TfrmTesteA;

implementation

{$R *.fmx}

uses untTestesB;

procedure TfrmTesteA.SpeedButton1Click(Sender: TObject);
begin
 if not Assigned(frmTesteB) then
    Application.CreateForm(TfrmTesteB, frmTesteB);

  frmTesteB.Show;
end;

procedure TfrmTesteA.SpeedButton2Click(Sender: TObject);
begin
  frmTesteA.Close;
  //frmTesteA.DisposeOf;
 // frmTesteA:=nil;
end;

end.
