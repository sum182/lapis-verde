unit uFrmMenus;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBaseFull, FMX.Layouts, FMX.Effects, FMX.Controls.Presentation, FMX.Objects;

type
  TFrmMenu = class(TFrmBaseFull)
    GridPanelLayout1: TGridPanelLayout;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses uFrmDays;

procedure TFrmMenu.Image2Click(Sender: TObject);
begin
  inherited;
  if not Assigned(FrmDays) then
    Application.CreateForm(TFrmDays,FrmDays);
  FrmDays.Show;
  FreeAndNil(FrmMenu);
end;

end.
