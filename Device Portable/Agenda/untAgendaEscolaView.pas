unit untAgendaEscolaView;

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
  TfrmAgendaEscolaView = class(TfrmBaseToolBar)
    lstAgenda: TListView;
    bsAgenda: TBindSourceDB;
    blAgenda: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public
    AlunoId:Integer;
    TurmaId:Integer;
  end;

var
  frmAgendaEscolaView: TfrmAgendaEscolaView;

implementation

{$R *.fmx}

uses untFuncoes, untDmEscola, untDM, untAgendaEscolaAdd, untPrincipal;

procedure TfrmAgendaEscolaView.btnVoltarClick(Sender: TObject);
begin
  fAllowCloseForm:=True;
  Close;
  inherited;
end;

procedure TfrmAgendaEscolaView.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
  //self.muMainMenu := frmPrincipal.MultiView1;
end;

procedure TfrmAgendaEscolaView.FormShow(Sender: TObject);
begin
  inherited;
  DmEscola.OpenAgenda(AlunoId,TurmaId);
end;

procedure TfrmAgendaEscolaView.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DmEscola.GetAgenda(GetFuncionarioId,0);
  DmEscola.OpenAgenda(AlunoId,TurmaId);
end;

procedure TfrmAgendaEscolaView.SpeedButton2Click(Sender: TObject);
begin
  inherited;
 if not Assigned(frmAgendaEscolaAdd) then
    Application.CreateForm(TfrmAgendaEscolaAdd, frmAgendaEscolaAdd);

  frmAgendaEscolaAdd.AlunoId:= AlunoId;
  frmAgendaEscolaAdd.TurmaId:= TurmaId;
  frmAgendaEscolaAdd.Show;
end;

end.
