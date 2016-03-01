unit untSmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin, FireDAC.Comp.UI, FireDAC.Comp.DataSet;

type
{$METHODINFO ON}
  TSmMain = class(TDataModule)
    fdqAlunos: TFDQuery;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDWaitCursor: TFDGUIxWaitCursor;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDConnection: TFDConnection;
    FDConnectionLocal: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SmMain: TSmMain;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TSmMain.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Close;
  FDConnection.Open;

  FDConnectionLocal.Close;
end;

end.
