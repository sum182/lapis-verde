unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.UI,Data.FireDacJSONReflect,
  FireDAC.Stan.StorageBin;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    FDConnection: TFDConnection;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDWaitCursor: TFDGUIxWaitCursor;
    fdmAlunos: TFDMemTable;
    fdqAlunos: TFDQuery;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function LisarAlunos(Codigo: string = ''): TFdJsonDatasets;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.LisarAlunos(Codigo: string): TFdJsonDatasets;
begin
  fdqAlunos.Close;
  fdqAlunos.SQl.Clear;
  fdqAlunos.SQl.Add('select * from aluno');
  fdqAlunos.SQl.Add('where 1=1');

  if Codigo <> '' then
    fdqAlunos.SQl.Add('and aluno_id = ' + Codigo);

  fdqAlunos.Open;

  Result:= TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result,fdqAlunos);

end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

