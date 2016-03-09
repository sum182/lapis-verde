unit untDmEscola;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,DateUtils;

type
  TDmEscola = class(TDataModule)
    fdqAluno: TFDQuery;
    fdqTurma: TFDQuery;
    fdStanStorageBinLink: TFDStanStorageBinLink;
    fdqAgenda: TFDQuery;
    fdqAgendaAluno: TFDQuery;
    fdqAgendaTurma: TFDQuery;
    fdqAgendaSaveServer: TFDQuery;
    fdqAgendaAlunoSaveServer: TFDQuery;
    fdqAgendaTurmaSaveServer: TFDQuery;
    fdqAgendaAlunoSaveServeragenda_id: TStringField;
    fdqAgendaAlunoSaveServeraluno_id: TIntegerField;
    fdqAgendaTurmaSaveServeragenda_id: TStringField;
    fdqAgendaTurmaSaveServerturma_id: TIntegerField;
  private
    { Private declarations }
  public
    procedure OpenAgenda;
    procedure OpenAlunos;
    procedure OpenTurmas;


    procedure GetAlunos;
    procedure GetTurmas;

    //Metodos para Agenda
    procedure GetAgenda(FuncionarioId:Integer;AgendaId:Integer);
    procedure CriarAgenda(Texto: string; FuncionarioId: Integer = 0; AlunoId: Integer = 0; TurmaId: Integer = 0);
    procedure SalvarAgenda;
    procedure AgendaApplyChanges;

    procedure SalvarDadosServer;
  end;

var
  DmEscola: TDmEscola;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untModuloCliente, Data.FireDACJSONReflect, smDBFireDac,
  FMX.Dialogs, System.SysUtils, smGeralFMX, untFuncoes, FMX.Forms;

{$R *.dfm}

{ TDmEscola }

procedure TDmEscola.AgendaApplyChanges;
var
  Deltas:TFDJSONDeltas;
  fdmTempAgenda : TFDMemTable;
  fdmTempAgendaAluno : TFDMemTable;
  fdmTempAgendaTurma : TFDMemTable;
begin
   //Não utilizar este metodo, usar o salvar
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
      ModuloCliente.SmEscolaClient.ApplyChangesAgenda(GetEscolaId,GetFuncionarioId,Deltas);
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
var
  Id:String;
begin
  //Método para Criar a agenda localmente
  try
    if Texto = EmptyStr then
      Exit;

    if fdqAgenda.State in [dsInactive] then
      fdqAgenda.Open;

    if fdqAgendaAluno.State in [dsInactive] then
      fdqAgendaAluno.Open;

    if fdqAgendaTurma.State in [dsInactive] then
      fdqAgendaTurma.Open;


    Id:= GetGUID;
    fdqAgenda.Append;
    fdqAgenda.FieldByName('agenda_id').AsString:= Id;
    fdqAgenda.FieldByName('descricao').AsString:=Texto;
    fdqAgenda.FieldByName('data_insert_local').AsDateTime:=Now;
    fdqAgenda.FieldByName('funcionario_id').AsInteger:=GetFuncionarioId;
    fdqAgenda.FieldByName('escola_id').AsInteger:=GetEscolaId;
    fdqAgenda.Post;

    fdqAgendaAluno.Append;
    fdqAgendaAluno.FieldByName('agenda_id').AsString := Id;
    fdqAgendaAluno.FieldByName('aluno_id').AsInteger := 19;
    fdqAgendaAluno.Post;

  except on E:Exception do
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'CriarAgenda',
                    Now,
                    'Erro ao Criar Agenda' + #13 + E.Message,
                    GetEscolaId,
                    0,
                    GetFuncionarioId
                  );
  end;
end;

procedure TDmEscola.GetAgenda(FuncionarioId:Integer;AgendaId:Integer);
var
  LDataSetList: TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  //Método para retornar as Agendas
  try
    try
      LDataSetList := ModuloCliente.SmEscolaClient.GetAgenda(GetEscolaId,GetFuncionarioId,IncDay(Now,-30),Now +1 );

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
      DM.SetLogError( E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'GetAgenda',
                      Now,
                      'Erro na busca da agenda' + #13 + E.Message,
                      GetEscolaId,
                      0,
                      GetFuncionarioId
                    );
    end;
  finally
  end;
end;



procedure TDmEscola.GetAlunos;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    LDataSetList := ModuloCliente.SmEscolaClient.GetAlunos(GetEscolaId,GetFuncionarioId);
    LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);
    CopyDataSet(LDataSet,fdqAluno);
  except on E:Exception do
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'GetAlunos',
                    Now,
                    'Erro na busca de alunos' + #13 + E.Message,
                    GetEscolaId,
                    0,
                    GetFuncionarioId
                    );
  end;
end;

procedure TDmEscola.GetTurmas;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    LDataSetList := ModuloCliente.SmEscolaClient.GetTurmas(GetEscolaId,GetFuncionarioId);
    LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);
    CopyDataSet(LDataSet,fdqTurma);
  except on E:Exception do
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'GetTurmas',
                    Now,
                    'Erro na busca das turmas' + #13 + E.Message,
                    GetEscolaId,
                    0,
                    GetFuncionarioId
                    );
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
  MsgRetornoServer:string;
begin
  //Método para salvar a agenda no server
  try
    try
      //GetAgenda(GetFuncionarioId,0);
      fdqAgendaSaveServer.Active := False;
      fdqAgendaSaveServer.Active := True;

      if fdqAgendaSaveServer.RecordCount <=0 then
        Exit;

      fdqAgendaSaveServer.Active := False;
      fdqAgendaAlunoSaveServer.Active := False;
      fdqAgendaTurmaSaveServer.Active := False;

      LDataSetList := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,'agenda',fdqAgendaSaveServer);
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,'agenda_aluno',fdqAgendaAlunoSaveServer);
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,'agenda_turma',fdqAgendaTurmaSaveServer);


      MsgRetornoServer:= ModuloCliente.SmEscolaClient.SalvarAgenda(GetEscolaId,GetFuncionarioId,Now-30,Now,LDataSetList);

      //Flagando registros como enviado
      if MsgRetornoServer = EmptyStr then
        SetFlagEnviado(fdqAgendaSaveServer);

    except on E:Exception do
      MsgRetornoServer := MsgRetornoServer + E.Message;
    end;
  finally
    if MsgRetornoServer <> EmptyStr then
      DM.SetLogError( MsgRetornoServer,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'SalvarAgenda',
                      Now,
                      'Erro ao Salvar Agenda' + #13 + MsgRetornoServer,
                      GetEscolaId,
                      0,
                      GetFuncionarioId
                    );
      fdqAgendaSaveServer.Active := False;
      fdqAgendaAlunoSaveServer.Active := False;
      fdqAgendaTurmaSaveServer.Active := False;
  end;
end;

procedure TDmEscola.SalvarDadosServer;
begin
  //Método para salvar todos os dados da escola no server
  SalvarAgenda;
end;

end.











