unit untCadastroTurma;

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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxMemo, cxDBEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Vcl.DBCtrls, cxListBox, Vcl.CheckLst, smCheckListBox, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxGroupBox, Vcl.Menus, cxButtons;

type
  TfrmCadastroTurma = class(TfrmCadFD)
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    cxDBMemo1: TcxDBMemo;
    Label9: TLabel;
    Label2: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    fdqPeriodo: TFDQuery;
    dsPeriodo: TDataSource;
    fdqAlunos: TFDQuery;
    dsAlunos: TDataSource;
    cxGroupBox1: TcxGroupBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1nome_completo: TcxGridDBColumn;
    fdqTurmaAluno: TFDQuery;
    cxGroupBox2: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dsTurmaAluno: TDataSource;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure fdqCadNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fdqBuscaBeforeOpen(DataSet: TDataSet);
    procedure fdqCadBeforeInsert(DataSet: TDataSet);
    procedure fdqAlunosBeforeOpen(DataSet: TDataSet);
    procedure cxButton1Click(Sender: TObject);
  private
    procedure OpenQuerys;
  public
    { Public declarations }
  end;

var
  frmCadastroTurma: TfrmCadastroTurma;

implementation

{$R *.dfm}

uses untDM, untFuncoes;

procedure TfrmCadastroTurma.cxButton1Click(Sender: TObject);
begin
  inherited;
  fdqTurmaAluno.Append;
  fdqTurmaAluno.FieldByName('aluno_id').AsInteger := fdqAlunos.FieldByName('aluno_id').AsInteger;
  fdqTurmaAluno.Post;

end;

procedure TfrmCadastroTurma.fdqAlunosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetIdEscolaParamBusca(fdqAlunos);
end;

procedure TfrmCadastroTurma.fdqBuscaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetIdEscolaParamBusca(fdqBusca);
end;

procedure TfrmCadastroTurma.fdqCadBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  fdqCad.FieldByName('nome').FocusControl;
end;

procedure TfrmCadastroTurma.fdqCadNewRecord(DataSet: TDataSet);
begin
  inherited;
  SetIdEscolaCadastro(fdqCad);
end;

procedure TfrmCadastroTurma.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  frmCadastroTurma:=nil;
end;

procedure TfrmCadastroTurma.FormCreate(Sender: TObject);
begin
  inherited;
  SetSQLEscolaIdBusca(smCadPadrao);
end;

procedure TfrmCadastroTurma.FormShow(Sender: TObject);
begin
  inherited;
  OpenQuerys;
end;

procedure TfrmCadastroTurma.OpenQuerys;
begin
  fdqPeriodo.Close;
  fdqPeriodo.Open;

  fdqAlunos.Close;
  fdqAlunos.Open;

  fdqTurmaAluno.Close;
  fdqTurmaAluno.Open;


end;

end.
