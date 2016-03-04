unit untSmEscola;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,Data.FireDACJSONReflect;

type
{$METHODINFO ON}

  TSmEscola = class(TDataModule)
    fdqLoginFuncionario: TFDQuery;
    fdqAgenda: TFDQuery;
    fdqAgendaAluno: TFDQuery;
    fdqTurmaAluno: TFDQuery;
    fdqTurma: TFDQuery;
    fdqAluno: TFDQuery;
    fdqAgendaTurma: TFDQuery;
    dsAgenda: TDataSource;
  private
    { Private declarations }
  public
    function LoginFuncionario(Login:string; Senha:string):Boolean;
    function GetAlunos(EscolaId:Integer;FuncionarioId:Integer):TFDJSONDataSets;
    function GetTurmas(EscolaId:Integer;FuncionarioId:Integer):TFDJSONDataSets;

    function GetAgenda(EscolaId:Integer;FuncionarioId:Integer;AgendaId:Integer):TFDJSONDataSets;
  end;

var
  SmEscola: TSmEscola;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses untSmMain;

{$R *.dfm}

{ TSmEscola }

function TSmEscola.GetAgenda(EscolaId, FuncionarioId,
  AgendaId: Integer): TFDJSONDataSets;
begin
  fdqAgenda.Active := False;
  fdqAgendaAluno.Active := False;
  fdqAgendaTurma.Active := False;

  fdqAgenda.ParamByName('escola_id').AsInteger:= EscolaId;
  //fdqAgenda.ParamByName('agenda_id').AsInteger:= AgendaId;

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result,'agenda',fdqAgenda);
  TFDJSONDataSetsWriter.ListAdd(Result,'agenda_aluno',fdqAgendaAluno);
  TFDJSONDataSetsWriter.ListAdd(Result,'agenda_turma',fdqAgendaTurma);
end;

function TSmEscola.GetAlunos(EscolaId, FuncionarioId: Integer): TFDJSONDataSets;
begin
  fdqAluno.Active := False;
  fdqAluno.ParamByName('escola_id').AsInteger:= EscolaId;

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, fdqAluno);
end;

function TSmEscola.GetTurmas(EscolaId, FuncionarioId: Integer): TFDJSONDataSets;
begin
  fdqTurma.Active := False;
  fdqTurma.ParamByName('escola_id').AsInteger:= EscolaId;

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, fdqTurma);
end;

function TSmEscola.LoginFuncionario(Login, Senha: string): Boolean;
begin
  fdqLoginFuncionario.Close;
  fdqLoginFuncionario.ParamByName('login').AsString := Login;
  fdqLoginFuncionario.ParamByName('senha').AsString := Senha;
  fdqLoginFuncionario.Open;
  Result:= not (fdqLoginFuncionario.IsEmpty);
end;

end.
