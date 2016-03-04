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
    fdqAgendaAluno: TFDQuery;
    fdqAgendaTurma: TFDQuery;
  private
    { Private declarations }
  public
    procedure OpenAgenda;
    procedure OpenAlunos;
    procedure OpenTurmas;


    procedure GetAlunos;
    procedure GetTurmas;


    procedure GetAgenda(FuncionarioId:Integer;AgendaId:Integer);

  end;

var
  DmEscola: TDmEscola;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untModuloCliente, Data.FireDACJSONReflect, smDBFireDac,
  FMX.Dialogs;

{$R *.dfm}

{ TDmEscola }

procedure TDmEscola.GetAgenda(FuncionarioId:Integer;AgendaId:Integer);
var
  LDataSetList  : TFDJSONDataSets;
  fdmTempAgenda : TFDMemTable;
  fdmTempAgendaAluno : TFDMemTable;
  fdmTempAgendaTurma : TFDMemTable;

  LDataSet: TFDDataSet;
begin
  try
    fdmTempAgenda := TFDMemTable.Create(self);
    fdmTempAgendaAluno := TFDMemTable.Create(self);
    fdmTempAgendaTurma := TFDMemTable.Create(self);

    try
      LDataSetList := ModuloCliente.SmEscolaClient.GetAgenda(1,0,0);

      //Pegando dados da agenda
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda');
      fdmTempAgenda.Active := False;
      fdmTempAgenda.AppendData(LDataSet);
      CopyDataSet(fdmTempAgenda,fdqAgenda,True);

      //Pegando dados da agenda_aluno
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_aluno');
      fdmTempAgendaAluno.Active := False;
      fdmTempAgendaAluno.AppendData(LDataSet);
      CopyDataSet(fdmTempAgendaAluno,fdqAgendaAluno,True);

      //Pegando dados da agenda_turma
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_turma');
      fdmTempAgendaTurma.Active := False;
      fdmTempAgendaTurma.AppendData(LDataSet);
      CopyDataSet(fdmTempAgendaTurma,fdqAgendaTurma,True);
    except on E:Exception do
      ShowMessage('Erro na busca da agenda' + #13 + E.Message);
    end;

  finally
    fdmTempAgenda.DisposeOf;
    fdmTempAgendaAluno.DisposeOf;
    fdmTempAgendaTurma.DisposeOf;
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

procedure TDmEscola.OpenAgenda;
begin
  fdqAgenda.Close;
  fdqAgenda.Open;

  fdqAgendaAluno.Close;
  fdqAgendaAluno.Open;

  fdqAgendaTurma.Close;
  fdqAgendaTurma.Open;
end;

procedure TDmEscola.OpenAlunos;
begin
  fdqAluno.Close;
  fdqAluno.Open;
end;

procedure TDmEscola.OpenTurmas;
begin
  fdqTurma.Close;
  fdqTurma.Open;
end;

end.
