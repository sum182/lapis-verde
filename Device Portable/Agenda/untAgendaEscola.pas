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
    fdmTurmas: TFDMemTable;
    fdmTurmasturma_id: TIntegerField;
    fdmTurmasnome: TStringField;
    bsTurmas: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
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

    //Prepara o MemoryTable tempor�rio
    fdmTemp.Active := False;

    //Fazemos um teste para verifica se realmente h� DataSet no retorno da fun��o
    Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);

    //Adicionamos o conte�do do DataSet "baixado" ao Memory Table
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
begin
  LDataSetList := ModuloCliente.SmEscolaClient.GetTurmas(1,0);

  //Prepara o MemoryTable tempor�rio
  fdmTurmas.Active := False;

  //Fazemos um teste para verifica se realmente h� DataSet no retorno da fun��o
  Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);

  //Adicionamos o conte�do do DataSet "baixado" ao Memory Table
  fdmTurmas.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));

  {fdqAluno.Close;
  fdqAluno.Open;

  fdmTurmas.First;
  while not(fdmTurmas.EOF) do
  begin
    fdqAluno.Append;
    fdqAluno.FieldByName('nome').AsString := fdmTurmas.FieldByName('nome').AsString;
    fdqAluno.Post;

    fdmTurmas.Next;
  end;

  fdqAluno.Close;
  fdqAluno.Open;  }

end;

procedure TfrmAgendaEscola.OpenQuerys;
begin
  fdqAluno.Close;
  fdqAluno.Open;
end;

end.
