unit untFuncoes;

interface

Uses

  Classes,  DBClient,  DB, SqlExpr,FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,smCadPadrao, System.SysUtils;

  procedure SetIdEscolaCadastro(Dataset: TDataset);
  procedure SetSQLEscolaIdBusca(smCadPadrao: TsmCadPadrao);
  procedure SetIdEscolaParamBusca(FDDataset: TFDQuery);

  function GetFuncionarioId: Integer;
  function GetFuncionarioNome: string;
  function GetFuncionarioNomeCompleto:string;

  function GetPahConexao:string;
  function GetNomeAplicacao:string;
  function GetEscolaId:integer;
  function UsuarioIsAdminSistema:boolean;

  function CheckAgendaAluno(idAluno: Integer): boolean;
  function CheckAgendaTurma(idTurma: Integer): boolean;

implementation

uses untDM;

procedure SetIdEscolaCadastro(Dataset: TDataset);
begin
  begin
  if Dataset.State in [dsInactive] then
    Exit;

  if not(Dataset.State in [dsEdit,dsInsert])then
    Exit;
  end;

  Dataset.FieldByName('Escola_id').AsInteger := DM.GetEscolaId;
end;

procedure SetSQLEscolaIdBusca(smCadPadrao: TsmCadPadrao);
begin
  smCadPadrao.BuscaCondicoes.Add(' and escola_id = :escola_id ');
end;


procedure SetIdEscolaParamBusca(FDDataset: TFDQuery);
begin
  FDDataset.ParamByName('escola_id').AsInteger:=GetEscolaId;
end;

function GetFuncionarioId: Integer;
begin
  Result:= Dm.GetFuncionarioId;
end;

function GetFuncionarioNome: string;
begin
  Result:= Dm.GetFuncionarioNome;
end;

function GetFuncionarioNomeCompleto:string;
begin
  Result:= Dm.GetFuncionarioNomeCompleto;
end;


function GetPahConexao:string;
begin
  Result:= Dm.GetPahConexao;
end;

function GetNomeAplicacao:string;
begin
  Result:= Dm.GetNomeAplicacao;
end;

function GetEscolaId:integer;
begin
  Result:= Dm.GetEscolaId;
end;

function UsuarioIsAdminSistema:boolean;
begin
   Result:= DM.fUsuarioAdminSistema;
end;

function CheckAgendaAluno(idAluno: Integer): boolean;
var quCheckAgenda: TFDQuery;
    sSQL: string;
begin
  sSQL := 'select count(1) as Qtde ' +
            'from agendadb.agenda_aluno aa ' +
                 'inner join agendadb.agenda a on (a.agenda_id = aa.agenda_id) ' +
           'where (aa.aluno_id = ' + IntToStr(idAluno) + ') ' +
             'and (a.escola_id = ' + IntToStr(GetEscolaId) + ')';

  quCheckAgenda:= TFDQuery.Create(nil);
  quCheckAgenda.Close;
  quCheckAgenda.Connection := DM.FDConnection;
  quCheckAgenda.SQL.Add(sSQL);
  quCheckAgenda.Open();
  Result := quCheckAgenda.FieldByName('Qtde').AsInteger > 0;
  quCheckAgenda.Close;
  FreeAndNil(quCheckAgenda);
end;


function CheckAgendaTurma(idTurma: Integer): boolean;
var quCheckAgenda: TFDQuery;
    sSQL: string;
begin
  sSQL := 'select count(1) as Qtde ' +
            'from agendadb.agenda_turma au ' +
                 'inner join agendadb.agenda a on (a.agenda_id = au.agenda_id) ' +
           'where (au.turma_id = ' + IntToStr(idTurma) + ') ' +
             'and (a.escola_id = ' + IntToStr(GetEscolaId) + ')';

  quCheckAgenda := TFDQuery.Create(nil);
  quCheckAgenda.Close;
  quCheckAgenda.Connection := DM.FDConnection;
  quCheckAgenda.SQL.Clear;
  quCheckAgenda.SQL.Add(sSQL);
  quCheckAgenda.Open();
  Result := quCheckAgenda.FieldByName('Qtde').AsInteger > 0;
  FreeAndNil(quCheckAgenda);
end;



end.
