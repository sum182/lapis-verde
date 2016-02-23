unit untCriarConta;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBase, FMX.Layouts, FMX.Controls.Presentation, FMX.TabControl, FMX.Edit,
  FMX.Objects,FMX.VirtualKeyboard, FMX.ListBox;

type
  TfrmCriarConta = class(TfrmBase)
    tbCtrlPrincipal: TTabControl;
    tbItemNome: TTabItem;
    tbItemEmail: TTabItem;
    tbItemSenha: TTabItem;
    ToolBarNome: TToolBar;
    lblTituloNome: TLabel;
    layRodapeNome: TLayout;
    layPrincipalNome: TLayout;
    btnProximaNome: TSpeedButton;
    edtNome: TEdit;
    edtSobrenome: TEdit;
    btnVoltarNome: TSpeedButton;
    tbItemTelefone: TTabItem;
    tbItemDadosPessoais: TTabItem;
    layNome: TLayout;
    laySobrenome: TLayout;
    layCabecalhoNome: TLayout;
    imgProximaNome: TImage;
    imgVoltarNome: TImage;
    layCabecalhoEmail: TLayout;
    layPrincipalEmail: TLayout;
    layEmail: TLayout;
    edtEmail: TEdit;
    layRodapeEmail: TLayout;
    btnProximaEmail: TSpeedButton;
    imgProximaEmail: TImage;
    btnVoltarEmail: TSpeedButton;
    imgVoltarEmail: TImage;
    ToolBarEmail: TToolBar;
    lblTituloEmail: TLabel;
    layCabecalhoSenha: TLayout;
    layPrincipalSenha: TLayout;
    layCriarSenha: TLayout;
    edtCriarSenha: TEdit;
    layConfirmarSenha: TLayout;
    edtConfirmarSenha: TEdit;
    layRodapeSenha: TLayout;
    btnProximaSenha: TSpeedButton;
    imgProximaSenha: TImage;
    btnVoltarSenha: TSpeedButton;
    imgVoltarSenha: TImage;
    ToolBarSenha: TToolBar;
    lblTituloSenha: TLabel;
    layCabecalhoTelefone: TLayout;
    layPrincipalTelefone: TLayout;
    layTelefone: TLayout;
    edtTelefone: TEdit;
    layRodapeTelefone: TLayout;
    btnProximaTelefone: TSpeedButton;
    imgProximaTelefone: TImage;
    btnVoltarTelefone: TSpeedButton;
    imgVoltarTelefone: TImage;
    ToolBarTelefone: TToolBar;
    lblTituloTelefone: TLabel;
    layCabecalhoDadosPessoais: TLayout;
    layPrincipalDadosPrincipais: TLayout;
    layCPF: TLayout;
    edtCPF: TEdit;
    layRG: TLayout;
    edtRG: TEdit;
    layRodapeDadosPrincipais: TLayout;
    btnFinalizar: TSpeedButton;
    imgFinalizar: TImage;
    btnVoltarDadosPessoais: TSpeedButton;
    imgVoltarDadosPessoais: TImage;
    ToolBarDadosPessoais: TToolBar;
    lblTituloDadosPessoais: TLabel;
    laySexo: TLayout;
    cmbSexo: TComboBox;
    lblSexo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnProximaNomeClick(Sender: TObject);
    procedure btnVoltarNomeClick(Sender: TObject);
    procedure imgProximaNomeClick(Sender: TObject);
    procedure imgVoltarNomeClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure edtSobrenomeChange(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtSobrenomeKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbSexoChange(Sender: TObject);
    procedure cmbSexoExit(Sender: TObject);
    procedure btnProximaEmailClick(Sender: TObject);
    procedure btnProximaSenhaClick(Sender: TObject);
    procedure btnVoltarEmailClick(Sender: TObject);
    procedure btnVoltarSenhaClick(Sender: TObject);
    procedure btnVoltarTelefoneClick(Sender: TObject);
    procedure btnVoltarDadosPessoaisClick(Sender: TObject);
    procedure btnProximaTelefoneClick(Sender: TObject);
    procedure imgVoltarEmailClick(Sender: TObject);
    procedure imgVoltarSenhaClick(Sender: TObject);
    procedure imgVoltarTelefoneClick(Sender: TObject);
    procedure imgVoltarDadosPessoaisClick(Sender: TObject);
    procedure imgProximaEmailClick(Sender: TObject);
    procedure imgProximaSenhaClick(Sender: TObject);
    procedure imgProximaTelefoneClick(Sender: TObject);
    procedure imgFinalizarClick(Sender: TObject);
    procedure edtEmailChange(Sender: TObject);
    procedure edtCriarSenhaChange(Sender: TObject);
    procedure edtConfirmarSenhaChange(Sender: TObject);
    procedure edtTelefoneChange(Sender: TObject);
    procedure edtCPFChange(Sender: TObject);
    procedure edtRGChange(Sender: TObject);
    procedure edtEmailKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtCriarSenhaKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtConfirmarSenhaKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtTelefoneKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtCPFKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtRGKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure cmbSexoKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtNomeChangeTracking(Sender: TObject);
    procedure cmbSexoClosePopup(Sender: TObject);
    procedure edtSobrenomeChangeTracking(Sender: TObject);
    procedure edtEmailChangeTracking(Sender: TObject);
    procedure edtCriarSenhaChangeTracking(Sender: TObject);
    procedure edtConfirmarSenhaChangeTracking(Sender: TObject);
    procedure edtTelefoneChangeTracking(Sender: TObject);
    procedure edtCPFChangeTracking(Sender: TObject);
    procedure edtRGChangeTracking(Sender: TObject);
    procedure cmbSexoClick(Sender: TObject);
    procedure cmbSexoDragEnd(Sender: TObject);
    procedure cmbSexoEnter(Sender: TObject);
  private
    procedure SetStateButtonsNome;
    procedure SetStateButtonsEmail;
    procedure SetStateButtonsSenha;
    procedure SetStateButtonsTelefone;
    procedure SetStateButtonsDadosPessoais;


  public
    { Public declarations }
  end;

var
  frmCriarConta: TfrmCriarConta;

implementation

{$R *.fmx}

uses smGeralFMX, untFuncoes, untDMStyles;

procedure TfrmCriarConta.btnProximaNomeClick(Sender: TObject);
begin
  inherited;
  tbCtrlPrincipal.ActiveTab := tbItemEmail;
end;

procedure TfrmCriarConta.btnVoltarNomeClick(Sender: TObject);
begin
  inherited;
  frmCriarConta.Close;
end;

procedure TfrmCriarConta.cmbSexoChange(Sender: TObject);
begin
  inherited;
  lblSexo.Visible:= cmbSexo.ItemIndex <> -1;
  SetStateButtonsDadosPessoais;
end;

procedure TfrmCriarConta.cmbSexoClick(Sender: TObject);
begin
  inherited;
  SetStateButtonsDadosPessoais;

end;

procedure TfrmCriarConta.cmbSexoClosePopup(Sender: TObject);
begin
  inherited;
  lblSexo.Visible:= cmbSexo.ItemIndex <> -1;

end;

procedure TfrmCriarConta.cmbSexoDragEnd(Sender: TObject);
begin
  inherited;
  SetStateButtonsDadosPessoais;

end;

procedure TfrmCriarConta.cmbSexoEnter(Sender: TObject);
begin
  inherited;
  lblSexo.Visible:=False;
end;

procedure TfrmCriarConta.cmbSexoExit(Sender: TObject);
begin
  inherited;
  lblSexo.Visible:= cmbSexo.ItemIndex <> -1;
end;

procedure TfrmCriarConta.cmbSexoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkReturn then
    KeyboardHide;
end;

procedure TfrmCriarConta.edtConfirmarSenhaChange(Sender: TObject);
begin
  inherited;
  SetStateButtonsSenha;
end;

procedure TfrmCriarConta.edtConfirmarSenhaChangeTracking(Sender: TObject);
begin
  inherited;
  SetStateButtonsSenha;
end;

procedure TfrmCriarConta.edtConfirmarSenhaKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkReturn then
    KeyboardHide;
end;

procedure TfrmCriarConta.edtCPFChange(Sender: TObject);
begin
  inherited;
  SetStateButtonsDadosPessoais;
end;

procedure TfrmCriarConta.edtCPFChangeTracking(Sender: TObject);
begin
  inherited;
  SetStateButtonsDadosPessoais;
end;

procedure TfrmCriarConta.edtCPFKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkReturn then
    KeyboardHide;
end;

procedure TfrmCriarConta.edtCriarSenhaChange(Sender: TObject);
begin
  inherited;
  SetStateButtonsSenha;
end;

procedure TfrmCriarConta.edtCriarSenhaChangeTracking(Sender: TObject);
begin
  inherited;
  SetStateButtonsSenha;
end;

procedure TfrmCriarConta.edtCriarSenhaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkReturn then
    KeyboardHide;
end;

procedure TfrmCriarConta.edtEmailChange(Sender: TObject);
begin
  inherited;
  SetStateButtonsEmail;
end;

procedure TfrmCriarConta.edtEmailChangeTracking(Sender: TObject);
begin
  inherited;
  SetStateButtonsEmail;
end;

procedure TfrmCriarConta.edtEmailKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkReturn then
    KeyboardHide;
end;

procedure TfrmCriarConta.edtNomeChange(Sender: TObject);
begin
  inherited;
  SetStateButtonsNome;
end;

procedure TfrmCriarConta.edtNomeChangeTracking(Sender: TObject);
begin
  inherited;
  SetStateButtonsNome;
end;

procedure TfrmCriarConta.edtNomeKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkReturn then
    KeyboardHide;
end;

procedure TfrmCriarConta.edtRGChange(Sender: TObject);
begin
  inherited;
  SetStateButtonsDadosPessoais;
end;

procedure TfrmCriarConta.edtRGChangeTracking(Sender: TObject);
begin
  inherited;
  SetStateButtonsDadosPessoais;
end;

procedure TfrmCriarConta.edtRGKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkReturn then
    KeyboardHide;
end;

procedure TfrmCriarConta.edtSobrenomeChange(Sender: TObject);
begin
  inherited;
  SetStateButtonsNome;
end;

procedure TfrmCriarConta.edtSobrenomeChangeTracking(Sender: TObject);
begin
  inherited;
  SetStateButtonsNome;
end;

procedure TfrmCriarConta.edtSobrenomeKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkReturn then
    KeyboardHide;
end;

procedure TfrmCriarConta.edtTelefoneChange(Sender: TObject);
begin
  inherited;
  SetStateButtonsTelefone;
end;

procedure TfrmCriarConta.edtTelefoneChangeTracking(Sender: TObject);
begin
  inherited;
  SetStateButtonsTelefone;
end;

procedure TfrmCriarConta.edtTelefoneKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if Key = vkReturn then
    KeyboardHide;
end;

procedure TfrmCriarConta.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
  tbCtrlPrincipal.ActiveTab:= tbItemNome;
  tbCtrlPrincipal.TabPosition:= TTabPosition.None;
end;

procedure TfrmCriarConta.FormShow(Sender: TObject);
begin
  inherited;
  SetStateButtonsNome;
  SetStateButtonsEmail;
  SetStateButtonsSenha;
  SetStateButtonsTelefone;
  SetStateButtonsDadosPessoais;

end;

procedure TfrmCriarConta.imgFinalizarClick(Sender: TObject);
begin
  inherited;
  btnFinalizar.OnClick(self);
end;

procedure TfrmCriarConta.imgProximaEmailClick(Sender: TObject);
begin
  inherited;
  btnProximaEmail.OnClick(self);
end;

procedure TfrmCriarConta.imgProximaNomeClick(Sender: TObject);
begin
  inherited;
  btnProximaNome.OnClick(self);
end;

procedure TfrmCriarConta.imgProximaSenhaClick(Sender: TObject);
begin
  inherited;
  btnProximaSenha.OnClick(self);
end;

procedure TfrmCriarConta.imgProximaTelefoneClick(Sender: TObject);
begin
  inherited;
  btnProximaTelefone.OnClick(self);
end;

procedure TfrmCriarConta.imgVoltarDadosPessoaisClick(Sender: TObject);
begin
  inherited;
  btnVoltarDadosPessoais.OnClick(self);
end;

procedure TfrmCriarConta.imgVoltarEmailClick(Sender: TObject);
begin
  inherited;
  btnVoltarEmail.OnClick(self);
end;

procedure TfrmCriarConta.imgVoltarNomeClick(Sender: TObject);
begin
  inherited;
  btnVoltarNome.OnClick(self);
end;

procedure TfrmCriarConta.imgVoltarSenhaClick(Sender: TObject);
begin
  inherited;
  btnVoltarSenha.OnClick(self);
end;

procedure TfrmCriarConta.imgVoltarTelefoneClick(Sender: TObject);
begin
  inherited;
  btnVoltarTelefone.OnClick(self);
end;

procedure TfrmCriarConta.SetStateButtonsDadosPessoais;
begin
  btnFinalizar.Enabled := ( (edtCPF.Text <> EmptyStr) and
                              (edtRG.Text <> EmptyStr)and
                              (cmbSexo.ItemIndex >= 0));

  imgFinalizar.Enabled := ( (edtCPF.Text <> EmptyStr) and
                              (edtRG.Text <> EmptyStr)and
                              (cmbSexo.ItemIndex >= 0));
end;

procedure TfrmCriarConta.SetStateButtonsEmail;
begin
  btnProximaEmail.Enabled := (edtEmail.Text <> EmptyStr);
  imgProximaEmail.Enabled := (edtEmail.Text <> EmptyStr);
end;

procedure TfrmCriarConta.SetStateButtonsNome;
begin
  btnProximaNome.Enabled := ( (edtNome.Text <> EmptyStr) and
                              (edtSobrenome.Text <> EmptyStr));

  imgProximaNome.Enabled := ( (edtNome.Text <> EmptyStr) and
                              (edtSobrenome.Text <> EmptyStr));

end;

procedure TfrmCriarConta.SetStateButtonsSenha;
begin
  btnProximaSenha.Enabled := ( (edtCriarSenha.Text <> EmptyStr) and
                              (edtConfirmarSenha.Text <> EmptyStr));

  imgProximaSenha.Enabled := ( (edtCriarSenha.Text <> EmptyStr) and
                              (edtConfirmarSenha.Text <> EmptyStr));

end;

procedure TfrmCriarConta.SetStateButtonsTelefone;
begin
  btnProximaTelefone.Enabled := (edtTelefone.Text <> EmptyStr);
  imgProximaTelefone.Enabled := (edtTelefone.Text <> EmptyStr);
end;

procedure TfrmCriarConta.btnProximaEmailClick(Sender: TObject);
begin
  inherited;
  tbCtrlPrincipal.ActiveTab := tbItemSenha;
end;

procedure TfrmCriarConta.btnVoltarEmailClick(Sender: TObject);
begin
  inherited;
  tbCtrlPrincipal.ActiveTab := tbItemNome;
end;

procedure TfrmCriarConta.btnProximaSenhaClick(Sender: TObject);
begin
  inherited;
    tbCtrlPrincipal.ActiveTab := tbItemTelefone;
end;

procedure TfrmCriarConta.btnVoltarSenhaClick(Sender: TObject);
begin
  inherited;
  tbCtrlPrincipal.ActiveTab := tbItemEmail;
end;

procedure TfrmCriarConta.btnProximaTelefoneClick(Sender: TObject);
begin
  inherited;
  tbCtrlPrincipal.ActiveTab := tbItemDadosPessoais;
end;

procedure TfrmCriarConta.btnVoltarTelefoneClick(Sender: TObject);
begin
  inherited;
  tbCtrlPrincipal.ActiveTab := tbItemSenha;
end;

procedure TfrmCriarConta.btnVoltarDadosPessoaisClick(Sender: TObject);
begin
  inherited;
  tbCtrlPrincipal.ActiveTab := tbItemTelefone;
end;

end.
