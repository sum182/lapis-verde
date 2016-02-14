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
    fgActivityDialog: TfgActivityDialog;
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
  private
    FActivityDialogThread: TThread;
    fLoginOK:boolean;
    fLogin: string;
    fSenha: string;
    function LoginResponsavel: boolean;
    function LoginFuncionario: boolean;
    procedure OpenFrmPrincipal;
    procedure Login;

  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses untDM, Proxy, untModuloCliente, untPrincipal, FMX.VirtualKeyboard,
  FMX.Platform, untFuncoes;

procedure TfrmLogin.btnCriarContaClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Criar conta...')
end;

procedure TfrmLogin.btnEsqueceuSenhaClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Esqueceu sua senha...');
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
 if not fgActivityDialog.IsShown then
  begin
    FActivityDialogThread := TThread.CreateAnonymousThread(procedure
      begin
        try
          TThread.Synchronize(nil, procedure
          begin
            layBase.Enabled:=False;
            fgActivityDialog.Message := 'Entrando';
            fgActivityDialog.Show;
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
                fgActivityDialog.Hide;
                Application.ProcessMessages;
              end
              else
              begin
                fgActivityDialog.Hide;
                layBase.Enabled:=True;
                Application.ProcessMessages;

                lblErrorLogin.Visible := True;
                KeyboardHide;
                edtSenha.Text:= EmptyStr;
                edtSenha.SetFocus;

              end;
            end);
        end;
      end);
    FActivityDialogThread.FreeOnTerminate := False;
    FActivityDialogThread.Start;
  end;



{ Código antigo

  layBase.Enabled:=False;
  AniIndicator.Visible := True;
  AniIndicator.Enabled := True;
  Application.ProcessMessages;


  TThread.CreateAnonymousThread(procedure
  begin
    try
      Login;
    finally
      layBase.Enabled:=True;
      AniIndicator.Visible := False;
      AniIndicator.Enabled := False;
      Application.ProcessMessages;
    end;
  end).Start;

  Application.ProcessMessages;

  }
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
  SetStyle(Self);
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  inherited;
  lblErrorLogin.Visible:=False;
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
  KeyboardHide;
  btnLogin.SetFocus;
  lblErrorLogin.Visible := False;
  fLogin := edtUsuario.Text;
  fSenha := Encrypt(edtSenha.Text);

  if LoginResponsavel then
  begin
    DM.fUsuarioLogadoIsResponsavel := True;
    DM.fUsuarioLogadoIsFuncionario := False;
    fLoginOk:=True;
    //OpenFrmPrincipal;
  end
  else if LoginFuncionario then
  begin
    fLoginOk:=True;
    DM.fUsuarioLogadoIsResponsavel := False;
    DM.fUsuarioLogadoIsFuncionario := True;
    //OpenFrmPrincipal;
  end ;
 { else
  begin

    lblErrorLogin.Visible := True;
    //layBase.Enabled:=True;
    //AniIndicator.Visible := False;
    //AniIndicator.Enabled := False;
    //Application.ProcessMessages;
    KeyboardHide;
    edtSenha.Text:= EmptyStr;
    edtSenha.SetFocus;
  end; }
end;

function TfrmLogin.LoginFuncionario: boolean;
begin
  Result := ModuloCliente.SrvServerMetodosClient.LoginFuncionario
    (fLogin, fSenha)
end;

function TfrmLogin.LoginResponsavel: boolean;
begin
  Result := ModuloCliente.SrvServerMetodosClient.LoginResponsavel
    (fLogin, fSenha);
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


end.
