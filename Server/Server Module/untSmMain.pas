unit untSmMain;

interface

uses
  System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin, FireDAC.Comp.UI, FireDAC.Comp.DataSet, Vcl.AppEvnts,untLibServer,
  Data.FireDACJSONReflect, untLibGeral, System.JSON, untTypes, System.Classes,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
{$METHODINFO ON}
  TSmMain = class(TDataModule)
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDWaitCursor: TFDGUIxWaitCursor;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    fdqLogError: TFDQuery;
    ApplicationEvents: TApplicationEvents;
    fdqProcessoAtualizacao: TFDQuery;
    fdqLogServerRequest: TFDQuery;
    fdqTurmaAluno: TFDQuery;
    fdqTurma: TFDQuery;
    fdqAluno: TFDQuery;
    fdqResp: TFDQuery;
    fdqRespAluno: TFDQuery;
    fdqRespTelefone: TFDQuery;
    fdqFuncionarios: TFDQuery;
    fdqFuncionario: TFDQuery;
    fdqRespEscola: TFDQuery;
    fdqConfiguracoes: TFDQuery;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    fdqLogCloudMessaging: TFDQuery;
    fdqDeviceUsuario: TFDQuery;
    fdqDevicesResp: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure fdqLogErrorBeforePost(DataSet: TDataSet);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure fdqConfiguracoesBeforePost(DataSet: TDataSet);
  private
    procedure SetSQLLogError;overload;
    procedure SetSQLLogError(KeyValues:String);overload;
    procedure SetSQLConfiguracoes(KeyValues:String);
    procedure SetSQLDeviceUsuario(KeyValues:String);
    procedure SetSQLResponsaveis;overload;
    procedure OpenLogError;overload;
    procedure OpenLogError(KeyValues:String);overload;

    procedure OpenConfiguracoes(KeyValues:String);
    procedure OpenDeviceUsuario(KeyValues:String);
    procedure OpenDevicesResponsavel(AlunoId:integer;ResponsavelId:integer);

    procedure CloseLogError;
    procedure SetTimeZone;

  {$METHODINFO ON}
  public
    {$METHODINFO OFF}
    procedure SetLogErrorOld( MsgError,Aplicacao,UnitNome,Classe,Metodo:String;
                           Data:TDateTime;
                           pEscolaId:Integer = 0
                          );overload;

    procedure SaveLogError(LogServerRequest:TLogServerRequest);overload;
    procedure SaveLogServerRequest(LogServerRequest:TLogServerRequest);overload;
    procedure SaveLogCloudMessaging(AData,Response:string;
                                    MsgError:String;
                                    LogServerRequest:TLogServerRequest = nil);


    function GetSQLEscolaId(FieldNameEscolaId:String = 'escola_id';Condicao:String = 'and'):String;
    procedure StartRequest(pEscolaId:Integer;pUsuario:TJSONValue);
    procedure EndRequest;

    procedure SetParamsServer(pEscolaId:Integer;pUsuario:TJSONValue);
    procedure SendCloudMessaging(Mensagem:string);
   {$METHODINFO ON}
    function GetAlunos(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function GetTurmas(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function GetResponsaveis(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function GetFuncionarios(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function GetConfiguracoes(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function GetDeviceUsuario(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function SalvarFuncionario(pEscolaId:Integer;pUsuario:TJSONValue;LDataSetList: TFDJSONDataSets):String;

    function SalvarLogError(pEscolaId:Integer;
                            pUsuario:TJSONValue;
                            LDataSetList: TFDJSONDataSets = nil ):String;

    function SalvarConfiguracoes(pEscolaId:Integer;
                                 pUsuario:TJSONValue;
                                 LDataSetList: TFDJSONDataSets = nil ):String;


    function SalvarDeviceUsuario(pEscolaId:Integer;
                                 pUsuario:TJSONValue;
                                 LDataSetList: TFDJSONDataSets = nil ):String;


    function GetProcessoAtualizacao(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;

    function GetDataSet( pEscolaId:Integer;
                         Nome: String;
                         pUsuario:TJSONValue;
                         UtilizaParamEscolaId:Boolean=True;
                         Condicoes: String=''
                        ):TFDJSONDataSets;


  end;

var
  SmMain: TSmMain;
  Usuario:TUsuario;
  EscolaId:Integer;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses smGeral, Vcl.Forms, smDBFireDac, Data.DBXJSONReflect,
  System.Rtti, untSQLs,untServerContainer;

{$R *.dfm}

procedure TSmMain.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  SetLogErrorOld(E.Message,
              ExtractFileName(Application.Exename),
              UnitName,
              ClassName,
              'ApplicationEventsException',
              Now);
end;

procedure TSmMain.CloseLogError;
begin
  fdqLogError.Active := False;
end;

procedure TSmMain.DataModuleCreate(Sender: TObject);
begin
  if not Assigned(Usuario) then
    Usuario:=TUsuario.Create;

  SetFDConnection(self,ServerContainer.GetConnection);
end;

procedure TSmMain.EndRequest;
begin
end;

procedure TSmMain.FDConnectionAfterConnect(Sender: TObject);
begin
  SetTimeZone;
end;

procedure TSmMain.fdqConfiguracoesBeforePost(DataSet: TDataSet);
begin
  Dataset.FieldByName('data_insert_server').AsDateTime:=Now;
end;

procedure TSmMain.fdqLogErrorBeforePost(DataSet: TDataSet);
begin
  if Dataset.State in [dsInsert]  then
    Dataset.FieldByName('data_insert_server').AsDateTime:=Now;
end;

function TSmMain.GetAlunos(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar os Alunos
  try
    try
      StartRequest(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest(UnitName,
                                           ClassName,
                                           'GetAlunos',
                                           EscolaId,
                                           Usuario);

      Result := TFDJSONDataSets.Create;

      fdqAluno.SQL.Clear;
      fdqAluno.SQL.Add(rs_SQLAluno);
      fdqAluno.SQL.Add(GetSQLEscolaId);

      TFDJSONDataSetsWriter.ListAdd(Result, fdqAluno);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    LogServerRequest.Free;
    EndRequest;
  end;
end;

function TSmMain.GetConfiguracoes(pEscolaId: Integer;
  pUsuario: TJSONValue): TFDJSONDataSets;
var
  fdqDataSet: TFDQuery;
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar as Configurações do usuário
  try
    try
      StartRequest(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest(UnitName,
                                           ClassName,
                                           'GetConfiguracoes',
                                           EscolaId,
                                           Usuario);

      Result := TFDJSONDataSets.Create;

      fdqDataSet := TFDQuery.Create(self);
      fdqDataSet.Connection:=ServerContainer.GetConnection;
      fdqDataSet.Active := False;

      fdqDataSet.SQL.Clear;
      fdqDataSet.SQL.Add('select * from configuracoes');
      fdqDataSet.SQL.Add('where ' + Usuario.FieldName + ' = ' + IntToStr(Usuario.Id));
      TFDJSONDataSetsWriter.ListAdd(Result, fdqDataSet);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    LogServerRequest.Free;
    EndRequest;
  end;
end;

function TSmMain.GetDataSet(pEscolaId: Integer; Nome: String;
                            pUsuario:TJSONValue;
                            UtilizaParamEscolaId:Boolean;
                            Condicoes: String): TFDJSONDataSets;
var
  fdqDataSet: TFDQuery;
  LogServerRequest:TLogServerRequest;
begin
  //Método para Genérico para retonar um Dataset
  try
    try
      if Nome = '' then
       raise Exception.Create('GetDataSet: Nome não definido');

      StartRequest(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'GetDataSet:' + Nome,
                                            EscolaId,
                                            Usuario);


      Result := TFDJSONDataSets.Create;
      fdqDataSet := TFDQuery.Create(self);
      fdqDataSet.Connection:=ServerContainer.GetConnection;

      fdqDataSet.Active := False;

      fdqDataSet.SQL.Clear;
      fdqDataSet.SQL.Add('select * from ' + Nome);
      fdqDataSet.SQL.Add('where 1 = 1');

      if UtilizaParamEscolaId then
        fdqDataSet.SQL.Add('and escola_id = ' + IntToStr(EscolaId));

      if Condicoes <> EmptyStr then
        fdqDataSet.SQL.Add(Condicoes);

      TFDJSONDataSetsWriter.ListAdd(Result,fdqDataSet);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    LogServerRequest.Free;
    EndRequest;
  end;

end;

function TSmMain.GetDeviceUsuario(pEscolaId: Integer;
  pUsuario: TJSONValue): TFDJSONDataSets;
var
  fdqDataSet: TFDQuery;
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar os devices do usuário
  try
    try
      StartRequest(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest(UnitName,
                                           ClassName,
                                           'GetDeviceUsuario',
                                           EscolaId,
                                           Usuario);

      Result := TFDJSONDataSets.Create;

      fdqDataSet := TFDQuery.Create(self);
      fdqDataSet.Connection:=ServerContainer.GetConnection;
      fdqDataSet.Active := False;

      fdqDataSet.SQL.Clear;
      fdqDataSet.SQL.Add('select * from device_usuario');
      fdqDataSet.SQL.Add('where ' + Usuario.FieldName + ' = ' + IntToStr(Usuario.Id));
      TFDJSONDataSetsWriter.ListAdd(Result, fdqDataSet);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    LogServerRequest.Free;
    EndRequest;
  end;
end;

function TSmMain.GetFuncionarios(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar os Funcionarios
  //Migracao Resp OK Server x Mobile

  try
    try
      StartRequest(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'GetFuncionarios',
                                            EscolaId,
                                            Usuario);
      Result := TFDJSONDataSets.Create;

      fdqFuncionarios.SQL.Clear;
      fdqFuncionarios.SQL.Add(rs_SQLFuncionario);
      fdqFuncionarios.SQL.Add(GetSQLEscolaId);

      TFDJSONDataSetsWriter.ListAdd(Result,'funcionario',fdqFuncionarios);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    LogServerRequest.Free;
    EndRequest;
  end;
end;


function TSmMain.GetProcessoAtualizacao(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar as Atualizações das Tabelas
  try
    try
      Result := TFDJSONDataSets.Create;
      StartRequest(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'GetProcessoAtualizacao',
                                            EscolaId,
                                            Usuario);


      fdqProcessoAtualizacao.Close;
      fdqProcessoAtualizacao.SQL.Clear;


      if Usuario.Tipo = Funcionario then
      begin
        fdqProcessoAtualizacao.SQL.Add('SELECT * FROM processo_atualizacao');
        fdqProcessoAtualizacao.SQL.Add('where ((escola_id = :escola_id) or (escola_id = 0) or (funcionario_id = :funcionario_id))');
        fdqProcessoAtualizacao.ParamByName('escola_id').AsInteger := EscolaId;
        fdqProcessoAtualizacao.ParamByName('funcionario_id').AsInteger := Usuario.Id;
      end;


      if Usuario.Tipo = Responsavel then
      begin
        fdqProcessoAtualizacao.SQL.Add('SELECT * FROM processo_atualizacao');
        fdqProcessoAtualizacao.SQL.Add('where (escola_id = 0)  or (responsavel_id = :responsavel_id) ');
        fdqProcessoAtualizacao.SQL.Add(' or escola_id in (select a.escola_id ');
        fdqProcessoAtualizacao.SQL.Add('                                       from aluno a');
        fdqProcessoAtualizacao.SQL.Add('                                       where a.aluno_id in (select ra.aluno_id from responsavel_aluno ra');
        fdqProcessoAtualizacao.SQL.Add('                                                            where ra.responsavel_id = :responsavel_id');
        fdqProcessoAtualizacao.SQL.Add('                                                            )');
        fdqProcessoAtualizacao.SQL.Add('                                       )');
        fdqProcessoAtualizacao.ParamByName('responsavel_id').AsInteger := Usuario.Id;
      end;

      fdqProcessoAtualizacao.Open;

      TFDJSONDataSetsWriter.ListAdd(Result,fdqProcessoAtualizacao);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    LogServerRequest.Free;
    EndRequest;
  end;

end;

function TSmMain.GetResponsaveis(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar os Responsaveis
  //Migracao Resp OK Server x Mobile
  try
    try
      StartRequest(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest(UnitName,
                                           ClassName,
                                           'GetResponsaveis',
                                           pEscolaId,
                                           Usuario);

      Result := TFDJSONDataSets.Create;

      SetSQLResponsaveis;

      //Tabela responsavel
      TFDJSONDataSetsWriter.ListAdd(Result,'responsavel',fdqResp);

      //Tabela de responsavel_escola
      TFDJSONDataSetsWriter.ListAdd(Result,'responsavel_escola',fdqRespEscola);

      //Tabela de responsavel_aluno
      TFDJSONDataSetsWriter.ListAdd(Result,'responsavel_aluno',fdqRespAluno);

      //Tabela de responsavel_telefone
      TFDJSONDataSetsWriter.ListAdd(Result,'responsavel_telefone',fdqRespTelefone);

      SmMain.SaveLogServerRequest(LogServerRequest);
     except on E:Exception do
       begin
         LogServerRequest.SetError(E.Message);
         SmMain.SaveLogError(LogServerRequest);
       end;
    end;
  finally
    LogServerRequest.Free;
    EndRequest;
  end;

end;
function TSmMain.GetSQLEscolaId(FieldNameEscolaId:String = 'escola_id';Condicao:String = 'and'):String;
begin
 if Usuario.Tipo = Responsavel then
    Result:=  Condicao + ' ' + FieldNameEscolaId +
                       ' in ('+
                              ' select re_sub.escola_id from responsavel_escola re_sub'+
                              ' where re_sub.responsavel_id = '+ IntToStr(Usuario.Id)+
                              ' group by re_sub.escola_id'+
                               ')';

  if Usuario.Tipo = Funcionario then
    //Result:=  Condicao + ' ' + FieldNameEscolaId + ' =:escola_id';
    Result:= Condicao + ' ' + FieldNameEscolaId + ' = ' + IntToStr(EscolaId);

end;

function TSmMain.GetTurmas(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar as Turmas
  //Migracao Resp OK Server x Mobile
  try
    try
      StartRequest(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'GetTurmas',
                                            EscolaId,
                                            Usuario);

      Result := TFDJSONDataSets.Create;

      fdqTurma.Active := False;
      fdqTurma.SQL.Clear;
      fdqTurma.SQL.Add(rs_SQLTurma);
      fdqTurma.SQL.Add(GetSQLEscolaId);
      TFDJSONDataSetsWriter.ListAdd(Result,'turma',fdqTurma);

      fdqTurmaAluno.Active := False;
      fdqTurmaAluno.SQL.Clear;
      fdqTurmaAluno.SQL.Add(rs_SQLTurmaAluno);
      fdqTurmaAluno.SQL.Add(GetSQLEscolaId());

      TFDJSONDataSetsWriter.ListAdd(Result,'turma_aluno',fdqTurmaAluno);

      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    LogServerRequest.Free;
    EndRequest;
  end;
end;



procedure TSmMain.OpenLogError;
begin
  CloseLogError;
  SetSQLLogError;
  fdqLogError.Active := True;
end;

procedure TSmMain.OpenConfiguracoes(KeyValues: String);
begin
  fdqConfiguracoes.Active := False;

  SetSQLConfiguracoes(KeyValues);

  fdqConfiguracoes.Active := True;
end;

procedure TSmMain.OpenDevicesResponsavel(AlunoId, ResponsavelId: integer);
begin
  fdqDevicesResp.Close;
  fdqDevicesResp.ParamByName('aluno_id').AsInteger := AlunoId;
  fdqDevicesResp.ParamByName('responsavel_id').AsInteger := ResponsavelId;

  //teste
  fdqDevicesResp.ParamByName('responsavel_id').AsInteger := 0;

  fdqDevicesResp.Open;
end;

procedure TSmMain.OpenDeviceUsuario(KeyValues: String);
begin
  fdqDeviceUsuario.Active := False;

  SetSQLDeviceUsuario(KeyValues);

  fdqDeviceUsuario.Active := True;
end;

procedure TSmMain.OpenLogError(KeyValues: String);
begin
  CloseLogError;

  SetSQLLogError(KeyValues);

  fdqLogError.Active := True;
end;

function TSmMain.SalvarConfiguracoes(pEscolaId: Integer; pUsuario: TJSONValue;
  LDataSetList: TFDJSONDataSets): String;
var
  LDataSet: TFDDataSet;
  Exceptions:string;
  KeyValues: string;
  LogServerRequest:TLogServerRequest;
begin
  //Método para Salvar Configuracoes
  try
    try
      StartRequest(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'SalvarConfiguracoes',
                                            EscolaId,
                                            Usuario);

      Result:=EmptyStr;

      Exceptions:=EmptyStr;

      LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);

      if LDataSet.IsEmpty then
        Exit;

      KeyValues:= GetKeyValuesDataSet(LDataSet,'configuracoes_id');
      OpenConfiguracoes(KeyValues);
      CopyDataSet(LDataSet,fdqConfiguracoes,False,[coEdit,coAppend]);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      Exceptions:=  Exceptions + E.Message;
    end;

    if (Exceptions <> EmptyStr) then
    begin
      Result:= 'Erro ao Salvar Configurações' + #13 + Exceptions;
      LogServerRequest.SetError(Exceptions);
      SmMain.SaveLogError(LogServerRequest);
    end;
  finally
    fdqConfiguracoes.Close;
    LogServerRequest.Free;
    EndRequest;
  end;

end;

function TSmMain.SalvarDeviceUsuario(pEscolaId: Integer; pUsuario: TJSONValue;
  LDataSetList: TFDJSONDataSets): String;
var
  LDataSet: TFDDataSet;
  Exceptions:string;
  KeyValues: string;
  LogServerRequest:TLogServerRequest;
begin
  //Método para Salvar Device do Usuario
  try
    try
      StartRequest(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'SalvarDeviceUsuario',
                                            EscolaId,
                                            Usuario);

      Result:=EmptyStr;

      Exceptions:=EmptyStr;

      LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);

      if LDataSet.IsEmpty then
        Exit;

      KeyValues:= GetKeyValuesDataSet(LDataSet,'device_usuario_id');
      OpenDeviceUsuario(KeyValues);
      CopyDataSet(LDataSet,fdqDeviceUsuario,False,[coEdit,coAppend]);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      Exceptions:=  Exceptions + E.Message;
    end;

    if (Exceptions <> EmptyStr) then
    begin
      Result:= 'Erro ao Salvar Device Usuário' + #13 + Exceptions;
      LogServerRequest.SetError(Exceptions);
      SmMain.SaveLogError(LogServerRequest);
    end;
  finally
    fdqDeviceUsuario.Close;
    LogServerRequest.Free;
    EndRequest;
  end;
end;

function TSmMain.SalvarFuncionario(pEscolaId: Integer; pUsuario: TJSONValue;
  LDataSetList: TFDJSONDataSets): String;
var
  LogServerRequest:TLogServerRequest;
  LDataSet: TFDDataSet;
begin
  //Método para salvar o Funcionario
  try
    try
      StartRequest(pEscolaId,pUsuario);

      if Usuario.Tipo <>  Funcionario then
        Exit;

      LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);

      if LDataSet.IsEmpty then
        Exit;

      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'SalvarFuncionario',
                                            EscolaId,
                                            Usuario);
      fdqFuncionario.Active := False;
      fdqFuncionario.ParamByName('funcionario_id').AsInteger:= Usuario.Id;
      fdqFuncionario.ParamByName('escola_id').AsInteger:= EscolaId;
      fdqFuncionario.Open;

      if fdqFuncionario.IsEmpty then
        raise Exception.Create('Erro ao localizar funcionário de Id:' +
                                IntToStr(Usuario.Id));
      fdqFuncionario.Edit;
      fdqFuncionario.FieldByName('nome').AsString := LDataSet.FieldByName('nome').AsString;
      fdqFuncionario.FieldByName('sobrenome').AsString := LDataSet.FieldByName('sobrenome').AsString;
      fdqFuncionario.FieldByName('sexo').AsString := LDataSet.FieldByName('sexo').AsString;
      fdqFuncionario.FieldByName('rg').AsString := LDataSet.FieldByName('rg').AsString;
      fdqFuncionario.FieldByName('cpf').AsString := LDataSet.FieldByName('cpf').AsString;
      fdqFuncionario.FieldByName('email').AsString := LDataSet.FieldByName('email').AsString;
      fdqFuncionario.FieldByName('senha').AsString := LDataSet.FieldByName('senha').AsString;
      fdqFuncionario.Post;

      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    LogServerRequest.Free;
    EndRequest;
  end;

end;

function TSmMain.SalvarLogError(pEscolaId:Integer;
                                pUsuario:TJSONValue;
                                LDataSetList: TFDJSONDataSets=nil):String;
var
  LDataSet: TFDDataSet;
  Exceptions:string;
  KeyValues: string;
  LogServerRequest:TLogServerRequest;
begin
  //Método para Salvar Logs de Erros
  try
    try
      StartRequest(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'SalvarLogError',
                                            EscolaId,
                                            Usuario);

      Result:=EmptyStr;

      Exceptions:=EmptyStr;

      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'log_error');

      if LDataSet.IsEmpty then
        Exit;


      KeyValues:= GetKeyValuesDataSet(LDataSet,'log_error_id');
      OpenLogError(KeyValues);
      CopyDataSet(LDataSet,fdqLogError,False,[coAppend,coEdit]);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      Exceptions:=  Exceptions + E.Message;
    end;

    if (Exceptions <> EmptyStr) then
    begin
      Result:= 'Erro ao Salvar logs' + #13 + Exceptions;
      LogServerRequest.SetError(Exceptions);
      SmMain.SaveLogError(LogServerRequest);
    end;
  finally
    fdqLogError.Close;
    LogServerRequest.Free;
    EndRequest;
  end;

end;

procedure TSmMain.SendCloudMessaging(Mensagem: string);
var
  AJson: TJSONObject;
  AJsonData: TJSONObject;
  ARegisterIds: TJSONArray;
  AData, AResponseContent: TStringStream;
  DeviceToken: string;
  MsgError: string;
begin
  try
    try
      ARegisterIds := TJSONArray.Create();
      AJson := TJSONObject.Create();
      // Celular Alvaro
      DeviceToken:='APA91bENEwdZ28PMYXisPk3eHx6W0UMkgemRajTXZ7TKJhxJDX4lEx6dOZbh2phYi10NklVmFSs6gmN5zisXZ9wNFXdgLvfWhvcMMz6t40R_zixkNdtN30Fc-FHK_iKI53uUk4W1C93_';
      ARegisterIds.Add(DeviceToken);

      // Create Json to Send!
      AJsonData := TJSONObject.Create();
      AJsonData.AddPair('id','');
      AJsonData.AddPair('message',Mensagem);
      // Add the information to send GCM server;
      AJson.AddPair('registration_ids',ARegisterIds);
      AJson.AddPair('data',AJsonData);
      // Set the Header.
      IdHTTP1.Request.ContentType := 'application/json';
      // Set the Key for Server Apllication
      IdHTTP1.Request.CustomHeaders.AddValue('Authorization','key=AIzaSyCU7YtJK0A4LDfFrvicS58RdHoTi814uR4');
      AData := TStringStream.Create(AJson.ToString);
      AData.Position := 0;
      AResponseContent := TStringStream.Create();
      // Send the notification
      IdHTTP1.Post('https://android.googleapis.com/gcm/send',AData,AResponseContent);
      AResponseContent.Position := 0;
    finally
    end;
   except on E:Exception do
   begin
      MsgError:= E.Message;
   end;
  end;

  SaveLogCloudMessaging(AData.DataString,AResponseContent.DataString,MsgError);
end;

procedure TSmMain.SetLogErrorOld( MsgError,Aplicacao,UnitNome,Classe,Metodo:String;
                               Data:TDateTime;
                               pEscolaId:Integer = 0);
begin
  try
    fdqLogError.Active:=False;
    fdqLogError.Active:=True;

    fdqLogError.Append;
    fdqLogError.FieldByName('log_error_id').AsString:= smGeral.GetGUID;
    fdqLogError.FieldByName('msg_error').AsString:= MsgError;
    fdqLogError.FieldByName('aplicacao').AsString:= Aplicacao;
    fdqLogError.FieldByName('unit').AsString:= UnitNome;
    fdqLogError.FieldByName('class').AsString:= Classe;
    fdqLogError.FieldByName('metodo').AsString:= Metodo;

    if EscolaId > 0 then
      fdqLogError.FieldByName('escola_id').AsInteger:=EscolaId;

    if Usuario.Tipo = Responsavel then
      fdqLogError.FieldByName('responsavel_id').AsInteger:=Usuario.Id;

    if Usuario.Tipo = Funcionario then
      fdqLogError.FieldByName('funcionario_id').AsInteger:= Usuario.Id;

    fdqLogError.FieldByName('data').AsDateTime:= Data;
    fdqLogError.FieldByName('data_insert_server').AsDateTime:= Now;
    fdqLogError.Post;
  finally
    fdqLogError.Active:=False;
  end;

end;


procedure TSmMain.SetParamsServer(pEscolaId: Integer; pUsuario: TJSONValue);
begin
  Usuario:= Usuario.UnMarshal(pUsuario);

  if pEscolaId <= 0 then
    pEscolaId:= 0;

  EscolaId:= pEscolaId;
end;

procedure TSmMain.StartRequest(pEscolaId: Integer; pUsuario: TJSONValue);
begin
  SetParamsServer(pEscolaId,pUsuario);
end;

procedure TSmMain.SaveLogServerRequest(LogServerRequest: TLogServerRequest);
var
  fdqDataSet: TFDQuery;
begin
  try
    try
      LogServerRequest.SetDataFim;
      fdqDataSet := TFDQuery.Create(self);
      fdqDataSet.Connection:=ServerContainer.GetConnection;

      fdqDataSet.SQL.Clear;
      fdqDataSet.SQL:= fdqLogServerRequest.SQL;
      fdqDataSet.Params:= fdqLogServerRequest.Params;
      fdqDataSet.Prepare;
      fdqDataSet.Active := True;
      fdqDataSet.Insert;
      fdqDataSet.FieldByName('log_server_request_id').AsString:= smGeral.GetGUID;
      fdqDataSet.FieldByName('aplicacao').AsString:= LogServerRequest.Aplicacao;
      fdqDataSet.FieldByName('unit').AsString:= LogServerRequest.UnitNome;
      fdqDataSet.FieldByName('class').AsString:= LogServerRequest.Classe;
      fdqDataSet.FieldByName('metodo').AsString:= LogServerRequest.Metodo;

      if LogServerRequest.EscolaId > 0 then
        fdqDataSet.FieldByName('escola_id').AsInteger:=LogServerRequest.EscolaId;

      if LogServerRequest.Usuario.Tipo = Responsavel then
        fdqDataSet.FieldByName('responsavel_id').AsInteger:=LogServerRequest.Usuario.Id;

      if LogServerRequest.Usuario.Tipo = Funcionario then
        fdqDataSet.FieldByName('funcionario_id').AsInteger:= LogServerRequest.Usuario.Id;

      fdqDataSet.FieldByName('data_ini').AsDateTime:= LogServerRequest.DataIni;
      fdqDataSet.FieldByName('data_fim').AsDateTime:= LogServerRequest.DataFim;

      fdqDataSet.FieldByName('msg_error').AsString:= LogServerRequest.MsgError;

      if LogServerRequest.DataError > 0 then
        fdqDataSet.FieldByName('data_error').AsDateTime:= LogServerRequest.DataError;

      fdqDataSet.FieldByName('data_insert_server').AsDateTime:= Now;
      fdqDataSet.Post;
    except on E:Exception do
    begin
      LogServerRequest.SetError(E.Message);
      SaveLogError(LogServerRequest);
    end;
    end;
  finally
    fdqDataSet.Free;
  end;
end;


procedure TSmMain.SetSQLLogError;
begin
  fdqLogError.SQL.Clear;
  fdqLogError.SQL.Add('select * from log_error ');
  fdqLogError.SQL.Add('where l.log_error_id = :log_error_id');
  fdqLogError.ParamByName('log_error_id').AsInteger := 0;
end;

procedure TSmMain.SaveLogCloudMessaging(AData,Response:string;
                                        MsgError:String;
                                        LogServerRequest:TLogServerRequest = nil);
var
  fdqDataSet: TFDQuery;
begin
  try
    try
      fdqDataSet := TFDQuery.Create(self);
      fdqDataSet.Connection:=ServerContainer.GetConnection;

      fdqDataSet.SQL.Clear;
      fdqDataSet.SQL:= fdqLogCloudMessaging.SQL;
      fdqDataSet.Params:= fdqLogCloudMessaging.Params;
      fdqDataSet.Prepare;
      fdqDataSet.Active := True;
      fdqDataSet.Insert;
      fdqDataSet.FieldByName('log_cloud_messaging_id').AsString:= smGeral.GetGUID;
      fdqDataSet.FieldByName('AData').AsString:= AData;
      fdqDataSet.FieldByName('Response').AsString:= Response;

     { if LogServerRequest.EscolaId > 0 then
        fdqDataSet.FieldByName('escola_id').AsInteger:=LogServerRequest.EscolaId;

      if LogServerRequest.Usuario.Tipo = Responsavel then
        fdqDataSet.FieldByName('responsavel_id').AsInteger:=LogServerRequest.Usuario.Id;

      if LogServerRequest.Usuario.Tipo = Funcionario then
        fdqDataSet.FieldByName('funcionario_id').AsInteger:= LogServerRequest.Usuario.Id;
     }
      fdqDataSet.FieldByName('msg_error').AsString:= MsgError;

      fdqDataSet.FieldByName('data_insert_server').AsDateTime:= Now;
      fdqDataSet.Post;
    except on E:Exception do
    begin
      LogServerRequest.SetError(E.Message);
      SaveLogError(LogServerRequest);
    end;
    end;
  finally
    fdqDataSet.Free;
  end;
end;

procedure TSmMain.SaveLogError(LogServerRequest: TLogServerRequest);
begin
  try
    fdqLogError.Active:=False;
    fdqLogError.Active:=True;

    fdqLogError.Append;
    fdqLogError.FieldByName('log_error_id').AsString:= smGeral.GetGUID;
    fdqLogError.FieldByName('msg_error').AsString:= LogServerRequest.MsgError;
    fdqLogError.FieldByName('aplicacao').AsString:= LogServerRequest.Aplicacao;
    fdqLogError.FieldByName('unit').AsString:= LogServerRequest.UnitNome;
    fdqLogError.FieldByName('class').AsString:= LogServerRequest.Classe;
    fdqLogError.FieldByName('metodo').AsString:= LogServerRequest.Metodo;

    if LogServerRequest.EscolaId > 0 then
      fdqLogError.FieldByName('escola_id').AsInteger:=LogServerRequest.EscolaId;

    if LogServerRequest.Usuario.Tipo = Responsavel then
      fdqLogError.FieldByName('responsavel_id').AsInteger:=LogServerRequest.Usuario.Id;

    if LogServerRequest.Usuario.Tipo = Funcionario then
      fdqLogError.FieldByName('funcionario_id').AsInteger:= LogServerRequest.Usuario.Id;

    fdqLogError.FieldByName('data').AsDateTime:= LogServerRequest.DataError;
    fdqLogError.FieldByName('data_insert_server').AsDateTime:= Now;
    fdqLogError.Post;
  finally
    fdqLogError.Active:=False;
  end;

end;

procedure TSmMain.SetSQLConfiguracoes(KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqConfiguracoes.SQL.Clear;
  fdqConfiguracoes.SQL.Add('select * from configuracoes ');
  fdqConfiguracoes.SQL.Add('where configuracoes_id in (' + KeyValues + ')');
end;

procedure TSmMain.SetSQLDeviceUsuario(KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqDeviceUsuario.SQL.Clear;
  fdqDeviceUsuario.SQL.Add('select * from device_usuario ');
  fdqDeviceUsuario.SQL.Add('where device_usuario_id in (' + KeyValues + ')');
end;

procedure TSmMain.SetSQLLogError(KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqLogError.SQL.Clear;
  fdqLogError.SQL.Add('select * from log_error ');
  fdqLogError.SQL.Add('where log_error_id in (' + KeyValues + ')');
end;

procedure TSmMain.SetSQLResponsaveis;
begin
  //Tabela responsavel
  fdqResp.Active := False;
  fdqResp.SQL.Clear;
  fdqResp.SQL.Add(rs_SQLResposavel);
  fdqResp.SQL.Add(GetSQLEscolaId('re.escola_id'));

  //Tabela de responsavel_escola
  fdqRespEscola.Active := False;
  fdqRespEscola.SQL.Clear;
  fdqRespEscola.SQL.Add(rs_SQLResposavelEscola);
  fdqRespEscola.SQL.Add(GetSQLEscolaId('re.escola_id'));

  //Tabela de responsavel_aluno
  fdqRespAluno.Active := False;
  fdqRespAluno.SQL.Clear;
  fdqRespAluno.SQL.Add(rs_SQLResposavelAluno);
  fdqRespAluno.SQL.Add(GetSQLEscolaId('re.escola_id'));

  //Tabela de responsavel_telefone
  fdqRespTelefone.Active := False;
  fdqRespTelefone.SQL.Clear;
  fdqRespTelefone.SQL.Add(rs_SQLResposavelTelefone);
  fdqRespTelefone.SQL.Add(GetSQLEscolaId('re.escola_id'));
end;

procedure TSmMain.SetTimeZone;
begin
  ServerContainer.GetConnection.ExecSQL('call sp_set_time_zone;');
end;


initialization
  //Este código parece estranho mas...
  { ao chamar algum metodo do smMain ex GetAlunos logo apos subir o server dava erro
    devido o objeto nao estar criado
    Com o codigo abaixo o erro foi resolvdio
  }
  if not Assigned(SmMain) then
    Application.CreateForm(TSmMain, SmMain);

end.
