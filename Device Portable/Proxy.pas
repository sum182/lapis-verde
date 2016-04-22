//
// Created by the DataSnap proxy generator.
// 22/04/2016 12:08:55
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
    FGetAlunosTesteCommand: TDSRestCommand;
    FGetAlunosTesteCommand_Cache: TDSRestCommand;
    FLoginFuncionarioCommand: TDSRestCommand;
    FLoginResponsavelCommand: TDSRestCommand;
    FValidarEmailExistenteResponsavelCommand: TDSRestCommand;
    FValidarCPFExistenteResponsavelCommand: TDSRestCommand;
    FCriarUsuarioResponsavelCommand: TDSRestCommand;
    FGetAlunosCommand: TDSRestCommand;
    FGetAlunosCommand_Cache: TDSRestCommand;
    FGetTurmasCommand: TDSRestCommand;
    FGetTurmasCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DataModuleCreate(Sender: TObject);
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetAlunosTeste(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetAlunosTeste_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LoginFuncionario(Login: string; Senha: string; const ARequestFilter: string = ''): Boolean;
    function LoginResponsavel(Login: string; Senha: string; const ARequestFilter: string = ''): Boolean;
    function ValidarEmailExistenteResponsavel(Email: string; const ARequestFilter: string = ''): Boolean;
    function ValidarCPFExistenteResponsavel(CPF: string; const ARequestFilter: string = ''): Boolean;
    function CriarUsuarioResponsavel(Nome: string; SobreNome: string; Email: string; Senha: string; Telefone: string; CPF: string; RG: string; Sexo: string; const ARequestFilter: string = ''): string;
    function GetAlunos(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetAlunos_Cache(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetTurmas(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetTurmas_Cache(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  TSmTesteClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetAlunosTesteCommand: TDSRestCommand;
    FGetAlunosTesteCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetAlunosTeste(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetAlunosTeste_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  TSmMainClient = class(TDSAdminRestClient)
  private
    FDataModuleCreateCommand: TDSRestCommand;
    FfdqLogErrorBeforePostCommand: TDSRestCommand;
    FApplicationEventsExceptionCommand: TDSRestCommand;
    FFDConnectionAfterConnectCommand: TDSRestCommand;
    FSalvarLogErrorCommand: TDSRestCommand;
    FSetLogErrorCommand: TDSRestCommand;
    FGetTabelaAtualizacaoCommand: TDSRestCommand;
    FGetTabelaAtualizacaoCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DataModuleCreate(Sender: TObject);
    procedure fdqLogErrorBeforePost(DataSet: TDataSet);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure FDConnectionAfterConnect(Sender: TObject);
    function SalvarLogError(EscolaId: Integer; FuncionarioId: Integer; LDataSetList: TFDJSONDataSets; const ARequestFilter: string = ''): string;
    procedure SetLogError(MsgError: string; Aplicacao: string; UnitNome: string; Classe: string; Metodo: string; Data: TDateTime; EscolaId: Integer; ResponsavelId: Integer; FuncionarioId: Integer);
    function GetTabelaAtualizacao(EscolaId: Integer; ResponsavelId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetTabelaAtualizacao_Cache(EscolaId: Integer; ResponsavelId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  TSmEscolaClient = class(TDSAdminRestClient)
  private
    FfdqAgendaBeforePostCommand: TDSRestCommand;
    FfdqAgendaIDBeforePostCommand: TDSRestCommand;
    FLoginFuncionarioCommand: TDSRestCommand;
    FGetAlunosCommand: TDSRestCommand;
    FGetAlunosCommand_Cache: TDSRestCommand;
    FGetTurmasCommand: TDSRestCommand;
    FGetTurmasCommand_Cache: TDSRestCommand;
    FGetResponsaveisCommand: TDSRestCommand;
    FGetResponsaveisCommand_Cache: TDSRestCommand;
    FGetFuncionariosCommand: TDSRestCommand;
    FGetFuncionariosCommand_Cache: TDSRestCommand;
    FGetAgendaCommand: TDSRestCommand;
    FGetAgendaCommand_Cache: TDSRestCommand;
    FSalvarAgendaCommand: TDSRestCommand;
    FApplyChangesAgendaCommand: TDSRestCommand;
    FGetTabelaAtualizacaoCommand: TDSRestCommand;
    FGetTabelaAtualizacaoCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure fdqAgendaBeforePost(DataSet: TDataSet);
    procedure fdqAgendaIDBeforePost(DataSet: TDataSet);
    function LoginFuncionario(Login: string; Senha: string; const ARequestFilter: string = ''): Boolean;
    function GetAlunos(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetAlunos_Cache(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetTurmas(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetTurmas_Cache(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetResponsaveis(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetResponsaveis_Cache(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetFuncionarios(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetFuncionarios_Cache(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetAgenda(EscolaId: Integer; FuncionarioId: Integer; DtIni: TDateTime; DtFim: TDateTime; ListKeysInserts: TFDJSONDataSets; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetAgenda_Cache(EscolaId: Integer; FuncionarioId: Integer; DtIni: TDateTime; DtFim: TDateTime; ListKeysInserts: TFDJSONDataSets; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function SalvarAgenda(EscolaId: Integer; FuncionarioId: Integer; DtIni: TDateTime; DtFim: TDateTime; LDataSetList: TFDJSONDataSets; const ARequestFilter: string = ''): string;
    procedure ApplyChangesAgenda(EscolaId: Integer; FuncionarioId: Integer; ADeltaList: TFDJSONDeltas);
    function GetTabelaAtualizacao(EscolaId: Integer; ResponsavelId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetTabelaAtualizacao_Cache(EscolaId: Integer; ResponsavelId: Integer; FuncionarioId: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  TSmResponsavelClient = class(TDSAdminRestClient)
  private
    FLoginResponsavelCommand: TDSRestCommand;
    FValidarEmailExistenteResponsavelCommand: TDSRestCommand;
    FValidarCPFExistenteResponsavelCommand: TDSRestCommand;
    FCriarUsuarioResponsavelCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
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

  TSrvServerMetodos_GetAlunosTeste: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSrvServerMetodos_GetAlunosTeste_Cache: array [0..0] of TDSRestParameterMetaData =
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

  TSrvServerMetodos_GetAlunos: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSrvServerMetodos_GetAlunos_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSrvServerMetodos_GetTurmas: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSrvServerMetodos_GetTurmas_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSmTeste_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSmTeste_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSmTeste_GetAlunosTeste: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSmTeste_GetAlunosTeste_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSmMain_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TSmMain_fdqLogErrorBeforePost: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'DataSet'; Direction: 1; DBXType: 23; TypeName: 'TDataSet')
  );

  TSmMain_ApplicationEventsException: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject'),
    (Name: 'E'; Direction: 1; DBXType: 37; TypeName: 'Exception')
  );

  TSmMain_FDConnectionAfterConnect: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TSmMain_SalvarLogError: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'LDataSetList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDataSets'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSmMain_SetLogError: array [0..8] of TDSRestParameterMetaData =
  (
    (Name: 'MsgError'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Aplicacao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'UnitNome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Classe'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Metodo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Data'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ResponsavelId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TSmMain_GetTabelaAtualizacao: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ResponsavelId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSmMain_GetTabelaAtualizacao_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ResponsavelId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSmEscola_fdqAgendaBeforePost: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'DataSet'; Direction: 1; DBXType: 23; TypeName: 'TDataSet')
  );

  TSmEscola_fdqAgendaIDBeforePost: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'DataSet'; Direction: 1; DBXType: 23; TypeName: 'TDataSet')
  );

  TSmEscola_LoginFuncionario: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Login'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Senha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSmEscola_GetAlunos: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSmEscola_GetAlunos_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSmEscola_GetTurmas: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSmEscola_GetTurmas_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSmEscola_GetResponsaveis: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSmEscola_GetResponsaveis_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSmEscola_GetFuncionarios: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSmEscola_GetFuncionarios_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSmEscola_GetAgenda: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'DtIni'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'DtFim'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ListKeysInserts'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDataSets'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSmEscola_GetAgenda_Cache: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'DtIni'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'DtFim'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'ListKeysInserts'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDataSets'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSmEscola_SalvarAgenda: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'DtIni'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'DtFim'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'LDataSetList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDataSets'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSmEscola_ApplyChangesAgenda: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

  TSmEscola_GetTabelaAtualizacao: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ResponsavelId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSmEscola_GetTabelaAtualizacao_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'EscolaId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ResponsavelId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FuncionarioId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSmResponsavel_LoginResponsavel: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Login'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Senha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSmResponsavel_ValidarEmailExistenteResponsavel: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Email'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSmResponsavel_ValidarCPFExistenteResponsavel: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'CPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSmResponsavel_CriarUsuarioResponsavel: array [0..8] of TDSRestParameterMetaData =
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

function TSrvServerMetodosClient.GetAlunosTeste(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetAlunosTesteCommand = nil then
  begin
    FGetAlunosTesteCommand := FConnection.CreateCommand;
    FGetAlunosTesteCommand.RequestType := 'GET';
    FGetAlunosTesteCommand.Text := 'TSrvServerMetodos.GetAlunosTeste';
    FGetAlunosTesteCommand.Prepare(TSrvServerMetodos_GetAlunosTeste);
  end;
  FGetAlunosTesteCommand.Execute(ARequestFilter);
  if not FGetAlunosTesteCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetAlunosTesteCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetAlunosTesteCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetAlunosTesteCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSrvServerMetodosClient.GetAlunosTeste_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetAlunosTesteCommand_Cache = nil then
  begin
    FGetAlunosTesteCommand_Cache := FConnection.CreateCommand;
    FGetAlunosTesteCommand_Cache.RequestType := 'GET';
    FGetAlunosTesteCommand_Cache.Text := 'TSrvServerMetodos.GetAlunosTeste';
    FGetAlunosTesteCommand_Cache.Prepare(TSrvServerMetodos_GetAlunosTeste_Cache);
  end;
  FGetAlunosTesteCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetAlunosTesteCommand_Cache.Parameters[0].Value.GetString);
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

function TSrvServerMetodosClient.GetAlunos(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetAlunosCommand = nil then
  begin
    FGetAlunosCommand := FConnection.CreateCommand;
    FGetAlunosCommand.RequestType := 'GET';
    FGetAlunosCommand.Text := 'TSrvServerMetodos.GetAlunos';
    FGetAlunosCommand.Prepare(TSrvServerMetodos_GetAlunos);
  end;
  FGetAlunosCommand.Parameters[0].Value.SetInt32(EscolaId);
  FGetAlunosCommand.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetAlunosCommand.Execute(ARequestFilter);
  if not FGetAlunosCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetAlunosCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetAlunosCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetAlunosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSrvServerMetodosClient.GetAlunos_Cache(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetAlunosCommand_Cache = nil then
  begin
    FGetAlunosCommand_Cache := FConnection.CreateCommand;
    FGetAlunosCommand_Cache.RequestType := 'GET';
    FGetAlunosCommand_Cache.Text := 'TSrvServerMetodos.GetAlunos';
    FGetAlunosCommand_Cache.Prepare(TSrvServerMetodos_GetAlunos_Cache);
  end;
  FGetAlunosCommand_Cache.Parameters[0].Value.SetInt32(EscolaId);
  FGetAlunosCommand_Cache.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetAlunosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetAlunosCommand_Cache.Parameters[2].Value.GetString);
end;

function TSrvServerMetodosClient.GetTurmas(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetTurmasCommand = nil then
  begin
    FGetTurmasCommand := FConnection.CreateCommand;
    FGetTurmasCommand.RequestType := 'GET';
    FGetTurmasCommand.Text := 'TSrvServerMetodos.GetTurmas';
    FGetTurmasCommand.Prepare(TSrvServerMetodos_GetTurmas);
  end;
  FGetTurmasCommand.Parameters[0].Value.SetInt32(EscolaId);
  FGetTurmasCommand.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetTurmasCommand.Execute(ARequestFilter);
  if not FGetTurmasCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetTurmasCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetTurmasCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetTurmasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSrvServerMetodosClient.GetTurmas_Cache(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetTurmasCommand_Cache = nil then
  begin
    FGetTurmasCommand_Cache := FConnection.CreateCommand;
    FGetTurmasCommand_Cache.RequestType := 'GET';
    FGetTurmasCommand_Cache.Text := 'TSrvServerMetodos.GetTurmas';
    FGetTurmasCommand_Cache.Prepare(TSrvServerMetodos_GetTurmas_Cache);
  end;
  FGetTurmasCommand_Cache.Parameters[0].Value.SetInt32(EscolaId);
  FGetTurmasCommand_Cache.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetTurmasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetTurmasCommand_Cache.Parameters[2].Value.GetString);
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
  FGetAlunosTesteCommand.DisposeOf;
  FGetAlunosTesteCommand_Cache.DisposeOf;
  FLoginFuncionarioCommand.DisposeOf;
  FLoginResponsavelCommand.DisposeOf;
  FValidarEmailExistenteResponsavelCommand.DisposeOf;
  FValidarCPFExistenteResponsavelCommand.DisposeOf;
  FCriarUsuarioResponsavelCommand.DisposeOf;
  FGetAlunosCommand.DisposeOf;
  FGetAlunosCommand_Cache.DisposeOf;
  FGetTurmasCommand.DisposeOf;
  FGetTurmasCommand_Cache.DisposeOf;
  inherited;
end;

function TSmTesteClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TSmTeste.EchoString';
    FEchoStringCommand.Prepare(TSmTeste_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TSmTesteClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TSmTeste.ReverseString';
    FReverseStringCommand.Prepare(TSmTeste_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TSmTesteClient.GetAlunosTeste(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetAlunosTesteCommand = nil then
  begin
    FGetAlunosTesteCommand := FConnection.CreateCommand;
    FGetAlunosTesteCommand.RequestType := 'GET';
    FGetAlunosTesteCommand.Text := 'TSmTeste.GetAlunosTeste';
    FGetAlunosTesteCommand.Prepare(TSmTeste_GetAlunosTeste);
  end;
  FGetAlunosTesteCommand.Execute(ARequestFilter);
  if not FGetAlunosTesteCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetAlunosTesteCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetAlunosTesteCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetAlunosTesteCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSmTesteClient.GetAlunosTeste_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetAlunosTesteCommand_Cache = nil then
  begin
    FGetAlunosTesteCommand_Cache := FConnection.CreateCommand;
    FGetAlunosTesteCommand_Cache.RequestType := 'GET';
    FGetAlunosTesteCommand_Cache.Text := 'TSmTeste.GetAlunosTeste';
    FGetAlunosTesteCommand_Cache.Prepare(TSmTeste_GetAlunosTeste_Cache);
  end;
  FGetAlunosTesteCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetAlunosTesteCommand_Cache.Parameters[0].Value.GetString);
end;

constructor TSmTesteClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSmTesteClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSmTesteClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetAlunosTesteCommand.DisposeOf;
  FGetAlunosTesteCommand_Cache.DisposeOf;
  inherited;
end;

procedure TSmMainClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TSmMain."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TSmMain_DataModuleCreate);
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

procedure TSmMainClient.fdqLogErrorBeforePost(DataSet: TDataSet);
begin
  if FfdqLogErrorBeforePostCommand = nil then
  begin
    FfdqLogErrorBeforePostCommand := FConnection.CreateCommand;
    FfdqLogErrorBeforePostCommand.RequestType := 'POST';
    FfdqLogErrorBeforePostCommand.Text := 'TSmMain."fdqLogErrorBeforePost"';
    FfdqLogErrorBeforePostCommand.Prepare(TSmMain_fdqLogErrorBeforePost);
  end;
  FfdqLogErrorBeforePostCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FfdqLogErrorBeforePostCommand.Execute;
end;

procedure TSmMainClient.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  if FApplicationEventsExceptionCommand = nil then
  begin
    FApplicationEventsExceptionCommand := FConnection.CreateCommand;
    FApplicationEventsExceptionCommand.RequestType := 'POST';
    FApplicationEventsExceptionCommand.Text := 'TSmMain."ApplicationEventsException"';
    FApplicationEventsExceptionCommand.Prepare(TSmMain_ApplicationEventsException);
  end;
  if not Assigned(Sender) then
    FApplicationEventsExceptionCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplicationEventsExceptionCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplicationEventsExceptionCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  if not Assigned(E) then
    FApplicationEventsExceptionCommand.Parameters[1].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplicationEventsExceptionCommand.Parameters[1].ConnectionHandler).GetJSONMarshaler;
    try
      FApplicationEventsExceptionCommand.Parameters[1].Value.SetJSONValue(FMarshal.Marshal(E), True);
      if FInstanceOwner then
        E.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplicationEventsExceptionCommand.Execute;
end;

procedure TSmMainClient.FDConnectionAfterConnect(Sender: TObject);
begin
  if FFDConnectionAfterConnectCommand = nil then
  begin
    FFDConnectionAfterConnectCommand := FConnection.CreateCommand;
    FFDConnectionAfterConnectCommand.RequestType := 'POST';
    FFDConnectionAfterConnectCommand.Text := 'TSmMain."FDConnectionAfterConnect"';
    FFDConnectionAfterConnectCommand.Prepare(TSmMain_FDConnectionAfterConnect);
  end;
  if not Assigned(Sender) then
    FFDConnectionAfterConnectCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FFDConnectionAfterConnectCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FFDConnectionAfterConnectCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FFDConnectionAfterConnectCommand.Execute;
end;

function TSmMainClient.SalvarLogError(EscolaId: Integer; FuncionarioId: Integer; LDataSetList: TFDJSONDataSets; const ARequestFilter: string): string;
begin
  if FSalvarLogErrorCommand = nil then
  begin
    FSalvarLogErrorCommand := FConnection.CreateCommand;
    FSalvarLogErrorCommand.RequestType := 'POST';
    FSalvarLogErrorCommand.Text := 'TSmMain."SalvarLogError"';
    FSalvarLogErrorCommand.Prepare(TSmMain_SalvarLogError);
  end;
  FSalvarLogErrorCommand.Parameters[0].Value.SetInt32(EscolaId);
  FSalvarLogErrorCommand.Parameters[1].Value.SetInt32(FuncionarioId);
  if not Assigned(LDataSetList) then
    FSalvarLogErrorCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSalvarLogErrorCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FSalvarLogErrorCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(LDataSetList), True);
      if FInstanceOwner then
        LDataSetList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSalvarLogErrorCommand.Execute(ARequestFilter);
  Result := FSalvarLogErrorCommand.Parameters[3].Value.GetWideString;
end;

procedure TSmMainClient.SetLogError(MsgError: string; Aplicacao: string; UnitNome: string; Classe: string; Metodo: string; Data: TDateTime; EscolaId: Integer; ResponsavelId: Integer; FuncionarioId: Integer);
begin
  if FSetLogErrorCommand = nil then
  begin
    FSetLogErrorCommand := FConnection.CreateCommand;
    FSetLogErrorCommand.RequestType := 'GET';
    FSetLogErrorCommand.Text := 'TSmMain.SetLogError';
    FSetLogErrorCommand.Prepare(TSmMain_SetLogError);
  end;
  FSetLogErrorCommand.Parameters[0].Value.SetWideString(MsgError);
  FSetLogErrorCommand.Parameters[1].Value.SetWideString(Aplicacao);
  FSetLogErrorCommand.Parameters[2].Value.SetWideString(UnitNome);
  FSetLogErrorCommand.Parameters[3].Value.SetWideString(Classe);
  FSetLogErrorCommand.Parameters[4].Value.SetWideString(Metodo);
  FSetLogErrorCommand.Parameters[5].Value.AsDateTime := Data;
  FSetLogErrorCommand.Parameters[6].Value.SetInt32(EscolaId);
  FSetLogErrorCommand.Parameters[7].Value.SetInt32(ResponsavelId);
  FSetLogErrorCommand.Parameters[8].Value.SetInt32(FuncionarioId);
  FSetLogErrorCommand.Execute;
end;

function TSmMainClient.GetTabelaAtualizacao(EscolaId: Integer; ResponsavelId: Integer; FuncionarioId: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetTabelaAtualizacaoCommand = nil then
  begin
    FGetTabelaAtualizacaoCommand := FConnection.CreateCommand;
    FGetTabelaAtualizacaoCommand.RequestType := 'GET';
    FGetTabelaAtualizacaoCommand.Text := 'TSmMain.GetTabelaAtualizacao';
    FGetTabelaAtualizacaoCommand.Prepare(TSmMain_GetTabelaAtualizacao);
  end;
  FGetTabelaAtualizacaoCommand.Parameters[0].Value.SetInt32(EscolaId);
  FGetTabelaAtualizacaoCommand.Parameters[1].Value.SetInt32(ResponsavelId);
  FGetTabelaAtualizacaoCommand.Parameters[2].Value.SetInt32(FuncionarioId);
  FGetTabelaAtualizacaoCommand.Execute(ARequestFilter);
  if not FGetTabelaAtualizacaoCommand.Parameters[3].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetTabelaAtualizacaoCommand.Parameters[3].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetTabelaAtualizacaoCommand.Parameters[3].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetTabelaAtualizacaoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSmMainClient.GetTabelaAtualizacao_Cache(EscolaId: Integer; ResponsavelId: Integer; FuncionarioId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetTabelaAtualizacaoCommand_Cache = nil then
  begin
    FGetTabelaAtualizacaoCommand_Cache := FConnection.CreateCommand;
    FGetTabelaAtualizacaoCommand_Cache.RequestType := 'GET';
    FGetTabelaAtualizacaoCommand_Cache.Text := 'TSmMain.GetTabelaAtualizacao';
    FGetTabelaAtualizacaoCommand_Cache.Prepare(TSmMain_GetTabelaAtualizacao_Cache);
  end;
  FGetTabelaAtualizacaoCommand_Cache.Parameters[0].Value.SetInt32(EscolaId);
  FGetTabelaAtualizacaoCommand_Cache.Parameters[1].Value.SetInt32(ResponsavelId);
  FGetTabelaAtualizacaoCommand_Cache.Parameters[2].Value.SetInt32(FuncionarioId);
  FGetTabelaAtualizacaoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetTabelaAtualizacaoCommand_Cache.Parameters[3].Value.GetString);
end;

constructor TSmMainClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSmMainClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSmMainClient.Destroy;
begin
  FDataModuleCreateCommand.DisposeOf;
  FfdqLogErrorBeforePostCommand.DisposeOf;
  FApplicationEventsExceptionCommand.DisposeOf;
  FFDConnectionAfterConnectCommand.DisposeOf;
  FSalvarLogErrorCommand.DisposeOf;
  FSetLogErrorCommand.DisposeOf;
  FGetTabelaAtualizacaoCommand.DisposeOf;
  FGetTabelaAtualizacaoCommand_Cache.DisposeOf;
  inherited;
end;

procedure TSmEscolaClient.fdqAgendaBeforePost(DataSet: TDataSet);
begin
  if FfdqAgendaBeforePostCommand = nil then
  begin
    FfdqAgendaBeforePostCommand := FConnection.CreateCommand;
    FfdqAgendaBeforePostCommand.RequestType := 'POST';
    FfdqAgendaBeforePostCommand.Text := 'TSmEscola."fdqAgendaBeforePost"';
    FfdqAgendaBeforePostCommand.Prepare(TSmEscola_fdqAgendaBeforePost);
  end;
  FfdqAgendaBeforePostCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FfdqAgendaBeforePostCommand.Execute;
end;

procedure TSmEscolaClient.fdqAgendaIDBeforePost(DataSet: TDataSet);
begin
  if FfdqAgendaIDBeforePostCommand = nil then
  begin
    FfdqAgendaIDBeforePostCommand := FConnection.CreateCommand;
    FfdqAgendaIDBeforePostCommand.RequestType := 'POST';
    FfdqAgendaIDBeforePostCommand.Text := 'TSmEscola."fdqAgendaIDBeforePost"';
    FfdqAgendaIDBeforePostCommand.Prepare(TSmEscola_fdqAgendaIDBeforePost);
  end;
  FfdqAgendaIDBeforePostCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FfdqAgendaIDBeforePostCommand.Execute;
end;

function TSmEscolaClient.LoginFuncionario(Login: string; Senha: string; const ARequestFilter: string): Boolean;
begin
  if FLoginFuncionarioCommand = nil then
  begin
    FLoginFuncionarioCommand := FConnection.CreateCommand;
    FLoginFuncionarioCommand.RequestType := 'GET';
    FLoginFuncionarioCommand.Text := 'TSmEscola.LoginFuncionario';
    FLoginFuncionarioCommand.Prepare(TSmEscola_LoginFuncionario);
  end;
  FLoginFuncionarioCommand.Parameters[0].Value.SetWideString(Login);
  FLoginFuncionarioCommand.Parameters[1].Value.SetWideString(Senha);
  FLoginFuncionarioCommand.Execute(ARequestFilter);
  Result := FLoginFuncionarioCommand.Parameters[2].Value.GetBoolean;
end;

function TSmEscolaClient.GetAlunos(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetAlunosCommand = nil then
  begin
    FGetAlunosCommand := FConnection.CreateCommand;
    FGetAlunosCommand.RequestType := 'GET';
    FGetAlunosCommand.Text := 'TSmEscola.GetAlunos';
    FGetAlunosCommand.Prepare(TSmEscola_GetAlunos);
  end;
  FGetAlunosCommand.Parameters[0].Value.SetInt32(EscolaId);
  FGetAlunosCommand.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetAlunosCommand.Execute(ARequestFilter);
  if not FGetAlunosCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetAlunosCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetAlunosCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetAlunosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSmEscolaClient.GetAlunos_Cache(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetAlunosCommand_Cache = nil then
  begin
    FGetAlunosCommand_Cache := FConnection.CreateCommand;
    FGetAlunosCommand_Cache.RequestType := 'GET';
    FGetAlunosCommand_Cache.Text := 'TSmEscola.GetAlunos';
    FGetAlunosCommand_Cache.Prepare(TSmEscola_GetAlunos_Cache);
  end;
  FGetAlunosCommand_Cache.Parameters[0].Value.SetInt32(EscolaId);
  FGetAlunosCommand_Cache.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetAlunosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetAlunosCommand_Cache.Parameters[2].Value.GetString);
end;

function TSmEscolaClient.GetTurmas(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetTurmasCommand = nil then
  begin
    FGetTurmasCommand := FConnection.CreateCommand;
    FGetTurmasCommand.RequestType := 'GET';
    FGetTurmasCommand.Text := 'TSmEscola.GetTurmas';
    FGetTurmasCommand.Prepare(TSmEscola_GetTurmas);
  end;
  FGetTurmasCommand.Parameters[0].Value.SetInt32(EscolaId);
  FGetTurmasCommand.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetTurmasCommand.Execute(ARequestFilter);
  if not FGetTurmasCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetTurmasCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetTurmasCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetTurmasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSmEscolaClient.GetTurmas_Cache(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetTurmasCommand_Cache = nil then
  begin
    FGetTurmasCommand_Cache := FConnection.CreateCommand;
    FGetTurmasCommand_Cache.RequestType := 'GET';
    FGetTurmasCommand_Cache.Text := 'TSmEscola.GetTurmas';
    FGetTurmasCommand_Cache.Prepare(TSmEscola_GetTurmas_Cache);
  end;
  FGetTurmasCommand_Cache.Parameters[0].Value.SetInt32(EscolaId);
  FGetTurmasCommand_Cache.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetTurmasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetTurmasCommand_Cache.Parameters[2].Value.GetString);
end;

function TSmEscolaClient.GetResponsaveis(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetResponsaveisCommand = nil then
  begin
    FGetResponsaveisCommand := FConnection.CreateCommand;
    FGetResponsaveisCommand.RequestType := 'GET';
    FGetResponsaveisCommand.Text := 'TSmEscola.GetResponsaveis';
    FGetResponsaveisCommand.Prepare(TSmEscola_GetResponsaveis);
  end;
  FGetResponsaveisCommand.Parameters[0].Value.SetInt32(EscolaId);
  FGetResponsaveisCommand.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetResponsaveisCommand.Execute(ARequestFilter);
  if not FGetResponsaveisCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetResponsaveisCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetResponsaveisCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetResponsaveisCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSmEscolaClient.GetResponsaveis_Cache(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetResponsaveisCommand_Cache = nil then
  begin
    FGetResponsaveisCommand_Cache := FConnection.CreateCommand;
    FGetResponsaveisCommand_Cache.RequestType := 'GET';
    FGetResponsaveisCommand_Cache.Text := 'TSmEscola.GetResponsaveis';
    FGetResponsaveisCommand_Cache.Prepare(TSmEscola_GetResponsaveis_Cache);
  end;
  FGetResponsaveisCommand_Cache.Parameters[0].Value.SetInt32(EscolaId);
  FGetResponsaveisCommand_Cache.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetResponsaveisCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetResponsaveisCommand_Cache.Parameters[2].Value.GetString);
end;

function TSmEscolaClient.GetFuncionarios(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetFuncionariosCommand = nil then
  begin
    FGetFuncionariosCommand := FConnection.CreateCommand;
    FGetFuncionariosCommand.RequestType := 'GET';
    FGetFuncionariosCommand.Text := 'TSmEscola.GetFuncionarios';
    FGetFuncionariosCommand.Prepare(TSmEscola_GetFuncionarios);
  end;
  FGetFuncionariosCommand.Parameters[0].Value.SetInt32(EscolaId);
  FGetFuncionariosCommand.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetFuncionariosCommand.Execute(ARequestFilter);
  if not FGetFuncionariosCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetFuncionariosCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetFuncionariosCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetFuncionariosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSmEscolaClient.GetFuncionarios_Cache(EscolaId: Integer; FuncionarioId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetFuncionariosCommand_Cache = nil then
  begin
    FGetFuncionariosCommand_Cache := FConnection.CreateCommand;
    FGetFuncionariosCommand_Cache.RequestType := 'GET';
    FGetFuncionariosCommand_Cache.Text := 'TSmEscola.GetFuncionarios';
    FGetFuncionariosCommand_Cache.Prepare(TSmEscola_GetFuncionarios_Cache);
  end;
  FGetFuncionariosCommand_Cache.Parameters[0].Value.SetInt32(EscolaId);
  FGetFuncionariosCommand_Cache.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetFuncionariosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetFuncionariosCommand_Cache.Parameters[2].Value.GetString);
end;

function TSmEscolaClient.GetAgenda(EscolaId: Integer; FuncionarioId: Integer; DtIni: TDateTime; DtFim: TDateTime; ListKeysInserts: TFDJSONDataSets; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetAgendaCommand = nil then
  begin
    FGetAgendaCommand := FConnection.CreateCommand;
    FGetAgendaCommand.RequestType := 'POST';
    FGetAgendaCommand.Text := 'TSmEscola."GetAgenda"';
    FGetAgendaCommand.Prepare(TSmEscola_GetAgenda);
  end;
  FGetAgendaCommand.Parameters[0].Value.SetInt32(EscolaId);
  FGetAgendaCommand.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetAgendaCommand.Parameters[2].Value.AsDateTime := DtIni;
  FGetAgendaCommand.Parameters[3].Value.AsDateTime := DtFim;
  if not Assigned(ListKeysInserts) then
    FGetAgendaCommand.Parameters[4].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FGetAgendaCommand.Parameters[4].ConnectionHandler).GetJSONMarshaler;
    try
      FGetAgendaCommand.Parameters[4].Value.SetJSONValue(FMarshal.Marshal(ListKeysInserts), True);
      if FInstanceOwner then
        ListKeysInserts.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FGetAgendaCommand.Execute(ARequestFilter);
  if not FGetAgendaCommand.Parameters[5].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetAgendaCommand.Parameters[5].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetAgendaCommand.Parameters[5].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetAgendaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSmEscolaClient.GetAgenda_Cache(EscolaId: Integer; FuncionarioId: Integer; DtIni: TDateTime; DtFim: TDateTime; ListKeysInserts: TFDJSONDataSets; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetAgendaCommand_Cache = nil then
  begin
    FGetAgendaCommand_Cache := FConnection.CreateCommand;
    FGetAgendaCommand_Cache.RequestType := 'POST';
    FGetAgendaCommand_Cache.Text := 'TSmEscola."GetAgenda"';
    FGetAgendaCommand_Cache.Prepare(TSmEscola_GetAgenda_Cache);
  end;
  FGetAgendaCommand_Cache.Parameters[0].Value.SetInt32(EscolaId);
  FGetAgendaCommand_Cache.Parameters[1].Value.SetInt32(FuncionarioId);
  FGetAgendaCommand_Cache.Parameters[2].Value.AsDateTime := DtIni;
  FGetAgendaCommand_Cache.Parameters[3].Value.AsDateTime := DtFim;
  if not Assigned(ListKeysInserts) then
    FGetAgendaCommand_Cache.Parameters[4].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FGetAgendaCommand_Cache.Parameters[4].ConnectionHandler).GetJSONMarshaler;
    try
      FGetAgendaCommand_Cache.Parameters[4].Value.SetJSONValue(FMarshal.Marshal(ListKeysInserts), True);
      if FInstanceOwner then
        ListKeysInserts.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FGetAgendaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetAgendaCommand_Cache.Parameters[5].Value.GetString);
end;

function TSmEscolaClient.SalvarAgenda(EscolaId: Integer; FuncionarioId: Integer; DtIni: TDateTime; DtFim: TDateTime; LDataSetList: TFDJSONDataSets; const ARequestFilter: string): string;
begin
  if FSalvarAgendaCommand = nil then
  begin
    FSalvarAgendaCommand := FConnection.CreateCommand;
    FSalvarAgendaCommand.RequestType := 'POST';
    FSalvarAgendaCommand.Text := 'TSmEscola."SalvarAgenda"';
    FSalvarAgendaCommand.Prepare(TSmEscola_SalvarAgenda);
  end;
  FSalvarAgendaCommand.Parameters[0].Value.SetInt32(EscolaId);
  FSalvarAgendaCommand.Parameters[1].Value.SetInt32(FuncionarioId);
  FSalvarAgendaCommand.Parameters[2].Value.AsDateTime := DtIni;
  FSalvarAgendaCommand.Parameters[3].Value.AsDateTime := DtFim;
  if not Assigned(LDataSetList) then
    FSalvarAgendaCommand.Parameters[4].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSalvarAgendaCommand.Parameters[4].ConnectionHandler).GetJSONMarshaler;
    try
      FSalvarAgendaCommand.Parameters[4].Value.SetJSONValue(FMarshal.Marshal(LDataSetList), True);
      if FInstanceOwner then
        LDataSetList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSalvarAgendaCommand.Execute(ARequestFilter);
  Result := FSalvarAgendaCommand.Parameters[5].Value.GetWideString;
end;

procedure TSmEscolaClient.ApplyChangesAgenda(EscolaId: Integer; FuncionarioId: Integer; ADeltaList: TFDJSONDeltas);
begin
  if FApplyChangesAgendaCommand = nil then
  begin
    FApplyChangesAgendaCommand := FConnection.CreateCommand;
    FApplyChangesAgendaCommand.RequestType := 'POST';
    FApplyChangesAgendaCommand.Text := 'TSmEscola."ApplyChangesAgenda"';
    FApplyChangesAgendaCommand.Prepare(TSmEscola_ApplyChangesAgenda);
  end;
  FApplyChangesAgendaCommand.Parameters[0].Value.SetInt32(EscolaId);
  FApplyChangesAgendaCommand.Parameters[1].Value.SetInt32(FuncionarioId);
  if not Assigned(ADeltaList) then
    FApplyChangesAgendaCommand.Parameters[2].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplyChangesAgendaCommand.Parameters[2].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyChangesAgendaCommand.Parameters[2].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplyChangesAgendaCommand.Execute;
end;

function TSmEscolaClient.GetTabelaAtualizacao(EscolaId: Integer; ResponsavelId: Integer; FuncionarioId: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetTabelaAtualizacaoCommand = nil then
  begin
    FGetTabelaAtualizacaoCommand := FConnection.CreateCommand;
    FGetTabelaAtualizacaoCommand.RequestType := 'GET';
    FGetTabelaAtualizacaoCommand.Text := 'TSmEscola.GetTabelaAtualizacao';
    FGetTabelaAtualizacaoCommand.Prepare(TSmEscola_GetTabelaAtualizacao);
  end;
  FGetTabelaAtualizacaoCommand.Parameters[0].Value.SetInt32(EscolaId);
  FGetTabelaAtualizacaoCommand.Parameters[1].Value.SetInt32(ResponsavelId);
  FGetTabelaAtualizacaoCommand.Parameters[2].Value.SetInt32(FuncionarioId);
  FGetTabelaAtualizacaoCommand.Execute(ARequestFilter);
  if not FGetTabelaAtualizacaoCommand.Parameters[3].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetTabelaAtualizacaoCommand.Parameters[3].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetTabelaAtualizacaoCommand.Parameters[3].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetTabelaAtualizacaoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSmEscolaClient.GetTabelaAtualizacao_Cache(EscolaId: Integer; ResponsavelId: Integer; FuncionarioId: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetTabelaAtualizacaoCommand_Cache = nil then
  begin
    FGetTabelaAtualizacaoCommand_Cache := FConnection.CreateCommand;
    FGetTabelaAtualizacaoCommand_Cache.RequestType := 'GET';
    FGetTabelaAtualizacaoCommand_Cache.Text := 'TSmEscola.GetTabelaAtualizacao';
    FGetTabelaAtualizacaoCommand_Cache.Prepare(TSmEscola_GetTabelaAtualizacao_Cache);
  end;
  FGetTabelaAtualizacaoCommand_Cache.Parameters[0].Value.SetInt32(EscolaId);
  FGetTabelaAtualizacaoCommand_Cache.Parameters[1].Value.SetInt32(ResponsavelId);
  FGetTabelaAtualizacaoCommand_Cache.Parameters[2].Value.SetInt32(FuncionarioId);
  FGetTabelaAtualizacaoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetTabelaAtualizacaoCommand_Cache.Parameters[3].Value.GetString);
end;

constructor TSmEscolaClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSmEscolaClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSmEscolaClient.Destroy;
begin
  FfdqAgendaBeforePostCommand.DisposeOf;
  FfdqAgendaIDBeforePostCommand.DisposeOf;
  FLoginFuncionarioCommand.DisposeOf;
  FGetAlunosCommand.DisposeOf;
  FGetAlunosCommand_Cache.DisposeOf;
  FGetTurmasCommand.DisposeOf;
  FGetTurmasCommand_Cache.DisposeOf;
  FGetResponsaveisCommand.DisposeOf;
  FGetResponsaveisCommand_Cache.DisposeOf;
  FGetFuncionariosCommand.DisposeOf;
  FGetFuncionariosCommand_Cache.DisposeOf;
  FGetAgendaCommand.DisposeOf;
  FGetAgendaCommand_Cache.DisposeOf;
  FSalvarAgendaCommand.DisposeOf;
  FApplyChangesAgendaCommand.DisposeOf;
  FGetTabelaAtualizacaoCommand.DisposeOf;
  FGetTabelaAtualizacaoCommand_Cache.DisposeOf;
  inherited;
end;

function TSmResponsavelClient.LoginResponsavel(Login: string; Senha: string; const ARequestFilter: string): Boolean;
begin
  if FLoginResponsavelCommand = nil then
  begin
    FLoginResponsavelCommand := FConnection.CreateCommand;
    FLoginResponsavelCommand.RequestType := 'GET';
    FLoginResponsavelCommand.Text := 'TSmResponsavel.LoginResponsavel';
    FLoginResponsavelCommand.Prepare(TSmResponsavel_LoginResponsavel);
  end;
  FLoginResponsavelCommand.Parameters[0].Value.SetWideString(Login);
  FLoginResponsavelCommand.Parameters[1].Value.SetWideString(Senha);
  FLoginResponsavelCommand.Execute(ARequestFilter);
  Result := FLoginResponsavelCommand.Parameters[2].Value.GetBoolean;
end;

function TSmResponsavelClient.ValidarEmailExistenteResponsavel(Email: string; const ARequestFilter: string): Boolean;
begin
  if FValidarEmailExistenteResponsavelCommand = nil then
  begin
    FValidarEmailExistenteResponsavelCommand := FConnection.CreateCommand;
    FValidarEmailExistenteResponsavelCommand.RequestType := 'GET';
    FValidarEmailExistenteResponsavelCommand.Text := 'TSmResponsavel.ValidarEmailExistenteResponsavel';
    FValidarEmailExistenteResponsavelCommand.Prepare(TSmResponsavel_ValidarEmailExistenteResponsavel);
  end;
  FValidarEmailExistenteResponsavelCommand.Parameters[0].Value.SetWideString(Email);
  FValidarEmailExistenteResponsavelCommand.Execute(ARequestFilter);
  Result := FValidarEmailExistenteResponsavelCommand.Parameters[1].Value.GetBoolean;
end;

function TSmResponsavelClient.ValidarCPFExistenteResponsavel(CPF: string; const ARequestFilter: string): Boolean;
begin
  if FValidarCPFExistenteResponsavelCommand = nil then
  begin
    FValidarCPFExistenteResponsavelCommand := FConnection.CreateCommand;
    FValidarCPFExistenteResponsavelCommand.RequestType := 'GET';
    FValidarCPFExistenteResponsavelCommand.Text := 'TSmResponsavel.ValidarCPFExistenteResponsavel';
    FValidarCPFExistenteResponsavelCommand.Prepare(TSmResponsavel_ValidarCPFExistenteResponsavel);
  end;
  FValidarCPFExistenteResponsavelCommand.Parameters[0].Value.SetWideString(CPF);
  FValidarCPFExistenteResponsavelCommand.Execute(ARequestFilter);
  Result := FValidarCPFExistenteResponsavelCommand.Parameters[1].Value.GetBoolean;
end;

function TSmResponsavelClient.CriarUsuarioResponsavel(Nome: string; SobreNome: string; Email: string; Senha: string; Telefone: string; CPF: string; RG: string; Sexo: string; const ARequestFilter: string): string;
begin
  if FCriarUsuarioResponsavelCommand = nil then
  begin
    FCriarUsuarioResponsavelCommand := FConnection.CreateCommand;
    FCriarUsuarioResponsavelCommand.RequestType := 'GET';
    FCriarUsuarioResponsavelCommand.Text := 'TSmResponsavel.CriarUsuarioResponsavel';
    FCriarUsuarioResponsavelCommand.Prepare(TSmResponsavel_CriarUsuarioResponsavel);
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

constructor TSmResponsavelClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSmResponsavelClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSmResponsavelClient.Destroy;
begin
  FLoginResponsavelCommand.DisposeOf;
  FValidarEmailExistenteResponsavelCommand.DisposeOf;
  FValidarCPFExistenteResponsavelCommand.DisposeOf;
  FCriarUsuarioResponsavelCommand.DisposeOf;
  inherited;
end;

end.

