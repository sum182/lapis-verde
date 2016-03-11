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
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
  fAllowCloseForm:=True;
  Close;
  inherited;
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
  DmEscola.SalvarDadosServer;
  DM.SalvarDadosServer;
  Memo1.Text:=EmptyStr;
  fAllowCloseForm:=True;
  Close;
end;



end.
