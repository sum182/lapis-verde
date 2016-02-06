unit uFraButton;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Effects, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TFraButton = class(TFrame)
    lytFrMain: TLayout;
    lytLabels: TLayout;
    lblTitle: TLabel;
    lblSubtitle: TLabel;
    imgIcon: TImage;
    RoundRect2: TRoundRect;
    ShadowEffect1: TShadowEffect;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Title, SubTitle, Icon: String); reintroduce;
  end;

implementation

uses
  IOUtils;

{$R *.fmx}


{ TFraButton }

constructor TFraButton.Create(AOwner: TComponent; Title, SubTitle, Icon: String);
begin
  inherited Create(AOwner);
  lblTitle.Text := Title;
  lblSubtitle.Text := SubTitle;
  if TFile.Exists(Icon) then imgIcon.Bitmap.LoadFromFile(Icon);
end;

end.
