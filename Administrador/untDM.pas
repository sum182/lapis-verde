unit untDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI, Datasnap.Provider, Datasnap.DBClient, Vcl.ImgList,
  Vcl.Controls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxClasses, cxLookAndFeels, IniFiles,
  Vcl.Forms,MidasLib, FireDAC.Phys.FBDef, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
  TDM = class(TDataModule)
    FDWaitCursor: TFDGUIxWaitCursor;
    FDConnection: TFDConnection;
    cdsBusca: TClientDataSet;
    fdqBusca: TFDQuery;
    dspBusca: TDataSetProvider;
    ImageList1: TImageList;
    cxLookAndFeelController1: TcxLookAndFeelController;
    fdqUsuario: TFDQuery;
    fdqUsuarioID_USUARIO: TIntegerField;
    fdqUsuarioLOGIN: TStringField;
    fdqUsuarioNOME: TStringField;
    fdqUsuarioSENHA: TStringField;
    fdqUsuarioATIVO: TStringField;
    fdqUsuarioADMINISTRADOR: TStringField;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDTransaction: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnectionError(ASender: TObject; const AInitiator: IFDStanObject; var AException: Exception);
  private
    fIniDataBase: string;
    fIniUser_Name: string;
    fIniPassword: string;
    fIniServer: string;
    fIniDriverID: string;
    fVendorLib:string;
    procedure LerIni;
    procedure ConexaoBD;
  public
    function GetUsuario: Integer;
    function GetNomeUsuario: String;
    function GetPahConexao:string;
    function GetNomeAplicacao:string;
  end;

var
  DM: TDM;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses untMenuPrincipal, smMensagens;

{$R *.dfm}
{ TDM }

function TDM.GetUsuario: Integer;
begin
  Result := DM.fdqUsuarioID_USUARIO.AsInteger;
end;

procedure TDM.LerIni;
var
  Ini: TIniFile;
  Dir: ShortString;
begin
  try
    try
      Dir := ExtractFilePath(Application.Exename);
      Ini := TIniFile.Create(Dir + 'Agenda.ini');
      fIniDataBase := Ini.ReadString('BD', 'Database', EmptyStr);
      fIniUser_Name := Ini.ReadString('BD', 'User_Name', EmptyStr);
      fIniPassword := Ini.ReadString('BD', 'Password', EmptyStr);
      fIniServer := Ini.ReadString('BD', 'Server', EmptyStr);
      fIniDriverID := Ini.ReadString('BD', 'DriverID', EmptyStr);
      fVendorLib:=Ini.ReadString('BD', 'VendorLib', EmptyStr);
    except
      on E: Exception do
        smMensagens.Msg('Erro ao ler o arquivo Leitura.ini!' + #13 +
          E.Message, mtErro);
    end;
  finally
     Ini.Free;
  end;
end;

procedure TDM.ConexaoBD;
begin
  try
    DM.FDConnection.Connected := False;

    DM.FDConnection.Params.Values['Database'] := fIniDataBase;
    DM.FDConnection.Params.Values['User_Name'] := fIniUser_Name;
    DM.FDConnection.Params.Values['Password'] := fIniPassword;
    DM.FDConnection.Params.Values['Server'] := fIniServer;
    DM.FDConnection.Params.Values['DriverID'] := fIniDriverID;
    DM.FDMySQLDriverLink.VendorLib:= fVendorLib;
    DM.FDConnection.Connected := True;
  except
    on E: Exception do
    begin
      smMensagens.Msg('Erro ao conectar-se ao banco de dados!' + #13 +  E.Message, mtErro);
      Application.Terminate;
    end;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  LerIni;
  ConexaoBD;
end;

procedure TDM.FDConnectionError(ASender: TObject; const AInitiator: IFDStanObject; var AException: Exception);
begin
  Msg('Erro na transição de dados:' + #13+ #13+ AException.Message,mtErro);
end;

function TDM.GetNomeAplicacao: string;
begin
  Result:= 'Sistema Agenda';
end;

function TDM.GetNomeUsuario: String;
begin
  Result := DM.fdqUsuarioNOME.AsString;
end;

function TDM.GetPahConexao: string;
begin
  Result:= fIniServer + '\' +  fIniDataBase;
end;

end.
