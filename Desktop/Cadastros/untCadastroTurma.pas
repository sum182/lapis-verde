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
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxGroupBox, Vcl.Menus, cxButtons, cxCheckListBox, cxDBCheckListBox;

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
    fdqTurmaAluno: TFDQuery;
    dsTurmaAluno: TDataSource;
    cxGroupBox3: TcxGroupBox;
    chklstAlunos: TsmCheckListBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure fdqCadNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fdqBuscaBeforeOpen(DataSet: TDataSet);
    procedure fdqCadBeforeInsert(DataSet: TDataSet);
    procedure fdqAlunosBeforeOpen(DataSet: TDataSet);
    procedure fdqCadAfterOpen(DataSet: TDataSet);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure AcApplyUpdateExecute(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
    procedure AcNovoExecute(Sender: TObject);
    procedure fdqTurmaAlunoBeforeEdit(DataSet: TDataSet);
    procedure fdqTurmaAlunoBeforeInsert(DataSet: TDataSet);
    procedure fdqTurmaAlunoBeforeDelete(DataSet: TDataSet);
  private
    procedure OpenQuerys;
    procedure SetCheckLisBoxtAlunos;
    procedure SalvarCheckListBoxAlunos;

  public
    { Public declarations }
  end;

var
  frmCadastroTurma: TfrmCadastroTurma;

implementation

{$R *.dfm}

uses untDM, untFuncoes, smDBFireDac;

procedure TfrmCadastroTurma.AcApplyUpdateExecute(Sender: TObject);
begin
  SalvarCheckListBoxAlunos;
  inherited;
end;

procedure TfrmCadastroTurma.AcCancelarExecute(Sender: TObject);
begin
  fdqTurmaAluno.Cancel;
  fdqTurmaAluno.CancelUpdates;
  inherited;
end;

procedure TfrmCadastroTurma.AcNovoExecute(Sender: TObject);
begin
  inherited;
  fdqCad.FieldByName('nome').FocusControl;
end;

procedure TfrmCadastroTurma.cxButton1Click(Sender: TObject);
begin
  inherited;
  SalvarCheckListBoxAlunos;
end;

procedure TfrmCadastroTurma.cxButton2Click(Sender: TObject);
begin
  SetCheckLisBoxtAlunos;
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

procedure TfrmCadastroTurma.fdqCadAfterOpen(DataSet: TDataSet);
begin
  inherited;
  OpenQuerys;
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
  chklstAlunos.UnchekedAll;
  SetCheckLisBoxtAlunos;
end;



procedure TfrmCadastroTurma.fdqTurmaAlunoBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  SalvarQueryMaster(fdqCad);
end;

procedure TfrmCadastroTurma.fdqTurmaAlunoBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  SalvarQueryMaster(fdqCad);
end;

procedure TfrmCadastroTurma.fdqTurmaAlunoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  SalvarQueryMaster(fdqCad);
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

  chklstAlunos.FillDataSet;
  chklstAlunos.UnchekedAll;

  SetCheckLisBoxtAlunos;
end;

procedure TfrmCadastroTurma.SalvarCheckListBoxAlunos;
var
  i:integer;
  AlunoId:integer;
begin
  try
    Screen.Cursor := crSQLWait;

    fdqTurmaAluno.First;
    while not(fdqTurmaAluno.Eof) do
      fdqTurmaAluno.Delete;

    //fdqTurmaAluno.IndexFieldNames:='aluno_id';

    for i := 0 to chklstAlunos.Items.Count - 1 do
      if chklstAlunos.Checked[i]Then
      begin
        AlunoId:= Integer(chklstAlunos.Items.Objects[i]);
        //if not(fdqTurmaAluno.FindKey([AlunoId])) and (AlunoId > 0) then
        if (AlunoId > 0) then
        begin
          fdqTurmaAluno.Append;
          fdqTurmaAluno.FieldByName('aluno_id').AsInteger:=AlunoId;
          fdqTurmaAluno.Post;
        end;
      end;

  finally
    Screen.Cursor := crDefault;
    //fdqTurmaAluno.IndexFieldNames:='';
  end;

end;

procedure TfrmCadastroTurma.SetCheckLisBoxtAlunos;
var
  i:integer;
  AlunoId:integer;
begin
  try
    chklstAlunos.UnchekedAll;

    fdqTurmaAluno.First;
    //fdqTurmaAluno.IndexFieldNames:='aluno_id';
    while not (fdqTurmaAluno.Eof) do
    begin
      for i := 0 to chklstAlunos.Items.Count - 1 do
      begin
        AlunoId:= Integer(chklstAlunos.Items.Objects[i]);

        if fdqTurmaAluno.FieldByName('aluno_id').AsInteger = AlunoId then
        begin
          chklstAlunos.Checked[i]:=True;
          Continue;
        end;
      end;
      fdqTurmaAluno.Next;
    end;
  finally
    Screen.Cursor := crDefault;
    //fdqTurmaAluno.IndexFieldNames:='';
  end;
end;

end.
