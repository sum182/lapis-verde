unit untCadastroAluno;

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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxMemo, cxDBEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit,
  cxSpinEdit, Vcl.ExtCtrls, Vcl.DBCtrls, Datasnap.DBClient, Datasnap.Provider, cxCheckBox, cxImageComboBox, Vcl.Menus, cxButtons,
  cxImage, cxBlobEdit, cxGroupBox, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxLabel;

type
  TfrmCadastroAluno = class(TfrmCadFD)
    fdqCadaluno_id: TFDAutoIncField;
    fdqCadnome: TStringField;
    fdqCadsobrenome: TStringField;
    fdqCaddata_nascimento: TDateField;
    fdqCadsexo: TStringField;
    fdqCadrg: TStringField;
    fdqCadcpf: TLargeintField;
    fdqCadativo: TStringField;
    fdqCadinformacoes_gerais: TMemoField;
    fdqCadescola_id: TIntegerField;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label5: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBImageComboBox1: TcxDBImageComboBox;
    Label6: TLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxDBMaskEdit2: TcxDBMaskEdit;
    Label8: TLabel;
    Label7: TLabel;
    cxDBMemo1: TcxDBMemo;
    Label9: TLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    cxLabel1: TcxLabel;
    fdqResponsaveis: TFDQuery;
    fdqResponsaveisresponsavel_id: TIntegerField;
    fdqResponsaveisaluno_id: TIntegerField;
    fdqResponsaveisLookup: TFDQuery;
    dsResponsaveisLookup: TDataSource;
    dsResponsaveis: TDataSource;
    grbxAlunos: TcxGroupBox;
    Bevel3: TBevel;
    cxGridAlunos: TcxGrid;
    cxGridAlunosDBTableView1: TcxGridDBTableView;
    cxGridAlunosDBTableView1nome: TcxGridDBColumn;
    cxGridAlunosDBTableView1sobrenome: TcxGridDBColumn;
    cxGridAlunosLevel1: TcxGridLevel;
    btnResponsaveisAdd: TcxButton;
    btnResponsaveisExcluir: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure fdqCadAfterOpen(DataSet: TDataSet);
    procedure fdqCadNewRecord(DataSet: TDataSet);
    procedure AcNovoExecute(Sender: TObject);
    procedure fdqBuscaBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure fdqResponsaveisAfterScroll(DataSet: TDataSet);
    procedure dsResponsaveisStateChange(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
    procedure btnResponsaveisAddClick(Sender: TObject);
    procedure btnResponsaveisExcluirClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure fdqResponsaveisLookupBeforeOpen(DataSet: TDataSet);
    procedure fdqResponsaveisLookupAfterScroll(DataSet: TDataSet);
    procedure fdqResponsaveisBeforeDelete(DataSet: TDataSet);
    procedure fdqResponsaveisBeforeEdit(DataSet: TDataSet);
    procedure fdqResponsaveisBeforeInsert(DataSet: TDataSet);
    procedure grPesquisaDblClick(Sender: TObject);
    procedure grPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure BuProcessarClick(Sender: TObject);
    procedure AcDeleteExecute(Sender: TObject);
  private
    procedure OpenQuerys;
    procedure SetStateButtonsResponsaveis;
    procedure SetPgtCtrlDefaut;
  public
    { Public declarations }
  end;

var
  frmCadastroAluno: TfrmCadastroAluno;

implementation

{$R *.dfm}

uses untDM, smGeral, untFuncoes, untPesquisaResponsavel, smDBFireDac, smMensagens;

procedure TfrmCadastroAluno.AcCancelarExecute(Sender: TObject);
begin

  fdqResponsaveis.Cancel;
  fdqResponsaveis.CancelUpdates;
  inherited;
end;

procedure TfrmCadastroAluno.AcDeleteExecute(Sender: TObject);
begin
  if (CheckAgendaAluno(fdqCadaluno_id.AsInteger)) then
  begin
    MSG('Não é possível excluir o aluno, pois o mesmo tem Agenda(s) associada(s).',mtErro);
    Abort;
  end;

  inherited;
end;

procedure TfrmCadastroAluno.AcNovoExecute(Sender: TObject);
begin
  inherited;
  fdqCadnome.FocusControl;
end;

procedure TfrmCadastroAluno.btnResponsaveisAddClick(Sender: TObject);
var
  ResponsavelId:integer;
begin
  ResponsavelId:=frmPesquisaResponsavel.Open;

  if ResponsavelId <= 0 then
    Exit;

  if fdqResponsaveis.Locate('responsavel_id',ResponsavelId,[]) then
    Exit;

  fdqResponsaveis.Append;
  fdqResponsaveis.FieldByName('responsavel_id').AsInteger:= ResponsavelId;
  fdqResponsaveis.Post;
end;

procedure TfrmCadastroAluno.btnResponsaveisExcluirClick(Sender: TObject);
begin
  inherited;
  if fdqResponsaveis.IsEmpty then
    Exit;

  fdqResponsaveis.Delete;
end;

procedure TfrmCadastroAluno.BuProcessarClick(Sender: TObject);
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

procedure TfrmCadastroAluno.dsResponsaveisStateChange(Sender: TObject);
begin
  inherited;
  SetStateButtonsResponsaveis;
end;

procedure TfrmCadastroAluno.fdqBuscaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetIdEscolaParamBusca(fdqBusca);
end;

procedure TfrmCadastroAluno.fdqCadAfterOpen(DataSet: TDataSet);
begin
  inherited;
  OpenQuerys;
end;

procedure TfrmCadastroAluno.fdqCadNewRecord(DataSet: TDataSet);
begin
  inherited;
  fdqCadativo.AsString:='S';
  SetIdEscolaCadastro(fdqCad);
end;

procedure TfrmCadastroAluno.fdqResponsaveisAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetStateButtonsResponsaveis;
end;

procedure TfrmCadastroAluno.fdqResponsaveisBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  SalvarQueryMaster(fdqCad);
end;

procedure TfrmCadastroAluno.fdqResponsaveisBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  SalvarQueryMaster(fdqCad);

end;

procedure TfrmCadastroAluno.fdqResponsaveisBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  SalvarQueryMaster(fdqCad);

end;

procedure TfrmCadastroAluno.fdqResponsaveisLookupAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetStateButtonsResponsaveis;
end;

procedure TfrmCadastroAluno.fdqResponsaveisLookupBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetIdEscolaParamBusca(fdqResponsaveisLookup);
end;

procedure TfrmCadastroAluno.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  frmCadastroAluno:= nil;
end;

procedure TfrmCadastroAluno.FormCreate(Sender: TObject);
begin
  inherited;
  SetSQLEscolaIdBusca(smCadPadrao);
end;

procedure TfrmCadastroAluno.FormShow(Sender: TObject);
begin
  inherited;
  OpenQuerys;
  SetPgtCtrlDefaut;
end;


procedure TfrmCadastroAluno.grPesquisaDblClick(Sender: TObject);
begin
  inherited;
  SetPgtCtrlDefaut;
end;

procedure TfrmCadastroAluno.grPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  SetPgtCtrlDefaut;
end;

procedure TfrmCadastroAluno.OpenQuerys;
begin
  fdqResponsaveis.Close;
  fdqResponsaveis.Open;

  fdqResponsaveisLookup.Close;
  fdqResponsaveisLookup.Open;
end;

procedure TfrmCadastroAluno.SetPgtCtrlDefaut;
begin
  cxPageControl1.ActivePageIndex:=0;
end;

procedure TfrmCadastroAluno.SetStateButtonsResponsaveis;
begin
  btnResponsaveisAdd.Enabled := fdqResponsaveis.State in [dsBrowse, dsInactive, dsEdit];
  btnResponsaveisExcluir.Enabled := (fdqResponsaveis.State in [dsEdit, dsBrowse, dsInactive]) and (fdqResponsaveis.RecordCount >= 1);
end;

end.
