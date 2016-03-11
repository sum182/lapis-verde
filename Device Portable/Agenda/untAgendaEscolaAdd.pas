unit untAgendaEscolaAdd;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ScrollBox, FMX.Memo;

type
  TfrmAgendaEscolaAdd = class(TfrmBaseToolBar)
    Memo1: TMemo;
    ToolBar2: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    AlunoId:Integer;
    TurmaId:Integer;
  end;

var
  frmAgendaEscolaAdd: TfrmAgendaEscolaAdd;

implementation

{$R *.fmx}

uses smGeralFMX, untDM, untDmEscola, untDMStyles, untFuncoes;

procedure TfrmAgendaEscolaAdd.btnVoltarClick(Sender: TObject);
begin
  inherited;
  frmAgendaEscolaAdd.Close;
  frmAgendaEscolaAdd.DisposeOf;
  frmAgendaEscolaAdd:= nil;

end;

procedure TfrmAgendaEscolaAdd.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
end;

procedure TfrmAgendaEscolaAdd.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DmEscola.CriarAgenda(Memo1.Text,AlunoId,TurmaId);
end;

procedure TfrmAgendaEscolaAdd.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  DmEscola.SalvarDadosServer;
  DM.SalvarDadosServer;
end;

procedure TfrmAgendaEscolaAdd.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Dm.FDConnectionDBEscola.ExecSQL('delete from agenda;');
  Dm.FDConnectionDBEscola.ExecSQL('delete from agenda_aluno;');
  Dm.FDConnectionDB.ExecSQL('delete from log_error;');
end;

procedure TfrmAgendaEscolaAdd.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  DmEscola.GetAgenda(GetFuncionarioId,0);
end;

end.
