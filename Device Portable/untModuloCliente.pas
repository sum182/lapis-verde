unit untModuloCliente;

interface

uses
  System.SysUtils, System.Classes, Proxy, IPPeerClient, Datasnap.DSClientRest;

type
  TModuloCliente = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
    DSRestConnectionLocal: TDSRestConnection;
    DSRestConnectionAWS: TDSRestConnection;
    procedure DataModuleCreate(Sender: TObject);
    private
    FInstanceOwner: Boolean;
    FSrvServerMetodosClient: TSrvServerMetodosClient;
    FSmTesteClient: TSmTesteClient;
    FSmMainClient: TSmMainClient;
    FSmEscolaClient: TSmEscolaClient;
    FSmResponsavelClient: TSmResponsavelClient;
    function GetSrvServerMetodosClient: TSrvServerMetodosClient;
    function GetSmTesteClient: TSmTesteClient;
    function GetSmMainClient: TSmMainClient;
    function GetSmEscolaClient: TSmEscolaClient;
    function GetSmResponsavelClient: TSmResponsavelClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SrvServerMetodosClient: TSrvServerMetodosClient read GetSrvServerMetodosClient write FSrvServerMetodosClient;
    property SmTesteClient: TSmTesteClient read GetSmTesteClient write FSmTesteClient;
    property SmMainClient: TSmMainClient read GetSmMainClient write FSmMainClient;
    property SmEscolaClient: TSmEscolaClient read GetSmEscolaClient write FSmEscolaClient;
    property SmResponsavelClient: TSmResponsavelClient read GetSmResponsavelClient write FSmResponsavelClient;

end;

var
  ModuloCliente: TModuloCliente;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses smGeralFMX, untFuncoes;

{$R *.dfm}

constructor TModuloCliente.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

procedure TModuloCliente.DataModuleCreate(Sender: TObject);
begin
  if not IsSysOSWindows then
    DSRestConnection1.Host := DSRestConnectionAWS.Host;
end;

destructor TModuloCliente.Destroy;
begin
  FSrvServerMetodosClient.Free;
  FSmTesteClient.Free;
  FSmMainClient.Free;
  FSmEscolaClient.Free;
  FSmResponsavelClient.Free;
  inherited;
end;

function TModuloCliente.GetSrvServerMetodosClient: TSrvServerMetodosClient;
begin
  if FSrvServerMetodosClient = nil then
    FSrvServerMetodosClient:= TSrvServerMetodosClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSrvServerMetodosClient;
end;
function TModuloCliente.GetSmTesteClient: TSmTesteClient;
begin
  if FSmTesteClient = nil then
    FSmTesteClient:= TSmTesteClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSmTesteClient;
end;
function TModuloCliente.GetSmMainClient: TSmMainClient;
begin
  if FSmMainClient = nil then
    FSmMainClient:= TSmMainClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSmMainClient;
end;
function TModuloCliente.GetSmEscolaClient: TSmEscolaClient;
begin
  if FSmEscolaClient = nil then
    FSmEscolaClient:= TSmEscolaClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSmEscolaClient;
end;
function TModuloCliente.GetSmResponsavelClient: TSmResponsavelClient;
begin
  if FSmResponsavelClient = nil then
    FSmResponsavelClient:= TSmResponsavelClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSmResponsavelClient;
end;


end.
