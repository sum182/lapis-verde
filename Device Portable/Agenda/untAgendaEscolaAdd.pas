unit untAgendaEscolaAdd;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ScrollBox, FMX.Memo, FGX.VirtualKeyboard;

type
  TfrmAgendaEscolaAdd = class(TfrmBaseToolBar)
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    ToolBar2: TToolBar;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure SetTitulo;
  public
    AlunoId:Integer;
    TurmaId:Integer;
    Titulo:String;
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

procedure TfrmAgendaEscolaAdd.FormShow(Sender: TObject);
begin
  inherited;
  SetTitulo;
end;

procedure TfrmAgendaEscolaAdd.SetTitulo;
begin
  lblTitulo.Text := Titulo + ' - Nova Agenda';
end;

procedure TfrmAgendaEscolaAdd.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DmEscola.CriarAgenda(Memo1.Text,AlunoId,TurmaId);
  DmEscola.SalvarDadosServer;
  Dm.SalvarDadosServer;
  Memo1.Text:=EmptyStr;
  fAllowCloseForm:=True;
  Close;
end;



end.
