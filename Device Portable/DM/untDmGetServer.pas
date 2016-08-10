unit untDmGetServer;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,DateUtils,
  FMX.Types, Data.FireDACJSONReflect;

type
  TDmGetServer = class(TDataModule)
    fdStanStorageBinLink: TFDStanStorageBinLink;
    fdqProcessoAtualizacao: TFDQuery;
    fdqAluno: TFDQuery;
    fdqTurma: TFDQuery;
    fdqTurmaAluno: TFDQuery;
    fdqResp: TFDQuery;
    fdqRespAluno: TFDQuery;
    fdqRespTelefone: TFDQuery;
    fdqFunc: TFDQuery;
    fdqAgenda: TFDQuery;
    fdqAgendaAluno: TFDQuery;
    fdqAgendaTurma: TFDQuery;
    fdqAgendaKeysInsert: TFDQuery;
    fdqProcessoAtualizacaoprocesso_atualizacao_id: TIntegerField;
    fdqProcessoAtualizacaoprocesso: TStringField;
    fdqProcessoAtualizacaodata: TDateTimeField;
    fdqProcessoAtualizacaodata_local: TDateTimeField;
    fdqProcessoAtualizacaoescola_id: TIntegerField;
    fdqRespEscola: TFDQuery;
  private
  public
    procedure OpenProcessoAtualizacao;
    procedure OpenTurmas;

    procedure GetProcessoAtualizacao;

    function GetDataSet(Nome: String;
                         UtilizaParamEscolaId:Boolean=True;
                         Condicoes: String='';
                         AtualizaDataSetLocal:Boolean=True
                         ):TFDDataSet;

    procedure GetEscola;
    procedure GetPeriodoTipo;
    procedure GetResponsavelTipo;
    procedure GetFuncionarioTipo;
    procedure GetTelefoneTipo;
    procedure GetAgendaTipo;
    procedure GetAlunos;
    procedure GetTurmas;
    procedure GetResponsaveis;
    procedure GetFuncionarios;
    function GetFuncionario(FuncionarioId:Integer):TFDDataSet;
    function GetResponsavel(ResponsavelId:Integer):TFDDataSet;

    procedure GetAgenda(DtIni,DtFim:TDateTime);
    procedure GetAgendaTeste(DtIni,DtFim:TDateTime);

    //Agenda
    procedure OpenAgendaKeysInsert(DtIni,DtFim:TDateTime);
    function GetAgendaListKeysInsert(DtIni,DtFim:TDateTime):TFDJSONDataSets;
    function GetAgendaKeysInsert(DtIni,DtFim:TDateTime):String;

    procedure OpenAgenda(KeyValues:String);
    procedure OpenAgendaAluno(KeyValues:String);
    procedure OpenAgendaTurma(KeyValues:String);
    procedure SetSQLAgenda(KeyValues:String);overload;
    procedure SetSQLAgendaAluno(KeyValues:String);overload;
    procedure SetSQLAgendaTurma(KeyValues:String);overload;
    procedure CloseAgenda;

    procedure GetDadosServerGeral;
    procedure GetDadosServerBasico;
  end;

var
  DmGetServer: TDmGetServer;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untRestClient, smDBFireDac,
  FMX.Dialogs, System.SysUtils, smGeralFMX, untLibDevicePortable, FMX.Forms,smMensagensFMX,smNetworkState,
  untLibGeral, Data.DBXJSONReflect, System.JSON, System.ZLib, untTypes;

{$R *.dfm}

{ TDmGetServer }

procedure TDmGetServer.CloseAgenda;
begin
  fdqAgenda.Active := False;
  fdqAgendaAluno.Active := False;
  fdqAgendaTurma.Active := False;
end;

procedure TDmGetServer.GetAgenda(DtIni, DtFim: TDateTime);
var
  LDataSetList: TFDJSONDataSets;
  LDataSet: TFDDataSet;
  KeyValues: string;
