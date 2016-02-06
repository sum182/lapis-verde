unit Login;

interface

uses
  {$Region 'FireDac'}
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FireDAC.Comp.UI, Data.Bind.Components, Data.Bind.DBScope,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  {$EndRegion}
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs,
  FMX.StdCtrls, FMX.MobilePreview, System.Rtti,
  REST.Backend.ServiceTypes, REST.Backend.MetaTypes, System.JSON,
  REST.OpenSSL, REST.Backend.ParseProvider, REST.Backend.Providers,
  REST.Backend.ServiceComponents,IPPeerClient, REST.Backend.ParseServices,
  FireDAC.Phys.SQLiteDef, System.IOUtils,
  {$IF DEFINED (IOS)}
  iOSapi.Foundation,
  Macapi.ObjectiveC
  {$ENDIF}
;


type
  TLogin = class
    private
      FSession        : TBackendEntityValue;
      FSessionStarted : Boolean;
    public
      constructor Create;
      destructor Destroy;
      function  Login(AUser, APassword: string): Boolean;
      function  Logout: Boolean;
      function  SignUp(AUser, APassword: string): Boolean;
    published
      property Session        : TBackendEntityValue read FSession          write FSession;
      property SessionStarted : Boolean             read FSessionStarted   write FSessionStarted;
  end;


implementation

{ TLogin }

uses UntLogin;

constructor TLogin.Create;
begin
  inherited Create;
  {$IFDEF DEBUG}
    FSessionStarted := True;
  {$ELSE}
    FSessionStarted := False;
  {$ENDIF}
end;

destructor TLogin.Destroy;
begin
  inherited Destroy;

end;

function TLogin.Login(AUser, APassword: string): Boolean;
var
  tmpSession : TBackendEntityValue;
begin
  try
    frmLogin.BackendUsers1.Users.LoginUser(AUser, APassword, tmpSession);
    FSession        := tmpSession;
    FSessionStarted := True;
    Result          := True;
    MessageDlg('Login efetuado com sucesso!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
  except on E:Exception do
    begin
      { Erro de usuário e senha }
      raise Exception.Create(E.Message);
      //if E.Message.Equals('Parse Error: invalid login parameters (101)') then
      //  raise Exception.Create('Usuário ou Senha inválidos!');
      Result := False;
    end;
  end;
end;

function TLogin.Logout: Boolean;
begin
  try
    frmLogin.BackendUsers1.Users.Logout;
    FSessionStarted := False;
    Result          := True;
    MessageDlg('Logout efetuado com sucesso!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
  except on E:Exception do
    begin
      { Erro de usuário e senha }
      raise Exception.Create(E.Message);
      //if E.Message.Equals('Parse Error: invalid login parameters (101)') then
      //  raise Exception.Create('Usuário ou Senha inválidos!');
      Result := False;
    end;
  end;
end;

function TLogin.SignUp(AUser, APassword: string): Boolean;
var
  Session : TBackendEntityValue;
begin
  try
    { Valida se nome de usuário já existe na base }
    frmLogin.BackendUsers1.Users.QueryUserName(AUser, Session);
    if Session.ObjectID.IsEmpty then
    begin
      { Cria o usuário já fazendo login na sessão }
      frmLogin.BackendUsers1.Users.SignupUser(AUser, APassword, nil, FSession);
      MessageDlg('Usuário e Senha cadastrado com sucesso!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
      FSessionStarted := True;
      Result          := True;
    end
    else
    begin
      MessageDlg('Nome de Usuário já existe. Por favor escolha outro!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
      Result := False;
    end;
  except on E:Exception do
    raise Exception.Create(E.Message);
  end;
end;

end.
