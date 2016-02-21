unit untLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseForAll,smGeralFMX, FMX.Effects, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, smCrypt, FMX.ListBox,
  FMX.TabControl, FGX.ProgressDialog;

type
  TfrmLogin = class(TfrmBaseForAll)
    layBase: TLayout;
    layUsuario: TLayout;
    laySenha: TLayout;
    layBotoes: TLayout;
    lblErrorLogin: TLabel;
    edtSenha: TEdit;
    edtUsuario: TEdit;
    btnLogin: TSpeedButton;
    lauCabecalho: TLayout;
    layStatus: TLayout;
    VertScrollBox1: TVertScrollBox;
    Label1: TLabel;
    imgUsuario: TImage;
    imgSenha: TImage;
    layContaUsuario: TLayout;
    btnEsqueceuSenha: TSpeedButton;
    Layout1: TLayout;
    btnCriarConta: TSpeedButton;
    Layout2: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtSenhaExit(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblEsqueceuSenhaDblClick(Sender: TObject);
    procedure lblCriarContaDblClick(Sender: TObject);
    procedure btnEsqueceuSenhaClick(Sender: TObject);
    procedure btnCriarContaClick(Sender: TObject);
    procedure edtUsuarioChange(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);
  private
    FActivityDialogThread: TThread;
    fLoginOK:boolean;
    fLogin: string;
    fSenha: string;
    function LoginResponsavel: boolean;
    function LoginFuncionario: boolean;
    procedure OpenFrmPrincipal;
    procedure Login;
    function GetTextoLogin:String;
    procedure SetStateButtons;

  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses untDM, Proxy, untModuloCliente, untPrincipal, FMX.VirtualKeyboard,
  FMX.Platform, untFuncoes, untDMStyles, untCriarConta;

procedure TfrmLogin.btnCriarContaClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCriarConta, frmCriarConta);
  frmCriarConta.Show;
end;

procedure TfrmLogin.btnEsqueceuSenhaClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Esqueceu sua senha...');
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
 if not DM.fgActivityDialog.IsShown then
  begin
    FActivityDialogThread := TThread.CreateAnonymousThread(procedure
      begin
        try
          TThread.Synchronize(nil, procedure
          begin
            layBase.Enabled:=False;
            DM.fgActivityDialog.Message := 'Entrando';
            DM.fgActivityDialog.Show;
          end);

          Login;

          if TThread.CheckTerminated then
            Exit;


        finally
          if not TThread.CheckTerminated then
            TThread.Synchronize(nil, procedure
            begin
              if fLoginOk then
              begin
                OpenFrmPrincipal;
                DM.fgActivityDialog.Hide;
                Application.ProcessMessages;
              end
              else
              begin
                DM.fgActivityDialog.Hide;
                layBase.Enabled:=True;
                Application.ProcessMessages;

                lblErrorLogin.Visible := True;
                edtSenha.Text:= EmptyStr;
                //edtSenha.SetFocus;
                KeyboardHide;
              end;
            end);
        end;
      end);
    FActivityDialogThread.FreeOnTerminate := False;
    FActivityDialogThread.Start;
  end;
end;


procedure TfrmLogin.edtUsuarioChange(Sender: TObject);
begin
  inherited;
  SetStateButtons;
end;

procedure TfrmLogin.edtUsuarioExit(Sender: TObject);
begin
  inherited;
  KeyboardHide;
end;

procedure TfrmLogin.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkReturn then
    KeyboardHide;

end;


procedure TfrmLogin.edtSenhaChange(Sender: TObject);
begin
  inherited;
  SetStateButtons;
end;

procedure TfrmLogin.edtSenhaExit(Sender: TObject);
begin
  inherited;
  KeyboardHide;
end;

procedure TfrmLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  Keyboard: IFMXVirtualKeyboardService;
begin
  inherited;
  if Key = vkReturn then
    KeyboardHide;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  lblErrorLogin.Visible := False;
  btnEsqueceuSenha.Visible:=False;
  SetStyle(Self);
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  inherited;
  lblErrorLogin.Visible:=False;
  SetStateButtons;
end;


function TfrmLogin.GetTextoLogin: String;
var
  Login:string;
  LoginPorEmail:boolean;
begin
  Login:= edtUsuario.Text;

  LoginPorEmail:= ( pos('@',Login)>0) ;
  if not(LoginPorEmail) then
    Login:= StringReplace(Login,'.','',[rfReplaceAll]);

  Result := Login;
end;

procedure TfrmLogin.lblCriarContaDblClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Criar Conta!');
end;

procedure TfrmLogin.lblEsqueceuSenhaDblClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Esqueceu sua senha?');
end;

procedure TfrmLogin.Login;
begin
  fLoginOK:=False;
  KeyboardHide;
  btnLogin.SetFocus;
  lblErrorLogin.Visible := False;
  fLogin := GetTextoLogin;
  fSenha := Encrypt(edtSenha.Text);

  if LoginResponsavel then
  begin
    DM.fUsuarioLogadoIsResponsavel := True;
    DM.fUsuarioLogadoIsFuncionario := False;
    fLoginOk:=True;
  end
  else if LoginFuncionario then
  begin
    fLoginOk:=True;
    DM.fUsuarioLogadoIsResponsavel := False;
    DM.fUsuarioLogadoIsFuncionario := True;
  end ;
end;

function TfrmLogin.LoginFuncionario: boolean;
begin
  try
    try
      Result := ModuloCliente.SrvServerMetodosClient.LoginFuncionario
      (fLogin, fSenha) ;
    finally
       //
    end;
  except
  on E:Exception do
    begin
      showmessage('Erro ao realizar o Login.');
      fLoginOk:=False;
    end;
  end;
end;

function TfrmLogin.LoginResponsavel: boolean;
begin
  try
    try
       Result := ModuloCliente.SrvServerMetodosClient.LoginResponsavel
    (fLogin, fSenha);
    finally
       //
    end;
  except
  on E:Exception do
    begin
      showmessage('Erro ao realizar o Login.');
      fLoginOk:=False;
    end;
  end;
end;

procedure TfrmLogin.OpenFrmPrincipal;
begin
  if not (fLoginOK) then
    Exit;

  KeyboardHide;
  if not Assigned(frmPrincipal) then
    Application.CreateForm(TfrmPrincipal, frmPrincipal);

  frmPrincipal.Show;

  if IsSysOSWindows then
  begin
    frmLogin.DisposeOf;
    frmLogin := nil;
  end;
end;


procedure TfrmLogin.SetStateButtons;
begin
  btnLogin.Enabled := ( (edtUsuario.Text <> EmptyStr) and
                              (edtSenha.Text <> EmptyStr));
end;

end.
