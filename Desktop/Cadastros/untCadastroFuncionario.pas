unit untCadastroFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smCadFD, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Vcl.ImgList, Vcl.DBActns, System.Actions, Vcl.ActnList, smCadPadrao, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  smDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxCheckBox, cxDBEdit, cxMemo, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxTextEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmCadastroFuncionario = class(TfrmCadFD)
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBImageComboBox1: TcxDBImageComboBox;
    Label6: TLabel;
    Label7: TLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    Label8: TLabel;
    cxDBMaskEdit2: TcxDBMaskEdit;
    cxDBMemo1: TcxDBMemo;
    Label9: TLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    fdqCadfuncionario_id: TFDAutoIncField;
    fdqCadnome: TStringField;
    fdqCadsobrenome: TStringField;
    fdqCadsexo: TStringField;
    fdqCadrg: TStringField;
    fdqCadcpf: TLargeintField;
    fdqCadativo: TStringField;
    fdqCademail: TStringField;
    fdqCadinformacoes_gerais: TMemoField;
    fdqCadfuncionario_tipo_id: TSmallintField;
    fdqCadescola_id: TIntegerField;
    cxDBTextEdit3: TcxDBTextEdit;
    Label2: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    fdqFuncionarioTipo: TFDQuery;
    dsFuncionarioTipo: TDataSource;
    Label5: TLabel;
    fdqCadsenha: TStringField;
    Label10: TLabel;
    edtSenha: TcxTextEdit;
    fdqCaddata_atualizacao: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcNovoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fdqCadNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure fdqBuscaBeforeOpen(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure fdqCadAfterOpen(DataSet: TDataSet);
    procedure fdqCadBeforePost(DataSet: TDataSet);
    procedure AcApplyUpdateExecute(Sender: TObject);
    procedure BuProcessarClick(Sender: TObject);
  private
    procedure OpenQuerys;
    procedure ValidarCadastro;
  public
    { Public declarations }
  end;

var
  frmCadastroFuncionario: TfrmCadastroFuncionario;

implementation

{$R *.dfm}

uses untDM, untFuncoes, smCrypt,System.NetEncoding, smMensagens, smGeral;

procedure TfrmCadastroFuncionario.AcApplyUpdateExecute(Sender: TObject);
begin
  ValidarCadastro;
  fdqCad.FieldByName('data_atualizacao').AsDateTime := Now;
  inherited;
end;

procedure TfrmCadastroFuncionario.AcNovoExecute(Sender: TObject);
begin
  inherited;
  fdqCadnome.FocusControl;
end;

procedure TfrmCadastroFuncionario.BuProcessarClick(Sender: TObject);
var
  ValorEdit: string;
  ValorSomenteNumero: string;
begin

  if ( (UpperCase(CoBoCampos.Text) = 'RG') or (UpperCase(CoBoCampos.Text) = 'CPF')) then
  begin
    try
      ValorEdit:= EdConteudoTexto.Text;
      ValorSomenteNumero:= SomenteNumero(ValorEdit);
      EdConteudoTexto.Text:= ValorSomenteNumero;
      inherited;
    finally
      EdConteudoTexto.Text:= ValorEdit;
    end;
  end
  else
    inherited;

end;

procedure TfrmCadastroFuncionario.Button2Click(Sender: TObject);
var
str:AnsiString;
begin
  inherited;
end;

procedure TfrmCadastroFuncionario.fdqBuscaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetIdEscolaParamBusca(fdqBusca);

end;

procedure TfrmCadastroFuncionario.fdqCadAfterOpen(DataSet: TDataSet);
begin
  inherited;
  edtSenha.Text:= Decrypt(fdqCadsenha.AsString);
end;

procedure TfrmCadastroFuncionario.fdqCadBeforePost(DataSet: TDataSet);
begin
  inherited;

  if fdqCad.State in [dsInsert,dsEdit] then
    fdqCadsenha.AsString:= Encrypt(edtSenha.Text);
end;

procedure TfrmCadastroFuncionario.fdqCadNewRecord(DataSet: TDataSet);
begin
  inherited;
  fdqCadativo.AsString:= 'S';
  edtSenha.Clear;
  SetIdEscolaCadastro(fdqCad);
end;

procedure TfrmCadastroFuncionario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmCadastroFuncionario:= nil;
end;

procedure TfrmCadastroFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  SetSQLEscolaIdBusca(smCadPadrao);
end;

procedure TfrmCadastroFuncionario.FormShow(Sender: TObject);
begin
  inherited;
  OpenQuerys;
end;

procedure TfrmCadastroFuncionario.OpenQuerys;
begin
  fdqFuncionarioTipo.Close;
  fdqFuncionarioTipo.Open
end;

procedure TfrmCadastroFuncionario.ValidarCadastro;
begin
  if (edtSenha.Text = '') then
  begin
    Msg('É obrigatório o preenchimento do campo: Senha', mtErro);
    edtSenha.SetFocus;
    Abort;
  end;
end;

end.
