unit untSmResponsavel;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, untLibGeral, untLibServer,
  FireDAC.Phys.MySQLDef, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Stan.StorageBin,System.JSON, untTypes,Data.FireDACJSONReflect;

type
{$METHODINFO ON}
  TSmResponsavel = class(TDataModule)
    fdqValidarEmailResponsavel: TFDQuery;
    fdqValidarCPFResponsavel: TFDQuery;
    fdqResponsavel: TFDQuery;
    fdqResponsavelTelefone: TFDQuery;
    fdqLoginResponsavel: TFDQuery;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function LoginResponsavel(Login:string; Senha:string):TFDJSONDataSets;
    function ValidarEmailExistenteResponsavel(Email:String):Boolean;
    function ValidarCPFExistenteResponsavel(CPF:String):Boolean;
    function CriarUsuarioResponsavel( Nome:String;
                                      SobreNome: String;
                                      Email: String;
                                      Senha: String;
                                      Telefone: String;
                                      CPF: String;
                                      RG: String;
                                      Sexo: String):String;
    function SalvarResponsavel(pEscolaId:Integer;pUsuario:TJSONValue;LDataSetList: TFDJSONDataSets):String;

  end;

var
  SmResponsavel: TSmResponsavel;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses untSmMain, Vcl.Forms;

{$R *.dfm}

{ TSmResponsavel }

function TSmResponsavel.CriarUsuarioResponsavel(Nome, SobreNome, Email, Senha,
  Telefone, CPF, RG, Sexo: String): String;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para Login de Responsaveis
  try
    try
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'CriarUsuarioResponsavel'
                                          );



      fdqResponsavel.Close;
      fdqResponsavel.ParamByName('responsavel_id').AsInteger:=0;
      fdqResponsavel.Open;
      fdqResponsavel.Append;
      //fdqResponsavel.FieldByName('responsavel_id').AsString := 0;
      fdqResponsavel.FieldByName('nome').AsString := Nome;
      fdqResponsavel.FieldByName('sobrenome').AsString := SobreNome;
      fdqResponsavel.FieldByName('sexo').AsString := Sexo;
      fdqResponsavel.FieldByName('rg').AsString := RG;
      fdqResponsavel.FieldByName('cpf').AsString := CPF;
      fdqResponsavel.FieldByName('ativo').AsString := 'S';
      fdqResponsavel.FieldByName('email').AsString := Email;
      fdqResponsavel.FieldByName('senha').AsString := Senha;
      fdqResponsavel.Post;

      //Criando o Telefone
      fdqResponsavelTelefone.Close;
      fdqResponsavelTelefone.Open;
      fdqResponsavelTelefone.Append;
      fdqResponsavelTelefone.FieldByName('responsavel_id').AsInteger := fdqResponsavel.FieldByName('responsavel_id').AsInteger;
      fdqResponsavelTelefone.FieldByName('telefone_tipo_id').AsInteger := 2;
      fdqResponsavelTelefone.FieldByName('numero').AsString := Telefone;
      fdqResponsavelTelefone.Post;

      Result:= 'OK';

      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        Result:= 'Erro ao criar usuário ' + #13 + E.Message;
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    fdqLoginResponsavel.Active := False;
    LogServerRequest.Free;
    SmMain.EndRequest;
  end;
end;

procedure TSmResponsavel.DataModuleCreate(Sender: TObject);
begin
  if not Assigned(SmMain) then
    Application.CreateForm(TSmMain, SmMain);
end;

function TSmResponsavel.LoginResponsavel(Login, Senha: string): TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para Login de Responsaveis
  try
    try
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'LoginResponsavel'
                                           );

      fdqLoginResponsavel.Close;
      fdqLoginResponsavel.ParamByName('login').AsString := UpperCase(Login);
      fdqLoginResponsavel.ParamByName('senha').AsString := Senha;
      fdqLoginResponsavel.Open;

      Result := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(Result, fdqLoginResponsavel);

      //Result:= not (fdqLoginResponsavel.IsEmpty);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    //fdqLoginResponsavel.Active := False;
    LogServerRequest.Free;
    //SmMain.EndRequest;
  end;
