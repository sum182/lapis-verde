unit UntPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.TabControl, UntDialogo1, UntCadastro, System.Actions,
  FMX.ActnList;

type
  TfrmPrincipal = class(TForm)
    ToolBar1: TToolBar;
    spbNovo: TSpeedButton;
    tbctrlPrincipal: TTabControl;
    tbitemPrincipal: TTabItem;
    tbitemDialogo1: TTabItem;
    tbitemCadastro: TTabItem;
    Label1: TLabel;
    ActionList1: TActionList;
    actionTab: TChangeTabAction;
    lytPrincipal: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure spbNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FDialogo : TfrmDialogo1;
    FCadastro : TfrmCadastro;
    procedure GoToTab(ATabTarget: TTabItem; Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}
{$R *.iPhone55in.fmx IOS}
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  tbctrlPrincipal.ActiveTab   := tbitemPrincipal;
  tbctrlPrincipal.TabPosition := TTabPosition.None;
end;

procedure TfrmPrincipal.GoToTab(ATabTarget: TTabItem; Sender: TObject);
begin
  actionTab.Tab := ATabTarget;
  actionTab.ExecuteTarget(Sender);
end;

procedure TfrmPrincipal.spbNovoClick(Sender: TObject);
begin
  if not (Assigned(FDialogo)) then
    FDialogo := TfrmDialogo1.Create(Self);

  tbitemDialogo1.AddObject(FDialogo.lytDialogo);
  frmPrincipal.GoToTab(frmPrincipal.tbitemDialogo1, Sender);
end;

end.
