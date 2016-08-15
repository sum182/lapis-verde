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
    fdqFuncionarios: TFDQuery;
    fdqFuncionario: TFDQuery;
    fdqRespEscola: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure fdqLogErrorBeforePost(DataSet: TDataSet);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    procedure SetSQLLogError;overload;
    procedure SetSQLLogError(KeyValues:String);overload;
    procedure SetSQLResponsaveis;overload;
    procedure OpenLogError;overload;
    procedure OpenLogError(KeyValues:String);overload;
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
    function GetSQLEscolaId(FieldNameEscolaId:String = 'escola_id';Condicao:String = 'and'):String;
    procedure SetParamsServer(pEscolaId:Integer;pUsuario:TJSONValue);
   {$METHODINFO ON}
    function GetAlunos(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function GetTurmas(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function GetResponsaveis(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function GetFuncionarios(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
    function SalvarFuncionario(pEscolaId:Integer;pUsuario:TJSONValue;LDataSetList: TFDJSONDataSets):String;

    function SalvarLogError(pEscolaId:Integer;
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
  System.Rtti, untSQLs;

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

function TSmMain.GetAlunos(pEscolaId:Integer;pUsuario:TJSONValue):TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar os Alunos
  //Migracao Resp OK Server x Mobile
  try
    try
      SetParamsServer(pEscolaId,pUsuario);
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

      SetParamsServer(pEscolaId,pUsuario);
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
    LogServerRequest.Free;
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
      SetParamsServer(pEscolaId,pUsuario);
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
      SetParamsServer(pEscolaId,pUsuario);
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
        fdqProcessoAtualizacao.SQL.Add('where ((escola_id = :escola_id) or (escola_id = 0))');
        fdqProcessoAtualizacao.ParamByName('escola_id').AsInteger := EscolaId;
      end;


      if Usuario.Tipo = Responsavel then
      begin
        fdqProcessoAtualizacao.SQL.Add('SELECT * FROM processo_atualizacao');
        fdqProcessoAtualizacao.SQL.Add('where (escola_id = 0) or escola_id in (select a.escola_id');
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
      SetParamsServer(pEscolaId,pUsuario);
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
      SetParamsServer(pEscolaId,pUsuario);
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
  end;
end;



procedure TSmMain.OpenLogError;
begin
  CloseLogError;
  SetSQLLogError;
  fdqLogError.Active := True;
end;

procedure TSmMain.OpenLogError(KeyValues: String);
begin
  CloseLogError;

  SetSQLLogError(KeyValues);

  fdqLogError.Active := True;
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
      SetParamsServer(pEscolaId,pUsuario);

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
      SetParamsServer(pEscolaId,pUsuario);
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
  end;

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

procedure TSmMain.SetSQLLogError;
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
  FDConnection.ExecSQL('call sp_set_time_zone;');
end;

end.
