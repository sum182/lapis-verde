unit untPrincipalTeste;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Layouts,smFrmBaseForAll,
  FMX.ListBox, FMX.Objects;

type
  TfrmPrincipalTeste = class(TfrmBaseForAll)
    layPrincipal: TLayout;
    MultiView1: TMultiView;
    lstMnuMain: TListBox;
    lstGroupHeaderTestes: TListBoxGroupHeader;
    lstItemTesteClientes: TListBoxItem;
    lstGroupHeaderConfig: TListBoxGroupHeader;
    lstItemConta: TListBoxItem;
    lstItemPreferencias: TListBoxItem;
    lstItemTesteString: TListBoxItem;
    lstItemTesteFornecedores: TListBoxItem;
    lstItemTesteProdutos: TListBoxItem;
    lstItemTesteJsonFdMem: TListBoxItem;
    lstItemTesteJsonSQLite: TListBoxItem;
    ToolBarPincipal: TToolBar;
    btnMenu: TSpeedButton;
    lblTitulo: TLabel;
    layToolBarMenu: TLayout;
    layMenu: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    imgMenu: TImage;
    lstGroupFooter: TListBoxGroupFooter;
    lstItemTesteLogin: TListBoxItem;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lstItemTesteClientesClick(Sender: TObject);
    procedure lstItemTesteProdutosClick(Sender: TObject);
    procedure lstItemTesteStringClick(Sender: TObject);
    procedure lstItemTesteJsonFdMemClick(Sender: TObject);
    procedure lstItemTesteJsonSQLiteClick(Sender: TObject);
    procedure lstItemTesteFornecedoresClick(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure lstItemTesteLoginClick(Sender: TObject);
    procedure lstItemAgendaClick(Sender: TObject);
    procedure lstItemMensagemClick(Sender: TObject);
    procedure lblAgendaClick(Sender: TObject);
    procedure lblMensagensClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    fShowForm:Boolean;
    fShowMenuPrincipal:Boolean;
    fActiveForm: TForm;
    fAllowCloseForm : Boolean;
    LayoutBase, btnVoltarForms: TComponent;

    procedure BotaoVoltarOnClick(Sender: TObject);
    procedure ShowMenuPrincipal;
    procedure HideMenuPrincipal;
    procedure AbrirAgenda;
    procedure AbrirMensagens;
  protected

  public
     procedure OpenForm(aFormClass: TComponentClass);
  end;

var
  frmPrincipalTeste: TfrmPrincipalTeste;

implementation

{$R *.fmx}

uses untTesteString, untTesteJsonFdMem, untTesteClientes, untTesteFornecedores, untTesteProduto, untTesteJsonXSqLite, untLogin,
  untFuncoes, untDMStyles, untDM, untAgendaEscolaView, untMensagens, smGeralFMX,
  untAgendaEscolaSelect, untAgendaEscolaAdd, untTestesA;

{ TfrmPrincipal }

procedure TfrmPrincipalTeste.OpenForm(AFormClass: TComponentClass);
begin
  if Assigned(fActiveForm)then
  begin
    if fActiveForm.ClassType = AFormClass then
    begin
      //exit
      fActiveForm.DisposeOf;
      fActiveForm := nil;
    end
    else
    begin
      fActiveForm.DisposeOf;
      fActiveForm := nil;
    end;
  end;


  Application.CreateForm(AFormClass, fActiveForm);


  fShowMenuPrincipal:=False;
  fShowForm:=True;

  //Encontra o Layout Base no form a ser exibido para adicionar ao frmPrincipal
  LayoutBase := fActiveForm.FindComponent('layBase');
  if Assigned(LayoutBase) then
  begin
    layPrincipal.AddObject(TLayout(LayoutBase));
    layMenu.Visible:=False;
    layPrincipal.Visible:=True;
  end;

  btnVoltarForms := fActiveForm.FindComponent('btnVoltar');
  if Assigned(btnVoltarForms) then
    TControl(btnVoltarForms).OnClick := BotaoVoltarOnClick;

   MultiView1.HideMaster;
   ToolBarPincipal.Visible:=False;
end;


procedure TfrmPrincipalTeste.ShowMenuPrincipal;
begin
  layPrincipal.Visible:=False;
  layMenu.Visible:=True;
  ToolBarPincipal.Visible:=True;
  MultiView1.HideMaster;
  fShowMenuPrincipal:=True;
  fShowForm:=False;
end;

procedure TfrmPrincipalTeste.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   OpenForm(TfrmAgendaEscolaView);
end;

procedure TfrmPrincipalTeste.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmAgendaEscolaAdd);
end;

