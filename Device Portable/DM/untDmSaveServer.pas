unit untDmSaveServer;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Dialogs, Data.FireDACJSONReflect;

type
  TDmSaveServer = class(TDataModule)
    fdqLogError: TFDQuery;
    fdqAgenda: TFDQuery;
    fdqAgendaAluno: TFDQuery;
    fdqAgendaAlunoagenda_id: TStringField;
    fdqAgendaAlunoaluno_id: TIntegerField;
    fdqAgendaTurma: TFDQuery;
    fdqAgendaTurmaagenda_id: TStringField;
    fdqAgendaTurmaturma_id: TIntegerField;
    fdqConfiguracoes: TFDQuery;
    fdqDeviceUsuario: TFDQuery;
    fdqAgendaDtMax: TFDQuery;
    fdqAgendaDtMin: TFDQuery;
  private
    SalvarAgendaInExecute:Boolean;
    function GetAgendaDtMax:TDateTime;
    function GetAgendaDtMin:TDateTime;
  public
    procedure SaveLogError;
    procedure SaveConfiguracoes;
    procedure SaveDeviceUsuario;
    procedure SaveAgenda;
    procedure SaveFuncionario(DataSet:TFDAdaptedDataSet);
    procedure SaveResponsavel(DataSet:TFDAdaptedDataSet);



    procedure SaveDadosServerGeral;
    procedure SaveDadosServerBasico;
  end;

var
  DmSaveServer: TDmSaveServer;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untLibDevicePortable, untRestClient, smDBFireDac,smNetworkState,
  smMensagensFMX;

{$R *.dfm}

{ TDmSaveServer }

function TDmSaveServer.GetAgendaDtMax: TDateTime;
begin
  fdqAgendaDtMax.Active := False;
  fdqAgendaDtMax.Active := True;

  Result:= fdqAgendaDtMax.FieldByName('data').asDateTime;
end;

function TDmSaveServer.GetAgendaDtMin: TDateTime;
begin
  fdqAgendaDtMin.Active := False;
  fdqAgendaDtMin.Active := True;

  Result:= fdqAgendaDtMin.FieldByName('data').AsDateTime;
end;

procedure TDmSaveServer.SaveAgenda;
var
  LDataSetList  : TFDJSONDataSets;
  MsgRetornoServer:string;
