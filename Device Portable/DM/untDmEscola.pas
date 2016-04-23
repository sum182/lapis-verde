unit untDmEscola;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,DateUtils,
  FMX.Types, Data.FireDACJSONReflect;

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
    fdqTurmaAluno: TFDQuery;
    dsTurmaAluno: TDataSource;
    fdqAgendaAlunoagenda_id: TStringField;
    fdqAgendaAlunoaluno_id: TIntegerField;
    fdqAgendaTurmaagenda_id: TStringField;
    fdqAgendaTurmaturma_id: TIntegerField;
    fdqResp: TFDQuery;
    fdqRespAluno: TFDQuery;
    fdqRespTelefone: TFDQuery;
    fdqRespTipo: TFDQuery;
    fdqFunc: TFDQuery;
    fdqFuncTipo: TFDQuery;
    TimerSyncBasico: TTimer;
    fdqAgendaCriar: TFDQuery;
    fdqAgendaSync: TFDQuery;
    fdqAgendaAlunoSync: TFDQuery;
    fdqAgendaTurmaSync: TFDQuery;
    TimerSyncGeral: TTimer;
    fdqAgendaKeysInsert: TFDQuery;
    procedure TimerSyncBasicoTimer(Sender: TObject);
    procedure TimerSyncGeralTimer(Sender: TObject);
  private
    SalvarAgendaInExecute:Boolean;
    SyncServer:Boolean;
  public
    procedure OpenAlunos;
    procedure OpenTurmas;
    procedure OpenTurmaAluno;overload;
    procedure OpenTurmaAluno(TurmaId:Integer);overload;
    procedure OpenResponsaveis;
    procedure OpenFuncionarios;

    procedure CloseResponsaveis;
    procedure CloseFuncionarios;

    procedure GetAlunos;
    procedure GetTurmas;
    procedure GetResponsaveis;
    procedure GetFuncionarios;

    //Metodos para Agenda

    procedure SetSQLAgenda;overload;
    procedure SetSQLAgenda(AlunoId:Integer;TurmaId:Integer);overload;
    procedure SetSQLAgendaSync(KeyValues:String);overload;
    procedure SetSQLAgendaAlunoSync(KeyValues:String);overload;
    procedure SetSQLAgendaTurmaSync(KeyValues:String);overload;

    procedure SetParamsAgenda(AlunoId:Integer;TurmaId:Integer;Data:TDate);

    procedure OpenAgenda;overload;
    procedure OpenAgenda(AlunoId:Integer;TurmaId:Integer;Data:TDate);overload;
    procedure OpenAgendaSync(KeyValues:String);
    procedure OpenAgendaAlunoSync(KeyValues:String);
    procedure OpenAgendaTurmaSync(KeyValues:String);
    procedure OpenAgendaKeysInsert(DtIni,DtFim:TDateTime);
    function GetListKeysInsert(DtIni,DtFim:TDateTime):TFDJSONDataSets;


    procedure CloseAgenda;
    procedure CloseAgendaSync;


    procedure GetAgenda(DtIni,DtFim:TDateTime);
    procedure CriarAgenda(Texto:string;Data:TDate;AlunoId:Integer=0;
                          TurmaId:Integer=0);
    procedure SalvarAgenda;
    procedure AgendaApplyChanges;

    procedure SalvarDadosServer;
    procedure SyncronizarDadosServerGeral;
    procedure SyncronizarDadosServerBasico;


  end;

var
  DmEscola: TDmEscola;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untModuloCliente, smDBFireDac,
  FMX.Dialogs, System.SysUtils, smGeralFMX, untFuncoes, FMX.Forms,smMensagensFMX,smNetworkState,
  untDmGetServer;

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

procedure TDmEscola.CloseAgenda;
begin
  fdqAgenda.Active := False;
  fdqAgendaAluno.Active := False;
  fdqAgendaTurma.Active := False;
end;

