unit untPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Layouts,smFrmBaseForAll;

type
  TfrmPrincipal = class(TfrmBaseForAll)
    MultiView1: TMultiView;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    layPrincipal: TLayout;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FActiveForm: TForm;
    procedure AbreForm(aFormClass: TComponentClass);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses untTesteString, untTesteJsonFdMem, untTesteClientes, untTesteFornecedores, untTesteProduto, untTesteJsonXSqLite, untLogin;

{ TfrmPrincipal }

procedure TfrmPrincipal.AbreForm(AFormClass: TComponentClass);
var
  LayoutBase, BotaoMenu: TComponent;
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
    layPrincipal.AddObject(TLayout(LayoutBase));

  //encontra o Botão de controle de Menu no form a ser exibido para
  //associá-lo ao MultiView do frmPrincipal
  BotaoMenu := FActiveForm.FindComponent('btnMenu');
  if Assigned(BotaoMenu) then
    MultiView1.MasterButton := TControl(BotaoMenu);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  AbreForm(TfrmTesteClientes);
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  AbreForm(TfrmTesteProduto);
end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  AbreForm(TfrmTesteFornecedores);
end;



procedure TfrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  AbreForm(TfrmTesteString);
end;

procedure TfrmPrincipal.SpeedButton5Click(Sender: TObject);
begin
  AbreForm(TfrmTesteJsonFdMem);
end;

procedure TfrmPrincipal.SpeedButton6Click(Sender: TObject);
begin
  AbreForm(TfrmTesteJsonXSqLite);
end;


procedure TfrmPrincipal.SpeedButton7Click(Sender: TObject);
begin
  AbreForm(TfrmLogin);
end;


end.
