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
    fdqFuncionario: TFDQuery;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDTransaction: TFDTransaction;
    fdqEscola: TFDQuery;
    fdqFuncionariofuncionario_id: TFDAutoIncField;
    fdqFuncionarionome: TStringField;
    fdqFuncionariosobrenome: TStringField;
    fdqFuncionariosexo: TStringField;
    fdqFuncionariorg: TStringField;
    fdqFuncionariocpf: TLargeintField;
    fdqFuncionarioativo: TStringField;
    fdqFuncionarioemail: TStringField;
    fdqFuncionariosenha: TStringField;
    fdqFuncionarioinformacoes_gerais: TMemoField;
    fdqFuncionariofuncionario_tipo_id: TSmallintField;
    fdqFuncionarioescola_id: TIntegerField;
    dsFuncionario: TDataSource;
    dsEscola: TDataSource;
    fdqFuncionarionome_completo: TStringField;
    FDConnectionLocal: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnectionError(ASender: TObject; const AInitiator: IFDStanObject; var AException: Exception);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    fIniDataBase: string;
    fIniUser_Name: string;
    fIniPassword: string;
    fIniServer: string;
    fIniDriverID: string;
    fVendorLib:string;
    fPort:string;
    fIdEscola:integer;
    procedure LerIni;
    procedure ConexaoBD;
    procedure OpenEscola;
    procedure SetTimeZone;
  public
    fUsuarioAdminSistema: boolean;

    function GetFuncionarioId: Integer;
    function GetFuncionarioNome: String;
    function GetFuncionarioNomeCompleto: String;

    function GetPahConexao:string;
    function GetNomeAplicacao:string;
    function GetEscolaId:integer;
  end;

var
  DM: TDM;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses untMenuPrincipal, smMensagens,smCrypt,Variants;

{$R *.dfm}
{ TDM }

function TDM.GetFuncionarioId: Integer;
begin
  Result := DM.fdqFuncionariofuncionario_id.AsInteger;

  if fUsuarioAdminSistema then
    Result := -1;
end;

procedure TDM.LerIni;
var
  Ini: TIniFile;
  Dir: ShortString;
begin
  try
    try
      Dir := ExtractFilePath(Application.Exename);
      Ini := TIniFile.Create(Dir + 'LapisVerde.ini');
      fIniDataBase := Decrypt(Ini.ReadString('BD', 'Database', EmptyStr));
      fIniUser_Name :=  Decrypt(Ini.ReadString('BD', 'User_Name', EmptyStr));
      fIniPassword := Decrypt(Ini.ReadString('BD', 'Password', EmptyStr));
      fIniServer := Decrypt(Ini.ReadString('BD', 'Server', EmptyStr));
      fIniDriverID := Ini.ReadString('BD', 'DriverID', EmptyStr);
      fVendorLib:=Ini.ReadString('BD', 'VendorLib', EmptyStr);
      fPort:= Ini.ReadString('BD', 'Port', EmptyStr);
      fIdEscola:=Ini.ReadInteger('Configuracoes', 'IdEscola',0);
    except
      on E: Exception do
        smMensagens.Msg('Erro ao ler o arquivo LapisVerde.ini!' + #13 +
          E.Message, mtErro);
    end;
  finally
     Ini.Free;
  end;
end;

procedure TDM.OpenEscola;
begin
  if fIdEscola <= 0 then
  begin
    smMensagens.Msg('Paramêtro Id_Escola não encontrdo.' + #13, mtErro);
    Exit;
  end;

  fdqEscola.Close;
  fdqEscola.ParamByName('escola_id').AsInteger := fIdEscola;
  fdqEscola.Open;

  if fdqEscola.RecordCount <= 0 then
  begin
    smMensagens.Msg('Paramêtro Escola_id['+ IntToStr(fIdEscola)+']' + 'não encontrado.' + #13,mtErro);
    Exit;
  end;
end;

procedure TDM.SetTimeZone;
begin
  FDConnection.ExecSQL('call sp_set_time_zone;');
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
    DM.FDConnection.Params.Values['Port'] := fPort;
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
  OpenEscola;
end;

procedure TDM.FDConnectionAfterConnect(Sender: TObject);
begin
  SetTimeZone;
end;

procedure TDM.FDConnectionError(ASender: TObject; const AInitiator: IFDStanObject; var AException: Exception);
begin
  Msg('Erro na transição de dados:' + #13+ #13+ AException.Message,mtErro);
end;

function TDM.GetEscolaId: integer;
begin
  Result:= fIdEscola;
end;

function TDM.GetNomeAplicacao: string;
begin
  Result:= 'Lápis Verde';
end;

function TDM.GetFuncionarioNomeCompleto: String;
begin
  Result := DM.fdqFuncionarionome_completo.AsString;
  if fUsuarioAdminSistema then
    Result := 'Admin';
end;

function TDM.GetFuncionarioNome: String;
begin
  Result := DM.fdqFuncionarionome.AsString;

  if fUsuarioAdminSistema then
    Result := 'Admin';
end;

function TDM.GetPahConexao: string;
begin
  Result:= fIniServer + '\' +  fIniDataBase;
end;

end.
