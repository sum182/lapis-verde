unit untAgendaSelect;

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
  TfrmAgendaSelect = class(TfrmBaseToolBar)
    tbctrlPrincipal: TTabControl;
    tbitTurma: TTabItem;
    tbitAlunos: TTabItem;
    lstTurmas: TListView;
    lstAlunos: TListView;
    bsAlunos: TBindSourceDB;
    BindingsList1: TBindingsList;
    bsTurmas: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    LinkListControlToField1: TLinkListControlToField;
    procedure FormCreate(Sender: TObject);
    procedure lstAlunosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure SetView;
    procedure lstTurmasItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    procedure OpenAgendaAluno;
    procedure OpenAgendaTurma;
  public
    { Public declarations }
  end;

var
  frmAgendaSelect: TfrmAgendaSelect;

implementation

{$R *.fmx}

uses untRestClient, Data.FireDACJSONReflect, untDM, untDmAgenda, untAgendaView,
  untPrincipal, untDMStyles, untLibDevicePortable, untTypes;

procedure TfrmAgendaSelect.FormCreate(Sender: TObject);
begin
  inherited;
  tbctrlPrincipal.ActiveTab := tbitTurma;
  Dm.OpenAlunos;
  Dm.OpenTurmas;

  dm.fdqAluno.First;
  SetView;
end;



procedure TfrmAgendaSelect.lstAlunosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  OpenAgendaAluno;
end;

procedure TfrmAgendaSelect.lstTurmasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  OpenAgendaTurma;
end;

procedure TfrmAgendaSelect.OpenAgendaAluno;
begin
  //frmPrincipal.OpenForm(TfrmAgenda);
  if not Assigned(frmAgendaView) then
    Application.CreateForm(TfrmAgendaView, frmAgendaView);

  frmAgendaView.AlunoId:= Dm.fdqAluno.FieldByName('aluno_id').AsInteger;
  frmAgendaView.OwnerAgenda:= Dm.fdqAluno.FieldByName('nome').AsString;
  frmAgendaView.NomeCompleto:= Dm.fdqAluno.FieldByName('nome_completo').AsString;
  frmAgendaView.DataSetAgenda:= DmAgenda.fdqAgenda;
  frmAgendaView.TurmaId:= 0;
  frmAgendaView.Show;
end;

procedure TfrmAgendaSelect.OpenAgendaTurma;
begin
  if not Assigned(frmAgendaView) then
    Application.CreateForm(TfrmAgendaView, frmAgendaView);

  frmAgendaView.AlunoId:= 0;
  frmAgendaView.TurmaId:= Dm.fdqTurma.FieldByName('turma_id').AsInteger;
  frmAgendaView.OwnerAgenda:= Dm.fdqTurma.FieldByName('nome').AsString;
  frmAgendaView.NomeCompleto:= Dm.fdqTurma.FieldByName('nome').AsString;
  frmAgendaView.DataSetAgenda:= DmAgenda.fdqAgenda;
  frmAgendaView.Show;
end;

procedure TfrmAgendaSelect.SetView;
begin
  if Usuario.Tipo = Responsavel then
  begin
    tbitTurma.Visible:=False;
    tbCtrlPrincipal.ActiveTab:= tbitAlunos;
    tbCtrlPrincipal.TabPosition:= TTabPosition.None;
  end;
end;

end.

