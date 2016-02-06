unit uDM;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, REST.Types;

type
  TDM = class(TDataModule)
    RestConnection: TRESTClient;
    RestReq: TRESTRequest;
    RestResp: TRESTResponse;
  private
    { Private declarations }
    FUserID: Integer;
    FHotelID: Integer;
    FDataReserva: TDate;
    procedure SetDataReserva(const Value: TDate);
    procedure SetHotelID(const Value: Integer);
  public
    { Public declarations }
    FLogado: Boolean;
    function Login(P_UserName, P_Password: String): Boolean;
    function GetHoteis: TJSONArray;
    function GetDays: TJSONArray;
    function GetReservas(Data: TDate): TJSONArray;
    procedure ResetRESTConnection;
    property HotelID: Integer read FHotelID write SetHotelID;
    property DataReserva: TDate read FDataReserva write SetDataReserva;
  end;

var
  DM: TDM;

const
  BASE_URL: String = 'http://www.rmfactory.com.br/services/';

implementation
uses
  DateUtils;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDM }

function TDM.GetDays: TJSONArray;
begin
  ResetRESTConnection;
  RestReq.Resource := 'hotel/reservas/{hotelid}';
  RestReq.Params.AddItem('hotelid',IntToStr(FHotelID), TRESTRequestParameterKind.pkURLSEGMENT);
  RestReq.Execute;
  Result := RESTResp.JSONValue as TJSONArray;
end;

function TDM.GetHoteis: TJSONArray;
begin
  ResetRESTConnection;
  RestReq.Resource := 'hotel/{userid}';
  RestReq.Params.AddItem('userid',IntToStr(FUserID), TRESTRequestParameterKind.pkURLSEGMENT);
  RestReq.Execute;
  Result := RESTResp.JSONValue as TJSONArray;
end;


function TDM.GetReservas(Data: TDate): TJSONArray;
begin
  ResetRESTConnection;
  RestReq.Resource := 'hotel/reservas/{hotelid}/{ano}/{mes}/{dia}';
  RestReq.Params.AddItem('hotelid',IntToStr(FHotelID), TRESTRequestParameterKind.pkURLSEGMENT);
  RestReq.Params.AddItem('ano',IntToStr(YearOf(Data)), TRESTRequestParameterKind.pkURLSEGMENT);
  RestReq.Params.AddItem('mes',IntToStr(MonthOf(Data)), TRESTRequestParameterKind.pkURLSEGMENT);
  RestReq.Params.AddItem('dia',IntToStr(DayOf(Data)), TRESTRequestParameterKind.pkURLSEGMENT);
  RestReq.Execute;
  Result := RESTResp.JSONValue as TJSONArray;
end;

function TDM.Login(P_UserName, P_Password: String): Boolean;
var
  ID: Integer;
  jObj: TJSONObject;
begin
  if (P_UserName <> EmptyStr) and (P_Password <> EmptyStr) then
  begin
    ResetRESTConnection;

    RestConnection.BaseURL := BASE_URL;
    RestReq.Resource := 'login/{user}/{password}';

    RestReq.Params.AddItem('user', P_UserName, TRESTRequestParameterKind.pkURLSEGMENT);
    RestReq.Params.AddItem('password', P_Password, TRESTRequestParameterKind.pkURLSEGMENT);
    RestReq.Execute;

    jObj := RestResp.JSONValue as TJSONObject;
    FUserID := StrToInt(jObj.GetValue('result').Value);
    Result := FUserID <> 0;
  end
  else
  begin
    Result := False;
  end;
end;

procedure TDM.ResetRESTConnection;
begin
  RestReq.ResetToDefaults;
  RestConnection.ResetToDefaults;
  RestResp.ResetToDefaults;
  RestConnection.BaseURL := BASE_URL;
end;

procedure TDM.SetDataReserva(const Value: TDate);
begin
  FDataReserva := Value;
end;


procedure TDM.SetHotelID(const Value: Integer);
begin
  FHotelID := Value;
end;

end.
