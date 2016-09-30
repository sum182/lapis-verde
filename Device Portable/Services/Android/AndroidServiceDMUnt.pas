unit AndroidServiceDMUnt;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Android.Service,
  AndroidApi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os,
  untTypes,
  untLibGeral;

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
  Usuario: TUsuario;

implementation


{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}
uses Androidapi.JNI.App;

function TAndroidServiceDM.AndroidServiceStartCommand(const Sender: TObject;
  const Intent: JIntent; Flags, StartId: Integer): Integer;
begin
  Result := TJService.JavaClass.START_STICKY; // Manterá o serviço executando
end;

initialization
  Usuario:= TUsuario.Create;
  Usuario.Tipo := Responsavel;
  Usuario.Id := 75;

end.