begin
  //Método para retornar as Agendas
  try
    try
      KeyValues:= EmptyStr;

      if not ValidacoesRestClientBeforeExecute then
        Exit;

      LDataSetList := RestClient.SmAgendaClient.GetAgenda(GetEscolaId,
                                                             Usuario.Marshal,
                                                             DtIni,
                                                             DtFim,
                                                             GetAgendaKeysInsert(DtIni,DtFim)
                                                             );

      //Pegando dados da agenda
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda');

      if LDataSet.IsEmpty then
        Exit;

      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      OpenAgenda(KeyValues);
      CopyDataSet(LDataSet,fdqAgenda,False,[coAppend,coEdit]);

      //Pegando dados da agenda_aluno
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_aluno');
      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      OpenAgendaAluno(KeyValues);
      CopyDataSet(LDataSet,fdqAgendaAluno,False,[coAppend,coEdit]);

      //Pegando dados da agenda_turma
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_turma');
      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      OpenAgendaTurma(KeyValues);
      CopyDataSet(LDataSet,fdqAgendaTurma,False,[coAppend,coEdit]);
      MsgPoupUpTeste('DmGetServer.GetAgenda Executado: ' + DateToStr(DtIni) + ' à '+ DateToStr(DtFim));
    except on E:Exception do
    begin
      DM.SetLogError( E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'GetAgenda',
                      Now,
                      'Erro na busca da agenda' + #13 + E.Message
                    );
      Raise;
    end;
    end;
  finally
  end;

end;

function TDmGetServer.GetAgendaKeysInsert(DtIni, DtFim: TDateTime): String;
begin
  OpenAgendaKeysInsert(DtIni,DtFim);
  Result:= GetKeyValuesDataSet(fdqAgendaKeysInsert,'agenda_id');
end;

procedure TDmGetServer.GetAgendaTeste(DtIni, DtFim: TDateTime);
var
  LDataSetList: TFDJSONDataSets;
  LDataSet: TFDDataSet;
  KeyValues: string;
  UsuarioJSONValue: TJSONValue;
  KeysInserts:String;
begin
  //Método para retornar as Agendas
  try
    try
      //MsgPoupUpTeste('Inicio DmGetServer.GetAgendaTeste');
      KeyValues:= EmptyStr;
      UsuarioJSONValue:= Usuario.MarshalValue;

      OpenAgendaKeysInsert(DtIni,DtFim);
      KeysInserts:= GetKeyValuesDataSet(fdqAgendaKeysInsert,'agenda_id');

      if not ValidacoesRestClientBeforeExecute then
        Exit;

      LDataSetList := RestClient.SmAgendaClient.GetAgendaTeste(GetEscolaId,
                                                                 Usuario.Marshal,
                                                                 DtIni,
                                                                 DtFim,
                                                                 KeysInserts
                                                                 );

      //Pegando dados da agenda
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda');

     if LDataSet.IsEmpty then
        Exit;

      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      //ShowMessage(KeyValues);
      OpenAgenda(KeyValues);

      CopyDataSet(LDataSet,fdqAgenda,False,[coAppend,coEdit]);

      //Pegando dados da agenda_aluno
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_aluno');
      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      OpenAgendaAluno(KeyValues);
      CopyDataSet(LDataSet,fdqAgendaAluno,False,[coAppend,coEdit]);

      //Pegando dados da agenda_turma
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_turma');
      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      OpenAgendaTurma(KeyValues);
      CopyDataSet(LDataSet,fdqAgendaTurma,False,[coAppend,coEdit]);

    except on E:Exception do
    begin
      DM.SetLogError( E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'GetAgenda',
                      Now,
                      '**Erro na busca da agenda Teste' + #13 + E.Message
                    );
       Raise;
    end;
    end;
  finally
    //ListKeysInsert.DisposeOf;
  end;
end;

procedure TDmGetServer.GetAgendaTipo;
begin
  GetDataSet('agenda_tipo',False);
end;

function TDmGetServer.GetFuncionario(FuncionarioId: Integer):TFDDataSet;
begin
  Result:= GetDataSet('funcionario',
              True,
              'and funcionario_id = ' + IntToStr(FuncionarioId),
              False);
end;

procedure TDmGetServer.GetFuncionarios;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    try
      if not Dm.ProcessHasUpdate('funcionario') then
       Exit;

      if not ValidacoesRestClientBeforeExecute then
        Exit;

      LDataSetList := RestClient.SmMainClient.GetFuncionarios(GetEscolaId,Usuario.Marshal);
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'funcionario');
      CopyDataSet(LDataSet,fdqFunc);

      DM.ProcessSaveUpdate('funcionario');
      MsgPoupUpTeste('DmGetServer.GetFuncionarios Executado');
    except on E:Exception do
    begin
      DM.SetLogError( E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'GetFuncionarios',
                      Now,
                      'Erro na busca de Funcionarios' + #13 + E.Message
                      );
       Raise;
    end;
    end;
  finally
  end;
end;

procedure TDmGetServer.GetFuncionarioTipo;
begin
  GetDataSet('funcionario_tipo',False);
end;

