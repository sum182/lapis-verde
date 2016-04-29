unit untSmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin, FireDAC.Comp.UI, FireDAC.Comp.DataSet, Vcl.AppEvnts,untLibServer,
  Data.FireDACJSONReflect, untLibGeral, System.JSON, untTypes;

type
{$METHODINFO ON}
  TSmMain = class(TDataModule)
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDWaitCursor: TFDGUIxWaitCursor;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDConnection: TFDConnection;
    FDConnectionLocal: TFDConnection;
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
    fdqFunc: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure fdqLogErrorBeforePost(DataSet: TDataSet);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    procedure SetSQLLogError(EscolaId:Integer);overload;
    procedure SetSQLLogError(EscolaId:Integer;KeyValues:String);overload;
    procedure OpenLogError(EscolaId:Integer);overload;
    procedure OpenLogError(EscolaId:Integer;KeyValues:String);overload;
    procedure CloseLogError;
    procedure SetTimeZone;
  {$METHODINFO ON}
  public
    {$METHODINFO OFF}
    procedure SetLogErrorOld( MsgError,Aplicacao,UnitNome,Classe,Metodo:String;
                           Data:TDateTime;
                           EscolaId:Integer = 0
                          );overload;

    procedure SaveLogError(LogServerRequest:TLogServerRequest);overload;
    procedure SaveLogServerRequest(LogServerRequest:TLogServerRequest);overload;
   {$METHODINFO ON}
    function GetAlunos(EscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function GetTurmas(EscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function GetResponsaveis(EscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function GetFuncionarios(EscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;


    function SalvarLogError(EscolaId:Integer;
                            pUsuario:TJSONValue;
                            LDataSetList: TFDJSONDataSets = nil ):String;

    function GetProcessoAtualizacao(EscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;

    function GetDataSet( EscolaId:Integer;
                         Nome: String;
                         pUsuario:TJSONValue;
                         UtilizaParamEscolaId:Boolean=True;
                         Condicoes: String=''
                        ):TFDJSONDataSets;


  end;

var
  SmMain: TSmMain;
  Usuario:TUsuario;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses smGeral, Vcl.Forms, smDBFireDac, Data.DBXJSONReflect,
  System.Rtti;

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
  FDConnection.Close;
  FDConnection.Open;

  FDConnectionLocal.Close;

  if not Assigned(Usuario) then
    Usuario:=TUsuario.Create;
end;

procedure TSmMain.FDConnectionAfterConnect(Sender: TObject);
begin
  SetTimeZone;
end;

procedure TSmMain.fdqLogErrorBeforePost(DataSet: TDataSet);
begin
  if Dataset.State in [dsInsert]  then
    Dataset.FieldByName('data_insert_server').AsDateTime:=Now;

  Dataset.FieldByName('enviado_server').AsString:= 'S';
end;

function TSmMain.GetAlunos(EscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar os Alunos
  try
    try
      Usuario:= Usuario.UnMarshal(pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest(UnitName,
                                           ClassName,
                                           'GetAlunos',
                                           EscolaId,
                                           Usuario);

      Result := TFDJSONDataSets.Create;

      fdqAluno.Active := False;
      fdqAluno.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result, fdqAluno);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    fdqAluno.Active := False;
    LogServerRequest.Free;
  end;
end;

function TSmMain.GetDataSet(EscolaId: Integer; Nome: String;
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

      Usuario:= Usuario.UnMarshal(pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'GetDataSet:' + Nome,
                                            EscolaId,
                                            Usuario);


      Result := TFDJSONDataSets.Create;
      fdqDataSet := TFDQuery.Create(self);
      fdqDataSet.Connection:=SmMain.FDConnection;

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
    fdqDataSet.Active := False;
    LogServerRequest.Free;
  end;

end;

function TSmMain.GetFuncionarios(EscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar os Funcionarios
  try
    try
      Usuario:= Usuario.UnMarshal(pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'GetFuncionarios',
                                            EscolaId,
                                            Usuario);
      Result := TFDJSONDataSets.Create;

      fdqFunc.Active := False;
      fdqFunc.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,'funcionario',fdqFunc);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    fdqFunc.Active := False;
    LogServerRequest.Free;
  end;
end;


function TSmMain.GetProcessoAtualizacao(EscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar as Atualizações das Tabelas
  try
    try
      Result := TFDJSONDataSets.Create;
      Usuario:= Usuario.UnMarshal(pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'GetProcessoAtualizacao',
                                            EscolaId,
                                            Usuario);

      fdqProcessoAtualizacao.Active := False;
      fdqProcessoAtualizacao.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,fdqProcessoAtualizacao);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    fdqProcessoAtualizacao.Active := False;
    LogServerRequest.Free;
  end;

end;

function TSmMain.GetResponsaveis(EscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar os Responsaveis
  try
    try
      Usuario:= Usuario.UnMarshal(pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest(UnitName,
                                           ClassName,
                                           'GetResponsaveis',
                                           EscolaId,
                                           Usuario);

      Result := TFDJSONDataSets.Create;

      fdqResp.Active := False;
      fdqResp.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,'responsavel',fdqResp);

      fdqRespAluno.Active := False;
      fdqRespAluno.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,'responsavel_aluno',fdqRespAluno);

      fdqRespTelefone.Active := False;
      fdqRespTelefone.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,'responsavel_telefone',fdqRespTelefone);
      SmMain.SaveLogServerRequest(LogServerRequest);
     except on E:Exception do
       begin
         LogServerRequest.SetError(E.Message);
         SmMain.SaveLogError(LogServerRequest);
       end;
    end;
  finally
    fdqResp.Active := False;
    fdqRespAluno.Active := False;
    fdqRespTelefone.Active := False;
    LogServerRequest.Free;
  end;

end;
function TSmMain.GetTurmas(EscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar as Turmas
  try
    try
      Usuario:= Usuario.UnMarshal(pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'GetTurmas',
                                            EscolaId,
                                            Usuario);

      Result := TFDJSONDataSets.Create;

      fdqTurma.Active := False;
      fdqTurma.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,'turma',fdqTurma);

      fdqTurmaAluno.Active := False;
      fdqTurmaAluno.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,'turma_aluno',fdqTurmaAluno);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    fdqTurma.Active := False;
    fdqTurmaAluno.Active := False;
    LogServerRequest.Free;
  end;
end;



procedure TSmMain.OpenLogError(EscolaId: Integer);
begin
  CloseLogError;
  SetSQLLogError(EscolaId);
  fdqLogError.Active := True;
end;

procedure TSmMain.OpenLogError(EscolaId: Integer;
  KeyValues: String);
begin
  CloseLogError;

  SetSQLLogError(EscolaId,KeyValues);

  fdqLogError.Active := True;
end;

function TSmMain.SalvarLogError(EscolaId:Integer;
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
      Usuario:= Usuario.UnMarshal(pUsuario);
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
      OpenLogError(EscolaId,KeyValues);
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
  end;

end;

procedure TSmMain.SetLogErrorOld( MsgError,Aplicacao,UnitNome,Classe,Metodo:String;
                               Data:TDateTime;
                               EscolaId:Integer = 0);
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

procedure TSmMain.SaveLogServerRequest(LogServerRequest: TLogServerRequest);
begin
  try
    LogServerRequest.SetDataFim;

    fdqLogServerRequest.Active:=False;
    fdqLogServerRequest.Active:=True;

    fdqLogServerRequest.Append;
    fdqLogServerRequest.FieldByName('log_server_request_id').AsString:= smGeral.GetGUID;
    fdqLogServerRequest.FieldByName('aplicacao').AsString:= LogServerRequest.Aplicacao;
    fdqLogServerRequest.FieldByName('unit').AsString:= LogServerRequest.UnitNome;
    fdqLogServerRequest.FieldByName('class').AsString:= LogServerRequest.Classe;
    fdqLogServerRequest.FieldByName('metodo').AsString:= LogServerRequest.Metodo;

    if LogServerRequest.EscolaId > 0 then
      fdqLogServerRequest.FieldByName('escola_id').AsInteger:=LogServerRequest.EscolaId;

    if LogServerRequest.Usuario.Tipo = Responsavel then
      fdqLogServerRequest.FieldByName('responsavel_id').AsInteger:=LogServerRequest.Usuario.Id;

    if LogServerRequest.Usuario.Tipo = Funcionario then
      fdqLogServerRequest.FieldByName('funcionario_id').AsInteger:= LogServerRequest.Usuario.Id;

    fdqLogServerRequest.FieldByName('data_ini').AsDateTime:= LogServerRequest.DataIni;
    fdqLogServerRequest.FieldByName('data_fim').AsDateTime:= LogServerRequest.DataFim;

    fdqLogServerRequest.FieldByName('msg_error').AsString:= LogServerRequest.MsgError;

    if LogServerRequest.DataError > 0 then
      fdqLogServerRequest.FieldByName('data_error').AsDateTime:= LogServerRequest.DataError;

    fdqLogServerRequest.FieldByName('data_insert_server').AsDateTime:= Now;
    fdqLogServerRequest.Post;
  finally
    fdqLogServerRequest.Active:=False;
  end;
end;

procedure TSmMain.SetSQLLogError(EscolaId:Integer);
begin
  fdqLogError.SQL.Clear;
  fdqLogError.SQL.Add('select * from log_error ');
  fdqLogError.SQL.Add('where l.log_error_id = :log_error_id');
  fdqLogError.ParamByName('log_error_id').AsInteger := 0;
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

procedure TSmMain.SetSQLLogError(EscolaId:Integer;KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqLogError.SQL.Clear;
  fdqLogError.SQL.Add('select * from log_error ');
  fdqLogError.SQL.Add('where log_error_id in (' + KeyValues + ')');
end;

procedure TSmMain.SetTimeZone;
begin
  FDConnection.ExecSQL('call sp_set_time_zone;');
end;

end.
