unit uFrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Effects,
  FMX.Edit;

type
  TFrmLogin = class(TForm)
    Layout1: TLayout;
    ImgIconRM: TImage;
    imgTitle: TImage;
    lblTitleHome: TLabel;
    ShadowEffect1: TShadowEffect;
    imgLineTop: TImage;
    lytCenter: TLayout;
    LytFacaLogin: TLayout;
    ImgIconLogin: TImage;
    lblFacaLogin: TLabel;
    Image1: TImage;
    Label1: TLabel;
    lytLogin: TLayout;
    RoundRect1: TRoundRect;
    GlowEffect1: TGlowEffect;
    RoundRect2: TRoundRect;
    Label2: TLabel;
    GlowEffect2: TGlowEffect;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Image2: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

end.
