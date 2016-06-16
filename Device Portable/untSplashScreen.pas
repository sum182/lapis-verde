unit untSplashScreen;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseForAll, FMX.Objects, untPrincipal, smGeralFMX;

type
  TfrmSplashScreen = class(TfrmBaseForAll)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplashScreen: TfrmSplashScreen;

implementation

{$R *.fmx}

uses untLogin;

procedure TfrmSplashScreen.FormCreate(Sender: TObject);
begin
  inherited;
  fAllowCloseForm:=True;
end;

procedure TfrmSplashScreen.FormShow(Sender: TObject);
begin
  inherited;
 { Sleep(3000);
  if not Assigned(frmPrincipal) then
    Application.CreateForm(TfrmPrincipal, frmPrincipal);

  frmPrincipal.Show;

  if IsSysOSWindows then
  begin
    frmLogin.DisposeOf;
    frmLogin := nil;
  end;  }
end;

end.
