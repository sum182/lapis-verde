unit UntPreferencias;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.ListBox, FMX.Layouts;

type
  TfrmPreferencias = class(TForm)
    ToolBar1: TToolBar;
    spbBack: TSpeedButton;
    spbGravar: TSpeedButton;
    ListBox1: TListBox;
    lstgrpLogin: TListBoxGroupHeader;
    lstitDesconectar: TListBoxItem;
    swtDesconectar: TSwitch;
    lytPreferencias: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure spbGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreferencias: TfrmPreferencias;

implementation

{$R *.fmx}
{$R *.iPhone4in.fmx IOS}
{$R *.NmXhdpiPh.fmx ANDROID}

uses UntMain;

procedure TfrmPreferencias.FormCreate(Sender: TObject);
begin
  frmMain.FLib.ReadConfig;
  swtDesconectar.IsChecked := frmMain.FLib.DesconectarAoSair;
end;

procedure TfrmPreferencias.spbGravarClick(Sender: TObject);
begin
  frmMain.FLib.DesconectarAoSair := swtDesconectar.IsChecked;
  frmMain.FLib.SaveConfig;
end;

end.
