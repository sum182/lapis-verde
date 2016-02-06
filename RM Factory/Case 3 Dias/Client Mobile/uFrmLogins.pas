unit uFrmLogins;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBaseFull, FMX.Layouts, FMX.Effects, FMX.Controls.Presentation, FMX.Objects,
  FMX.Edit;

type
  TFrmLogin = class(TFrmBaseFull)
    lytClient: TLayout;
    LytFacaLogin: TLayout;
    ImgIconLogin: TImage;
    lblFacaLogin: TLabel;
    ImgLineLogin: TImage;
    lblInformeSenha: TLabel;
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
    lytTopCenter: TLayout;
    lytMiddleCenter: TLayout;
    lblSenha: TLabel;
    lblUsuario: TLabel;
    procedure EdtUserNameKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure EdtPasswordKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ImgBtnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation
uses
  FMX.VirtualKeyboard, FMX.Platform, uDM, uFrmHoteis;

{$R *.fmx}

procedure TFrmLogin.EdtUserNameKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  Keyboard: IFMXVirtualKeyboardService;
begin
  inherited;
  if Key = vkReturn then
  begin
    if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,Keyboard) then
    begin
      Keyboard.HideVirtualKeyboard;
    end;
  end;
end;

procedure TFrmLogin.EdtPasswordKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  Keyboard: IFMXVirtualKeyboardService;
begin
  inherited;
  if Key = vkReturn then
  begin
    if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,Keyboard) then
    begin
      Keyboard.HideVirtualKeyboard;
    end;
  end;
end;

procedure TFrmLogin.ImgBtnLoginClick(Sender: TObject);
begin
  inherited;
  if DM.Login(EdtUserName.Text,EdtPassword.Text) then
  begin
    EdtUserName.Text := EmptyStr;
    EdtPassword.Text := EmptyStr;
    if not Assigned(FrmHoteis) then
      Application.CreateForm(TFrmHoteis,FrmHoteis);
    FrmHoteis.Show;
  end
  else
  begin
    lblErrorLogin.Visible := True;
  end;
end;



end.
