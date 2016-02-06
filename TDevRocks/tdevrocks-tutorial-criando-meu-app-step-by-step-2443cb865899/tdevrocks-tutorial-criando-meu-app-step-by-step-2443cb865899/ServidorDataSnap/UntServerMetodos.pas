unit UntServerMetodos;

interface

uses
  System.SysUtils, System.Classes, System.Json,
  Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,

  Data.FireDACJSONReflect
  ;

type
{$METHODINFO ON}
  TSrvServerMetodos = class(TDataModule)
    FDConexao: TFDConnection;
    qryTitulos: TFDQuery;
    qryTitulosID_TITULO: TIntegerField;
    qryTitulosTITULO: TStringField;
    qryTitulosSUBTITULO: TStringField;
    qryTitulosANO_LANCAMENTO: TIntegerField;
    qryTitulosFOTO: TBlobField;
    qryTitulosMINIATURA: TBlobField;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryAuxiliar: TFDQuery;
  private
    { Private declarations }
    const
      sTitulos = 'TITULOS';
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetTitulos: TFDJSONDataSets;
    procedure ApplyUpdadesTitulos(const ADeltaList: TFDJSONDeltas);
    function ExcluirTitulo(ATitulo: Integer): Boolean;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}



uses
  System.StrUtils;

function TSrvServerMetodos.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TSrvServerMetodos.ExcluirTitulo(ATitulo: Integer): Boolean;
const
  _DELETE = 'DELETE FOM TITULOS WHERE ID_TITULO =:ATITULO';
begin
  try
    qryAuxiliar.Active := False;
    qryAuxiliar.ParamByName('ATITULO').AsInteger := ATitulo;
    qryAuxiliar.ExecSQL;

    Result := True;
  except
    Result := False;
  end;
end;

function TSrvServerMetodos.GetTitulos: TFDJSONDataSets;
begin
  //Devolve para o cliente o DataSet de Pedidos
  //Elimina cache
  qryTitulos.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, qryTitulos);
end;

function TSrvServerMetodos.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

procedure TSrvServerMetodos.ApplyUpdadesTitulos(const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);
  LApply.ApplyUpdates(sTitulos, qryTitulos.Command);
end;

end.

