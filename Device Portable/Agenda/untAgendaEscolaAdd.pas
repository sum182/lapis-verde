unit untAgendaEscolaAdd;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ScrollBox, FMX.Memo, FGX.VirtualKeyboard;

type
  TfrmAgendaEscolaAdd = class(TfrmBaseToolBar)
    memAgenda: TMemo;
    SpeedButton1: TSpeedButton;
    lblAgenda: TLabel;
    ToolBarNome: TToolBar;
    lblNome: TLabel;
    Layout1: TLayout;
    fgVirtualKeyboard1: TfgVirtualKeyboard;
    layMemo: TLayout;
    VertScrollBox1: TVertScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memAgendaChangeTracking(Sender: TObject);
    procedure memAgendaChange(Sender: TObject);
    procedure memAgendaClick(Sender: TObject);
    procedure fgVirtualKeyboard1Hide(Sender: TObject; const Bounds: TRect);
    procedure fgVirtualKeyboard1Show(Sender: TObject; const Bounds: TRect);
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

uses smGeralFMX, untDM, untDmEscola, untDMStyles, untFuncoes, smMensagensFMX,
  FMX.Forms;

procedure TfrmAgendaEscolaAdd.btnVoltarClick(Sender: TObject);
begin
  fAllowCloseForm:=True;
  Close;
  inherited;
end;

procedure TfrmAgendaEscolaAdd.fgVirtualKeyboard1Hide(Sender: TObject;
  const Bounds: TRect);
begin
  inherited;
  layBase.Align := TAlignLayout.Client;
end;

procedure TfrmAgendaEscolaAdd.fgVirtualKeyboard1Show(Sender: TObject;
  const Bounds: TRect);
begin
  inherited;
  layBase.Align := TAlignLayout.Top;
  if BorderStyle <> TFmxFormBorderStyle.None then
    layBase.Height := Screen.Size.Height - Bounds.Height
  else
    layBase.Height := Screen.Size.Height - Bounds.Height - 20;
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

procedure TfrmAgendaEscolaAdd.memAgendaChange(Sender: TObject);
begin
  inherited;
  lblAgenda.Visible:= (memAgenda.Text = '');
end;

procedure TfrmAgendaEscolaAdd.memAgendaChangeTracking(Sender: TObject);
begin
  inherited;
  lblAgenda.Visible:= (memAgenda.Text = '');
end;

procedure TfrmAgendaEscolaAdd.memAgendaClick(Sender: TObject);
begin
  inherited;
  OnClickFields(Self);
end;

procedure TfrmAgendaEscolaAdd.SetTitulo;
begin
  lblNome.Text := 'Para: ' + Titulo;
end;

procedure TfrmAgendaEscolaAdd.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DmEscola.CriarAgenda(memAgenda.Text,AlunoId,TurmaId);
  DmEscola.SalvarDadosServer;
  Dm.SalvarDadosServer;
  memAgenda.Text:=EmptyStr;
  fAllowCloseForm:=True;
  Close;
end;



end.
