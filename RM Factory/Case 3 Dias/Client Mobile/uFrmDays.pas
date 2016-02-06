unit uFrmDays;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBaseFull, FMX.Layouts, FMX.Effects, FMX.Controls.Presentation, FMX.Objects;

type
  TFrmDays = class(TFrmBaseFull)
    GridPanelLayout1: TGridPanelLayout;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    lblDia1: TLabel;
    lblDia2: TLabel;
    lblDia3: TLabel;
    lblDia4: TLabel;
    lblDia5: TLabel;
    lblDia6: TLabel;
    lblDia7: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure DoClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmDays: TFrmDays;

implementation

uses
  System.JSON, uDM, uFrmReservas;

{$R *.fmx}

procedure TFrmDays.DoClick(Sender: TObject);
begin
  DM.DataReserva := TImage(Sender).Tag;
  if not Assigned(FrmReservas) then
    Application.CreateForm(TFrmReservas,FrmReservas);
  FrmReservas.Show;
  FreeAndNil(FrmDays);
end;

procedure TFrmDays.FormShow(Sender: TObject);
var
  jArr: TJSONArray;
  jObj: TJSONObject;
  I: Integer;
  Data: TDate;
begin
  inherited;
  jArr := DM.GetDays;
  for I := 0 to jArr.Size - 1 do
  begin
    jObj                := jArr.Items[I] as TJSONObject;
    TLabel(FindComponent('lblDia'+IntToStr(I+1))).Text := jObj.GetValue('Data').Value;
    Data := StrToDate(jObj.GetValue('Data').Value);
    TImage(FindComponent('Image'+IntToStr(I+1))).Tag := Trunc(Data);
    TImage(FindComponent('Image'+IntToStr(I+1))).OnClick := DoClick;
  end;
end;

end.
