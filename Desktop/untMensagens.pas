unit untMensagens;

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
  Vcl.DBGrids, Vcl.ComCtrls, cxListView;

type
  TfrmMensagens = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    btnEnviar: TcxButton;
    cxGroupBox3: TcxGroupBox;
    fdqAluno: TFDQuery;
    dsAluno: TDataSource;
    cmbbxAluno: TcxLookupComboBox;
    lblAluno: TcxLabel;
    cxListView1: TcxListView;
    fdqMensagem: TFDQuery;
    dsMensagem: TDataSource;
    fdqMensagemmensagem_id: TFDAutoIncField;
    fdqMensagemmsg: TMemoField;
    fdqMensagemdata: TDateTimeField;
    fdqMensagemmensagem_tipo_id: TSmallintField;
    fdqMensagemfuncionario_id: TIntegerField;
    fdqMensagemaluno_id: TIntegerField;
    fdqMensagemescola_id: TIntegerField;
    memoMensagem: TcxMemo;
    fdqMensagemresponsavel_id: TIntegerField;
    cxGroupBox4: TcxGroupBox;
    cxListView2: TcxListView;
    fdqMsgHistorico: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    MemoField1: TMemoField;
    DateTimeField1: TDateTimeField;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    dsMsgHistorico: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnEnviarClick(Sender: TObject);
    procedure fdqAlunoBeforeOpen(DataSet: TDataSet);
    procedure edtTituloPropertiesChange(Sender: TObject);
    procedure memoDescricaoPropertiesChange(Sender: TObject);
    procedure fdqMensagemBeforeOpen(DataSet: TDataSet);
    procedure memoMensagemPropertiesChange(Sender: TObject);
    procedure fdqMsgHistoricoBeforeOpen(DataSet: TDataSet);
    procedure cmbbxAlunoPropertiesChange(Sender: TObject);
    procedure fdqMensagemNewRecord(DataSet: TDataSet);
  private
    procedure OpenQuerys;
    procedure EnviarMensagem;
    procedure SetDadosMensagem;
    procedure ValidarEnvio;
    procedure SetStateButtons;
    procedure OpenMsgHistorico;
  public
    { Public declarations }
  end;

var
  frmMensagens: TfrmMensagens;

implementation

{$R *.dfm}

uses untDM, smMensagens, untFuncoes;

procedure TfrmMensagens.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  frmMensagens:=nil;
end;

procedure TfrmMensagens.FormShow(Sender: TObject);
begin
  OpenQuerys;
  memoMensagem.Clear;
  SetStateButtons;

end;

procedure TfrmMensagens.memoDescricaoPropertiesChange(Sender: TObject);
begin
  SetStateButtons;
end;


procedure TfrmMensagens.memoMensagemPropertiesChange(Sender: TObject);
begin
  SetStateButtons;
end;

procedure TfrmMensagens.OpenMsgHistorico;
begin
  if cmbbxAluno.EditValue <= 0 then
    Exit;

  //analisar refresh
  fdqMsgHistorico.Close;
  fdqMsgHistorico.ParamByName('funcionario_id').AsInteger := GetFuncionarioId;
  fdqMsgHistorico.ParamByName('aluno_id').AsInteger := cmbbxAluno.EditValue;
  fdqMsgHistorico.Open;
end;

procedure TfrmMensagens.OpenQuerys;
begin
  fdqMensagem.Close;
  fdqMensagem.Open;

  fdqAluno.Close;
  fdqAluno.ParamByName('funcionario_id').AsInteger := GetFuncionarioId;
  fdqAluno.Open;

  OpenMsgHistorico;
end;

procedure TfrmMensagens.cmbbxAlunoPropertiesChange(Sender: TObject);
begin
  OpenMsgHistorico;
end;

procedure TfrmMensagens.edtTituloPropertiesChange(Sender: TObject);
begin
  SetStateButtons;
end;

procedure TfrmMensagens.btnEnviarClick(Sender: TObject);
begin
  EnviarMensagem;
end;


procedure TfrmMensagens.EnviarMensagem;
begin
  ValidarEnvio;

  try
    try
      Screen.Cursor:=crHourGlass;
      fdqMensagem.Append;
      SetDadosMensagem;
      fdqMensagem.Post;
      OpenMsgHistorico;
    except on E:Exception do
    begin
      Msg('Erro ao enviar a mensagem!'+ #13 + E.Message,mtErro);

    end;
    end;
  finally
    Screen.Cursor:=crDefault;
    memoMensagem.Clear;
  end;

end;

procedure TfrmMensagens.fdqAlunoBeforeOpen(DataSet: TDataSet);
begin
  SetIdEscolaParamBusca(fdqAluno);
end;

procedure TfrmMensagens.fdqMensagemBeforeOpen(DataSet: TDataSet);
begin
  SetIdEscolaParamBusca(fdqMensagem);
end;

procedure TfrmMensagens.fdqMensagemNewRecord(DataSet: TDataSet);
begin
  SetIdEscolaCadastro(fdqMensagem);
end;

procedure TfrmMensagens.fdqMsgHistoricoBeforeOpen(DataSet: TDataSet);
begin
  SetIdEscolaParamBusca(fdqMsgHistorico);
end;

procedure TfrmMensagens.SetDadosMensagem;
var
  FuncionarioId:Integer;
begin
  fdqMensagemdata.AsDateTime:=Now;
  FuncionarioId:= GetFuncionarioId;

  if FuncionarioId > 0 then
    fdqMensagemfuncionario_id.AsInteger := FuncionarioId;

  fdqMensagemmensagem_tipo_id.AsInteger := 1;
  fdqMensagemaluno_id.AsInteger := cmbbxAluno.EditValue;
  fdqMensagemmsg.AsString := memoMensagem.Text;
end;

procedure TfrmMensagens.SetStateButtons;
begin
  btnEnviar.Enabled := (memoMensagem.Text <> '');
end;



procedure TfrmMensagens.ValidarEnvio;
begin
  if cmbbxAluno.EditValue <= 0 Then
  begin
    cmbbxAluno.SetFocus;
    raise Exception.Create('È obrigatório selelcionar um aluno!');
  end;
end;


end.
