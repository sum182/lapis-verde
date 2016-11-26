unit untServerContainer;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Generics.Collections,Datasnap.DSSession;

type
  TServerContainer = class(TDataModule)
    DSServerClass1: TDSServerClass;
    DSServerClassTeste: TDSServerClass;
    DSServerClassEscola: TDSServerClass;
    DSServerClassResponsavel: TDSServerClass;
    DSServerClassMain: TDSServerClass;
    DSServerClassAgenda: TDSServerClass;
    FDConnection: TFDConnection;
    DSServer1: TDSServer;
    FDConnectionLocal: TFDConnection;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerClassTesteGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerClassMainGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerClassAgendaGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerClassEscolaGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerClassResponsavelGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServer1Disconnect(DSConnectEventObject: TDSConnectEventObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private

  public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetConnection : TFDConnection;

  end;

function DSServer: TDSServer;

var
 ServerContainer: TServerContainer;

implementation


{$R *.dfm}

uses  untServerMetodos, untSmTeste, untSmMain, untSmEscola,
  untSmResponsavel,untSmAgenda;

var
  FModule: TComponent;
  FDSServer: TDSServer;
  ListofConnection : TDictionary<NativeInt,TFDConnection>;

function DSServer: TDSServer;
begin
  Result := FDSServer;
end;

constructor TServerContainer.Create(AOwner: TComponent);
begin
  inherited;
  FDSServer := DSServer1;
end;

procedure TServerContainer.DataModuleCreate(Sender: TObject);
begin
  ListofConnection := TDictionary<NativeInt, TFDConnection>.Create;
  FDConnection.Close;
  FDConnectionLocal.Close;
end;

destructor TServerContainer.Destroy;
begin
  inherited;
  FDSServer := nil;
end;

procedure TServerContainer.DSServer1Disconnect(
  DSConnectEventObject: TDSConnectEventObject);
var
  dbconn: TFDConnection;
  ThreadSessionID : NativeInt;
begin
  ThreadSessionID:= TDSSessionManager.GetThreadSession.Id;
  if ListofConnection.ContainsKey(ThreadSessionID) then
   begin
      dbconn := ListofConnection.Items[ThreadSessionID];
      dbconn.Close;
      dbconn.Free;

      ListofConnection.Remove(ThreadSessionID);
   end;
end;

procedure TServerContainer.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := untServerMetodos.TSrvServerMetodos;
end;


procedure TServerContainer.DSServerClassAgendaGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := untSmAgenda.TSmAgenda;
end;

procedure TServerContainer.DSServerClassEscolaGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := untSmEscola.TSmEscola;
end;

procedure TServerContainer.DSServerClassMainGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := untSmMain.TSmMain;
end;

procedure TServerContainer.DSServerClassResponsavelGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := untSmResponsavel.TSmResponsavel;
end;

procedure TServerContainer.DSServerClassTesteGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := untSmTeste.TSmTeste;
end;

procedure TServerContainer.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL('call sp_set_time_zone;');;
end;

function TServerContainer.GetConnection: TFDConnection;
var
  dbconn : TFDConnection;
  ThreadSessionID : NativeInt;
begin
  ThreadSessionID:= TDSSessionManager.GetThreadSession.Id;
  if ListofConnection.ContainsKey(ThreadSessionID) then
     Result := ListofConnection[ThreadSessionID]
  else
  begin
    dbconn := TFDConnection.Create(nil);
    dbconn.Params.Clear;
    dbconn.Params := FDConnection.Params;
    dbconn.ResourceOptions := FDConnection.ResourceOptions;
    dbconn.FormatOptions.DataSnapCompatibility:=True;
    dbconn.LoginPrompt := false;
    dbconn.ExecSQL('call sp_set_time_zone;');
    ListofConnection.Add(ThreadSessionID, dbconn);
    Result := dbconn;
  end;
end;

initialization
  FModule := TServerContainer.Create(nil);
finalization
  FModule.Free;
end.

