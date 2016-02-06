unit uFrmHoteis;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBaseFull, FMX.Layouts, FMX.Effects, FMX.Controls.Presentation, FMX.Objects,
  System.JSON;

type
  TFrmHoteis = class(TFrmBaseFull)
    lytGridMain: TGridLayout;
    procedure FormShow(Sender: TObject);
    procedure DoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHoteis: TFrmHoteis;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses uFraButton, uDM, uFrmMenus;

procedure TFrmHoteis.DoClick(Sender: TObject);
begin
  DM.HotelID := TComponent(TComponent(Sender).Owner).Tag;
  if not Assigned(FrmMenu) then
    Application.CreateForm(TFrmMenu,FrmMenu);
  FrmMenu.Show;
  FreeAndNil(FrmHoteis);
end;

procedure TFrmHoteis.FormShow(Sender: TObject);
var
  jArr: TJSONArray;
  jObj: TJSONObject;
  I: Integer;
  Frame: TFraButton;
begin
  inherited;
  jArr := DM.GetHoteis;
  for I := 0 to jArr.Size - 1 do
  begin
    jObj                := jArr.Items[I] as TJSONObject;
    Frame               := TFraButton.Create(Self,jObj.GetValue('nome').Value,'','');
    Frame.Parent        := lytGridMain;
    Frame.Name          := 'Frame'+IntToStr(I);
    Frame.Tag           := jObj.GetValue('id').GetValue<Integer>;

    Frame.imgIcon.OnClick  := DoClick;
    Frame.lblTitle.OnClick := DoClick;
  end;
end;

end.
