//
// Created by the DataSnap proxy generator.
// 06/02/2016 17:16:21
//

unit Proxy;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TSrvServerMetodosClient = class(TDSAdminRestClient)
  private
    FDataModuleCreateCommand: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetAlunosCommand: TDSRestCommand;
    FGetAlunosCommand_Cache: TDSRestCommand;
    FLoginFuncionarioCommand: TDSRestCommand;
    FLoginResponsavelCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DataModuleCreate(Sender: TObject);
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetAlunos(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetAlunos_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LoginFuncionario(Login: string; Senha: string; const ARequestFilter: string = ''): Boolean;
    function LoginResponsavel(Login: string; Senha: string; const ARequestFilter: string = ''): Boolean;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TSrvServerMetodos_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TSrvServerMetodos_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSrvServerMetodos_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSrvServerMetodos_GetAlunos: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSrvServerMetodos_GetAlunos_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSrvServerMetodos_LoginFuncionario: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Login'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Senha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSrvServerMetodos_LoginResponsavel: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Login'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Senha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

implementation

procedure TSrvServerMetodosClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TSrvServerMetodos."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TSrvServerMetodos_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

function TSrvServerMetodosClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TSrvServerMetodos.EchoString';
    FEchoStringCommand.Prepare(TSrvServerMetodos_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TSrvServerMetodosClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TSrvServerMetodos.ReverseString';
    FReverseStringCommand.Prepare(TSrvServerMetodos_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TSrvServerMetodosClient.GetAlunos(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetAlunosCommand = nil then
  begin
    FGetAlunosCommand := FConnection.CreateCommand;
    FGetAlunosCommand.RequestType := 'GET';
    FGetAlunosCommand.Text := 'TSrvServerMetodos.GetAlunos';
    FGetAlunosCommand.Prepare(TSrvServerMetodos_GetAlunos);
  end;
  FGetAlunosCommand.Execute(ARequestFilter);
  if not FGetAlunosCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetAlunosCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetAlunosCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetAlunosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSrvServerMetodosClient.GetAlunos_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetAlunosCommand_Cache = nil then
  begin
    FGetAlunosCommand_Cache := FConnection.CreateCommand;
    FGetAlunosCommand_Cache.RequestType := 'GET';
    FGetAlunosCommand_Cache.Text := 'TSrvServerMetodos.GetAlunos';
    FGetAlunosCommand_Cache.Prepare(TSrvServerMetodos_GetAlunos_Cache);
  end;
  FGetAlunosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetAlunosCommand_Cache.Parameters[0].Value.GetString);
end;

function TSrvServerMetodosClient.LoginFuncionario(Login: string; Senha: string; const ARequestFilter: string): Boolean;
begin
  if FLoginFuncionarioCommand = nil then
  begin
    FLoginFuncionarioCommand := FConnection.CreateCommand;
    FLoginFuncionarioCommand.RequestType := 'GET';
    FLoginFuncionarioCommand.Text := 'TSrvServerMetodos.LoginFuncionario';
    FLoginFuncionarioCommand.Prepare(TSrvServerMetodos_LoginFuncionario);
  end;
  FLoginFuncionarioCommand.Parameters[0].Value.SetWideString(Login);
  FLoginFuncionarioCommand.Parameters[1].Value.SetWideString(Senha);
  FLoginFuncionarioCommand.Execute(ARequestFilter);
  Result := FLoginFuncionarioCommand.Parameters[2].Value.GetBoolean;
end;

function TSrvServerMetodosClient.LoginResponsavel(Login: string; Senha: string; const ARequestFilter: string): Boolean;
begin
  if FLoginResponsavelCommand = nil then
  begin
    FLoginResponsavelCommand := FConnection.CreateCommand;
    FLoginResponsavelCommand.RequestType := 'GET';
    FLoginResponsavelCommand.Text := 'TSrvServerMetodos.LoginResponsavel';
    FLoginResponsavelCommand.Prepare(TSrvServerMetodos_LoginResponsavel);
  end;
  FLoginResponsavelCommand.Parameters[0].Value.SetWideString(Login);
  FLoginResponsavelCommand.Parameters[1].Value.SetWideString(Senha);
  FLoginResponsavelCommand.Execute(ARequestFilter);
  Result := FLoginResponsavelCommand.Parameters[2].Value.GetBoolean;
end;

constructor TSrvServerMetodosClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSrvServerMetodosClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSrvServerMetodosClient.Destroy;
begin
  FDataModuleCreateCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetAlunosCommand.DisposeOf;
  FGetAlunosCommand_Cache.DisposeOf;
  FLoginFuncionarioCommand.DisposeOf;
  FLoginResponsavelCommand.DisposeOf;
  inherited;
end;

end.

