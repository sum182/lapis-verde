unit untLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseForAll,smGeralFMX, FMX.Effects, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, smCrypt, FMX.ListBox,
  FMX.TabControl;

type
  TfrmLogin = class(TfrmBaseForAll)
    layBase: TLayout;
    lblUsuario: TLabel;
    layUsuario: TLayout;
    laySenha: TLayout;
    lblSenha: TLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtUsuarioChange(Sender: TObject);
    procedure edtUsuarioChangeTracking(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtSenhaExit(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);
    procedure edtSenhaChangeTracking(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fLogin: string;
    fSenha: string;
    function LoginResponsavel: boolean;
    function LoginFuncionario: boolean;
    procedure OpenFrmPrincipal;
    procedure SetLabelsEdits;
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

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  inherited;
  Login;
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
  KeyboardHide;
end;

procedure TfrmLogin.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  SetLabelsEdits;
  if Key = vkReturn then
    KeyboardHide;

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
  KeyboardHide;
end;

procedure TfrmLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  Keyboard: IFMXVirtualKeyboardService;
begin
  inherited;
  SetLabelsEdits;
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
    OpenFrmPrincipal;
  end
  else if LoginFuncionario then
  begin
    DM.fUsuarioLogadoIsResponsavel := False;
    DM.fUsuarioLogadoIsFuncionario := True;
    edtUsuario.Text := EmptyStr;
    edtSenha.Text := EmptyStr;
    OpenFrmPrincipal;
  end
  else
  begin
    //edtUsuario.Text := EmptyStr;
    edtSenha.Text := EmptyStr;
    lblErrorLogin.Visible := True;
    //ShowMessage('O login e a senha que você digitou não coincidem.');
    ModalResult := mrCancel;
    KeyboardHide;
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
  edtUsuario.Text := EmptyStr;
  edtSenha.Text := EmptyStr;
   ModalResult := mrOk;

  OpenFrmPrincipal;

end;

end.
