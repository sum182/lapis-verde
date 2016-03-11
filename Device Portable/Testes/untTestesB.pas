unit untTestesB;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmTesteB = class(TForm)
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesteB: TfrmTesteB;

implementation

{$R *.fmx}

procedure TfrmTesteB.SpeedButton2Click(Sender: TObject);
begin
  frmTesteB.Close;
  //frmTesteB.DisposeOf;
 // frmTesteB:=nil;
end;

end.
