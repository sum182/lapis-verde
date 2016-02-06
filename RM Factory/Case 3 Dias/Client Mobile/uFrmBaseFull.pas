unit uFrmBaseFull;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.Layouts, FMX.Effects, FMX.Controls.Presentation, FMX.Objects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TFrmBaseFull = class(TFrmBase)
    imgLineTop: TImage;
    lblTitleHome: TLabel;
    ShadowEffect1: TShadowEffect;
    lytTop: TLayout;
    imgTitle: TImage;
    ImgIconRM: TImage;
    Layout1: TLayout;
    lblCopyRight: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBaseFull: TFrmBaseFull;

implementation

{$R *.fmx}

end.
