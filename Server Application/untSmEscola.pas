unit untSmEscola;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,Data.FireDACJSONReflect,
  Vcl.AppEvnts, untLibGeral, System.JSON;

type

{$METHODINFO ON}

  TSmEscola = class(TDataModule)

 {$METHODINFO OFF}
    fdqLoginFuncionario: TFDQuery;
  private
 {$METHODINFO ON}

  public
    function LoginFuncionario(Login:string; Senha:string):Boolean;
  end;

var
  SmEscola: TSmEscola;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses untSmMain, smDBFireDac, Vcl.Forms, smGeralFMX, smGeral, FMX.Dialogs,
  System.SysUtils, untLibServer;

{$R *.dfm}

{ TSmEscola }


function TSmEscola.LoginFuncionario(Login, Senha: string): Boolean;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar os Alunos
  try
    try
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'LoginFuncionario',
                                            0,
                                            Usuario);

      fdqLoginFuncionario.Close;
      fdqLoginFuncionario.ParamByName('login').AsString := Login;
      fdqLoginFuncionario.ParamByName('senha').AsString := Senha;
      fdqLoginFuncionario.Open;
      Result:= not (fdqLoginFuncionario.IsEmpty);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    fdqLoginFuncionario.Active := False;
    LogServerRequest.Free;
  end;

end;


end.