begin
  //Método para salvar a agenda no server
  try
    try
      if not smNetworkState.IsConnected then
        Exit;

      if SalvarAgendaInExecute then
        Exit;

      SalvarAgendaInExecute:=True;
      fdqAgenda.Active := False;
      fdqAgenda.Active := True;

      if fdqAgenda.IsEmpty  then
        Exit;

      fdqAgenda.Active := False;
      fdqAgendaAluno.Active := False;
      fdqAgendaTurma.Active := False;

      LDataSetList := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,'agenda',fdqAgenda);
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,'agenda_aluno',fdqAgendaAluno);
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,'agenda_turma',fdqAgendaTurma);

      if not ValidacoesRestClientBeforeExecute then
        Exit;

      MsgRetornoServer:= RestClient.SmAgendaClient.SalvarAgenda(GetEscolaId,Usuario.Marshal,GetAgendaDtMin,GetAgendaDtMax,LDataSetList);

      //Flagando registros como enviado
      if MsgRetornoServer = EmptyStr then
        SetFlagEnviado(fdqAgenda)
      else
        ShowMessage('Erro ao Salvar Agenda' + #13 + MsgRetornoServer);


      MsgPoupUpTeste('DmSaveServer.SalvarAgenda Executado');
    except on E:Exception do
    begin
      MsgRetornoServer := MsgRetornoServer + E.Message;

      if (IsTesteApp or IsModoTeste) then
        Raise;
    end;
    end;
  finally
    if MsgRetornoServer <> EmptyStr then
      DM.SetLogError( MsgRetornoServer,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'SalvarAgenda',
                      Now,
                      'Erro ao Salvar Agenda' + #13 + MsgRetornoServer
                    );
      fdqAgenda.Active := False;
      fdqAgendaAluno.Active := False;
      fdqAgendaTurma.Active := False;
      SalvarAgendaInExecute:=False;
  end;

  MsgPoupUpTeste('Agenda salva com sucesso');
end;
procedure TDmSaveServer.SaveLogError;
var
  LDataSetList  : TFDJSONDataSets;
  MsgRetornoServer:string;
begin
  //Método para Salvar os Logs de Erro no Server
  try
    try
      MsgRetornoServer := EmptyStr;
      fdqLogError.Active := False;
      fdqLogError.Active := True;

      if fdqLogError.IsEmpty then
        Exit;

      LDataSetList := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,'log_error',fdqLogError);

      if not ValidacoesRestClientBeforeExecute then
        Exit;

      MsgRetornoServer:= RestClient.SmMainClient.SalvarLogError(GetEscolaId,Usuario.Marshal,LDataSetList);

      if (MsgRetornoServer <> '') and (IsTesteApp or IsModoTeste) then
        ShowMessage( 'Erro ao Salvar LogError' + #13 + MsgRetornoServer);

      MsgPoupUpTeste('DmSaveServer.SalvarLogError Executado');
    except on E:Exception do
    begin
      MsgRetornoServer := MsgRetornoServer + E.Message;

      if (IsTesteApp or IsModoTeste) then
        Raise;
    end;
    end;
  finally
    if MsgRetornoServer = '' then
      DataSetDelete(fdqLogError)
    else
      DM.SetLogError( MsgRetornoServer,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'SalvarLogError',
                      Now,
                      'Erro ao Salvar LogError' + #13 + MsgRetornoServer
                    );
    fdqLogError.Active := False;
  end;
end;

procedure TDmSaveServer.SaveResponsavel(DataSet: TFDAdaptedDataSet);
var
  LDataSetList  : TFDJSONDataSets;
  MsgRetornoServer:string;
begin
  //Método para salvar o Responsavel no server
  try
    try
      if not smNetworkState.IsConnected then
        Exit;

      LDataSetList := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,DataSet);

      if not ValidacoesRestClientBeforeExecute then
        Exit;

      MsgRetornoServer:= RestClient.SmResponsavelClient.SalvarResponsavel(GetEscolaId,Usuario.Marshal,LDataSetList);

    except on E:Exception do
    begin
      DM.SetLogError( MsgRetornoServer + E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'SaveResponsavel',
                      Now,
                      'Erro ao Salvar Responsável' + #13 + E.Message
                        );
      Raise;
    end;
    end;
  finally
  end;
end;

procedure TDmSaveServer.SaveDadosServerGeral;
begin
  try
    SaveAgenda;
    //MsgPoupUpTeste('DmSaveServer.SalvarAgenda OK');
  except on E:Exception do
    MsgPoupUp('DmSaveServer.SalvarAgenda Erro:' + e.Message);
  end;


  try
    SaveLogError;
    //MsgPoupUpTeste('DmSaveServer.SalvarLogError OK');
  except on E:Exception do
    MsgPoupUp('DmSaveServer.SalvarLogError Erro:' + e.Message);
  end;


  try
    SaveConfiguracoes;
  except on E:Exception do
    MsgPoupUp('DmSaveServer.SaveConfiguracoes Erro:' + e.Message);
  end;

  try
    SaveDeviceUsuario;
  except on E:Exception do
    MsgPoupUp('DmSaveServer.SaveDeviceUsuario Erro:' + e.Message);
  end;



end;

procedure TDmSaveServer.SaveDeviceUsuario;
var
  LDataSetList  : TFDJSONDataSets;
  MsgRetornoServer:string;
