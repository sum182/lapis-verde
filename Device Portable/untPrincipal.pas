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
    ToolBarPincipal: TToolBar;
    btnMenu: TSpeedButton;
    imgUsuario: TImage;
    lblTitulo: TLabel;
    layToolBarMenu: TLayout;
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
    procedure OpenForm(aFormClass: TComponentClass);
    procedure BotaoVoltarOnClick(Sender: TObject);
    procedure ShowMenuPrincipal;
    procedure HideMenuPrincipal;

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

procedure TfrmPrincipal.OpenForm(AFormClass: TComponentClass);
var
  LayoutBase, BotaoVoltar: TComponent;
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

  BotaoVoltar := FActiveForm.FindComponent('btnVoltar');
  if Assigned(BotaoVoltar) then
    TControl(BotaoVoltar).OnClick := BotaoVoltarOnClick;

   MultiView1.HideMaster;
   ToolBarPincipal.Visible:=False;
end;


procedure TfrmPrincipal.ShowMenuPrincipal;
begin
  layPrincipal.Visible:=False;
  layMenu.Visible:=True;
  ToolBarPincipal.Visible:=True;
  MultiView1.HideMaster;
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

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
end;


procedure TfrmPrincipal.HideMenuPrincipal;
begin
  layPrincipal.Visible:=False;
  layMenu.Visible:=True;
  ToolBarPincipal.Visible:=True;
  MultiView1.HideMaster;

end;

procedure TfrmPrincipal.ListBoxItem3Click(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmTesteFornecedores);
end;

procedure TfrmPrincipal.ListBoxItem4Click(Sender: TObject);
begin
  inherited;
   OpenForm(TfrmTesteProduto);
end;

procedure TfrmPrincipal.lstClientesClick(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmTesteClientes);
end;

procedure TfrmPrincipal.ListBoxItem2Click(Sender: TObject);
begin
  inherited;
    OpenForm(TfrmTesteString);
end;

procedure TfrmPrincipal.ListBoxItem5Click(Sender: TObject);
begin
  inherited;
    OpenForm(TfrmTesteJsonFdMem);
end;

procedure TfrmPrincipal.ListBoxItem6Click(Sender: TObject);
begin
  inherited;
  OpenForm(TfrmTesteJsonXSqLite);
end;

procedure TfrmPrincipal.lstContaClick(Sender: TObject);
begin
  inherited;
    OpenForm(TfrmLogin);
end;


end.
