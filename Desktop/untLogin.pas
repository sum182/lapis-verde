unit untLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxGroupBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, Vcl.Grids,
  Vcl.DBGrids, cxTextEdit, cxLabel, cxMaskEdit;

type
  TfrmLogin = class(TForm)
    cxGroupBox1: TcxGroupBox;
    btnLogin: TcxButton;
    cxGroupBox2: TcxGroupBox;
    edtSenha: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    btnCancelar: TcxButton;
    lblStatus: TcxLabel;
    edtLogin: TcxMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure edUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtSenhaPropertiesChange(Sender: TObject);
    procedure edtLoginPropertiesChange(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    procedure SetStateButtons;
    function GetTextoLogin:String;
    procedure Login;
    function ValidarEscolaAtiva:Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses untMenuPrincipal, untDM, smMensagens, smCrypt, untFuncoes;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  Login;
end;

procedure TfrmLogin.edSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    btnLogin.SetFocus;
end;

procedure TfrmLogin.edtLoginPropertiesChange(Sender: TObject);
begin
  SetStateButtons;

  {exit;
  if StrToIntDef(edtLogin.Text,0) > 0 then
    edtLogin.Properties.EditMask:= '999.999.999-99;0;_'
  else
    edtLogin.Properties.EditMask:= '';
  }
end;

procedure TfrmLogin.edtSenhaPropertiesChange(Sender: TObject);
begin
  SetStateButtons;
end;

procedure TfrmLogin.edUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then
    edtSenha.SetFocus;

end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  frmLogin.Caption:= GetNomeAplicacao + ' - ' + 'Login';
  lblStatus.Caption:= '';
  lblStatus.Visible:= False;
  edtLogin.SetFocus;
  SetStateButtons;
end;


function TfrmLogin.GetTextoLogin: String;
var
  Login:string;
  LoginPorEmail:boolean;
begin
  Login:= edtLogin.Text;

  LoginPorEmail:= ( pos('@',Login)>0) ;
  if not(LoginPorEmail) then
    Login:= StringReplace(Login,'.','',[rfReplaceAll]);

  Result := Login;
end;

procedure TfrmLogin.Login;
begin
  try
    try
      Screen.Cursor:= crHourGlass;
      Sleep(200);

      dm.fdqFuncionario.Close;
      dm.fdqFuncionario.ParamByName('login').AsString := GetTextoLogin;
      dm.fdqFuncionario.ParamByName('senha').AsString := Encrypt(edtSenha.Text);
      dm.fdqFuncionario.Open;

      //Login errado
      if (dm.fdqFuncionario.IsEmpty) then
      begin
        lblStatus.Visible:= True;
        lblStatus.Caption:= 'O login e a senha que você digitou não coincidem. ';
        edtLogin.SetFocus;
        Exit;
      end;

      //Escola Bloqueada
      if not ValidarEscolaAtiva then
        Exit;

      ModalResult := mrOk;
      lblStatus.Caption:= '';
      lblStatus.Visible:= False;
    except on E:Exception do
    begin
      Msg('Erro ao realizar o login!'+ #13 + E.Message,mtErro);
    end;
    end;
  finally
    Screen.Cursor:=crDefault;
  end;

end;

procedure TfrmLogin.SetStateButtons;
begin
  btnLogin.Enabled := ((edtSenha.Text <> '') and (edtLogin.Text <> ''));
end;


function TfrmLogin.ValidarEscolaAtiva: Boolean;
begin
  Result:= (DM.fdqEscola.FieldByName('ativo').AsString = 'S');

  if Result  then
    Exit;

  lblStatus.Visible:= True;
  lblStatus.Caption:= 'Escola bloqueada para utilização';
end;

end.