procedure TDmEscola.CloseAgendaSync;
begin
  fdqAgendaSync.Active := False;
  fdqAgendaAlunoSync.Active := False;
  fdqAgendaTurmaSync.Active := False;
end;

procedure TDmEscola.CloseFuncionarios;
begin
  fdqFunc.Close;
  fdqFuncTipo.Close;
end;

procedure TDmEscola.CloseResponsaveis;
begin
  fdqResp.Close;
  fdqRespAluno.Close;
  fdqRespTelefone.Close;
  fdqRespTipo.Close;
end;

procedure TDmEscola.CriarAgenda(Texto:string;Data:TDate;AlunoId:Integer=0;
                                TurmaId:Integer=0);
var
  Id:String;
  Thread: TThread;
begin
  //Método para Criar a agenda localmente
  try
    if Texto = EmptyStr then
      Exit;

    if fdqAgendaCriar.State in [dsInactive] then
      fdqAgendaCriar.Open;

    if fdqAgendaAluno.State in [dsInactive] then
      fdqAgendaAluno.Open;

    if fdqAgendaTurma.State in [dsInactive] then
      fdqAgendaTurma.Open;


    Id:= GetGUID;
    fdqAgendaCriar.Append;
    fdqAgendaCriar.FieldByName('agenda_id').AsString:= Id;
    fdqAgendaCriar.FieldByName('descricao').AsString:=Texto;
    fdqAgendaCriar.FieldByName('data').AsDateTime:=Data;
    fdqAgendaCriar.FieldByName('data_insert_local').AsDateTime:=Now;
    fdqAgendaCriar.FieldByName('funcionario_id').AsInteger:=GetFuncionarioId;
    fdqAgendaCriar.FieldByName('escola_id').AsInteger:=GetEscolaId;
    fdqAgendaCriar.Post;

    if AlunoId > 0 then
    begin
      fdqAgendaAluno.Append;
      fdqAgendaAluno.FieldByName('agenda_id').AsString := Id;
      fdqAgendaAluno.FieldByName('aluno_id').AsInteger := AlunoId;
      fdqAgendaAluno.Post;
    end;

    if TurmaId > 0 then
    begin
      fdqAgendaTurma.Append;
      fdqAgendaTurma.FieldByName('agenda_id').AsString := Id;
      fdqAgendaTurma.FieldByName('turma_id').AsInteger := TurmaId;
      fdqAgendaTurma.Post;

      OpenTurmaAluno(TurmaId);
      fdqTurmaAluno.First;
      while not (fdqTurmaAluno.Eof)do
      begin
        fdqAgendaAluno.Append;
        fdqAgendaAluno.FieldByName('agenda_id').AsString := Id;
        fdqAgendaAluno.FieldByName('aluno_id').AsInteger := fdqTurmaAluno.FieldByName('aluno_id').AsInteger;
        fdqAgendaAluno.Post;
        fdqTurmaAluno.Next;
      end;
    end;


    Thread := TThread.CreateAnonymousThread(procedure
    begin
       //Salva a agenda no server
       SalvarAgenda;
        {TThread.Synchronize(TThread.CurrentThread, procedure
        begin
          //Salva a agenda no server
          SalvarAgenda;
        end); }
    end);
    Thread.Start;


  except on E:Exception do
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'CriarAgenda',
                    Now,
                    'Erro ao Criar Agenda' + #13 + E.Message,
                    GetEscolaId,
                    GetResponsavelId,
                    GetFuncionarioId
                  );
  end;

   MsgPoupUp('Agenda criada com sucesso');
end;

procedure TDmEscola.GetAgenda(DtIni,DtFim:TDateTime);
var
  LDataSetList: TFDJSONDataSets;
  LDataSet: TFDDataSet;
  KeyValues: string;
