unit untDmSaveServer;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.FireDACJSONReflect;

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
  private
    SalvarAgendaInExecute:Boolean;
  public
    procedure SaveLogError;
    procedure SaveAgenda;
    procedure SaveFuncionario(DataSet:TFDAdaptedDataSet);



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

      MsgRetornoServer:= RestClient.SmAgendaClient.SalvarAgenda(GetEscolaId,Usuario.Marshal,Now-30,Now,LDataSetList);

      //Flagando registros como enviado
      if MsgRetornoServer = EmptyStr then
        SetFlagEnviado(fdqAgenda);

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

procedure TDmSaveServer.SaveDadosServerGeral;
begin
  try
    SaveAgenda;
    MsgPoupUpTeste('DmSaveServer.SalvarAgenda OK');
  except on E:Exception do
    MsgPoupUp('DmSaveServer.SalvarAgenda Erro:' + e.Message);
  end;


  try
    SaveLogError;
    MsgPoupUpTeste('DmSaveServer.SalvarLogError OK');
  except on E:Exception do
    MsgPoupUp('DmSaveServer.SalvarLogError Erro:' + e.Message);
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


procedure TDmSaveServer.SaveDadosServerBasico;
begin
  try
    SaveAgenda;
    MsgPoupUpTeste('DmSaveServer.SalvarAgenda OK');
  except on E:Exception do
    MsgPoupUp('DmSaveServer.SalvarAgenda Erro:' + e.Message);
  end;
end;

end.
