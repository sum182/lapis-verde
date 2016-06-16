unit uSplashForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, untPrincipal, untDM, untDmAgenda,
  untDmGetServer, untDmResponsavel, untDmSaveServer, untDMStyles, untRestClient;

type
  TFormSplash = class(TForm)
    SplashImage: TImage;
    StartupTimer: TTimer;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure SplashImagePaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure StartupTimerTimer(Sender: TObject);
  private
    FInitialized: Boolean;
    procedure LoadMainForm;
  public
  end;

var
  FormSplash: TFormSplash;

implementation

uses
  System.Devices;

{$R *.fmx}

resourcestring
  SNotSuitableForDevice = 'The application is not suitable for this device!';

procedure TFormSplash.FormCreate(Sender: TObject);
begin
  StartupTimer.Enabled := false;
  StartupTimer.Interval := 2000; // can be changed to improve startup speed in later releases
end;

procedure TFormSplash.LoadMainForm;
type
  TFormClass = class of TForm;
var
  form: TForm;
  formClass: TFormClass;
begin
  formClass := nil;
  {case TDeviceInfo.ThisDevice.DeviceClass of
    TDeviceInfo.TDeviceClass.Desktop: formClass := TMainFormDesktop;
    TDeviceInfo.TDeviceClass.Phone: formClass := TMainFormPhone;
    TDeviceInfo.TDeviceClass.Tablet: formClass := TMainFormTablet;
  end; }

  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TDmResponsavel, DmResponsavel);
  Application.CreateForm(TDmAgenda, DmAgenda);
  Application.CreateForm(TDMStyles, DMStyles);
  Application.CreateForm(TDmGetServer, DmGetServer);
  Application.CreateForm(TDmSaveServer, DmSaveServer);
  Application.CreateForm(TRestClient, RestClient);


  formClass := TfrmPrincipal;

  if formClass <> nil then begin
    form := formClass.Create(Application);
    form.Show;
    Application.MainForm := form;
  end
  else begin
    ShowMessage(SNotSuitableForDevice);
  end;
  Close;
end;

procedure TFormSplash.SplashImagePaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
  StartupTimer.Enabled := not FInitialized;
end;

procedure TFormSplash.StartupTimerTimer(Sender: TObject);
begin
  StartupTimer.Enabled := false;
  if not FInitialized then begin
    FInitialized := true;
    LoadMainForm;
  end;
end;

end.
