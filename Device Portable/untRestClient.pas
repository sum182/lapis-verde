unit untRestClient;

interface

uses
  System.SysUtils, System.Classes, Proxy, IPPeerClient, Datasnap.DSClientRest,
  smMensagensFMX,smNetworkState, untResourceString;

type
  TRestClient = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
    DSRestConnectionLocal: TDSRestConnection;
    DSRestConnectionAWS: TDSRestConnection;
    DSRestConnectionApacheLocal: TDSRestConnection;
    DSRestConnectionApacheAWS: TDSRestConnection;
    procedure DataModuleCreate(Sender: TObject);
    private
    FInstanceOwner: Boolean;
    FSrvServerMetodosClient: TSrvServerMetodosClient;
    FSmTesteClient: TSmTesteClient;
    FSmMainClient: TSmMainClient;

    FSmAgendaClient: TSmAgendaClient;

    FSmEscolaClient: TSmEscolaClient;
    FSmResponsavelClient: TSmResponsavelClient;

    function GetSrvServerMetodosClient: TSrvServerMetodosClient;
    function GetSmTesteClient: TSmTesteClient;
    function GetSmMainClient: TSmMainClient;
    function GetSmEscolaClient: TSmEscolaClient;
    function GetSmResponsavelClient: TSmResponsavelClient;
    function GetSmAgendaClient: TSmAgendaClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SrvServerMetodosClient: TSrvServerMetodosClient read GetSrvServerMetodosClient write FSrvServerMetodosClient;
    property SmTesteClient: TSmTesteClient read GetSmTesteClient write FSmTesteClient;
    property SmMainClient: TSmMainClient read GetSmMainClient write FSmMainClient;

    property SmAgendaClient: TSmAgendaClient read GetSmAgendaClient write FSmAgendaClient;

    property SmEscolaClient: TSmEscolaClient read GetSmEscolaClient write FSmEscolaClient;
    property SmResponsavelClient: TSmResponsavelClient read GetSmResponsavelClient write FSmResponsavelClient;

end;

var
  RestClient: TRestClient;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses smGeralFMX, untLibDevicePortable;

{$R *.dfm}

constructor TRestClient.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

procedure TRestClient.DataModuleCreate(Sender: TObject);
begin
   //Windows
   if IsSysOSWindows then
   begin

    //Modo de Teste - Apache Local
    DSRestConnection1.Host := DSRestConnectionApacheLocal.Host;
    DSRestConnection1.UrlPath := DSRestConnectionApacheLocal.UrlPath;
    exit;


    //Modo de Teste - Server local stand alone
    {DSRestConnection1.Host := DSRestConnectionLocal.Host;
    DSRestConnection1.UrlPath := DSRestConnectionLocal.UrlPath;
    exit; }

    DSRestConnection1.Host := DSRestConnectionApacheAWS.Host;
    DSRestConnection1.UrlPath := DSRestConnectionApacheAWS.UrlPath;
  end;


  if not IsSysOSWindows then
  begin
    DSRestConnection1.Host := DSRestConnectionApacheAWS.Host;
    DSRestConnection1.UrlPath := DSRestConnectionApacheAWS.UrlPath;
  end;
end;

destructor TRestClient.Destroy;
begin
  FSrvServerMetodosClient.Free;
  FSmTesteClient.Free;
  FSmMainClient.Free;
  FSmEscolaClient.Free;
  FSmResponsavelClient.Free;
  FSmAgendaClient.Free;
  inherited;
end;

function TRestClient.GetSrvServerMetodosClient: TSrvServerMetodosClient;
begin
  if FSrvServerMetodosClient = nil then
    FSrvServerMetodosClient:= TSrvServerMetodosClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSrvServerMetodosClient;
end;
function TRestClient.GetSmTesteClient: TSmTesteClient;
begin
  if FSmTesteClient = nil then
    FSmTesteClient:= TSmTesteClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSmTesteClient;
end;
function TRestClient.GetSmMainClient: TSmMainClient;
begin
  if FSmMainClient = nil then
    FSmMainClient:= TSmMainClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSmMainClient;
end;
function TRestClient.GetSmAgendaClient: TSmAgendaClient;
begin
  if FSmAgendaClient = nil then
    FSmAgendaClient:= TSmAgendaClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSmAgendaClient;
end;

function TRestClient.GetSmEscolaClient: TSmEscolaClient;
begin
  if FSmEscolaClient = nil then
    FSmEscolaClient:= TSmEscolaClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSmEscolaClient;
end;
function TRestClient.GetSmResponsavelClient: TSmResponsavelClient;
begin
  if FSmResponsavelClient = nil then
    FSmResponsavelClient:= TSmResponsavelClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSmResponsavelClient;
end;


end.

