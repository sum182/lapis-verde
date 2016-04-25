unit untSmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin, FireDAC.Comp.UI, FireDAC.Comp.DataSet, Vcl.AppEvnts,
  Data.FireDACJSONReflect,untLib;

type
{$METHODINFO ON}
  TSmMain = class(TDataModule)
 {$METHODINFO OFF}
    fdqAlunos: TFDQuery;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDWaitCursor: TFDGUIxWaitCursor;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDConnection: TFDConnection;
    FDConnectionLocal: TFDConnection;
    fdqLogError: TFDQuery;
    ApplicationEvents: TApplicationEvents;
    fdqProcessoAtualizacao: TFDQuery;
    FDQuery1: TFDQuery;
    fdqLogServerRequest: TFDQuery;

    procedure DataModuleCreate(Sender: TObject);
    procedure fdqLogErrorBeforePost(DataSet: TDataSet);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private

    procedure SetSQLLogError(EscolaId:Integer;FuncionarioId:Integer);overload;
    procedure SetSQLLogError(EscolaId:Integer;FuncionarioId:Integer;KeyValues:String);overload;
    procedure OpenLogError(EscolaId:Integer;FuncionarioId:Integer);overload;
    procedure OpenLogError(EscolaId:Integer;FuncionarioId:Integer;KeyValues:String);overload;
    procedure CloseLogError;
    procedure SetTimeZone;
  {$METHODINFO ON}
  public
    {$METHODINFO OFF}
    procedure SetLogErrorOld( MsgError,Aplicacao,UnitNome,Classe,Metodo:String;
                           Data:TDateTime;
                           EscolaId:Integer = 0;
                           ResponsavelId:Integer=0;
                           FuncionarioId:Integer=0
                          );overload;

    procedure SaveLogError(LogServerRequest:TLogServerRequest);overload;
    procedure SaveLogServerRequest(LogServerRequest:TLogServerRequest);overload;
   {$METHODINFO ON}

    function SalvarLogError(EscolaId, FuncionarioId: Integer; LDataSetList: TFDJSONDataSets):String;

   function GetProcessoAtualizacao(EscolaId:Integer;
                                 ResponsavelId:Integer=0;
                                 FuncionarioId:Integer=0):TFDJSONDataSets;

   function GetDataSet( EscolaId:Integer;
                        Nome: String;
                        ResponsavelId:Integer=0;
                        FuncionarioId:Integer=0;
                        UtilizaParamEscolaId:Boolean=True;
                        Condicoes: String=''
                       ):TFDJSONDataSets;


  end;

var
  SmMain: TSmMain;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses smGeral, Vcl.Forms, smDBFireDac;

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

function TSmMain.GetDataSet(EscolaId: Integer; Nome: String; ResponsavelId,
  FuncionarioId: Integer; UtilizaParamEscolaId:Boolean;
  Condicoes: String): TFDJSONDataSets;
var
  fdqDataSet: TFDQuery;
begin
  //Método para Genérico para retonar um Dataset
  try
    try
      if Nome = '' then
       raise Exception.Create('GetDataSet: Nome não definido');

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

    except on E:Exception do
      SmMain.SetLogErrorOld(E.Message,
                         ExtractFileName(Application.Exename),
                         UnitName,
                         ClassName,
                         'GetDataSet:' + Nome,
                         Now,
                         EscolaId,
                         ResponsavelId,
                         FuncionarioId
                         );


    end;
  finally
    fdqDataSet.Active := False;
  end;

end;

function TSmMain.GetProcessoAtualizacao(EscolaId, ResponsavelId,
  FuncionarioId: Integer): TFDJSONDataSets;
