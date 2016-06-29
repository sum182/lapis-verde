unit untPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Layouts,smFrmBaseForAll,
  FMX.ListBox, FMX.Objects, untDmGetServer, untTesteGeralApp;

type
  TfrmPrincipal = class(TfrmBaseForAll)
    layPrincipal: TLayout;
    MultiView1: TMultiView;
    lstMnuMain: TListBox;
    lstGroupHeaderTestes: TListBoxGroupHeader;
    lstItemTesteGeralApp: TListBoxItem;
    ToolBarPincipal: TToolBar;
    btnMenu: TSpeedButton;
    lblTitulo: TLabel;
    layToolBarMenu: TLayout;
    layMenu: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    imgMenu: TImage;
    lstItemSobre: TListBoxItem;
    lstItemTesteLogin: TListBoxItem;
    imgAgenda: TImage;
    lblAgenda: TLabel;
    imgMeuPerfil: TImage;
    lblMensagens: TLabel;
    imgConfiguracoes: TImage;
    Label1: TLabel;
    imgSair: TImage;
    Label2: TLabel;
    imgEnviar: TImage;
    Label3: TLabel;
    lstItemUsuario: TListBoxItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lstItemTesteGeralAppClick(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure lstItemTesteLoginClick(Sender: TObject);
    procedure lstItemSobreClick(Sender: TObject);
    procedure imgAgendaClick(Sender: TObject);
    procedure imgMensagensClick(Sender: TObject);
    procedure lblAgendaClick(Sender: TObject);
    procedure lblMensagensClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure imgMeuPerfilClick(Sender: TObject);
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
    procedure Sair;
    procedure SetModoTeste;
    procedure SetUsuario;
  protected

  public
     procedure OpenForm(aFormClass: TComponentClass);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses untLogin,
  untLibDevicePortable, untDMStyles, untDM, untMensagens, smGeralFMX,
  untAgendaSelect, untAgendaAdd, untDmAgenda,
  untDmResponsavel, smMensagensFMX,smNetworkState
  //, untConfiguracoes

  , untPerfil, untTypes, untSobre;

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


procedure TfrmPrincipal.Sair;
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.SetModoTeste;
begin
  lstGroupHeaderTestes.Visible := IsModoTeste;
  lstItemTesteGeralApp.Visible := IsModoTeste;
  lstItemTesteLogin.Visible := IsModoTeste;
end;

procedure TfrmPrincipal.SetUsuario;
begin
  lstItemUsuario.Text:= 'Usuário: ' + Usuario.Nome;
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

procedure TfrmPrincipal.AbrirAgenda;
begin
  OpenForm(TfrmAgendaSelect);
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
  //if (IsSysOSAndroid) or (IsSysOSiOS)then
  CanClose := fAllowCloseForm;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  fAllowCloseForm:= True;
  SetStyle(Self);
  fShowMenuPrincipal:=True;
  fShowForm:=False;
  SetModoTeste;
  SetUsuario;
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
    begin
      Key := 0;
      Sair;
    end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  if Assigned(frmLogin) then
  begin
    frmLogin.Close;
    frmLogin.DisposeOf;
    frmLogin := nil;
  end;
end;

procedure TfrmPrincipal.HideMenuPrincipal;
begin
  layPrincipal.Visible:=False;
  layMenu.Visible:=True;
  ToolBarPincipal.Visible:=True;
  MultiView1.HideMaster;
end;

procedure TfrmPrincipal.imgSairClick(Sender: TObject);
begin
  inherited;
  Sair;
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

procedure TfrmPrincipal.imgMeuPerfilClick(Sender: TObject);
begin
  inherited;
  if Usuario.Tipo = Funcionario then
    OpenForm(TfrmPerfil);
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

procedure TfrmPrincipal.lstItemSobreClick(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmSobre);
end;



procedure TfrmPrincipal.lstItemTesteGeralAppClick(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmTesteGeralApp);
end;

procedure TfrmPrincipal.lstItemTesteLoginClick(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmLogin);
end;


end.
