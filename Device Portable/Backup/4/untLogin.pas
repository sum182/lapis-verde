unit untLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, smFrmBaseForAll, FMX.Effects, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,smCrypt;

type
  TfrmLogin = class(TfrmBaseForAll)
    layBase: TLayout;
    lytLogin: TLayout;
    RoundRect1: TRoundRect;
    GlowEffect1: TGlowEffect;
    EdtUserName: TEdit;
    RoundRect2: TRoundRect;
    GlowEffect2: TGlowEffect;
    EdtPassword: TEdit;
    ImgBtnLogin: TImage;
    lblErrorLogin: TLabel;
    ShadowEffect2: TShadowEffect;
    lblSenha: TLabel;
    lblUsuario: TLabel;
    lblStatus: TLabel;
    procedure ImgBtnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fLogin:string;
    fSenha:string;
    function LoginResponsavel:boolean;
    function LoginFuncionario:boolean;
    procedure OpenFrmPrincipal;

  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses untDM, Proxy, untModuloCliente, untPrincipal;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  lblErrorLogin.Visible:=False;
end;

procedure TfrmLogin.ImgBtnLoginClick(Sender: TObject);
begin
  lblErrorLogin.Visible:=False;
  fLogin:= EdtUserName.Text;
  fSenha:= Encrypt(EdtPassword.Text);

  if  LoginResponsavel then
  begin
    DM.fUsuarioLogadoIsResponsavel:=True;
    DM.fUsuarioLogadoIsFuncionario:=False;
    lblStatus.Text:='Login OK - Responsavel';
    OpenFrmPrincipal;
  end
  else if LoginFuncionario then
  begin
    DM.fUsuarioLogadoIsResponsavel:=False;
    DM.fUsuarioLogadoIsFuncionario:=True;
    lblStatus.Text:='Login OK - Funcionario';
    EdtUserName.Text := EmptyStr;
    EdtPassword.Text := EmptyStr;
    OpenFrmPrincipal;
  end
  else
  begin
    EdtUserName.Text := EmptyStr;
    EdtPassword.Text := EmptyStr;
    lblStatus.Text:='Login Erro';
    lblErrorLogin.Visible := True;
  end;
end;

function TfrmLogin.LoginFuncionario: boolean;
begin
  Result:= ModuloCliente.SrvServerMetodosClient.LoginFuncionario(fLogin,fSenha)
end;

function TfrmLogin.LoginResponsavel: boolean;
begin
  Result:= ModuloCliente.SrvServerMetodosClient.LoginResponsavel(fLogin,fSenha);
end;

procedure TfrmLogin.OpenFrmPrincipal;
begin
  if not Assigned(frmPrincipal) then
    Application.CreateForm(TfrmPrincipal,frmPrincipal);
  frmPrincipal.Show;
end;

end.