begin
  //Método para retornar as Agendas
  try
    try
      KeyValues:= EmptyStr;

      LDataSetList := ModuloCliente.SmEscolaClient.GetAgenda(GetEscolaId,
                                                             GetFuncionarioId,
                                                             DtIni,
                                                             DtFim,
                                                             GetListKeysInsert(DtIni,DtFim)
                                                             );

      //Pegando dados da agenda
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda');

     if LDataSet.IsEmpty then
        Exit;

      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      //ShowMessage(KeyValues);
      OpenAgendaSync(KeyValues);

      CopyDataSet(LDataSet,fdqAgendaSync,False,[coAppend,coEdit]);

      //Pegando dados da agenda_aluno
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_aluno');
      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      OpenAgendaAlunoSync(KeyValues);
      CopyDataSet(LDataSet,fdqAgendaAlunoSync,False,[coAppend,coEdit]);

      //Pegando dados da agenda_turma
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_turma');
      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      OpenAgendaTurmaSync(KeyValues);
      CopyDataSet(LDataSet,fdqAgendaTurmaSync,False,[coAppend,coEdit]);

    except on E:Exception do
      DM.SetLogError( E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'GetAgenda',
                      Now,
                      'Erro na busca da agenda' + #13 + E.Message,
                      GetEscolaId,
                      GetResponsavelId,
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
   if not Dm.ProcessHasUpdate('aluno') then
     Exit;


    LDataSetList := ModuloCliente.SmEscolaClient.GetAlunos(GetEscolaId,GetFuncionarioId);
    LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);
    CopyDataSet(LDataSet,fdqAluno);

    DM.ProcessSaveUpdate('aluno');

  except on E:Exception do
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'GetAlunos',
                    Now,
                    'Erro na busca de alunos' + #13 + E.Message,
                    GetEscolaId,
                    GetResponsavelId,
                    GetFuncionarioId
                    );
  end;
end;

procedure TDmEscola.GetFuncionarios;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    try
      if not Dm.ProcessHasUpdate('funcionario') then
       Exit;

      OpenFuncionarios;
      LDataSetList := ModuloCliente.SmEscolaClient.GetFuncionarios(GetEscolaId,GetFuncionarioId);
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'funcionario');
      CopyDataSet(LDataSet,fdqFunc);

      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'funcionario_tipo');
      CopyDataSet(LDataSet,fdqFuncTipo);

      DM.ProcessSaveUpdate('funcionario');
    except on E:Exception do
      DM.SetLogError( E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'GetFuncionarios',
                      Now,
                      'Erro na busca de Funcionarios' + #13 + E.Message,
                      GetEscolaId,
                      GetResponsavelId,
                      GetFuncionarioId
                      );
    end;
  finally
    CloseFuncionarios;
  end;

end;

function TDmEscola.GetListKeysInsert(DtIni, DtFim: TDateTime): TFDJSONDataSets;
begin
  try
    Result:= TFDJSONDataSets.Create;
    OpenAgendaKeysInsert(DtIni,DtFim);
    TFDJSONDataSetsWriter.ListAdd(Result,fdqAgendaKeysInsert);
  finally
    fdqAgendaKeysInsert.Close;
  end;
end;

procedure TDmEscola.GetResponsaveis;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    try
      if not Dm.ProcessHasUpdate('responsavel') then
       Exit;

      OpenResponsaveis;
      LDataSetList := ModuloCliente.SmEscolaClient.GetResponsaveis(GetEscolaId,GetFuncionarioId);
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'responsavel');
      CopyDataSet(LDataSet,fdqResp);

      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'responsavel_aluno');
      CopyDataSet(LDataSet,fdqRespAluno);

      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'responsavel_telefone');
      CopyDataSet(LDataSet,fdqRespTelefone);

      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'responsavel_tipo');
      CopyDataSet(LDataSet,fdqRespTipo);


      DM.ProcessSaveUpdate('responsavel');
    except on E:Exception do
      DM.SetLogError( E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'GetResponsaveis',
                      Now,
                      'Erro na busca dos responsaveis' + #13 + E.Message,
                      GetEscolaId,
                      GetResponsavelId,
                      GetFuncionarioId
                      );
    end;
  finally
    CloseResponsaveis;
  end;

