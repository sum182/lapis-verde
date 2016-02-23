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
    lstgrpListas: TListBoxGroupHeader;
    lstClientes: TListBoxItem;
    lstgrpConfig: TListBoxGroupHeader;
    lstConta: TListBoxItem;
    lstPreferencias: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ToolBar1: TToolBar;
    btnMenu: TSpeedButton;
    imgUsuario: TImage;
    lblTitulo: TLabel;
    layToolBarMenu: TLayout;
    recBackground: TRectangle;
    layMenu: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    Image1: TImage;
    Label2: TLabel;
    Image2: TImage;
    Label3: TLabel;
    Image3: TImage;
    Label4: TLabel;
    Image4: TImage;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lstClientesClick(Sender: TObject);
    procedure ListBoxItem4Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem5Click(Sender: TObject);
    procedure ListBoxItem6Click(Sender: TObject);
    procedure lstContaClick(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
  private
    { Private declarations }
    FActiveForm: TForm;
    procedure AbreForm(aFormClass: TComponentClass);
    procedure ShowBackground(AParent: TFmxObject; AOnClick: TNotifyEvent = nil);
    procedure HideBackground;
    procedure BotaoVoltarOnClick(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses untTesteString, untTesteJsonFdMem, untTesteClientes, untTesteFornecedores, untTesteProduto, untTesteJsonXSqLite, untLogin,
  untFuncoes, untDMStyles, untDM;

{ TfrmPrincipal }

procedure TfrmPrincipal.AbreForm(AFormClass: TComponentClass);
var
  LayoutBase, BotaoMenu, BotaoVoltar: TComponent;
begin
  if Assigned(FActiveForm) then
  begin
    if FActiveForm.ClassType = AFormClass then
      exit
    else
    begin
      FActiveForm.DisposeOf;
      FActiveForm := nil;
    end;
  end;

  Application.CreateForm(AFormClass, FActiveForm);

  //Encontra o Layout Base no form a ser exibido para adicionar ao frmPrincipal
  LayoutBase := FActiveForm.FindComponent('layBase');
  if Assigned(LayoutBase) then
  begin
    layPrincipal.AddObject(TLayout(LayoutBase));
    layMenu.Visible:=False;
    layPrincipal.Visible:=True;
  end;

  //encontra o Botão de controle de Menu no form a ser exibido para
  //associá-lo ao MultiView do frmPrincipal
  //BotaoMenu := FActiveForm.FindComponent('btnMenu');
  //if Assigned(BotaoMenu) then
    //MultiView1.MasterButton := TControl(BotaoMenu);

  BotaoVoltar := FActiveForm.FindComponent('btnVoltar');
  if Assigned(BotaoVoltar) then
    TControl(BotaoVoltar).OnClick := BotaoVoltarOnClick;

   MultiView1.HideMaster;
   ToolBar1.Visible:=False;
end;


procedure TfrmPrincipal.BotaoVoltarOnClick(Sender: TObject);
var
  LayoutBase, BotaoMenu: TComponent;
begin
  layPrincipal.Visible:=False;
  layMenu.Visible:=True;
  ToolBar1.Visible:=True;
  MultiView1.HideMaster;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
  recBackground.Visible := False;
  recBackground.Align   := TAlignLayout.Contents;
end;

procedure TfrmPrincipal.HideBackground;
begin
  recBackground.AnimateFloat('opacity', 0, 0.1);
  recBackground.Visible := False;
end;

procedure TfrmPrincipal.ListBoxItem3Click(Sender: TObject);
begin
  inherited;
  AbreForm(TfrmTesteFornecedores);
end;

procedure TfrmPrincipal.ListBoxItem4Click(Sender: TObject);
begin
  inherited;
   AbreForm(TfrmTesteProduto);
end;

procedure TfrmPrincipal.lstClientesClick(Sender: TObject);
begin
  inherited;
  AbreForm(TfrmTesteClientes);
end;

procedure TfrmPrincipal.ListBoxItem2Click(Sender: TObject);
begin
  inherited;
    AbreForm(TfrmTesteString);
end;

procedure TfrmPrincipal.ListBoxItem5Click(Sender: TObject);
begin
  inherited;
    AbreForm(TfrmTesteJsonFdMem);
end;

procedure TfrmPrincipal.ListBoxItem6Click(Sender: TObject);
begin
  inherited;
  AbreForm(TfrmTesteJsonXSqLite);
end;

procedure TfrmPrincipal.lstContaClick(Sender: TObject);
begin
  inherited;
    AbreForm(TfrmLogin);
end;


procedure TfrmPrincipal.ShowBackground(AParent: TFmxObject;
  AOnClick: TNotifyEvent);
begin
  recBackground.OnClick := AOnClick;
  recBackground.Parent  := AParent;
  recBackground.BringToFront;
  recBackground.Opacity := 0;
  recBackground.Visible := True;
  recBackground.AnimateFloat('opacity', 0.5, 0.1);

end;

end.