end;

function TSmResponsavel.SalvarResponsavel(pEscolaId: Integer;
  pUsuario: TJSONValue; LDataSetList: TFDJSONDataSets): String;
var
  LogServerRequest:TLogServerRequest;
  LDataSet: TFDDataSet;
begin
  //Método para salvar o Responsável
  try
    try
      SmMain.StartRequest(pEscolaId,pUsuario);

      if Usuario.Tipo <>  Responsavel then
        Exit;

      LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);

      if LDataSet.IsEmpty then
        Exit;

      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'SalvarResponsavel',
                                            EscolaId,
                                            Usuario);
      fdqResponsavel.Active := False;
      fdqResponsavel.ParamByName('responsavel_id').AsInteger:= Usuario.Id;
      fdqResponsavel.Open;

      if fdqResponsavel.IsEmpty then
        raise Exception.Create('Erro ao localizar Responsável de Id:' +
                                IntToStr(Usuario.Id));
      fdqResponsavel.Edit;
      fdqResponsavel.FieldByName('nome').AsString := LDataSet.FieldByName('nome').AsString;
      fdqResponsavel.FieldByName('sobrenome').AsString := LDataSet.FieldByName('sobrenome').AsString;
      fdqResponsavel.FieldByName('sexo').AsString := LDataSet.FieldByName('sexo').AsString;
      fdqResponsavel.FieldByName('rg').AsString := LDataSet.FieldByName('rg').AsString;
      fdqResponsavel.FieldByName('cpf').AsString := LDataSet.FieldByName('cpf').AsString;
      fdqResponsavel.FieldByName('email').AsString := LDataSet.FieldByName('email').AsString;
      fdqResponsavel.FieldByName('senha').AsString := LDataSet.FieldByName('senha').AsString;
      fdqResponsavel.Post;

      //Atualizando o Telefone
      if LDataSet.FieldByName('telefone').AsString <> '' then
      begin
        fdqResponsavelTelefone.Close;
        fdqResponsavelTelefone.ParamByName('responsavel_id').AsInteger:= Usuario.Id;
        fdqResponsavelTelefone.Open;

        if fdqResponsavelTelefone.IsEmpty then
          fdqResponsavelTelefone.Append;

        fdqResponsavelTelefone.FieldByName('responsavel_id').AsInteger := fdqResponsavel.FieldByName('responsavel_id').AsInteger;
        fdqResponsavelTelefone.FieldByName('telefone_tipo_id').AsInteger := 2;
        fdqResponsavelTelefone.FieldByName('numero').AsString := LDataSet.FieldByName('telefone').AsString;
        fdqResponsavelTelefone.Post;
      end;


      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    LogServerRequest.Free;
    SmMain.EndRequest;
  end;
end;

function TSmResponsavel.ValidarCPFExistenteResponsavel(CPF: String): Boolean;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para Login de Responsaveis
  try
    try
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'ValidarCPFExistenteResponsavel'
                                           );



      fdqValidarCPFResponsavel.Close;
      fdqValidarCPFResponsavel.ParamByName('cpf').AsString := cpf;
      fdqValidarCPFResponsavel.Open;
      Result:=(fdqValidarCPFResponsavel.IsEmpty);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    fdqLoginResponsavel.Active := False;
    LogServerRequest.Free;
    SmMain.EndRequest;
  end;
end;

function TSmResponsavel.ValidarEmailExistenteResponsavel(
  Email: String): Boolean;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para Login de Responsaveis
  try
    try
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'ValidarEmailExistenteResponsavel'
                                          );



      fdqValidarEmailResponsavel.Close;
      fdqValidarEmailResponsavel.ParamByName('email').AsString := Email;
      fdqValidarEmailResponsavel.Open;
      Result:= (fdqValidarEmailResponsavel.IsEmpty);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    fdqLoginResponsavel.Active := False;
    LogServerRequest.Free;
    SmMain.EndRequest;
  end;
end;

end.