begin
  //Método para Salvar os Logs de Erro no Server
  try
    try
      MsgRetornoServer := EmptyStr;
      fdqDeviceUsuario.Active := False;
      fdqDeviceUsuario.Active := True;

      if fdqDeviceUsuario.IsEmpty then
        Exit;

      LDataSetList := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,fdqDeviceUsuario);

      if not ValidacoesRestClientBeforeExecute then
        Exit;

      MsgRetornoServer:= RestClient.SmMainClient.SalvarDeviceUsuario(GetEscolaId,Usuario.Marshal,LDataSetList);

     //Flagando registros como enviado
      if MsgRetornoServer = EmptyStr then
        SetFlagEnviado(fdqDeviceUsuario)
      else
        ShowMessage('Erro ao Salvar Device Usuário ' + #13 + MsgRetornoServer);

      MsgPoupUpTeste('DmSaveServer.SaveDeviceUsuario Executado');
    except on E:Exception do
    begin
      MsgRetornoServer := MsgRetornoServer + E.Message;

      if (IsTesteApp or IsModoTeste) then
        Raise;
    end;
    end;
  finally
    if MsgRetornoServer <> EmptyStr then
       DM.SetLogError( MsgRetornoServer,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'SaveDeviceUsuario',
                      Now,
                      'Erro ao Salvar Device Usuário' + #13 + MsgRetornoServer
                    );
    fdqDeviceUsuario.Active := False;
  end;
end;

procedure TDmSaveServer.SaveFuncionario(DataSet:TFDAdaptedDataSet);
var
  LDataSetList  : TFDJSONDataSets;
  MsgRetornoServer:string;
begin
  //Método para salvar o funcionário no server
  try
    try
      if not smNetworkState.IsConnected then
        Exit;

      LDataSetList := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,DataSet);

      if not ValidacoesRestClientBeforeExecute then
        Exit;

      MsgRetornoServer:= RestClient.SmMainClient.SalvarFuncionario(GetEscolaId,Usuario.Marshal,LDataSetList);

    except on E:Exception do
    begin
      DM.SetLogError( MsgRetornoServer + E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'SaveFuncionario',
                      Now,
                      'Erro ao Salvar Funcionario' + #13 + E.Message
                        );
      Raise;
    end;
    end;
  finally
  end;
end;


procedure TDmSaveServer.SaveConfiguracoes;
var
  LDataSetList  : TFDJSONDataSets;
  MsgRetornoServer:string;
begin
  //Método para Salvar os Logs de Erro no Server
  try
    try
      MsgRetornoServer := EmptyStr;
      fdqConfiguracoes.Active := False;
      fdqConfiguracoes.Active := True;

      if fdqConfiguracoes.IsEmpty then
        Exit;

      LDataSetList := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,fdqConfiguracoes);

      if not ValidacoesRestClientBeforeExecute then
        Exit;

      MsgRetornoServer:= RestClient.SmMainClient.SalvarConfiguracoes(GetEscolaId,Usuario.Marshal,LDataSetList);

     //Flagando registros como enviado
      if MsgRetornoServer = EmptyStr then
        SetFlagEnviado(fdqConfiguracoes)
      else
        ShowMessage('Erro ao Salvar Configuracoes' + #13 + MsgRetornoServer);

      MsgPoupUpTeste('DmSaveServer.SaveConfiguracoes Executado');
    except on E:Exception do
    begin
      MsgRetornoServer := MsgRetornoServer + E.Message;

      if (IsTesteApp or IsModoTeste) then
        Raise;
    end;
    end;
  finally
    if MsgRetornoServer <> EmptyStr then
       DM.SetLogError( MsgRetornoServer,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'SaveConfiguracoes',
                      Now,
                      'Erro ao Salvar Configuracoes' + #13 + MsgRetornoServer
                    );
    fdqConfiguracoes.Active := False;
  end;

end;

procedure TDmSaveServer.SaveDadosServerBasico;
begin
  try
    SaveAgenda;
    //MsgPoupUpTeste('DmSaveServer.SalvarAgenda OK');
  except on E:Exception do
    MsgPoupUp('DmSaveServer.SalvarAgenda Erro:' + e.Message);
  end;
end;

end.
