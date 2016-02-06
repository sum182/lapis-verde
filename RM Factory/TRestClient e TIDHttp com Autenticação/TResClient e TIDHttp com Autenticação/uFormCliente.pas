unit uFormCliente;

interface

uses
	Vcl.Forms,
	Vcl.Dialogs,
	Vcl.Controls,
	System.Classes,
	Vcl.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IPPeerClient, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Client, REST.Authenticator.OAuth, System.JSON, System.SysUtils, 
  REST.Types, Data.DBXJSONReflect, REST.Authenticator.Basic;

type
	TFormCliente = class(TForm)
    btnGetLoginUsandoTIdHTTP: TButton;
    IdHTTP: TIdHTTP;
    btnGetLoginUsandoTRESTClient: TButton;
    HTTPBasicAuthenticator: THTTPBasicAuthenticator;
    RestReq: TRESTRequest;
    RestConnection: TRESTClient;
    RestResp: TRESTResponse;
    procedure btnGetLoginUsandoTIdHTTPClick(Sender: TObject);
    procedure btnGetLoginUsandoTRESTClientClick(Sender: TObject);
	private

	end;

const
	URL  : string = 'http://localhost:54201';
	Path : string = '/datasnap/rest/TDMServerMethods/';

implementation

{$R *.dfm}

uses uCM;

procedure TFormCliente.btnGetLoginUsandoTIdHTTPClick(Sender: TObject);
var
	_All  : string;

	_Ret  : string;

	function GetRetornoParser : string;
	var
		_Value : TJSONValue;
		_Obj   : TJSONObject;
		_Pair  : TJSONPair;
		_Ar    : TJSONArray;
	begin
		_Value := nil;

		try
			// Parser
			_Value := TJSONObject.ParseJSONValue (TEncoding.ASCII.GetBytes(_Ret), 0);

			_Obj  := TJSONObject(_Value);
			_Pair := _Obj.Pairs[0];
			_Ar   := TJSONArray(_Pair.JsonValue);

			_Ret := _Ar.Items[0].Value;

			Result := _Ret;
		finally
			_Value.Free;
		end;
	end;

	function GetDelimiter : string;
	begin
		Result := '/';
	end;

	function GetUser : string;
	begin
		Result := GetDelimiter + IdHTTP.Request.Username;
	end;

	function GetPW : string;
	begin
		Result := GetDelimiter + IdHTTP.Request.Password;
	end;
begin
	// Autenticação no Server
	IdHTTP.Request.Username := 'usuario';
	IdHTTP.Request.Password := 'senha';

	_All := URL + Path + 'GetLogin' + GetUser + GetPW;
	
	_Ret := IdHTTP.Get(_All);

	ShowMessage('Retorno puro: ' + _Ret);

	ShowMessage('Retorno Parser: ' + GetRetornoParser);
end;

procedure TFormCliente.btnGetLoginUsandoTRESTClientClick(Sender: TObject);

	procedure ResetRESTConnection;
	begin
		RestReq.ResetToDefaults;
		RestConnection.ResetToDefaults;
		RestResp.ResetToDefaults;
		RestConnection.BaseURL := URL + Path;
	end;

var
	jObj : TJSONObject;
	_Ret : string;
begin
	ResetRESTConnection;

	// Autenticação no Server
	HTTPBasicAuthenticator.Username := 'usuario';
	HTTPBasicAuthenticator.Password := 'senha';

	RestReq.Resource := 'GetLogin/{User}/{Password}';

	RestReq.Params.AddItem('User', HTTPBasicAuthenticator.Username, TRESTRequestParameterKind.pkURLSEGMENT);
	RestReq.Params.AddItem('Password', HTTPBasicAuthenticator.Username, TRESTRequestParameterKind.pkURLSEGMENT);
	RestReq.Execute;

	jObj := RestResp.JSONValue as TJSONObject;

	_Ret := jObj.GetValue('result').ToJSON;

	ShowMessage(_Ret);
end;

initialization
	RegisterClasses([TFormCliente]);

finalization;
	UnRegisterClasses([TFormCliente]);

end.
