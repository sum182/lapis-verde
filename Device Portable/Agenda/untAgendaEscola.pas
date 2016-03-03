unit untAgendaEscola;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.TabControl, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, MultiDetailAppearanceU,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TfrmAgendaEscola = class(TfrmBaseToolBar)
    tbctrlPrincipal: TTabControl;
    tbitTurma: TTabItem;
    tbitAlunos: TTabItem;
    lstTurmas: TListView;
    lstAlunos: TListView;
    btnAtualizar: TSpeedButton;
    bsAlunos: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    bsTurmas: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lstAlunosClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmAgendaEscola: TfrmAgendaEscola;

implementation

{$R *.fmx}

uses untModuloCliente, Data.FireDACJSONReflect, untDM, untDMEscola, untAgenda,
  untPrincipal;

procedure TfrmAgendaEscola.btnAtualizarClick(Sender: TObject);
begin
  DmEscola.GetAlunos;
  DmEscola.GetTurmas;
end;

procedure TfrmAgendaEscola.FormCreate(Sender: TObject);
begin
  inherited;
  DmEscola.OpenQuerys;
  tbctrlPrincipal.ActiveTab := tbitTurma;
end;



procedure TfrmAgendaEscola.lstAlunosClick(Sender: TObject);
begin
  inherited;
  frmPrincipal.OpenForm(TfrmAgenda);
end;

end.

