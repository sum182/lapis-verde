unit untAgendaEscola;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.TabControl, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, MultiDetailAppearanceU,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TfrmAgendaEscola = class(TfrmBaseToolBar)
    tbctrlPrincipal: TTabControl;
    tbitTurma: TTabItem;
    TabItem2: TTabItem;
    lstTurmas: TListView;
    lstAlunos: TListView;
    btnAtualizar: TSpeedButton;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    bsAlunos: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    fdqAluno: TFDQuery;
    fdqAlunoaluno_id: TIntegerField;
    fdqAlunonome: TStringField;
    bsTurmas: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    fdqTurma: TFDQuery;
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure GetAlunos;
    procedure GetTurmas;
    procedure OpenQuerys;
  public
    { Public declarations }
  end;

var
  frmAgendaEscola: TfrmAgendaEscola;

implementation

{$R *.fmx}

uses untModuloCliente, Data.FireDACJSONReflect, untDM;

procedure TfrmAgendaEscola.btnAtualizarClick(Sender: TObject);
begin
  GetAlunos;
  GetTurmas;
end;

procedure TfrmAgendaEscola.FormCreate(Sender: TObject);
begin
  inherited;
  OpenQuerys;
end;

procedure TfrmAgendaEscola.GetAlunos;
var
  LDataSetList  : TFDJSONDataSets;
  fdmTemp : TFDMemTable;
begin

  try
    fdmTemp := TFDMemTable.Create(self);

    LDataSetList := ModuloCliente.SmEscolaClient.GetAlunos(1,0);

    //Prepara o MemoryTable temporário
    fdmTemp.Active := False;

    //Fazemos um teste para verifica se realmente há DataSet no retorno da função
    Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);

    //Adicionamos o conteúdo do DataSet "baixado" ao Memory Table
    fdmTemp.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));

    fdqAluno.Close;
    fdqAluno.Open;

    fdqAluno.First;
    while not(fdqAluno.Eof) do
    begin
      fdqAluno.Delete;
    end;

    fdqAluno.Close;
    fdqAluno.Open;

    fdmTemp.First;
    while not(fdmTemp.EOF) do
    begin
      fdqAluno.Append;
      fdqAluno.FieldByName('aluno_id').AsString := fdmTemp.FieldByName('aluno_id').AsString;
      fdqAluno.FieldByName('nome').AsString := fdmTemp.FieldByName('nome').AsString;
      fdqAluno.Post;

      fdmTemp.Next;
    end;

    fdqAluno.Close;
    fdqAluno.Open;


  finally
    fdmTemp.DisposeOf;
  end;

end;

procedure TfrmAgendaEscola.GetTurmas;
var
  LDataSetList  : TFDJSONDataSets;
  fdmTemp : TFDMemTable;
begin
  try
    fdmTemp := TFDMemTable.Create(self);

  LDataSetList := ModuloCliente.SmEscolaClient.GetTurmas(1,0);

  //Prepara o MemoryTable temporário
  fdmTemp.Active := False;

  //Fazemos um teste para verifica se realmente há DataSet no retorno da função
  Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);

  //Adicionamos o conteúdo do DataSet "baixado" ao Memory Table
  fdmTemp.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));

  fdqTurma.Close;
  fdqTurma.Open;

  fdmTemp.First;
  while not(fdmTemp.EOF) do
  begin
    fdqTurma.Append;
    fdqTurma.FieldByName('turma_id').AsString := fdmTemp.FieldByName('turma_id').AsString;
    fdqTurma.FieldByName('nome').AsString := fdmTemp.FieldByName('nome').AsString;
    fdqTurma.Post;

    fdmTemp.Next;
  end;

  fdqTurma.Close;
  fdqTurma.Open;

  finally
    fdmTemp.DisposeOf;
  end;

end;

procedure TfrmAgendaEscola.OpenQuerys;
begin
  fdqAluno.Close;
  fdqAluno.Open;

  fdqTurma.Close;
  fdqTurma.Open;
end;

end.
