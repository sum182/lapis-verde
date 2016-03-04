unit untPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Layouts,smFrmBaseForAll,
  FMX.ListBox, FMX.Objects;

type
  TfrmPrincipal = class(TfrmBaseForAll)
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
    imgAgenda: TImage;
    lblAgenda: TLabel;
    imgMensagens: TImage;
    lblMensagens: TLabel;
    imgMenu: TImage;
    lstGroupHeaderPrincipal: TListBoxGroupHeader;
    lstGroupFooter: TListBoxGroupFooter;
    lstItemAgenda: TListBoxItem;
    lstItemMensagem: TListBoxItem;
    lstItemTesteLogin: TListBoxItem;
    SpeedButton1: TSpeedButton;
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
    procedure imgAgendaClick(Sender: TObject);
    procedure lstItemMensagemClick(Sender: TObject);
    procedure imgMensagensClick(Sender: TObject);
    procedure lblAgendaClick(Sender: TObject);
    procedure lblMensagensClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses untTesteString, untTesteJsonFdMem, untTesteClientes, untTesteFornecedores, untTesteProduto, untTesteJsonXSqLite, untLogin,
  untFuncoes, untDMStyles, untDM, untAgenda, untMensagens, smGeralFMX,
  untAgendaEscola;

{ TfrmPrincipal }

procedure TfrmPrincipal.OpenForm(AFormClass: TComponentClass);
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


procedure TfrmPrincipal.ShowMenuPrincipal;
begin
  layPrincipal.Visible:=False;
  layMenu.Visible:=True;
  ToolBarPincipal.Visible:=True;
  MultiView1.HideMaster;
  fShowMenuPrincipal:=True;
  fShowForm:=False;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   OpenForm(TfrmAgenda);
end;

procedure TfrmPrincipal.AbrirAgenda;
begin
  OpenForm(TfrmAgendaEscola);
end;

procedure TfrmPrincipal.AbrirMensagens;
begin
  OpenForm(TfrmMensagens);
end;

procedure TfrmPrincipal.BotaoVoltarOnClick(Sender: TObject);
begin
  ShowMenuPrincipal;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if (IsSysOSAndroid) or (IsSysOSiOS)then
    CanClose := fAllowCloseForm;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  fAllowCloseForm:= False;
  SetStyle(Self);
  fShowMenuPrincipal:=True;
  fShowForm:=False;
end;


procedure TfrmPrincipal.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  frmLogin.DisposeOf;
  frmLogin:= nil;
end;

procedure TfrmPrincipal.HideMenuPrincipal;
begin
  layPrincipal.Visible:=False;
  layMenu.Visible:=True;
  ToolBarPincipal.Visible:=True;
  MultiView1.HideMaster;
end;

procedure TfrmPrincipal.imgMensagensClick(Sender: TObject);
begin
  inherited;
  AbrirMensagens;
end;

procedure TfrmPrincipal.imgAgendaClick(Sender: TObject);
begin
  inherited;
  AbrirAgenda;
end;

procedure TfrmPrincipal.imgMenuClick(Sender: TObject);
begin
  inherited;
  btnMenu.OnClick(self);
end;

procedure TfrmPrincipal.lblAgendaClick(Sender: TObject);
begin
  inherited;
  AbrirAgenda;
end;

procedure TfrmPrincipal.lblMensagensClick(Sender: TObject);
begin
  inherited;
  AbrirMensagens;
end;

procedure TfrmPrincipal.lstItemTesteFornecedoresClick(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmTesteFornecedores);
end;

procedure TfrmPrincipal.lstItemTesteProdutosClick(Sender: TObject);
begin
  inherited;
   OpenForm(TfrmTesteProduto);
end;

procedure TfrmPrincipal.lstItemAgendaClick(Sender: TObject);
begin
  inherited;
  AbrirAgenda;
end;

procedure TfrmPrincipal.lstItemMensagemClick(Sender: TObject);
begin
  inherited;
  AbrirMensagens;
end;

procedure TfrmPrincipal.lstItemTesteClientesClick(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmTesteClientes);
end;

procedure TfrmPrincipal.lstItemTesteStringClick(Sender: TObject);
begin
  inherited;
    OpenForm(TfrmTesteString);
end;

procedure TfrmPrincipal.lstItemTesteJsonFdMemClick(Sender: TObject);
begin
  inherited;
    OpenForm(TfrmTesteJsonFdMem);
end;

procedure TfrmPrincipal.lstItemTesteJsonSQLiteClick(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmTesteJsonXSqLite);
end;

procedure TfrmPrincipal.lstItemTesteLoginClick(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmLogin);
end;

end.
