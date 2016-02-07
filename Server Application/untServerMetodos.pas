unit untServerMetodos;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,Data.FireDACJSONReflect,
  FireDAC.Stan.StorageBin;

type
{$METHODINFO ON}
  TSrvServerMetodos = class(TDataModule)
    fdqAlunos: TFDQuery;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDWaitCursor: TFDGUIxWaitCursor;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDConnection: TFDConnection;
    FDConnectionLocal: TFDConnection;
    fdqLoginFuncionario: TFDQuery;
    fdqLoginResponsavel: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetAlunos:TFDJSONDataSets;
    function LoginFuncionario(Login:string; Senha:string):Boolean;
    function LoginResponsavel(Login:string; Senha:string):Boolean;

  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

procedure TSrvServerMetodos.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Close;
  FDConnection.Open;

  FDConnectionLocal.Close;
end;

function TSrvServerMetodos.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TSrvServerMetodos.GetAlunos: TFDJSONDataSets;
begin
  //Devolve para o cliente o DataSet de Pedidos
  //Elimina cache
  fdqAlunos.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, fdqAlunos);
end;

function TSrvServerMetodos.LoginFuncionario(Login, Senha: string): Boolean;
begin
  fdqLoginFuncionario.Close;
  fdqLoginFuncionario.ParamByName('login').AsString := Login;
  fdqLoginFuncionario.ParamByName('senha').AsString := Senha;
  fdqLoginFuncionario.Open;
  Result:= not (fdqLoginFuncionario.IsEmpty);
end;

function TSrvServerMetodos.LoginResponsavel(Login, Senha: string): Boolean;
begin
  fdqLoginResponsavel.Close;
  fdqLoginResponsavel.ParamByName('login').AsString := Login;
  fdqLoginResponsavel.ParamByName('senha').AsString := Senha;
  fdqLoginResponsavel.Open;
  Result:= not (fdqLoginResponsavel.IsEmpty);
end;

function TSrvServerMetodos.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

