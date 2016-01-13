unit untAgendaEnvio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.ExtCtrls, Vcl.DBCtrls,
  cxDropDownEdit, cxCalendar, cxDBEdit, cxMemo, cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Menus, cxButtons, cxGroupBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmAgendaEnvio = class(TForm)
    fdqAgenda: TFDQuery;
    dsAgenda: TDataSource;
    fdqAgendaagenda_id: TFDAutoIncField;
    fdqAgendatitulo: TStringField;
    fdqAgendadescricao: TMemoField;
    fdqAgendadata: TDateTimeField;
    fdqAgendaagenda_tipo_id: TSmallintField;
    fdqAgendafuncionario_id: TIntegerField;
    cxGroupBox1: TcxGroupBox;
    memoDescricao: TcxDBMemo;
    Label3: TLabel;
    edtTitulo: TcxDBTextEdit;
    Label2: TLabel;
    cxGroupBox2: TcxGroupBox;
    btnEnviar: TcxButton;
    btnCancelar: TcxButton;
    fdqAgendaescola_id: TIntegerField;
    cxGroupBox3: TcxGroupBox;
    cxLabel1: TcxLabel;
    fdqTurma: TFDQuery;
    fdqAluno: TFDQuery;
    dsAluno: TDataSource;
    dsTurma: TDataSource;
    dsTurmaAluno: TDataSource;
    fdqTurmaAluno: TFDQuery;
    lblAluno: TcxLabel;
    lblTurma: TcxLabel;
    fdqAgendaAluno: TFDQuery;
    dsAgendaAluno: TDataSource;
    fdqAgendaAlunoagenda_id: TIntegerField;
    fdqAgendaAlunoaluno_id: TIntegerField;
    cmbbxAluno: TcxLookupComboBox;
    cmbbxTurma: TcxLookupComboBox;
    cmbbxTipo: TcxComboBox;
    lblStatus: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure fdqAgendaNewRecord(DataSet: TDataSet);
    procedure fdqAgendaBeforeOpen(DataSet: TDataSet);
    procedure fdqAlunoBeforeOpen(DataSet: TDataSet);
    procedure fdqTurmaBeforeOpen(DataSet: TDataSet);
    procedure cmbbxTipoPropertiesChange(Sender: TObject);
    procedure edtTituloPropertiesChange(Sender: TObject);
    procedure memoDescricaoPropertiesChange(Sender: TObject);
  private
    procedure OpenQuerys;
    procedure NovaAgenda;
    procedure EnviarAgenda;
    procedure SetDadosAgenda;
    procedure SetAgendaAluno;
    procedure ValidarEnvio;
    procedure ViewTipoEnvio;
    procedure SetPositionFields;
    procedure SetStateButtons;
    procedure SetStatus(Mensagem: String);
  public
    { Public declarations }
  end;

var
  frmAgendaEnvio: TfrmAgendaEnvio;

implementation

{$R *.dfm}

uses untDM, smMensagens, untFuncoes;

procedure TfrmAgendaEnvio.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  frmAgendaEnvio:=nil;
end;

procedure TfrmAgendaEnvio.FormShow(Sender: TObject);
begin
  SetPositionFields;
  ViewTipoEnvio;
  OpenQuerys;
  NovaAgenda;
  SetStateButtons;
  lblStatus.Visible := False;
end;

procedure TfrmAgendaEnvio.memoDescricaoPropertiesChange(Sender: TObject);
begin
  SetStateButtons;
end;

procedure TfrmAgendaEnvio.NovaAgenda;
begin
  fdqAgenda.Append;
  cmbbxTipo.SetFocus;
end;

procedure TfrmAgendaEnvio.OpenQuerys;
begin
  fdqAgenda.Close;
  fdqAgenda.Open;

  fdqAgendaAluno.Close;
  fdqAgendaAluno.Open;

  fdqTurma.Close;
  fdqTurma.Open;

  fdqAluno.Close;
  fdqAluno.Open;


  fdqTurmaAluno.Close;
  fdqTurmaAluno.Open;
end;

procedure TfrmAgendaEnvio.cmbbxTipoPropertiesChange(Sender: TObject);
begin
  ViewTipoEnvio;
end;

procedure TfrmAgendaEnvio.edtTituloPropertiesChange(Sender: TObject);
begin
  SetStateButtons;
end;

procedure TfrmAgendaEnvio.btnEnviarClick(Sender: TObject);
begin
  EnviarAgenda;
end;

procedure TfrmAgendaEnvio.btnCancelarClick(Sender: TObject);
begin
  if (edtTitulo.Text <> '') and (memoDescricao.Text <> '') then
    if not(Msg('Deseja cancelar as alterações desta agenda?',mtConfirmacao,Sim_Nao_Cancelar)) then
      Exit;

  fdqAgenda.Cancel;
  SetStatus('Mensagem cancelada com sucesso!');

  Close;
  //NovaAgenda;
