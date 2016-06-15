unit untSmEscola;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,Data.FireDACJSONReflect,
  Vcl.AppEvnts, untLibGeral, System.JSON, FireDAC.Phys.MySQLDef, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Stan.StorageBin;

type

{$METHODINFO ON}

  TSmEscola = class(TDataModule)

 {$METHODINFO OFF}
    fdqLoginFuncionario: TFDQuery;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
 {$METHODINFO ON}

  public
    function LoginFuncionario(Login:string; Senha:string):TFDJSONDataSets;
  end;

var
  SmEscola: TSmEscola;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses untSmMain, smDBFireDac, Vcl.Forms, smGeralFMX, smGeral, FMX.Dialogs,
  System.SysUtils, untLibServer, untTypes;

{$R *.dfm}

{ TSmEscola }


procedure TSmEscola.DataModuleCreate(Sender: TObject);
begin
  if not Assigned(SmMain) then
    Application.CreateForm(TSmMain, SmMain);
end;

function TSmEscola.LoginFuncionario(Login, Senha: string): TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para Login de Funcionarios
  try
    try
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'LoginFuncionario'
                                           );

      fdqLoginFuncionario.Close;
      fdqLoginFuncionario.ParamByName('login').AsString := Login;
      fdqLoginFuncionario.ParamByName('senha').AsString := Senha;
      fdqLoginFuncionario.Open;

      Result := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(Result, fdqLoginFuncionario);
      //Result:= not (fdqLoginFuncionario.IsEmpty);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    //fdqLoginFuncionario.Active := False;
    LogServerRequest.Free;
  end;

end;


end.
