unit AndroidServiceDMUnt;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Android.Service,
  AndroidApi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os;

type
  TAndroidServiceDM = class(TAndroidService)
    function AndroidServiceStartCommand(const Sender: TObject;
      const Intent: JIntent; Flags, StartId: Integer): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AndroidServiceDM: TAndroidServiceDM;

implementation


{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}
uses Androidapi.JNI.App;

function TAndroidServiceDM.AndroidServiceStartCommand(const Sender: TObject;
  const Intent: JIntent; Flags, StartId: Integer): Integer;
begin
  Result := TJService.JavaClass.START_STICKY; // Manterá o serviço executando
end;

end.
