unit untFuncoes;

interface

Uses

  Classes,  DBClient,  DB, SqlExpr,FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,smCadPadrao;

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

end.
