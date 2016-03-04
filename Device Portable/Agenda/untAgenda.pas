unit untAgenda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, FMX.ListView, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TfrmAgenda = class(TfrmBaseToolBar)
    lstAgenda: TListView;
    bsAgenda: TBindSourceDB;
    blAgenda: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmAgenda: TfrmAgenda;

implementation

{$R *.fmx}

uses untFuncoes, untDmEscola, untDM;

procedure TfrmAgenda.btnVoltarClick(Sender: TObject);
begin
  inherited;
  frmAgenda.Close;
  frmAgenda.DisposeOf;
  frmAgenda:=nil;
end;

procedure TfrmAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
  DmEscola.OpenAgenda;
end;

procedure TfrmAgenda.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DmEscola.GetAgenda(0,0);
end;

end.
