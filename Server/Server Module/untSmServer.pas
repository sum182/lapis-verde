unit untSmServer;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, untLibGeral, untLibServer,
  FireDAC.Phys.MySQLDef, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Stan.StorageBin,System.JSON, untTypes,Data.FireDACJSONReflect,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI;

type
{$METHODINFO ON}
  TSmServer = class(TDataModule)
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDConnection: TFDConnection;
    FDConnectionLocal: TFDConnection;
    FDWaitCursor: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  SmServer: TSmServer;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses untSmMain, Vcl.Forms;

{$R *.dfm}

{ TSmResponsavel }



procedure TSmServer.DataModuleCreate(Sender: TObject);
begin
  if not Assigned(SmMain) then
    Application.CreateForm(TSmMain, SmMain);

  FDConnection.Close;
  FDConnection.Open;

  FDConnectionLocal.Close;


end;



end.
