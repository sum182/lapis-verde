unit untDmEscola;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin;

type
  TDmEscola = class(TDataModule)
    fdqAluno: TFDQuery;
    fdqTurma: TFDQuery;
    fdStanStorageBinLink: TFDStanStorageBinLink;
    fdqAgenda: TFDQuery;
    fdqAgendaAluno: TFDQuery;
    fdqAgendaTurma: TFDQuery;
    fdqAgendaApply: TFDQuery;
    fdqAgendaAlunoApply: TFDQuery;
    fdqAgendaTurmaApply: TFDQuery;
    fdqAgendaApplyagenda_id: TStringField;
    fdqAgendaApplydescricao: TStringField;
    fdqAgendaApplydata_insert_local: TDateTimeField;
    fdqAgendaApplydata_insert_server: TDateTimeField;
    fdqAgendaApplyagenda_tipo_id: TSmallintField;
    fdqAgendaApplyfuncionario_id: TIntegerField;
    fdqAgendaApplyescola_id: TIntegerField;
  private
    { Private declarations }
  public
    procedure OpenAgenda;
    procedure OpenAlunos;
    procedure OpenTurmas;


    procedure GetAlunos;
    procedure GetTurmas;


    procedure GetAgenda(FuncionarioId:Integer;AgendaId:Integer);
    procedure CriarAgenda(Texto: string; FuncionarioId: Integer = 0; AlunoId: Integer = 0; TurmaId: Integer = 0);
    procedure SalvarAgenda;

    procedure AgendaApplyChanges;

  end;

var
  DmEscola: TDmEscola;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untModuloCliente, Data.FireDACJSONReflect, smDBFireDac,
  FMX.Dialogs, System.SysUtils, smGeralFMX;

{$R *.dfm}

{ TDmEscola }

procedure TDmEscola.AgendaApplyChanges;
var
  Deltas:TFDJSONDeltas;
  fdmTempAgenda : TFDMemTable;
  fdmTempAgendaAluno : TFDMemTable;
  fdmTempAgendaTurma : TFDMemTable;
begin
   try
    // Post if editing
    if fdqAgenda.State in dsEditModes then
      fdqAgenda.Post;

    if fdqAgendaAluno.State in dsEditModes then
      fdqAgendaAluno.Post;

    if fdqAgendaTurma.State in dsEditModes then
      fdqAgendaTurma.Post;


    fdmTempAgenda := TFDMemTable.Create(self);
    fdmTempAgendaAluno := TFDMemTable.Create(self);
    fdmTempAgendaTurma := TFDMemTable.Create(self);

    fdmTempAgenda.Data := fdqAgenda.Delta;
    fdmTempAgendaAluno.Data := fdqAgendaAluno.Delta;
    fdmTempAgendaTurma.Data := fdqAgendaTurma.Delta;

    // Create a delta list
    Deltas := TFDJSONDeltas.Create;
    // Add deltas
    TFDJSONDeltasWriter.ListAdd(Deltas, 'agenda', fdmTempAgenda);
    TFDJSONDeltasWriter.ListAdd(Deltas, 'agenda_aluno', fdmTempAgendaAluno);
    TFDJSONDeltasWriter.ListAdd(Deltas, 'agenda_turma', fdmTempAgendaTurma);



    try
      ModuloCliente.SmEscolaClient.ApplyChangesAgenda(Deltas);
    except on E:Exception do
      ShowMessage('Erro no apply' + #13 + E.Message);
    end;

  finally

    fdmTempAgenda.DisposeOf;
    fdmTempAgendaAluno.DisposeOf;
    fdmTempAgendaTurma.DisposeOf;
  end;
end;

procedure TDmEscola.CriarAgenda(Texto: string; FuncionarioId: Integer = 0; AlunoId: Integer = 0; TurmaId: Integer = 0);
begin
  if Texto = EmptyStr then
    Exit;

  if fdqAgenda.State in [dsInactive] then
    fdqAgenda.Open;

  if fdqAgendaAluno.State in [dsInactive] then
    fdqAgendaAluno.Open;


  if fdqAgendaTurma.State in [dsInactive] then
    fdqAgendaTurma.Open;

  fdqAgenda.Append;
  fdqAgenda.FieldByName('agenda_id').AsString:=GetGUID;
  fdqAgenda.FieldByName('descricao').AsString:=Texto;
  fdqAgenda.FieldByName('data_insert_local').AsDateTime:=Now;
  fdqAgenda.FieldByName('funcionario_id').AsInteger:=16;
  fdqAgenda.FieldByName('escola_id').AsInteger:=1;
  fdqAgenda.Post;

  fdqAgendaAluno.Append;
  fdqAgendaAluno.FieldByName('agenda_id').AsString := fdqAgenda.FieldByName('agenda_id').AsString;
  fdqAgendaAluno.FieldByName('aluno_id').AsInteger := 19;
  fdqAgendaAluno.Post;
end;

procedure TDmEscola.GetAgenda(FuncionarioId:Integer;AgendaId:Integer);
var
  LDataSetList: TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
    try
      LDataSetList := ModuloCliente.SmEscolaClient.GetAgenda(1,0,0);

      //Pegando dados da agenda
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda');
      CopyDataSet(LDataSet,fdqAgenda,False,[coAppend,coEdit]);

      //Pegando dados da agenda_aluno
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_aluno');
      CopyDataSet(LDataSet,fdqAgendaAluno,False,[coAppend,coEdit]);

      //Pegando dados da agenda_turma
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_turma');
      CopyDataSet(LDataSet,fdqAgendaTurma,False,[coAppend,coEdit]);

    except on E:Exception do
      ShowMessage('Erro na busca da agenda' + #13 + E.Message);
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

procedure TDmEscola.SalvarAgenda;
var
  LDataSetList  : TFDJSONDataSets;
  MsgSalvar:string;
begin
  fdqAgendaApply.Active := False;
  fdqAgendaAlunoApply.Active := False;
  fdqAgendaTurmaApply.Active := False;

  LDataSetList := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(LDataSetList,'agenda',fdqAgendaApply);
  TFDJSONDataSetsWriter.ListAdd(LDataSetList,'agenda_aluno',fdqAgendaAlunoApply);
  TFDJSONDataSetsWriter.ListAdd(LDataSetList,'agenda_turma',fdqAgendaTurmaApply);

    try
      MsgSalvar:= ModuloCliente.SmEscolaClient.SalvarAgenda(LDataSetList);
    except on E:Exception do
      ShowMessage('Erro no apply' + #13 + E.Message);
    end;

  if MsgSalvar <> EmptyStr then
    ShowMessage(MsgSalvar);

end;

end.