end;


procedure TDmEscola.GetTurmas;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
   if not Dm.ProcessHasUpdate('turma') then
     Exit;


    OpenTurmas;
    LDataSetList := ModuloCliente.SmEscolaClient.GetTurmas(GetEscolaId,GetFuncionarioId);
    LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'turma');
    CopyDataSet(LDataSet,fdqTurma);

    LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'turma_aluno');
    CopyDataSet(LDataSet,fdqTurmaAluno);

    DM.ProcessSaveUpdate('turma');
  except on E:Exception do
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'GetTurmas',
                    Now,
                    'Erro na busca das turmas' + #13 + E.Message,
                    GetEscolaId,
                    GetResponsavelId,
                    GetFuncionarioId
                    );
  end;


end;

procedure TDmEscola.OpenAgenda;
begin
  CloseAgenda;

  SetSQLAgenda;

  fdqAgenda.Active := True;
  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;



procedure TDmEscola.OpenAgendaAlunoSync(KeyValues: String);
begin
  fdqAgendaAlunoSync.Active := False;
  SetSQLAgendaAlunoSync(KeyValues);
  fdqAgendaAlunoSync.Active := True;
end;

procedure TDmEscola.OpenAgendaKeysInsert(DtIni, DtFim: TDateTime);
begin
  fdqAgendaKeysInsert.Close;
  fdqAgendaKeysInsert.ParamByName('dt_ini').AsDate := DtIni;
  fdqAgendaKeysInsert.ParamByName('dt_fim').AsDate := DtFim;
  fdqAgendaKeysInsert.Open;
end;

procedure TDmEscola.OpenAgendaTurmaSync(KeyValues: String);
begin
  fdqAgendaTurmaSync.Active := False;
  SetSQLAgendaTurmaSync(KeyValues);
  fdqAgendaTurmaSync.Active := True;
end;

procedure TDmEscola.OpenAgendaSync(KeyValues: String);
begin
  CloseAgendaSync;
  SetSQLAgendaSync(KeyValues);
  fdqAgendaSync.Active := True;
end;

procedure TDmEscola.OpenAgenda(AlunoId, TurmaId: Integer;Data:TDate);
begin
  CloseAgenda;

  SetSQLAgenda(AlunoId,TurmaId);
  SetParamsAgenda(AlunoId,TurmaId,Data);

  fdqAgenda.Active := True;
  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;

procedure TDmEscola.OpenAlunos;
begin
  fdqAluno.Close;
  fdqAluno.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqAluno.Open;
end;

procedure TDmEscola.OpenFuncionarios;
begin
  fdqFunc.Close;
  fdqFunc.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqFunc.Open;

  fdqFuncTipo.Close;
  fdqFuncTipo.Open;
end;

procedure TDmEscola.OpenResponsaveis;
begin
  fdqResp.Close;
  fdqResp.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqResp.Open;

  fdqRespAluno.Close;
  fdqRespAluno.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqRespAluno.Open;

  fdqRespTelefone.Close;
  fdqRespTelefone.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqRespTelefone.Open;

  fdqRespTipo.Close;
  fdqRespTipo.Open;
end;

procedure TDmEscola.OpenTurmaAluno(TurmaId:Integer);
begin
  fdqTurmaAluno.Close;
  fdqTurmaAluno.SQL.Clear;
  fdqTurmaAluno.SQL.Add('select');
  fdqTurmaAluno.SQL.Add('ta.*');
  fdqTurmaAluno.SQL.Add('from turma_aluno ta');
  fdqTurmaAluno.SQL.Add('inner join turma t on (t.turma_id = ta.turma_id )');
  fdqTurmaAluno.SQL.Add('where t.escola_id = :escola_id');
  fdqTurmaAluno.SQL.Add('and t.turma_id = :turma_id');
  fdqTurmaAluno.ParamByName('turma_id').AsInteger:= TurmaId;
  fdqTurmaAluno.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqTurmaAluno.Open;
