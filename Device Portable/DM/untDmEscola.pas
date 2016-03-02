unit untDmEscola;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin;

type
  TDmEscola = class(TDataModule)
    fdqAluno: TFDQuery;
    fdqAlunoaluno_id: TIntegerField;
    fdqAlunonome: TStringField;
    fdqTurma: TFDQuery;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
  private
    { Private declarations }
  public
    procedure GetAlunos;
    procedure GetTurmas;
    procedure OpenQuerys;
  end;

var
  DmEscola: TDmEscola;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untModuloCliente, Data.FireDACJSONReflect;

{$R *.dfm}

{ TDmEscola }

procedure TDmEscola.GetAlunos;
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


    fdmTemp.First;

    fdqAluno.CopyDataSet(fdmTemp);
    {while not(fdmTemp.EOF) do
    begin
      fdqAluno.Append;
      fdqAluno.FieldByName('aluno_id').AsString := fdmTemp.FieldByName('aluno_id').AsString;
      fdqAluno.FieldByName('nome').AsString := fdmTemp.FieldByName('nome').AsString;
      fdqAluno.Post;

      fdmTemp.Next;
    end;  }

    fdqAluno.Close;
    fdqAluno.Open;


  finally
    fdmTemp.DisposeOf;
  end;
end;

procedure TDmEscola.GetTurmas;
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


  fdqTurma.First;
  while not(fdqTurma.Eof) do
  begin
    fdqTurma.Delete;
  end;



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

procedure TDmEscola.OpenQuerys;
begin
  fdqAluno.Close;
  fdqAluno.Open;

  fdqTurma.Close;
  fdqTurma.Open;
end;

end.