function TDmGetServer.GetAgendaListKeysInsert(DtIni,
  DtFim: TDateTime): TFDJSONDataSets;
begin
  try
    Result:= TFDJSONDataSets.Create;
    OpenAgendaKeysInsert(DtIni,DtFim);
    TFDJSONDataSetsWriter.ListAdd(Result,fdqAgendaKeysInsert);
  finally
  end;
end;

procedure TDmGetServer.GetAlunos;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    if not Dm.ProcessHasUpdate('aluno') then
      Exit;

    if not ValidacoesRestClientBeforeExecute then
      Exit;

    LDataSetList := RestClient.SmMainClient.GetAlunos(GetEscolaId,Usuario.Marshal);
    LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);
    CopyDataSet(LDataSet,fdqAluno);

    DM.ProcessSaveUpdate('aluno');
    MsgPoupUpTeste('DmGetServer.GetAlunos Executado');
  except on E:Exception do
  begin
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'GetAlunos',
                    Now,
                    'Erro na busca de alunos' + #13 + E.Message
                    );
     Raise;
  end;
  end;

end;

procedure TDmGetServer.GetDadosServerGeral;
begin
  try
    GetProcessoAtualizacao;
    //MsgPoupUpTeste('DmGetServer.GetTabelaAtualizacao OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.GetTabelaAtualizacao Erro:' + e.Message);
  end;

  try
    GetAlunos;
    //MsgPoupUpTeste('DmGetServer.GetAlunos OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.GetAlunos Erro:' + e.Message);
  end;

  try
    GetTurmas;
    //MsgPoupUpTeste('DmGetServer.GetTurmas OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.GetTurmas Erro:' + e.Message);
  end;

  try
    GetResponsaveis;
    //MsgPoupUpTeste('DmGetServer.GetResponsaveis OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.GetResponsaveis Erro:' + e.Message);
  end;

  try
    GetFuncionarios;
    //MsgPoupUpTeste('DmGetServer.GetFuncionarios OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.GetFuncionarios Erro:' + e.Message);
  end;

  try
    GetEscola;
    //MsgPoupUpTeste('DmGetServer.GetEscola OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.GetEscola Erro:' + e.Message);
  end;

  try
    GetPeriodoTipo;
    //MsgPoupUpTeste('DmGetServer.PeriodoTipo OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.PeriodoTipo Erro:' + e.Message);
  end;

  try
    GetResponsavelTipo;
    //MsgPoupUpTeste('DmGetServer.ResponsavelTipo OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.ResponsavelTipo Erro:' + e.Message);
  end;

  try
    GetFuncionarioTipo;
    //MsgPoupUpTeste('DmGetServer.FuncionarioTipo OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.FuncionarioTipo Erro:' + e.Message);
  end;

  try
    GetTelefoneTipo;
    //MsgPoupUpTeste('DmGetServer.TelefoneTipo OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.TelefoneTipo Erro:' + e.Message);
  end;

  try
    GetAgendaTipo;
    //MsgPoupUpTeste('DmGetServer.AgendaTipo OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.AgendaTipo Erro:' + e.Message);
  end;

  try
    GetAgenda(Now - 30, Now + 1);
    //MsgPoupUpTeste('DmGetServer.GetAgenda OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.GetAgenda Erro:' + e.Message);
  end;
end;

function TDmGetServer.GetDataSet(Nome: String; UtilizaParamEscolaId: Boolean;
  Condicoes: String;AtualizaDataSetLocal:Boolean):TFDDataSet;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSetServer: TFDDataSet;
  fdqDataSet: TFDQuery;
begin
  try
    fdqDataSet := TFDQuery.Create(self);

    try
      if Nome = '' then
       raise Exception.Create('GetDataSet: Nome não definido');

      if not Dm.ProcessHasUpdate(Nome) and (AtualizaDataSetLocal) then
       Exit;

      if AtualizaDataSetLocal then
      begin
        fdqDataSet.Connection:=Dm.FDConnectionDB;

        fdqDataSet.Active := False;

        fdqDataSet.SQL.Clear;
        fdqDataSet.SQL.Add('select * from ' + Nome);
        fdqDataSet.SQL.Add('where 1 = 1');

        if UtilizaParamEscolaId then
          fdqDataSet.SQL.Add('and escola_id = ' + IntToStr(GetEscolaId));

        if Condicoes <> EmptyStr then
          fdqDataSet.SQL.Add(Condicoes);
      end;


      if not ValidacoesRestClientBeforeExecute then
        Exit;

      LDataSetList := RestClient.SmMainClient.GetDataSet(GetEscolaId,
                                                              Nome,
                                                              Usuario.Marshal,
                                                              UtilizaParamEscolaId,
                                                              Condicoes);



      LDataSetServer := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);
      Result:= LDataSetServer;
      if AtualizaDataSetLocal then
      begin
        CopyDataSet(LDataSetServer,fdqDataSet,False,[coAppend,coEdit]);
        DM.ProcessSaveUpdate(Nome);
      end;

      MsgPoupUpTeste('DmGetServer.' + Nome + ' Executado');
    except on E:Exception do
    begin
      DM.SetLogError( E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'GetDataSet:' + Nome,
                      Now,
                      'Erro na busca GetDataSet:' + Nome + #13 + E.Message
                     );
       Raise;
    end;
    end;
  finally
    //if AtualizaDataSetLocal then
     if Assigned(fdqDataSet) then
      fdqDataSet.DisposeOf;
  end;

