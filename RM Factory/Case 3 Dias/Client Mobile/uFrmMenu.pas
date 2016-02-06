unit uFrmMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Layouts, FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls,
  uFraButton, System.Actions, FMX.ActnList;

type
  TFrmMenu = class(TForm)
    tbctrlPrincipal: TTabControl;
    tbitemMenu: TTabItem;
    Image1: TImage;
    lytInferior: TLayout;
    recInferior: TRectangle;
    Image2: TImage;
    grdMenu: TGridLayout;
    Frame11: TFraButton;
    tbitemAuxiliar: TTabItem;
    lytPrincipal: TLayout;
    ActionList1: TActionList;
    actMudarAba: TChangeTabAction;
    procedure FormCreate(Sender: TObject);
    procedure Frame11imgIconClick(Sender: TObject);
  private
    { Private declarations }
    FActiveForm: TForm;
    procedure MostrarForm(AFormClass: TComponentClass);
    procedure AjustarLayout;
  public
    { Public declarations }
    procedure MudarAba(ATabItem: TTabItem; Sender: TObject);
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}

uses uFrmStatus, uDM;

procedure TFrmMenu.AjustarLayout;
var
  iWidth : Integer;
begin
  iWidth            := Self.ClientWidth - 20;
  grdMenu.ItemWidth := iWidth;
end;

procedure TFrmMenu.FormCreate(Sender: TObject);
var
  RS: TResourceStream;
  Img: String;
begin
  tbctrlPrincipal.TabPosition := TTabPosition.None;
  tbctrlPrincipal.ActiveTab   := tbitemMenu;
  AjustarLayout;
end;

procedure TFrmMenu.Frame11imgIconClick(Sender: TObject);
begin
  MostrarForm(TFrmStatus);
  MudarAba(tbitemAuxiliar, Sender);
end;

procedure TFrmMenu.MostrarForm(AFormClass: TComponentClass);
var
  LayoutBase : TComponent;
  BotaoMenu  : TComponent;
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

  Application.CreateForm(aFormClass, FActiveForm);

  LayoutBase := FActiveForm.FindComponent('lytBase');
  if Assigned(LayoutBase) then
    lytPrincipal.AddObject(TLayout(LayoutBase));
end;

procedure TFrmMenu.MudarAba(ATabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

end.
