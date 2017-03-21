unit untSplashScreen;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, untPrincipal, untDM, untDmAgenda,
  untDmGetServer, untDmResponsavel, untDmSaveServer, untDMStyles, untRestClient,
  untDMCloudMessaging, FMX.Layouts;

type
  TfrmSplashScreen = class(TForm)
    StartupTimer: TTimer;
    layLogotipo: TLayout;
    lblTituloApp: TLabel;
    SplashImage: TImage;
    procedure FormCreate(Sender: TObject);
    procedure SplashImagePaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure StartupTimerTimer(Sender: TObject);
  private
    FInitialized: Boolean;
    procedure LoadMainForm;
  public
  end;

var
  frmSplashScreen: TfrmSplashScreen;

implementation

uses
  System.Devices, untLogin, smGeralFMX, smMensagensFMX, untLibDevicePortable;

{$R *.fmx}

resourcestring
  SNotSuitableForDevice = 'The application is not suitable for this device!';

procedure TfrmSplashScreen.FormCreate(Sender: TObject);
begin

  {if IsSysOSWindows then
  begin
    SplashImage.MultiResBitmap.Clear;
    lblTituloApp.Text:= '';
  end;}

  StartupTimer.Enabled := false;
  StartupTimer.Interval := 1500; // can be changed to improve startup speed in later releases
end;

procedure TfrmSplashScreen.LoadMainForm;
type
  TFormClass = class of TForm;
var
  form: TForm;
  formClass: TFormClass;
  Thread: TThread;
begin
  formClass := nil;
  {case TDeviceInfo.ThisDevice.DeviceClass of
    TDeviceInfo.TDeviceClass.Desktop: formClass := TMainFormDesktop;
    TDeviceInfo.TDeviceClass.Phone: formClass := TMainFormPhone;
    TDeviceInfo.TDeviceClass.Tablet: formClass := TMainFormTablet;
  end; }

  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TDMCloudMessaging, DMCloudMessaging);
  Application.CreateForm(TDmResponsavel, DmResponsavel);
  Application.CreateForm(TDmAgenda, DmAgenda);
  Application.CreateForm(TDMStyles, DMStyles);
  Application.CreateForm(TDmGetServer, DmGetServer);
  Application.CreateForm(TDmSaveServer, DmSaveServer);
  Application.CreateForm(TRestClient, RestClient);

  Dm.fdqLoginUltimo.Close;
  Dm.fdqLoginUltimo.Open;

  formClass := TfrmLogin;

  if not(Dm.fdqLoginUltimo.IsEmpty) then
    if (Dm.fdqLoginUltimo.FieldByName('realizou_logoff').AsString <> 'S') then
    begin
      Dm.OpenConfiguracoesLoginUltimo;

      if not Configuracoes.DesconectarAoSair then
      begin
        formClass:=TfrmPrincipal;
        DM.LoginAuto;
      end
    end;

  if formClass <> nil then
  begin
    form := formClass.Create(Application);
    form.Show;
    Application.MainForm := form;
  end
  else
  begin
    ShowMessage(SNotSuitableForDevice);
  end;


  //Sync Geral
  if Dm.IsTesteApp then
    Exit;

  Dm.PrimeiroAcessoVerificar;
  {if PrimeiroAcessoOK then
  begin
    Thread := TThread.CreateAnonymousThread(
      procedure
      begin
        Dm.SyncronizarDadosServerGeral;
        MsgPoupUpTeste('TfrmSplashScreen SyncGeral - OK');
      end);
    Thread.Start;
  end;}

  Close;
end;

procedure TfrmSplashScreen.SplashImagePaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
  StartupTimer.Enabled := not FInitialized;
end;

procedure TfrmSplashScreen.StartupTimerTimer(Sender: TObject);
begin
  StartupTimer.Enabled := false;
  if not FInitialized then
  begin
    FInitialized := true;
    LoadMainForm;
  end;
end;

end.
