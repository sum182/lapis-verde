unit untLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseForAll, FMX.Effects, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, smCrypt, FMX.ListBox,
  FMX.TabControl;

type
  TfrmLogin = class(TfrmBaseForAll)
    layBase: TLayout;
    edtUsuario: TEdit;
    lblUsuario: TLabel;
    layUsuario: TLayout;
    laySenha: TLayout;
    edtSenha: TEdit;
    lblSenha: TLabel;
    layBotoes: TLayout;
    SpeedButton1: TSpeedButton;
    ImgBtnLogin: TImage;
    lblErrorLogin: TLabel;
    ShadowEffect2: TShadowEffect;
    lblStatus: TLabel;
    procedure ImgBtnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtUsuarioChange(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure edtUsuarioChangeTracking(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);
    procedure edtSenhaChangeTracking(Sender: TObject);
  private
    fLogin: string;
    fSenha: string;
    function LoginResponsavel: boolean;
    function LoginFuncionario: boolean;
    procedure OpenFrmPrincipal;
    function Dologon: boolean;
    procedure SetLabelsEdits;

  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses untDM, Proxy, untModuloCliente, untPrincipal, FMX.VirtualKeyboard,
  FMX.Platform;

function TfrmLogin.Dologon: boolean;
var
  LogIn: TfrmLogin;
begin
  LogIn := TfrmLogin.Create(nil);
  LogIn.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      // ModalResult:=True;

      // if ModalResult = mrOK then begin
      if True then
      begin
        ShowMessage('Welcome');
        Application.CreateForm(TfrmPrincipal, frmPrincipal);
        LogIn.DisposeOf;
      end;
      LogIn.DisposeOf;
    end);
end;

procedure TfrmLogin.edtUsuarioChange(Sender: TObject);
begin
  inherited;
  SetLabelsEdits;

end;

procedure TfrmLogin.edtUsuarioChangeTracking(Sender: TObject);
begin
  inherited;
  SetLabelsEdits;
end;

procedure TfrmLogin.edtUsuarioExit(Sender: TObject);
begin
  inherited;
  SetLabelsEdits;
end;

procedure TfrmLogin.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
var
  Keyboard: IFMXVirtualKeyboardService;
begin
  inherited;
  SetLabelsEdits;
  if Key = vkReturn then
  begin
    if TPlatformServices.Current.SupportsPlatformService
      (IFMXVirtualKeyboardService, Keyboard) then
    begin
      Keyboard.HideVirtualKeyboard;
    end;
  end;

end;

procedure TfrmLogin.edtSenhaChange(Sender: TObject);
begin
  inherited;
  SetLabelsEdits;
end;

procedure TfrmLogin.edtSenhaChangeTracking(Sender: TObject);
begin
  inherited;
  SetLabelsEdits;
end;

procedure TfrmLogin.edtSenhaExit(Sender: TObject);
begin
  inherited;
  SetLabelsEdits;
end;

procedure TfrmLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
var
  Keyboard: IFMXVirtualKeyboardService;
begin
  inherited;
  SetLabelsEdits;
  if Key = vkReturn then
  begin
    if TPlatformServices.Current.SupportsPlatformService
      (IFMXVirtualKeyboardService, Keyboard) then
    begin
      Keyboard.HideVirtualKeyboard;
    end;
  end;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  // Dologon;
  lblErrorLogin.Visible := False;
end;

procedure TfrmLogin.ImgBtnLoginClick(Sender: TObject);
begin
  lblErrorLogin.Visible := False;
  fLogin := edtUsuario.Text;
  fSenha := Encrypt(edtSenha.Text);

  if LoginResponsavel then
  begin
    DM.fUsuarioLogadoIsResponsavel := True;
    DM.fUsuarioLogadoIsFuncionario := False;
    lblStatus.Text := 'Login OK - Responsavel';
    // ModalResult := mrOk;

    OpenFrmPrincipal;
  end
  else if LoginFuncionario then
  begin
    DM.fUsuarioLogadoIsResponsavel := False;
    DM.fUsuarioLogadoIsFuncionario := True;
    lblStatus.Text := 'Login OK - Funcionario';
    edtUsuario.Text := EmptyStr;
    edtSenha.Text := EmptyStr;
    // ModalResult := mrOk;

    OpenFrmPrincipal;
  end
  else
  begin
    edtUsuario.Text := EmptyStr;
    edtSenha.Text := EmptyStr;
    lblStatus.Text := 'Login Erro';
    lblErrorLogin.Visible := True;
    ModalResult := mrCancel;

  end;
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
  frmLogin.DisposeOf;
  frmLogin := nil;

  if not Assigned(frmPrincipal) then
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
  frmPrincipal.Show;

end;

procedure TfrmLogin.SetLabelsEdits;
begin
  lblUsuario.Visible := (edtUsuario.Text = '');
  lblSenha.Visible := (edtSenha.Text = '');
end;

procedure TfrmLogin.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DM.fUsuarioLogadoIsResponsavel := False;
  DM.fUsuarioLogadoIsFuncionario := True;
  lblStatus.Text := 'Login OK - Funcionario';
  edtUsuario.Text := EmptyStr;
  edtSenha.Text := EmptyStr;
  // ModalResult := mrOk;

  OpenFrmPrincipal;

end;

end.
