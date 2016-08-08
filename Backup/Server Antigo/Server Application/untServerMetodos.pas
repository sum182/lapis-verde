unit untServerMetodos;

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
  TSrvServerMetodos = class(TDataModule)
    fdqAlunos: TFDQuery;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDWaitCursor: TFDGUIxWaitCursor;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDConnection: TFDConnection;
    FDConnectionLocal: TFDConnection;
    fdqLoginFuncionario: TFDQuery;
    fdqLoginResponsavel: TFDQuery;
    fdqValidarEmailResponsavel: TFDQuery;
    fdqValidarCPFResponsavel: TFDQuery;
    fdqResponsavel: TFDQuery;
    fdqResponsavelTelefone: TFDQuery;
    fdqAgenda: TFDQuery;
    fdqAgendaagenda_id: TFDAutoIncField;
    fdqAgendatitulo: TStringField;
    fdqAgendadescricao: TMemoField;
    fdqAgendadata: TDateTimeField;
    fdqAgendaagenda_tipo_id: TSmallintField;
    fdqAgendafuncionario_id: TIntegerField;
    fdqAgendaescola_id: TIntegerField;
    fdqAgendaAluno: TFDQuery;
    fdqAgendaAlunoagenda_id: TIntegerField;
    fdqAgendaAlunoaluno_id: TIntegerField;
    fdqTurmaAluno: TFDQuery;
    fdqTurma: TFDQuery;
    fdqAluno: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //Testes
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetAlunosTeste:TFDJSONDataSets;overload;

    //Login
    function LoginFuncionario(Login:string; Senha:string):Boolean;
    function LoginResponsavel(Login:string; Senha:string):Boolean;

    //Criar Conta
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
    //Agenda Escola
    function GetAlunos(EscolaId:Integer;FuncionarioId:Integer):TFDJSONDataSets;overload;
    function GetTurmas(EscolaId:Integer;FuncionarioId:Integer):TFDJSONDataSets;overload;


  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TSrvServerMetodos.CriarUsuarioResponsavel(Nome, SobreNome, Email,
  Senha, Telefone, CPF, RG, Sexo: String): String;
begin
  try
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
  except on E:Exception do
    begin
      Result:= 'Erro ao criar usuário ' + #13 + E.Message;
    end;
  end;
end;

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

function TSrvServerMetodos.GetAlunos(EscolaId,
  FuncionarioId: Integer): TFDJSONDataSets;
begin
  fdqAluno.Active := False;
  fdqAluno.ParamByName('escola_id').AsInteger:= EscolaId;

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, fdqAluno);
end;

function TSrvServerMetodos.GetTurmas(EscolaId,
  FuncionarioId: Integer): TFDJSONDataSets;
begin
  fdqTurma.Active := False;
  fdqTurma.ParamByName('escola_id').AsInteger:= EscolaId;

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, fdqTurma);
end;

function TSrvServerMetodos.GetAlunosTeste: TFDJSONDataSets;
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

function TSrvServerMetodos.ValidarCPFExistenteResponsavel(
  CPF: String): Boolean;
begin
  fdqValidarCPFResponsavel.Close;
  fdqValidarCPFResponsavel.ParamByName('cpf').AsString := cpf;
  fdqValidarCPFResponsavel.Open;
  Result:=(fdqValidarCPFResponsavel.IsEmpty);
end;

function TSrvServerMetodos.ValidarEmailExistenteResponsavel(
  Email: String): Boolean;
begin
  fdqValidarEmailResponsavel.Close;
  fdqValidarEmailResponsavel.ParamByName('email').AsString := Email;
  fdqValidarEmailResponsavel.Open;
  Result:= (fdqValidarEmailResponsavel.IsEmpty);
end;

end.

