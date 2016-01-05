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
    cxDBMemo1: TcxDBMemo;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label2: TLabel;
    cxGroupBox2: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    fdqAgendaescola_id: TIntegerField;
    cxGroupBox3: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxComboBox1: TcxComboBox;
    fdqTurma: TFDQuery;
    fdqAluno: TFDQuery;
    dsAluno: TDataSource;
    dsTurma: TDataSource;
    dsTurmaAluno: TDataSource;
    fdqTurmaAluno: TFDQuery;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    fdqAgendaAluno: TFDQuery;
    dsAgendaAluno: TDataSource;
    DBGrid1: TDBGrid;
    cxLookupComboBox1: TcxLookupComboBox;
    cxLookupComboBox2: TcxLookupComboBox;
    DBGrid2: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure fdqAgendaNewRecord(DataSet: TDataSet);
    procedure fdqAgendaBeforeOpen(DataSet: TDataSet);
    procedure fdqAlunoBeforeOpen(DataSet: TDataSet);
    procedure fdqTurmaBeforeOpen(DataSet: TDataSet);
  private
    procedure OpenQuerys;
    procedure NovaAgenda;
    procedure EnviarAgenda;
    procedure SetDadosAgenda;
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
  OpenQuerys;
  NovaAgenda;
end;

procedure TfrmAgendaEnvio.NovaAgenda;
begin
  fdqAgenda.Append;
  fdqAgendatitulo.FocusControl;
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

procedure TfrmAgendaEnvio.cxButton1Click(Sender: TObject);
begin
  EnviarAgenda;
end;

procedure TfrmAgendaEnvio.cxButton2Click(Sender: TObject);
begin
  if not(Msg('Deseja cancelar as alterações desta agenda?',mtConfirmacao,Sim_Nao_Cancelar)) then
    Exit;

  fdqAgenda.Cancel;
  NovaAgenda;
end;

procedure TfrmAgendaEnvio.EnviarAgenda;
begin
  try
    Screen.Cursor:=crSQLWait;
    SetDadosAgenda;
    fdqAgenda.Post;
    NovaAgenda;
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

procedure TfrmAgendaEnvio.SetDadosAgenda;
begin
  fdqAgendadata.AsDateTime:=Now;
end;

end.