begin
  //Método para retornar as Atualizações das Tabelas
  try
    try
      Result := TFDJSONDataSets.Create;

      fdqProcessoAtualizacao.Active := False;
      fdqProcessoAtualizacao.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,fdqProcessoAtualizacao);

    except on E:Exception do
      SmMain.SetLogErrorOld(E.Message,
                         ExtractFileName(Application.Exename),
                         UnitName,
                         ClassName,
                         'GetTabelaAtualizacao',
                         Now,
                         EscolaId,
                         ResponsavelId,
                         FuncionarioId
                         );


    end;
  finally
    fdqProcessoAtualizacao.Active := False;
  end;

end;

procedure TSmMain.OpenLogError(EscolaId, FuncionarioId: Integer);
begin
  CloseLogError;
  SetSQLLogError(EscolaId, FuncionarioId);
  fdqLogError.Active := True;
end;

procedure TSmMain.OpenLogError(EscolaId, FuncionarioId: Integer;
  KeyValues: String);
begin
  CloseLogError;

  SetSQLLogError(EscolaId, FuncionarioId,KeyValues);

  fdqLogError.Active := True;
end;

function TSmMain.SalvarLogError(EscolaId, FuncionarioId: Integer;
  LDataSetList: TFDJSONDataSets): String;
var
  LDataSet: TFDDataSet;
  Exceptions:string;
  KeyValues: string;
begin
  //Método para Salvar Logs de Erros
  try
    try
      Result:=EmptyStr;

      Exceptions:=EmptyStr;

      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'log_error');

      if LDataSet.IsEmpty then
        Exit;


      KeyValues:= GetKeyValuesDataSet(LDataSet,'log_error_id');
      OpenLogError(EscolaId,FuncionarioId,KeyValues);
      CopyDataSet(LDataSet,fdqLogError,False,[coAppend,coEdit]);
    except on E:Exception do
      Exceptions:=  Exceptions + E.Message;
    end;

    if (Exceptions <> EmptyStr) then
    begin
      Result:= 'Erro ao Salvar logs' + #13 + Exceptions;
      SmMain.SetLogErrorOld(Exceptions,
                         ExtractFileName(Application.Exename),
                         UnitName,
                         ClassName,
                         'SalvarLogError',
                         Now,
                         EscolaId,
                         0,
                         FuncionarioId);
    end;
  finally
    fdqLogError.Close;
  end;

end;

procedure TSmMain.SetLogErrorOld( MsgError,Aplicacao,UnitNome,Classe,Metodo:String;
                               Data:TDateTime;
                               EscolaId:Integer = 0;
                               ResponsavelId:Integer=0;
                               FuncionarioId:Integer=0);
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

    if ResponsavelId > 0 then
      fdqLogError.FieldByName('responsavel_id').AsInteger:=ResponsavelId;

    if FuncionarioId > 0 then
      fdqLogError.FieldByName('funcionario_id').AsInteger:= FuncionarioId;

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

    if LogServerRequest.ResponsavelId > 0 then
      fdqLogServerRequest.FieldByName('responsavel_id').AsInteger:=LogServerRequest.ResponsavelId;

    if LogServerRequest.FuncionarioId > 0 then
      fdqLogServerRequest.FieldByName('funcionario_id').AsInteger:= LogServerRequest.FuncionarioId;

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

procedure TSmMain.SetSQLLogError(EscolaId, FuncionarioId: Integer);
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

    if LogServerRequest.ResponsavelId > 0 then
      fdqLogError.FieldByName('responsavel_id').AsInteger:=LogServerRequest.ResponsavelId;

    if LogServerRequest.FuncionarioId > 0 then
      fdqLogError.FieldByName('funcionario_id').AsInteger:= LogServerRequest.FuncionarioId;

    fdqLogError.FieldByName('data').AsDateTime:= LogServerRequest.DataError;
    fdqLogError.FieldByName('data_insert_server').AsDateTime:= Now;
    fdqLogError.Post;
  finally
    fdqLogError.Active:=False;
  end;

end;

procedure TSmMain.SetSQLLogError(EscolaId, FuncionarioId: Integer;
  KeyValues: String);
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
