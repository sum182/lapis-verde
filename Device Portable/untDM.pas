unit untDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,System.IOUtils,
  FMX.Types, FMX.Controls, System.ImageList, FMX.ImgList, FGX.ProgressDialog,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,REST.Types;

type
  TDM = class(TDataModule)
    FDConnectionDB: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    ImageList1: TImageList;
    fgActivityDialog: TfgActivityDialog;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    FDConnectionDBEscola: TFDConnection;
    FDConnectionDBResponsavel: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure ConectarSQLite(FDConnection: TFDConnection;DataBaseName:String);
    procedure ConectarBases;
    procedure ConectarDB;
    procedure ConectarDBEscola;
    procedure ConectarDBResponsavel;

  public
    fUsuarioLogadoIsResponsavel:boolean;
    fUsuarioLogadoIsFuncionario:boolean;
    procedure ResetRESTConnection;
  end;

var
  DM: TDM;

const
  BASE_URL: String = 'http://54.200.116.223:8080/datasnap/rest/TSrvServerMetodos';

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses smGeralFMX, FMX.Dialogs;

{$R *.dfm}

procedure TDM.ConectarBases;
begin
  ConectarDB;
  ConectarDBEscola;
  ConectarDBResponsavel;
end;

procedure TDM.ConectarDB;
begin
  ConectarSQLite(FDConnectionDBEscola,'db.s3db');
end;

procedure TDM.ConectarDBEscola;
begin
  ConectarSQLite(FDConnectionDBEscola,'dbEscola.s3db');
end;

procedure TDM.ConectarDBResponsavel;
begin
  ConectarSQLite(FDConnectionDBEscola,'dbResponsavel.s3db');
end;

procedure TDM.ConectarSQLite(FDConnection: TFDConnection;DataBaseName:String);
var
  DataBase:string;
begin

  try
    FDConnection.Close;

    if smGeralFMX.IsSysOSAndroid or (smGeralFMX.IsSysOSiOS) then
    begin
      DataBase := TPath.GetDocumentsPath + PathDelim + DataBaseName;
      FDConnection.Params.Values['Database']:= DataBase;
      //FDConnection.ExecSQL('CREATE TABLE aluno (   aluno_id INTEGER (11)  PRIMARY KEY,    nome     VARCHAR (150) );');
    end;

    FDConnection.Open;
  except
   on E: Exception do
        ShowMessage('Erro ao conectar ao banco de dados local!' + #13 +
          E.Message);
  end;

end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FDConnectionDB.Close;
  FDConnectionDBEscola.Close;
  FDConnectionDBResponsavel.Close;
  ConectarBases;
end;

procedure TDM.ResetRESTConnection;
begin
  RESTClient1.ResetToDefaults;
  RESTRequest1.ResetToDefaults;
  RESTResponse1.ResetToDefaults;
  RESTClient1.BaseURL := BASE_URL;
end;

end.
