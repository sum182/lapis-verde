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
    fdqTurma: TFDQuery;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    fdqAgenda: TFDQuery;
  private
    { Private declarations }
  public
    procedure OpenQuerys;

    procedure GetAlunos;
    procedure GetTurmas;

    procedure GetAgendaAluno(AlunoId:Integer;AgendaId:Integer);
    procedure GetAgendaTurma(TurmaId:Integer;AgendaId:Integer);

  end;

var
  DmEscola: TDmEscola;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untModuloCliente, Data.FireDACJSONReflect, smDBFireDac,
  FMX.Dialogs;

{$R *.dfm}

{ TDmEscola }

procedure TDmEscola.GetAgendaAluno(AlunoId, AgendaId: Integer);
var
  LDataSetList  : TFDJSONDataSets;
  fdmTemp : TFDMemTable;
begin
  try
    fdmTemp := TFDMemTable.Create(self);
    try
      LDataSetList := ModuloCliente.SmEscolaClient.GetAgendaAluno(1,0,19,0);

      //Prepara o MemoryTable temporário
      fdmTemp.Active := False;

      //Fazemos um teste para verifica se realmente há DataSet no retorno da função
      Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);

      //Adicionando o conteúdo do DataSet "baixado" ao Memory Table
      fdmTemp.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));

      //CopyDataSet(fdmTemp,fdqAgenda,False);
      CopyDataSet(fdmTemp,fdqAgenda,True);
    except on E:Exception do
      ShowMessage('Erro na busca dos alunos' + #13 + E.Message);
    end;

  finally
    fdmTemp.DisposeOf;
  end;

end;

procedure TDmEscola.GetAgendaTurma(TurmaId, AgendaId: Integer);
var
  LDataSetList  : TFDJSONDataSets;
  fdmTemp : TFDMemTable;
begin
  try
    fdmTemp := TFDMemTable.Create(self);
    try
      LDataSetList := ModuloCliente.SmEscolaClient.GetAgendaTurma(1,0,19,0);

      //Prepara o MemoryTable temporário
      fdmTemp.Active := False;

      //Fazemos um teste para verifica se realmente há DataSet no retorno da função
      Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);

      //Adicionando o conteúdo do DataSet "baixado" ao Memory Table
      fdmTemp.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));

      //CopyDataSet(fdmTemp,fdqAgenda,False);
      CopyDataSet(fdmTemp,fdqAgenda,True);
    except on E:Exception do
      ShowMessage('Erro na busca dos alunos' + #13 + E.Message);
    end;

  finally
    fdmTemp.DisposeOf;
  end;
end;

procedure TDmEscola.GetAlunos;
var
  LDataSetList  : TFDJSONDataSets;
  fdmTemp : TFDMemTable;
begin
  try
    fdmTemp := TFDMemTable.Create(self);
    try
      LDataSetList := ModuloCliente.SmEscolaClient.GetAlunos(1,0);

      //Prepara o MemoryTable temporário
      fdmTemp.Active := False;

      //Fazemos um teste para verifica se realmente há DataSet no retorno da função
      Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);

      //Adicionando o conteúdo do DataSet "baixado" ao Memory Table
      fdmTemp.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));

      CopyDataSet(fdmTemp,fdqAluno);
    except on E:Exception do
      ShowMessage('Erro na busca dos alunos' + #13 + E.Message);
    end;

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
    try
      LDataSetList := ModuloCliente.SmEscolaClient.GetTurmas(1,0);

      //Prepara o MemoryTable temporário
      fdmTemp.Active := False;

      //Fazemos um teste para verifica se realmente há DataSet no retorno da função
      Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);

      //Adicionando o conteúdo do DataSet "baixado" ao Memory Table
      fdmTemp.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));

      CopyDataSet(fdmTemp,fdqTurma);
    except on E:Exception do
      ShowMessage('Erro na busca das turmas' + #13 + E.Message);
    end;

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
