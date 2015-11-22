unit untCadastroResponsavel;

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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxMemo, cxDBEdit, cxImageComboBox, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox, cxMaskEdit, cxTextEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ExtCtrls, Vcl.DBCtrls, cxGroupBox, dxBarBuiltInMenu, cxPC, Vcl.Menus, cxButtons;

type
  TfrmCadastroResponsavel = class(TfrmCadFD)
    fdqResponsavelTipo: TFDQuery;
    dsResponsavelTipo: TDataSource;
    fdqCadresponsavel_id: TFDAutoIncField;
    fdqCadnome: TStringField;
    fdqCadsobrenome: TStringField;
    fdqCadsexo: TStringField;
    fdqCadrg: TStringField;
    fdqCadcpf: TLargeintField;
    fdqCadativo: TStringField;
    fdqCademail: TStringField;
    fdqCadinformacoes_gerais: TMemoField;
    fdqCadescola_id: TIntegerField;
    fdqCadresponsavel_tipo_id: TSmallintField;
    fdqTelefoneTipo: TFDQuery;
    dsTelefoneTipo: TDataSource;
    dsTelefone: TDataSource;
    fdqTelefone: TFDQuery;
    fdqAlunos: TFDQuery;
    dsAlunos: TDataSource;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxDBMaskEdit2: TcxDBMaskEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBImageComboBox1: TcxDBImageComboBox;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBMemo1: TcxDBMemo;
    cxGroupBox1: TcxGroupBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBNavigator1: TDBNavigator;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1escola_telefone_id: TcxGridDBColumn;
    cxGrid1DBTableView1escola_id: TcxGridDBColumn;
    cxGrid1DBTableView1telefone_tipo_id: TcxGridDBColumn;
    cxGrid1DBTableView1numero: TcxGridDBColumn;
    cxGrid1DBTableView1TelefoneTipo: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxDBCheckBox1: TcxDBCheckBox;
    cxTabSheet2: TcxTabSheet;
    DBNavigator2: TDBNavigator;
    DBGrid1: TDBGrid;
    cxGroupBox2: TcxGroupBox;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1nome: TcxGridDBColumn;
    cxGrid2DBTableView1sobrenome: TcxGridDBColumn;
    fdqAlunosLookup: TFDQuery;
    dsAlunosLookup: TDataSource;
    fdqAlunosresponsavel_id: TIntegerField;
    fdqAlunosaluno_id: TIntegerField;
    fdqAlunosaluno_id_1: TIntegerField;
    fdqAlunosnome: TStringField;
    fdqAlunossobrenome: TStringField;
    fdqAlunosdata_nascimento: TDateField;
    fdqAlunossexo: TStringField;
    fdqAlunosrg: TStringField;
    fdqAlunoscpf: TLargeintField;
    fdqAlunosativo: TStringField;
    fdqAlunosinformacoes_gerais: TMemoField;
    fdqAlunosescola_id: TIntegerField;
    btnAlunoAdd: TcxButton;
    cxButton2: TcxButton;
    Bevel3: TBevel;
    procedure AcNovoExecute(Sender: TObject);
    procedure fdqCadNewRecord(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure fdqTelefoneBeforeEdit(DataSet: TDataSet);
    procedure AcCancelarExecute(Sender: TObject);
    procedure fdqTelefoneBeforeInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure fdqBuscaBeforeOpen(DataSet: TDataSet);
    procedure fdqAlunosBeforeEdit(DataSet: TDataSet);
    procedure fdqAlunosBeforeInsert(DataSet: TDataSet);
    procedure grPesquisaDblClick(Sender: TObject);
    procedure grPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure fdqCadAfterOpen(DataSet: TDataSet);
    procedure fdqAlunosBeforeOpen(DataSet: TDataSet);
    procedure fdqAlunosLookupBeforeOpen(DataSet: TDataSet);
    procedure btnAlunoAddClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    procedure OpenQuerys;
    procedure SetPgtCtrlDefaut;
  public
    { Public declarations }
  end;

var
  frmCadastroResponsavel: TfrmCadastroResponsavel;

implementation

{$R *.dfm}

uses untDM, smDBFireDac, untFuncoes, untPesquisaAluno;

procedure TfrmCadastroResponsavel.AcCancelarExecute(Sender: TObject);
begin
  fdqTelefone.Cancel;
  fdqTelefone.CancelUpdates;

  fdqAlunos.Cancel;
  fdqAlunos.CancelUpdates;
  inherited;

end;

procedure TfrmCadastroResponsavel.AcNovoExecute(Sender: TObject);
begin
  inherited;
  fdqCadnome.FocusControl;
end;

procedure TfrmCadastroResponsavel.btnAlunoAddClick(Sender: TObject);
var
  AlunoId:integer;
begin
  AlunoId:=frmPesquisaAluno.Open;

  if AlunoId <= 0 then
    Exit;

  fdqAlunos.Append;
  fdqAlunosaluno_id.AsInteger:= AlunoID;
  fdqAlunos.Post;
end;

procedure TfrmCadastroResponsavel.cxButton2Click(Sender: TObject);
begin
  inherited;
  if fdqAlunos.IsEmpty then
    Exit;

  fdqAlunos.Delete;
end;

procedure TfrmCadastroResponsavel.fdqAlunosBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  SalvarQueryMaster(fdqCad);
end;

procedure TfrmCadastroResponsavel.fdqAlunosBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  SalvarQueryMaster(fdqCad);
end;

procedure TfrmCadastroResponsavel.fdqAlunosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetIdEscolaParamBusca(fdqAlunos);
end;

procedure TfrmCadastroResponsavel.fdqBuscaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetIdEscolaParamBusca(fdqBusca);
end;

procedure TfrmCadastroResponsavel.fdqCadAfterOpen(DataSet: TDataSet);
begin
  inherited;
  OpenQuerys;
end;

procedure TfrmCadastroResponsavel.fdqCadNewRecord(DataSet: TDataSet);
begin
  inherited;
  fdqCadativo.AsString:= 'S';
  SetIdEscolaCadastro(fdqCad);
end;

procedure TfrmCadastroResponsavel.fdqTelefoneBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  SalvarQueryMaster(fdqCad);
end;

procedure TfrmCadastroResponsavel.fdqTelefoneBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  SalvarQueryMaster(fdqCad);
end;

procedure TfrmCadastroResponsavel.fdqAlunosLookupBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetIdEscolaParamBusca(fdqAlunosLookup);
end;

procedure TfrmCadastroResponsavel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmCadastroResponsavel:=nil;
end;

procedure TfrmCadastroResponsavel.FormCreate(Sender: TObject);
begin
  inherited;
  SetSQLEscolaIdBusca(smCadPadrao);
end;

procedure TfrmCadastroResponsavel.FormShow(Sender: TObject);
begin
  inherited;
  OpenQuerys;
  SetPgtCtrlDefaut;
end;

procedure TfrmCadastroResponsavel.grPesquisaDblClick(Sender: TObject);
begin
  inherited;
  SetPgtCtrlDefaut;
end;

procedure TfrmCadastroResponsavel.grPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  SetPgtCtrlDefaut;
end;

procedure TfrmCadastroResponsavel.OpenQuerys;
begin
  fdqResponsavelTipo.Close;
  fdqResponsavelTipo.Open;

  fdqTelefone.Close;
  fdqTelefone.Open;

  fdqTelefoneTipo.Close;
  fdqTelefoneTipo.Open;

  fdqAlunos.Close;
  fdqAlunos.Open;

  fdqAlunosLookup.Close;
  fdqAlunosLookup.Open;
end;

procedure TfrmCadastroResponsavel.SetPgtCtrlDefaut;
begin
  cxPageControl1.ActivePageIndex:=0;
end;

end.