end;

procedure TDmEscola.OpenTurmaAluno;
begin
  fdqTurmaAluno.Close;
  fdqTurmaAluno.SQL.Clear;
  fdqTurmaAluno.SQL.Add('select');
  fdqTurmaAluno.SQL.Add('ta.*');
  fdqTurmaAluno.SQL.Add('from turma_aluno ta');
  fdqTurmaAluno.SQL.Add('inner join turma t on (t.turma_id = ta.turma_id )');
  fdqTurmaAluno.SQL.Add('where t.escola_id = :escola_id');
  fdqTurmaAluno.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqTurmaAluno.Open;
end;

procedure TDmEscola.OpenTurmas;
begin
  fdqTurma.Close;
  fdqTurma.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqTurma.Open;
  OpenTurmaAluno;
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
      if not smNetworkState.IsConnected then
        Exit;

      if SalvarAgendaInExecute then
        Exit;

      SalvarAgendaInExecute:=True;
      fdqAgendaSaveServer.Active := False;
      fdqAgendaSaveServer.Active := True;

      if fdqAgendaSaveServer.IsEmpty  then
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
                      GetResponsavelId,
                      GetFuncionarioId
                    );
      fdqAgendaSaveServer.Active := False;
      fdqAgendaAlunoSaveServer.Active := False;
      fdqAgendaTurmaSaveServer.Active := False;
      SalvarAgendaInExecute:=False;
  end;

  MsgPoupUp('Agenda salva com sucesso');
end;

procedure TDmEscola.SalvarDadosServer;
begin
  //Método para salvar todos os dados da escola no server
  SalvarAgenda;
end;




procedure TDmEscola.SetParamsAgenda(AlunoId, TurmaId: Integer;Data:TDate);
begin
  fdqAgenda.ParamByName('escola_id').AsInteger:= GetEscolaId;

  if AlunoId > 0 then
    fdqAgenda.ParamByName('aluno_id').AsInteger:= AlunoId;

  if TurmaId > 0 then
    fdqAgenda.ParamByName('turma_id').AsInteger:= TurmaId;

  fdqAgenda.ParamByName('data').AsDate:= Data;
end;

