// 
// Created by the DataSnap proxy generator.
// 25/01/2016 00:14:07
// 

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FLisarAlunosCommand: TDSRestCommand;
    FLisarAlunosCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function LisarAlunos(Codigo: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LisarAlunos_Cache(Codigo: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods1_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_LisarAlunos: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Codigo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_LisarAlunos_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Codigo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TServerMethods1Client.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare(TServerMethods1_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods1_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.LisarAlunos(Codigo: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLisarAlunosCommand = nil then
  begin
    FLisarAlunosCommand := FConnection.CreateCommand;
    FLisarAlunosCommand.RequestType := 'GET';
    FLisarAlunosCommand.Text := 'TServerMethods1.LisarAlunos';
    FLisarAlunosCommand.Prepare(TServerMethods1_LisarAlunos);
  end;
  FLisarAlunosCommand.Parameters[0].Value.SetWideString(Codigo);
  FLisarAlunosCommand.Execute(ARequestFilter);
  if not FLisarAlunosCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLisarAlunosCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLisarAlunosCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLisarAlunosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.LisarAlunos_Cache(Codigo: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLisarAlunosCommand_Cache = nil then
  begin
    FLisarAlunosCommand_Cache := FConnection.CreateCommand;
    FLisarAlunosCommand_Cache.RequestType := 'GET';
    FLisarAlunosCommand_Cache.Text := 'TServerMethods1.LisarAlunos';
    FLisarAlunosCommand_Cache.Prepare(TServerMethods1_LisarAlunos_Cache);
  end;
  FLisarAlunosCommand_Cache.Parameters[0].Value.SetWideString(Codigo);
  FLisarAlunosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLisarAlunosCommand_Cache.Parameters[1].Value.GetString);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FLisarAlunosCommand.DisposeOf;
  FLisarAlunosCommand_Cache.DisposeOf;
  inherited;
end;

end.
