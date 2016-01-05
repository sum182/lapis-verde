unit untFuncoes;

interface

Uses

  Classes,  DBClient,  DB, SqlExpr,FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,smCadPadrao;

  procedure SetIdEscolaCadastro(Dataset: TDataset);
  procedure SetSQLEscolaIdBusca(smCadPadrao: TsmCadPadrao);
  procedure SetIdEscolaParamBusca(FDDataset: TFDQuery);

  function GetUsuario: Integer;
  function GetNomeUsuario: String;
  function GetPahConexao:string;
  function GetNomeAplicacao:string;
  function GetIdEscola:integer;

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

  Dataset.FieldByName('Escola_id').AsInteger := DM.GetIdEscola;
end;

procedure SetSQLEscolaIdBusca(smCadPadrao: TsmCadPadrao);
begin
  smCadPadrao.BuscaCondicoes.Add(' and escola_id = :escola_id ');
end;


procedure SetIdEscolaParamBusca(FDDataset: TFDQuery);
begin
  FDDataset.ParamByName('escola_id').AsInteger:=GetIdEscola;
end;

function GetUsuario: Integer;
begin
  Result:= Dm.GetUsuario;
end;

function GetNomeUsuario: String;
begin
  Result:= Dm.GetNomeUsuario;
end;

function GetPahConexao:string;
begin
  Result:= Dm.GetPahConexao;
end;

function GetNomeAplicacao:string;
begin
  Result:= Dm.GetNomeAplicacao;
end;

function GetIdEscola:integer;
begin
  Result:= Dm.GetIdEscola;
end;

end.