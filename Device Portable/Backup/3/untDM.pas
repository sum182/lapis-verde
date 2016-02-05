unit untDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,System.IOUtils;

type
  TDM = class(TDataModule)
    FDConnectionSQLite: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  private
    fDataBaseNameSQLite:string;
    procedure ConectarSQLite;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses smGeralFMX, FMX.Dialogs;

{$R *.dfm}

procedure TDM.ConectarSQLite;
var
  DataBase:string;
begin

  try
    FDConnectionSQLite.Close;

    if smGeralFMX.IsSysOSAndroid or (smGeralFMX.IsSysOSiOS) then
    begin
      DataBase := TPath.GetDocumentsPath + PathDelim + fDataBaseNameSQLite;
      FDConnectionSQLite.Params.Values['Database']:= DataBase;
      FDConnectionSQLite.ExecSQL('CREATE TABLE aluno (   aluno_id INTEGER (11)  PRIMARY KEY,    nome     VARCHAR (150) );');
    end;

    FDConnectionSQLite.Open;
    //ShowMessage(DataBase);
  except
   on E: Exception do
        ShowMessage('Erro ao conectar ao banco de dados local!' + #13 +
          E.Message);
  end;

end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FDConnectionSQLite.Close;
  fDataBaseNameSQLite:= 'db.s3db';
  ConectarSQLite;
end;

end.