procedure TDmEscola.SetSQLAgendaSync(KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqAgendaSync.SQL.Clear;
  fdqAgendaSync.SQL.Add('select');
  fdqAgendaSync.SQL.Add('  ag.*,');
  fdqAgendaSync.SQL.Add('  strftime("%d/%m/%Y",ag.data_insert_local) as data_criacao,');
  fdqAgendaSync.SQL.Add('  strftime("%H:%M",data_insert_local) as hora_criacao');
  fdqAgendaSync.SQL.Add('from agenda ag');
  fdqAgendaSync.SQL.Add('where agenda_id in (' + KeyValues + ')');
  fdqAgendaSync.SQL.Add('order by ag.data_insert_local');

end;

procedure TDmEscola.SetSQLAgendaAlunoSync(KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqAgendaAlunoSync.SQL.Clear;
  fdqAgendaAlunoSync.SQL.Add('select al.*');
  fdqAgendaAlunoSync.SQL.Add('from agenda_aluno al');
  fdqAgendaAlunoSync.SQL.Add('where agenda_id in (' + KeyValues + ')');
end;

procedure TDmEscola.SetSQLAgendaTurmaSync(KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqAgendaTurmaSync.SQL.Clear;
  fdqAgendaTurmaSync.SQL.Add('select at.*');
  fdqAgendaTurmaSync.SQL.Add('from agenda_turma at');
  fdqAgendaTurmaSync.SQL.Add('where agenda_id in (' + KeyValues + ')');
end;

procedure TDmEscola.SyncronizarDadosServerGeral;
begin
  try
    if SyncServer then
      Exit;

    if not smNetworkState.IsConnected then
      Exit;

    SyncServer:=True;

    try
      DmGetServer.GetProcessoAtualizacao;
      smMensagensFMX.MsgPoupUp('DmGetServer.GetTabelaAtualizacao OK');
    except on E:Exception do
      smMensagensFMX.MsgPoupUp('DmGetServer.GetTabelaAtualizacao Erro:' + e.Message);
    end;


    try
      GetAlunos;
      smMensagensFMX.MsgPoupUp('DmEscola.GetAlunos OK');
    except on E:Exception do
      smMensagensFMX.MsgPoupUp('DmEscola.GetAlunos Erro:' + e.Message);
    end;

    try
      GetTurmas;
      smMensagensFMX.MsgPoupUp('DmEscola.GetTurmas OK');
    except on E:Exception do
      smMensagensFMX.MsgPoupUp('DmEscola.GetTurmas Erro:' + e.Message);
    end;

    try
      GetResponsaveis;
      smMensagensFMX.MsgPoupUp('DmEscola.GetResponsaveis OK');
    except on E:Exception do
      smMensagensFMX.MsgPoupUp('DmEscola.GetResponsaveis Erro:' + e.Message);
    end;

    try
      GetFuncionarios;
      smMensagensFMX.MsgPoupUp('DmEscola.GetFuncionarios OK');
    except on E:Exception do
      smMensagensFMX.MsgPoupUp('DmEscola.GetFuncionarios Erro:' + e.Message);
    end;

    try
      DmGetServer.GetEscola;
      if IsModoTeste then
        smMensagensFMX.MsgPoupUp('DmGetServer.GetEscola OK');
    except on E:Exception do
      if IsModoTeste then
        smMensagensFMX.MsgPoupUp('DmGetServer.GetEscola Erro:' + e.Message);
    end;


    try
      DmGetServer.PeriodoTipo;
      if IsModoTeste then
        smMensagensFMX.MsgPoupUp('DmGetServer.PeriodoTipo OK');
    except on E:Exception do
      if IsModoTeste then
        smMensagensFMX.MsgPoupUp('DmGetServer.PeriodoTipo Erro:' + e.Message);
    end;

    try
      DmGetServer.ResponsavelTipo;
      if IsModoTeste then
        smMensagensFMX.MsgPoupUp('DmGetServer.ResponsavelTipo OK');
    except on E:Exception do
      if IsModoTeste then
        smMensagensFMX.MsgPoupUp('DmGetServer.ResponsavelTipo Erro:' + e.Message);
    end;


    try
      DmGetServer.FuncionarioTipo;
      if IsModoTeste then
        smMensagensFMX.MsgPoupUp('DmGetServer.FuncionarioTipo OK');
    except on E:Exception do
      if IsModoTeste then
        smMensagensFMX.MsgPoupUp('DmGetServer.FuncionarioTipo Erro:' + e.Message);
    end;


    try
      DmGetServer.TelefoneTipo;
      if IsModoTeste then
        smMensagensFMX.MsgPoupUp('DmGetServer.TelefoneTipo OK');
    except on E:Exception do
      if IsModoTeste then
        smMensagensFMX.MsgPoupUp('DmGetServer.TelefoneTipo Erro:' + e.Message);
    end;


    try
      DmGetServer.AgendaTipo;
      if IsModoTeste then
        smMensagensFMX.MsgPoupUp('DmGetServer.AgendaTipo OK');
    except on E:Exception do
      if IsModoTeste then
        smMensagensFMX.MsgPoupUp('DmGetServer.AgendaTipo Erro:' + e.Message);
    end;

    try
      GetAgenda(Now - 30, Now + 1);
      smMensagensFMX.MsgPoupUp('DmEscola.GetAgenda OK');
    except on E:Exception do
      smMensagensFMX.MsgPoupUp('DmEscola.GetAgenda Erro:' + e.Message);
    end;


    try
      SalvarDadosServer;
      smMensagensFMX.MsgPoupUp('DmEscola.SalvarDadosServer OK');
    except on E:Exception do
      smMensagensFMX.MsgPoupUp('DmEscola.SalvarDadosServer Erro:' + e.Message);
    end;
  finally
    SyncServer:=False;
  end;
end;




procedure TDmEscola.TimerSyncBasicoTimer(Sender: TObject);
var
  Thread: TThread;
begin
  Thread := TThread.CreateAnonymousThread(procedure
    begin
      SyncronizarDadosServerBasico;
    end);
  Thread.Start;
end;

procedure TDmEscola.TimerSyncGeralTimer(Sender: TObject);
var
  Thread: TThread;
begin
  Thread := TThread.CreateAnonymousThread(procedure
    begin
      SyncronizarDadosServerGeral;
    end);
  Thread.Start;
end;

procedure TDmEscola.SyncronizarDadosServerBasico;
begin
  try
    if SyncServer then
      Exit;

    if not smNetworkState.IsConnected then
      Exit;

    SyncServer:=True;

    try
      GetAgenda(Now - 1, Now + 7);
      smMensagensFMX.MsgPoupUp('DmEscola.GetAgenda OK');
    except on E:Exception do
      smMensagensFMX.MsgPoupUp('DmEscola.GetAgenda Erro:' + e.Message);
    end;

    try
      SalvarAgenda;
      smMensagensFMX.MsgPoupUp('DmEscola.SalvarAgenda OK');
    except on E:Exception do
      smMensagensFMX.MsgPoupUp('DmEscola.SalvarAgenda Erro:' + e.Message);
    end;

  finally
    SyncServer:=False;
  end;

end;

procedure TDmEscola.SetSQLAgenda;
begin
  fdqAgenda.SQL.Clear;
  fdqAgenda.SQL.Add('select');
  fdqAgenda.SQL.Add('  ag.*,');
  fdqAgenda.SQL.Add('  strftime("%d/%m/%Y",ag.data_insert_local) as data_criacao,');
  fdqAgenda.SQL.Add('  strftime("%H:%M",data_insert_local) as hora_criacao,');
  fdqAgenda.SQL.Add('  f.nome as funcionario_nome,');
  fdqAgenda.SQL.Add('  ft.descricao as funcionario_tipo,');
  fdqAgenda.SQL.Add('  r.nome as responsavel_nome,');
  fdqAgenda.SQL.Add('  rt.descricao as responsavel_tipo');
  fdqAgenda.SQL.Add('from agenda ag');
  fdqAgenda.SQL.Add('left outer join funcionario f on (f.funcionario_id = ag.funcionario_id)');
  fdqAgenda.SQL.Add('left outer join funcionario_tipo ft on (ft.funcionario_tipo_id = f.funcionario_tipo_id)');
  fdqAgenda.SQL.Add('left outer join responsavel r on (r.responsavel_id = ag.responsavel_id)');
  fdqAgenda.SQL.Add('left outer join responsavel_tipo rt on (rt.responsavel_tipo_id = r.responsavel_tipo_id)');
  fdqAgenda.SQL.Add('order by ag.data_insert_local');
end;


procedure TDmEscola.SetSQLAgenda(AlunoId, TurmaId: Integer);
begin
  fdqAgenda.SQL.Clear;

  if AlunoId > 0 then
  begin
    fdqAgenda.SQL.Clear;
    fdqAgenda.SQL.Add('select');
    fdqAgenda.SQL.Add('  ag.*,');
    fdqAgenda.SQL.Add('  strftime("%d/%m/%Y",ag.data_insert_local) as data_criacao,');
    fdqAgenda.SQL.Add('  strftime("%H:%M",data_insert_local) as hora_criacao,');
    fdqAgenda.SQL.Add('  f.nome as funcionario_nome,');
    fdqAgenda.SQL.Add('  ft.descricao as funcionario_tipo,');
    fdqAgenda.SQL.Add('  r.nome as responsavel_nome,');
    fdqAgenda.SQL.Add('  rt.descricao as responsavel_tipo');
    fdqAgenda.SQL.Add('from agenda ag');
    fdqAgenda.SQL.Add('inner join agenda_aluno al on (ag.agenda_id = al.agenda_id)');
    fdqAgenda.SQL.Add('left outer join funcionario f on (f.funcionario_id = ag.funcionario_id)');
    fdqAgenda.SQL.Add('left outer join funcionario_tipo ft on (ft.funcionario_tipo_id = f.funcionario_tipo_id)');
    fdqAgenda.SQL.Add('left outer join responsavel r on (r.responsavel_id = ag.responsavel_id)');
    fdqAgenda.SQL.Add('left outer join responsavel_tipo rt on (rt.responsavel_tipo_id = r.responsavel_tipo_id)');

    fdqAgenda.SQL.Add('where 1=1');
    fdqAgenda.SQL.Add('and data = :data');
    fdqAgenda.SQL.Add('and ag.escola_id = :escola_id');
    fdqAgenda.SQL.Add('and al.aluno_id = :aluno_id');
    fdqAgenda.SQL.Add('order by ag.data_insert_local ');
  end;


  if TurmaId > 0 then
  begin
    fdqAgenda.SQL.Clear;
    fdqAgenda.SQL.Add('select');
    fdqAgenda.SQL.Add('  ag.*,');
    fdqAgenda.SQL.Add('  strftime("%d/%m/%Y",ag.data_insert_local) as data_criacao,');
    fdqAgenda.SQL.Add('  strftime("%H:%M",data_insert_local) as hora_criacao,');
    fdqAgenda.SQL.Add('  f.nome as funcionario_nome,');
    fdqAgenda.SQL.Add('  ft.descricao as funcionario_tipo,');
    fdqAgenda.SQL.Add('  r.nome as responsavel_nome,');
    fdqAgenda.SQL.Add('  rt.descricao as responsavel_tipo');
    fdqAgenda.SQL.Add('from agenda ag');
    fdqAgenda.SQL.Add('inner join agenda_turma at on (ag.agenda_id = at.agenda_id)');
    fdqAgenda.SQL.Add('left outer join funcionario f on (f.funcionario_id = ag.funcionario_id)');
    fdqAgenda.SQL.Add('left outer join funcionario_tipo ft on (ft.funcionario_tipo_id = f.funcionario_tipo_id)');
    fdqAgenda.SQL.Add('left outer join responsavel r on (r.responsavel_id = ag.responsavel_id)');
    fdqAgenda.SQL.Add('left outer join responsavel_tipo rt on (rt.responsavel_tipo_id = r.responsavel_tipo_id)');
    fdqAgenda.SQL.Add('where 1=1');
    fdqAgenda.SQL.Add('and data = :data');
    fdqAgenda.SQL.Add('and ag.escola_id = :escola_id');
    fdqAgenda.SQL.Add('and at.turma_id = :turma_id');
    fdqAgenda.SQL.Add('order by ag.data_insert_local ');
  end;

  fdqAgendaAluno.SQL.Clear;
  fdqAgendaAluno.SQL.Add('select * from agenda_aluno al');
  fdqAgendaAluno.SQL.Add('where al.agenda_id = :agenda_id');
  fdqAgendaAluno.ParamByName('agenda_id').AsInteger:=0;

  fdqAgendaTurma.SQL.Clear;
  fdqAgendaTurma.SQL.Add('select * from agenda_turma at');
  fdqAgendaTurma.SQL.Add('where at.agenda_id = :agenda_id');
  fdqAgendaTurma.ParamByName('agenda_id').AsInteger:=0;
end;

end.