end;

procedure TDmGetServer.GetEscola;
begin
  GetDataSet('escola');
end;

procedure TDmGetServer.GetProcessoAtualizacao;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    OpenProcessoAtualizacao;
    if not ValidacoesRestClientBeforeExecute then
      Exit;

    LDataSetList := RestClient.SmMainClient.GetProcessoAtualizacao(GetEscolaId,Usuario.Marshal);
    LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);
    CopyDataSet(LDataSet,fdqProcessoAtualizacao,False,[coAppend,coEdit]);
    MsgPoupUpTeste('DmGetServer.GetTabelaAtualizacao Executado');
  except on E:Exception do
  begin
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'GetTabelaAtualizacao',
                    Now,
                    'Erro na busca de Tabelas Atualização' + #13 + E.Message
                   );
    Raise;
  end;
  end;
end;

procedure TDmGetServer.OpenAgendaAluno(KeyValues: String);
begin
  fdqAgendaAluno.Active := False;
  SetSQLAgendaAluno(KeyValues);
  fdqAgendaAluno.Active := True;
end;

procedure TDmGetServer.OpenAgendaKeysInsert(DtIni, DtFim: TDateTime);
begin
  fdqAgendaKeysInsert.Close;
  fdqAgendaKeysInsert.ParamByName('dt_ini').AsDate := DtIni;
  fdqAgendaKeysInsert.ParamByName('dt_fim').AsDate := DtFim;
  fdqAgendaKeysInsert.Open;
end;

procedure TDmGetServer.OpenAgenda(KeyValues: String);
begin
  CloseAgenda;
  SetSQLAgenda(KeyValues);
  fdqAgenda.Active := True;
end;

procedure TDmGetServer.OpenAgendaTurma(KeyValues: String);
begin
  fdqAgendaTurma.Active := False;
  SetSQLAgendaTurma(KeyValues);
  fdqAgendaTurma.Active := True;
end;

procedure TDmGetServer.OpenProcessoAtualizacao;
begin
  fdqProcessoAtualizacao.Close;
  fdqProcessoAtualizacao.SQL.Clear;


  if Usuario.Tipo = Funcionario then
  begin
    fdqProcessoAtualizacao.SQL.Add('SELECT * FROM processo_atualizacao');
    fdqProcessoAtualizacao.SQL.Add('where ((escola_id = :escola_id) or (escola_id = 0))');
    fdqProcessoAtualizacao.ParamByName('escola_id').AsInteger := GetEscolaId;
  end;


  if Usuario.Tipo = Responsavel then
  begin
    fdqProcessoAtualizacao.SQL.Add('SELECT * FROM processo_atualizacao');
    { TODO : OpenProcessoAtualizacao - Busca por Responsavel }
    //As linhas abaixo estao inativas devido nao poder realizar os joins.
    //As tabelas neste momento estao vazias
    {fdqProcessoAtualizacao.SQL.Add('where (escola_id = 0) or escola_id in (select a.escola_id');
    fdqProcessoAtualizacao.SQL.Add('                                       from aluno a');
    fdqProcessoAtualizacao.SQL.Add('                                       where a.aluno_id in (select ra.aluno_id from responsavel_aluno ra');
    fdqProcessoAtualizacao.SQL.Add('                                                            where ra.responsavel_id = :responsavel_id');
    fdqProcessoAtualizacao.SQL.Add('                                                            )');
    fdqProcessoAtualizacao.SQL.Add('                                       )');
    fdqProcessoAtualizacao.ParamByName('responsavel_id').AsInteger := Usuario.Id;}
  end;

  fdqProcessoAtualizacao.Open;
