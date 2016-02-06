//
// Created by the DataSnap proxy generator.
// 03/07/2015 16:28:41
//

unit Proxy;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TSrvServerMetodosClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetTitulosCommand: TDSRestCommand;
    FGetTitulosCommand_Cache: TDSRestCommand;
    FApplyUpdadesTitulosCommand: TDSRestCommand;
    FExcluirTituloCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetTitulos(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetTitulos_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure ApplyUpdadesTitulos(ADeltaList: TFDJSONDeltas);
    function ExcluirTitulo(ATitulo: Integer; const ARequestFilter: string = ''): Boolean;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
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

  TSrvServerMetodos_GetTitulos: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSrvServerMetodos_GetTitulos_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSrvServerMetodos_ApplyUpdadesTitulos: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

  TSrvServerMetodos_ExcluirTitulo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ATitulo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

implementation

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

function TSrvServerMetodosClient.GetTitulos(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetTitulosCommand = nil then
  begin
    FGetTitulosCommand := FConnection.CreateCommand;
    FGetTitulosCommand.RequestType := 'GET';
    FGetTitulosCommand.Text := 'TSrvServerMetodos.GetTitulos';
    FGetTitulosCommand.Prepare(TSrvServerMetodos_GetTitulos);
  end;
  FGetTitulosCommand.Execute(ARequestFilter);
  if not FGetTitulosCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetTitulosCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetTitulosCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetTitulosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSrvServerMetodosClient.GetTitulos_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetTitulosCommand_Cache = nil then
  begin
    FGetTitulosCommand_Cache := FConnection.CreateCommand;
    FGetTitulosCommand_Cache.RequestType := 'GET';
    FGetTitulosCommand_Cache.Text := 'TSrvServerMetodos.GetTitulos';
    FGetTitulosCommand_Cache.Prepare(TSrvServerMetodos_GetTitulos_Cache);
  end;
  FGetTitulosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetTitulosCommand_Cache.Parameters[0].Value.GetString);
end;

procedure TSrvServerMetodosClient.ApplyUpdadesTitulos(ADeltaList: TFDJSONDeltas);
begin
  if FApplyUpdadesTitulosCommand = nil then
  begin
    FApplyUpdadesTitulosCommand := FConnection.CreateCommand;
    FApplyUpdadesTitulosCommand.RequestType := 'POST';
    FApplyUpdadesTitulosCommand.Text := 'TSrvServerMetodos."ApplyUpdadesTitulos"';
    FApplyUpdadesTitulosCommand.Prepare(TSrvServerMetodos_ApplyUpdadesTitulos);
  end;
  if not Assigned(ADeltaList) then
    FApplyUpdadesTitulosCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplyUpdadesTitulosCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyUpdadesTitulosCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplyUpdadesTitulosCommand.Execute;
end;

function TSrvServerMetodosClient.ExcluirTitulo(ATitulo: Integer; const ARequestFilter: string): Boolean;
begin
  if FExcluirTituloCommand = nil then
  begin
    FExcluirTituloCommand := FConnection.CreateCommand;
    FExcluirTituloCommand.RequestType := 'GET';
    FExcluirTituloCommand.Text := 'TSrvServerMetodos.ExcluirTitulo';
    FExcluirTituloCommand.Prepare(TSrvServerMetodos_ExcluirTitulo);
  end;
  FExcluirTituloCommand.Parameters[0].Value.SetInt32(ATitulo);
  FExcluirTituloCommand.Execute(ARequestFilter);
  Result := FExcluirTituloCommand.Parameters[1].Value.GetBoolean;
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
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetTitulosCommand.DisposeOf;
  FGetTitulosCommand_Cache.DisposeOf;
  FApplyUpdadesTitulosCommand.DisposeOf;
  FExcluirTituloCommand.DisposeOf;
  inherited;
end;

end.

