unit untSmTeste;

interface

uses
  System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,Data.FireDACJSONReflect,
  FireDAC.Stan.StorageBin;

type
{$METHODINFO ON}
  TSmTeste = class(TDataModule)
    fdqAlunos: TFDQuery;
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetAlunosTeste:TFDJSONDataSets;overload;
  end;

var
  SmTeste: TSmTeste;
  {$METHODINFO OFF}


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses  untSmMain,System.StrUtils;

{$R *.dfm}

{ TDMServerMethodsTeste }

function TSmTeste.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TSmTeste.GetAlunosTeste: TFDJSONDataSets;
begin
  //Devolve para o cliente o DataSet de Pedidos
  //Elimina cache
  fdqAlunos.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, fdqAlunos);
end;

function TSmTeste.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.
