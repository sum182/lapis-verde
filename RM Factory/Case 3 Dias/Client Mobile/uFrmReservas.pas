unit uFrmReservas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBaseFull, FMX.Layouts, FMX.Effects, FMX.Controls.Presentation, FMX.Objects;

type
  TFrmReservas = class(TFrmBaseFull)
    GridPanelLayout1: TGridPanelLayout;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    lblLivre: TLabel;
    lblInterditadas: TLabel;
    lblReservadas: TLabel;
    lblOcupadas: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReservas: TFrmReservas;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses uDM, System.JSON, uFrmDays;

procedure TFrmReservas.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkBack then
  begin
    if not Assigned(FrmDays) then
      Application.CreateForm(TFrmDays,FrmDays);
    FrmDays.Show;
    FreeAndNil(FrmReservas);
  end;
end;

procedure TFrmReservas.FormShow(Sender: TObject);
var
  jArr: TJSONArray;
  jObj: TJSONObject;
  I: Integer;
begin
  inherited;
  jArr := DM.GetReservas(DM.DataReserva);
  for I := 0 to jArr.Size - 1 do
  begin
    jObj := jArr.Items[I] as TJSONObject;
    case I of
      0: lblOcupadas.Text := 'Ocupadas ('+jObj.GetValue('Ocupada').Value+')';
      1: lblReservadas.Text := 'Reservadas ('+jObj.GetValue('Reservada').Value+')';
      2: lblLivre.Text := 'Livres ('+jObj.GetValue('Livre').Value+')';
      3: lblInterditadas.Text := 'Interditadas ('+jObj.GetValue('Interditada').Value+')';
    end;
  end;
end;

end.
