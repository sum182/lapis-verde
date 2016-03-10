unit untAgendaEscolaNew;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ScrollBox, FMX.Memo;

type
  TfrmAgendaEscolaNew = class(TfrmBaseToolBar)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendaEscolaNew: TfrmAgendaEscolaNew;

implementation

{$R *.fmx}

uses smGeralFMX, untDM, untDmEscola, untDMStyles, untFuncoes;

procedure TfrmAgendaEscolaNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  self.DisposeOf;
  self:= nil;
end;

procedure TfrmAgendaEscolaNew.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
end;

procedure TfrmAgendaEscolaNew.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DmEscola.CriarAgenda(Memo1.Text);
end;

procedure TfrmAgendaEscolaNew.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  DmEscola.SalvarDadosServer;
  DM.SalvarDadosServer;
end;

procedure TfrmAgendaEscolaNew.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Dm.FDConnectionDBEscola.ExecSQL('delete from agenda;');
  Dm.FDConnectionDBEscola.ExecSQL('delete from agenda_aluno;');
  Dm.FDConnectionDB.ExecSQL('delete from log_error;');
end;

procedure TfrmAgendaEscolaNew.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  DmEscola.GetAgenda(GetFuncionarioId,0);
end;

end.
