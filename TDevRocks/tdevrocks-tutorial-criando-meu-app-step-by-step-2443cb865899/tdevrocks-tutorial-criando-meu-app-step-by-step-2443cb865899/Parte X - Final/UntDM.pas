unit UntDM;

interface

uses
  FMX.Dialogs, System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, Data.DB, FireDAC.Comp.Client,
  FireDAC.FMXUI.Wait, FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.IOUtils;

type
  TDM = class(TDataModule)
    fdcConexao: TFDConnection;
    qryTitulos: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    qryTitulosID_TITULO: TIntegerField;
    qryTitulosTITULO: TStringField;
    qryTitulosSUBTITULO: TStringField;
    qryTitulosANO_LANCAMENTO: TIntegerField;
    qryAuxiliar1: TFDQuery;
    qryTitulosFOTO: TBlobField;
    qryTitulosrowid: TLargeintField;
    memTitulos: TFDMemTable;
    procedure DataModuleCreate(Sender: TObject);
    procedure fdcConexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetIDFromTable(ATable: String): Integer;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  sPath: String;
begin
  with fdcConexao do
  begin
    {$IF DEFINED(IOS) OR DEFINED(ANDROID)}
      Params.Values['DriverID'] := 'SQLite';
      Params.Values['OpenMode'] := 'ReadWrite';
      try
        sPath := TPath.Combine(TPath.GetDocumentsPath, 'Locadora.s3db');
        Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'Locadora.s3db');
        Connected := True;
      except on E: Exception do
        begin
          ShowMessage(E.Message);
        end;
      end;
    {$ELSE}
      try
        Params.Values['Database'] := '$(DB_LOCADORA_SQLITE)';
        Connected := True;
      except on E: Exception do
        begin
          ShowMessage(E.Message);
        end;
      end;
    {$ENDIF}
  end;
end;

procedure TDM.fdcConexaoBeforeConnect(Sender: TObject);
begin
  {$IFNDEF MSWINDOWS}
  {Para uso com o iOS e Android}
    fdcConexao.Params.Values['Protocol'] := 'Local';
    fdcConexao.Params.Values['Server']   := '';
    fdcConexao.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'Locadora.s3db');
  {$ELSE}
    fdcConexao.Params.Values['Protocol'] := 'SQLite';
    fdcConexao.Params.Values['OpenMode'] := 'ReadWrite';
    fdcConexao.Params.Values['Database'] := '$(DB_LOCADORA_SQLITE)';
  {$ENDIF}
end;

function TDM.GetIDFromTable(ATable: String): Integer;
const
  _SQL = 'SELECT MAX(ROWID)+1 AS NEW_ID FROM %s';
begin
  with qryAuxiliar1 do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := Format(_SQL, [ATable]);
    Active := True;
    Result := FieldByName('NEW_ID').AsInteger;
  end;
end;

end.
