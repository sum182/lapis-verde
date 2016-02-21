unit untCriarConta;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBase, FMX.Layouts, FMX.Controls.Presentation, FMX.TabControl, FMX.Edit,
  FMX.Objects,FMX.VirtualKeyboard;

type
  TfrmCriarConta = class(TfrmBase)
    tbCtrlPrincipal: TTabControl;
    tbItemNome: TTabItem;
    tbItemEmail: TTabItem;
    tbItemSenha: TTabItem;
    ToolBarNome: TToolBar;
    lblTituloNome: TLabel;
    ToolBar2: TToolBar;
    Label1: TLabel;
    ToolBar3: TToolBar;
    Label2: TLabel;
    layRodapeNome: TLayout;
    layPrincipalNome: TLayout;
    btnProximaNome: TSpeedButton;
    edtNome: TEdit;
    edtSobrenome: TEdit;
    btnVoltarNome: TSpeedButton;
    Telefone: TTabItem;
    tbItemDadosPessoais: TTabItem;
    layNome: TLayout;
    laySobrenome: TLayout;
    layCabecalhoNome: TLayout;
    imgProximaNome: TImage;
    imgVoltarNome: TImage;
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
  private
    procedure SetStateButtonsNome;
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

procedure TfrmCriarConta.edtNomeChange(Sender: TObject);
begin
  inherited;
  SetStateButtonsNome;
end;

procedure TfrmCriarConta.edtNomeKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  Keyboard: IFMXVirtualKeyboardService;
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

procedure TfrmCriarConta.edtSobrenomeKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  Keyboard: IFMXVirtualKeyboardService;
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
end;

procedure TfrmCriarConta.imgProximaNomeClick(Sender: TObject);
begin
  inherited;
  btnProximaNome.OnClick(self);
end;

procedure TfrmCriarConta.imgVoltarNomeClick(Sender: TObject);
begin
  inherited;
  btnVoltarNome.OnClick(self);
end;

procedure TfrmCriarConta.SetStateButtonsNome;
begin
  btnProximaNome.Enabled := ( (edtNome.Text <> EmptyStr) and
                              (edtSobrenome.Text <> EmptyStr));

  imgProximaNome.Enabled := ( (edtNome.Text <> EmptyStr) and
                              (edtSobrenome.Text <> EmptyStr));

end;

end.
