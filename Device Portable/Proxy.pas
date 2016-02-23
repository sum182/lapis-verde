//
// Created by the DataSnap proxy generator.
// 23/02/2016 12:28:55
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
    FValidarEmailExistenteResponsavelCommand: TDSRestCommand;
    FValidarCPFExistenteResponsavelCommand: TDSRestCommand;
    FCriarUsuarioResponsavelCommand: TDSRestCommand;
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
    function ValidarEmailExistenteResponsavel(Email: string; const ARequestFilter: string = ''): Boolean;
    function ValidarCPFExistenteResponsavel(CPF: string; const ARequestFilter: string = ''): Boolean;
    function CriarUsuarioResponsavel(Nome: string; SobreNome: string; Email: string; Senha: string; Telefone: string; CPF: string; RG: string; Sexo: string; const ARequestFilter: string = ''): string;
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

  TSrvServerMetodos_ValidarEmailExistenteResponsavel: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Email'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSrvServerMetodos_ValidarCPFExistenteResponsavel: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'CPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSrvServerMetodos_CriarUsuarioResponsavel: array [0..8] of TDSRestParameterMetaData =
  (
    (Name: 'Nome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'SobreNome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Email'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Senha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Telefone'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'CPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'RG'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Sexo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
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

function TSrvServerMetodosClient.ValidarEmailExistenteResponsavel(Email: string; const ARequestFilter: string): Boolean;
begin
  if FValidarEmailExistenteResponsavelCommand = nil then
  begin
    FValidarEmailExistenteResponsavelCommand := FConnection.CreateCommand;
    FValidarEmailExistenteResponsavelCommand.RequestType := 'GET';
    FValidarEmailExistenteResponsavelCommand.Text := 'TSrvServerMetodos.ValidarEmailExistenteResponsavel';
    FValidarEmailExistenteResponsavelCommand.Prepare(TSrvServerMetodos_ValidarEmailExistenteResponsavel);
  end;
  FValidarEmailExistenteResponsavelCommand.Parameters[0].Value.SetWideString(Email);
  FValidarEmailExistenteResponsavelCommand.Execute(ARequestFilter);
  Result := FValidarEmailExistenteResponsavelCommand.Parameters[1].Value.GetBoolean;
end;

function TSrvServerMetodosClient.ValidarCPFExistenteResponsavel(CPF: string; const ARequestFilter: string): Boolean;
begin
  if FValidarCPFExistenteResponsavelCommand = nil then
  begin
    FValidarCPFExistenteResponsavelCommand := FConnection.CreateCommand;
    FValidarCPFExistenteResponsavelCommand.RequestType := 'GET';
    FValidarCPFExistenteResponsavelCommand.Text := 'TSrvServerMetodos.ValidarCPFExistenteResponsavel';
    FValidarCPFExistenteResponsavelCommand.Prepare(TSrvServerMetodos_ValidarCPFExistenteResponsavel);
  end;
  FValidarCPFExistenteResponsavelCommand.Parameters[0].Value.SetWideString(CPF);
  FValidarCPFExistenteResponsavelCommand.Execute(ARequestFilter);
  Result := FValidarCPFExistenteResponsavelCommand.Parameters[1].Value.GetBoolean;
end;

function TSrvServerMetodosClient.CriarUsuarioResponsavel(Nome: string; SobreNome: string; Email: string; Senha: string; Telefone: string; CPF: string; RG: string; Sexo: string; const ARequestFilter: string): string;
begin
  if FCriarUsuarioResponsavelCommand = nil then
  begin
    FCriarUsuarioResponsavelCommand := FConnection.CreateCommand;
    FCriarUsuarioResponsavelCommand.RequestType := 'GET';
    FCriarUsuarioResponsavelCommand.Text := 'TSrvServerMetodos.CriarUsuarioResponsavel';
    FCriarUsuarioResponsavelCommand.Prepare(TSrvServerMetodos_CriarUsuarioResponsavel);
  end;
  FCriarUsuarioResponsavelCommand.Parameters[0].Value.SetWideString(Nome);
  FCriarUsuarioResponsavelCommand.Parameters[1].Value.SetWideString(SobreNome);
  FCriarUsuarioResponsavelCommand.Parameters[2].Value.SetWideString(Email);
  FCriarUsuarioResponsavelCommand.Parameters[3].Value.SetWideString(Senha);
  FCriarUsuarioResponsavelCommand.Parameters[4].Value.SetWideString(Telefone);
  FCriarUsuarioResponsavelCommand.Parameters[5].Value.SetWideString(CPF);
  FCriarUsuarioResponsavelCommand.Parameters[6].Value.SetWideString(RG);
  FCriarUsuarioResponsavelCommand.Parameters[7].Value.SetWideString(Sexo);
  FCriarUsuarioResponsavelCommand.Execute(ARequestFilter);
  Result := FCriarUsuarioResponsavelCommand.Parameters[8].Value.GetWideString;
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
  FValidarEmailExistenteResponsavelCommand.DisposeOf;
  FValidarCPFExistenteResponsavelCommand.DisposeOf;
  FCriarUsuarioResponsavelCommand.DisposeOf;
  inherited;
end;

end.