end;

procedure TDmGetServer.OpenTurmas;
begin
  fdqTurma.Close;
  fdqTurma.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqTurma.Open;

  fdqTurmaAluno.Close;
  fdqTurmaAluno.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqTurmaAluno.Open;
end;

procedure TDmGetServer.SetSQLAgendaAluno(KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqAgendaAluno.SQL.Clear;
  fdqAgendaAluno.SQL.Add('select al.*');
  fdqAgendaAluno.SQL.Add('from agenda_aluno al');
  fdqAgendaAluno.SQL.Add('where agenda_id in (' + KeyValues + ')');
end;

procedure TDmGetServer.SetSQLAgenda(KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqAgenda.SQL.Clear;
  fdqAgenda.SQL.Add('select');
  fdqAgenda.SQL.Add('  ag.*,');
  fdqAgenda.SQL.Add('  strftime("%d/%m/%Y",ag.data_insert_local) as data_criacao,');
  fdqAgenda.SQL.Add('  strftime("%H:%M",data_insert_local) as hora_criacao');
  fdqAgenda.SQL.Add('from agenda ag');
  fdqAgenda.SQL.Add('where agenda_id in (' + KeyValues + ')');
  fdqAgenda.SQL.Add('order by ag.data_insert_local');
end;

procedure TDmGetServer.SetSQLAgendaTurma(KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqAgendaTurma.SQL.Clear;
  fdqAgendaTurma.SQL.Add('select at.*');
  fdqAgendaTurma.SQL.Add('from agenda_turma at');
  fdqAgendaTurma.SQL.Add('where agenda_id in (' + KeyValues + ')');
end;

procedure TDmGetServer.GetPeriodoTipo;
begin
  GetDataSet('periodo_tipo',False);
end;

procedure TDmGetServer.GetResponsaveis;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    try
      //if not Dm.ProcessHasUpdate('responsavel') then
       //Exit;

      //OpenResponsaveis;
      if not ValidacoesRestClientBeforeExecute then
        Exit;

      LDataSetList := RestClient.SmMainClient.GetResponsaveis(GetEscolaId,Usuario.Marshal);
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'responsavel');
      CopyDataSet(LDataSet,fdqResp);

      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'responsavel_escola');
      CopyDataSet(LDataSet,fdqRespEscola);

      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'responsavel_aluno');
      CopyDataSet(LDataSet,fdqRespAluno);

      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'responsavel_telefone');
      CopyDataSet(LDataSet,fdqRespTelefone);

      DM.ProcessSaveUpdate('responsavel');
      MsgPoupUpTeste('DmGetServer.GetResponsaveis Executado');
    except on E:Exception do
    begin
      DM.SetLogError( E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'GetResponsaveis',
                      Now,
                      'Erro na busca dos responsaveis' + #13 + E.Message
                      );
       Raise;
    end;
    end;
  finally
    //CloseResponsaveis;
  end;
end;

function TDmGetServer.GetResponsavel(ResponsavelId: Integer): TFDDataSet;
begin
  Result:= GetDataSet('responsavel',
              False,
              'and responsavel_id = ' + IntToStr(ResponsavelId),
              False);

end;

procedure TDmGetServer.GetResponsavelTipo;
begin
  GetDataSet('responsavel_tipo',False);
end;

procedure TDmGetServer.GetDadosServerBasico;
begin
  try
    GetAgenda(Now - 1, Now + 7);
    //MsgPoupUpTeste('DmGetServer.GetAgenda OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.GetAgenda Erro:' + e.Message);
  end;

end;

procedure TDmGetServer.GetTelefoneTipo;
begin
  GetDataSet('telefone_tipo',False);
end;

procedure TDmGetServer.GetTurmas;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    if not Dm.ProcessHasUpdate('turma') then
      Exit;

    OpenTurmas;
    if not ValidacoesRestClientBeforeExecute then
      Exit;

    LDataSetList := RestClient.SmMainClient.GetTurmas(GetEscolaId,Usuario.Marshal);
    LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'turma');
    CopyDataSet(LDataSet,fdqTurma);

    LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'turma_aluno');
    CopyDataSet(LDataSet,fdqTurmaAluno);

    DM.ProcessSaveUpdate('turma');
    MsgPoupUpTeste('DmGetServer.GetTurmas Executado');
  except on E:Exception do
  begin
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'GetTurmas',
                    Now,
                    'Erro na busca das turmas' + #13 + E.Message
                    );
    Raise;
  end;
  end;
end;

end.