end;

procedure TfrmAgendaEnvio.EnviarAgenda;
begin
  ValidarEnvio;

  try
    try
      Screen.Cursor:=crHourGlass;
      SetDadosAgenda;
      fdqAgenda.Post;
      SetAgendaAluno;
      NovaAgenda;
      cmbbxAluno.ItemIndex := -1;
      cmbbxTurma.ItemIndex := -1;
      SetStatus('Mensagem enviada com suceso!');
    except on E:Exception do
    begin
      Msg('Erro ao enviar a mensagem!'+ #13 + E.Message,mtErro);
      SetStatus('Erro ao enviar a mensagem!');
    end;
    end;
  finally
    Screen.Cursor:=crDefault;
  end;

end;

procedure TfrmAgendaEnvio.fdqAgendaBeforeOpen(DataSet: TDataSet);
begin
  SetIdEscolaParamBusca(fdqAgenda);
end;

procedure TfrmAgendaEnvio.fdqAgendaNewRecord(DataSet: TDataSet);
begin
  SetIdEscolaCadastro(fdqAgenda);
end;

procedure TfrmAgendaEnvio.fdqAlunoBeforeOpen(DataSet: TDataSet);
begin
  SetIdEscolaParamBusca(fdqAluno);
end;

procedure TfrmAgendaEnvio.fdqTurmaBeforeOpen(DataSet: TDataSet);
begin
  SetIdEscolaParamBusca(fdqTurma);

end;

procedure TfrmAgendaEnvio.SetAgendaAluno;
begin

  //Tipo de Envio - Aluno
  if cmbbxTipo.ItemIndex = 0 then
  begin
    fdqAgendaAluno.Append;
    fdqAgendaAlunoagenda_id.AsInteger := fdqAgendaagenda_id.AsInteger;
    fdqAgendaAlunoaluno_id.AsVariant:= cmbbxAluno.EditValue;
    fdqAgendaAluno.Post;
  end;


  //Tipo de Envio - Turma
  if cmbbxTipo.ItemIndex = 1 then
  begin
    fdqTurmaAluno.Close;
    fdqTurmaAluno.ParamByName('turma_id').AsInteger := cmbbxTurma.EditValue;
    fdqTurmaAluno.Open;

    fdqTurmaAluno.First;
    while not(fdqTurmaAluno.Eof) do
    begin
      fdqAgendaAluno.Append;
      fdqAgendaAlunoagenda_id.AsInteger := fdqAgendaagenda_id.AsInteger;
      fdqAgendaAlunoaluno_id.AsInteger:= fdqTurmaAluno.FieldByName('aluno_id').AsInteger;
      fdqAgendaAluno.Post;
      fdqTurmaAluno.Next;
    end;
  end;
end;

procedure TfrmAgendaEnvio.SetDadosAgenda;
var
  FuncionarioId:Integer;
begin
  fdqAgendadata.AsDateTime:=Now;

  FuncionarioId:= GetFuncionarioId;

  if FuncionarioId > 0 then
    fdqAgendafuncionario_id.AsInteger := FuncionarioId;
end;

procedure TfrmAgendaEnvio.SetPositionFields;
begin
  lblTurma.Top := lblAluno.Top;
  lblTurma.Left := lblAluno.Left;

  cmbbxTurma.Top:= cmbbxAluno.Top;
  cmbbxTurma.Left:= cmbbxAluno.Left;
end;

procedure TfrmAgendaEnvio.SetStateButtons;
begin
  btnEnviar.Enabled := ((edtTitulo.Text <> '') and (memoDescricao.Text <> ''));
end;

procedure TfrmAgendaEnvio.SetStatus(Mensagem: String);
begin
  lblStatus.Caption := Mensagem;
  lblStatus.Visible := True;
end;

procedure TfrmAgendaEnvio.ValidarEnvio;
begin
  //Tipo de Envio - Aluno
  if cmbbxTipo.ItemIndex = 0 then
  begin
    if cmbbxAluno.EditValue <= 0 Then
    begin
      cmbbxAluno.SetFocus;
      raise Exception.Create('È obrigatório selelcionar um aluno!');
    end;
  end;

  //Tipo de Envio - Turma
  if cmbbxTipo.ItemIndex = 1 then
  begin
    if cmbbxTurma.EditValue <= 0 Then
    begin
      cmbbxTurma.SetFocus;
      raise Exception.Create('È obrigatório selelcionar uma turma!');
    end;
  end;
end;

procedure TfrmAgendaEnvio.ViewTipoEnvio;
begin
  lblAluno.Visible:= (cmbbxTipo.ItemIndex = 0);
  cmbbxAluno.Visible:= (cmbbxTipo.ItemIndex = 0);

  lblTurma.Visible:= (cmbbxTipo.ItemIndex = 1);
  cmbbxTurma .Visible:= (cmbbxTipo.ItemIndex = 1);
end;

end.
