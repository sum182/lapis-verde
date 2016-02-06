unit UntPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Layouts;

type
  TfrmPrincipal = class(TForm)
    MultiView1: TMultiView;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    layPrincipal: TLayout;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
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

uses UntClientes, UntFornecedores, UntProdutos;

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

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  AbreForm(TfrmClientes);
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  AbreForm(TfrmProdutos);
end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  AbreForm(TfrmFornecedores);
end;

end.