procedure TfrmPrincipalTeste.SpeedButton3Click(Sender: TObject);
begin
  AbrirAgenda;
end;

procedure TfrmPrincipalTeste.SpeedButton4Click(Sender: TObject);
begin
  AbrirMensagens;
end;

procedure TfrmPrincipalTeste.AbrirAgenda;
begin
  OpenForm(TfrmAgendaEscolaSelect);
end;

procedure TfrmPrincipalTeste.AbrirMensagens;
begin
  OpenForm(TfrmMensagens);
end;

procedure TfrmPrincipalTeste.BotaoVoltarOnClick(Sender: TObject);
begin
  ShowMenuPrincipal;
end;

procedure TfrmPrincipalTeste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmPrincipalTeste.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if (IsSysOSAndroid) or (IsSysOSiOS)then
    CanClose := fAllowCloseForm;
end;

procedure TfrmPrincipalTeste.FormCreate(Sender: TObject);
begin
  inherited;
  fAllowCloseForm:= False;
  SetStyle(Self);
  fShowMenuPrincipal:=True;
  fShowForm:=False;
end;


procedure TfrmPrincipalTeste.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;

  if Key = vkHardwareBack then
    //Caso o menu estiver aberto
    if (MultiView1.IsShowed) then
    begin
      Key := 0;
      MultiView1.HideMaster;
      Exit;
    end
    //Caso tenha algum form aberto
    else if (Assigned(fActiveForm) and not(fShowMenuPrincipal) and (fShowForm)) then
    begin
        Key := 0;
        BotaoVoltarOnClick(self);
    end
    else
      fAllowCloseForm:=True;
end;

procedure TfrmPrincipalTeste.FormShow(Sender: TObject);
begin
  inherited;
  frmLogin.DisposeOf;
  frmLogin:= nil;
end;

procedure TfrmPrincipalTeste.HideMenuPrincipal;
begin
  layPrincipal.Visible:=False;
  layMenu.Visible:=True;
  ToolBarPincipal.Visible:=True;
  MultiView1.HideMaster;
end;

procedure TfrmPrincipalTeste.imgMenuClick(Sender: TObject);
begin
  inherited;
  btnMenu.OnClick(self);
end;

procedure TfrmPrincipalTeste.lblAgendaClick(Sender: TObject);
begin
  inherited;
  AbrirAgenda;
end;

procedure TfrmPrincipalTeste.lblMensagensClick(Sender: TObject);
begin
  inherited;
  AbrirMensagens;
end;

procedure TfrmPrincipalTeste.lstItemTesteFornecedoresClick(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmTesteFornecedores);
end;

procedure TfrmPrincipalTeste.lstItemTesteProdutosClick(Sender: TObject);
begin
  inherited;
   OpenForm(TfrmTesteProduto);
end;

procedure TfrmPrincipalTeste.lstItemAgendaClick(Sender: TObject);
begin
  inherited;
  AbrirAgenda;
end;

procedure TfrmPrincipalTeste.lstItemMensagemClick(Sender: TObject);
begin
  inherited;
  AbrirMensagens;
end;

procedure TfrmPrincipalTeste.lstItemTesteClientesClick(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmTesteClientes);
end;

procedure TfrmPrincipalTeste.lstItemTesteStringClick(Sender: TObject);
begin
  inherited;
    OpenForm(TfrmTesteString);
end;

procedure TfrmPrincipalTeste.lstItemTesteJsonFdMemClick(Sender: TObject);
begin
  inherited;
    OpenForm(TfrmTesteJsonFdMem);
end;

procedure TfrmPrincipalTeste.lstItemTesteJsonSQLiteClick(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmTesteJsonXSqLite);
end;

procedure TfrmPrincipalTeste.lstItemTesteLoginClick(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmLogin);
end;

end.
