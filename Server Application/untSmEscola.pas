unit untSmEscola;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,Data.FireDACJSONReflect,
  Vcl.AppEvnts;

type

{$METHODINFO ON}

  TSmEscola = class(TDataModule)

 {$METHODINFO OFF}
    fdqLoginFuncionario: TFDQuery;
    fdqAgenda: TFDQuery;
    fdqAgendaAluno: TFDQuery;
    fdqTurmaAluno: TFDQuery;
    fdqTurma: TFDQuery;
    fdqAluno: TFDQuery;
    fdqAgendaTurma: TFDQuery;
    fdqAgendaAlunoagenda_id: TStringField;
    fdqAgendaAlunoaluno_id: TIntegerField;
    fdqAgendaTurmaagenda_id: TStringField;
    fdqAgendaTurmaturma_id: TIntegerField;
    fdqResp: TFDQuery;
    fdqRespAluno: TFDQuery;
    fdqRespTelefone: TFDQuery;
    fdqRespTipo: TFDQuery;
    fdqFunc: TFDQuery;
    fdqFuncTipo: TFDQuery;
    procedure fdqAgendaBeforePost(DataSet: TDataSet);
    procedure fdqAgendaIDBeforePost(DataSet: TDataSet);
  private
    procedure SetSQLAgenda(ListKeysInserts: TFDJSONDataSets = nil);overload;
    procedure SetSQLAgenda(KeyValues:String);overload;
    procedure SetSQLAgendaDet(KeyValues:String);

    procedure SetParamsAgenda(EscolaId:Integer;FuncionarioId:Integer;DtIni,DtFim:TDateTime);

    procedure OpenAgenda(EscolaId:Integer;FuncionarioId:Integer;DtIni,DtFim:TDateTime;ListKeysInserts: TFDJSONDataSets = nil);overload;
    procedure OpenAgenda(EscolaId:Integer;FuncionarioId:Integer;KeyValues:String);overload;
    procedure CloseAgenda;


 {$METHODINFO ON}

  public
    function LoginFuncionario(Login:string; Senha:string):Boolean;
    function GetAlunos(EscolaId:Integer;FuncionarioId:Integer):TFDJSONDataSets;
    function GetTurmas(EscolaId:Integer;FuncionarioId:Integer):TFDJSONDataSets;
    function GetResponsaveis(EscolaId:Integer;
                             FuncionarioId:Integer):TFDJSONDataSets;

    function GetFuncionarios(EscolaId:Integer;
                             FuncionarioId:Integer):TFDJSONDataSets;



    //Metodos de Agenda
    function GetAgenda(EscolaId:Integer;FuncionarioId:Integer;DtIni,DtFim:TDateTime;ListKeysInserts: TFDJSONDataSets = nil):TFDJSONDataSets;
    function SalvarAgenda(EscolaId, FuncionarioId: Integer; DtIni, DtFim: TDateTime; LDataSetList: TFDJSONDataSets):String;
    procedure ApplyChangesAgenda(EscolaId, FuncionarioId: Integer; const ADeltaList: TFDJSONDeltas);

  end;

var
  SmEscola: TSmEscola;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses untSmMain, smDBFireDac, Vcl.Forms, smGeralFMX, smGeral, FMX.Dialogs;

{$R *.dfm}

{ TSmEscola }

procedure TSmEscola.ApplyChangesAgenda(EscolaId, FuncionarioId: Integer; const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  //Este método não será utilizado, o ideal é utitlizar o método SalvarAgenda

  //Método para dar um apply nos deltas de um FdDataset
 // Create the apply object
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);

  // Apply the agenda delta
  LApply.ApplyUpdates('agenda', fdqAgenda.Command);

  if LApply.Errors.Count = 0 then
  begin
    // If no errors, apply the detalhes delta
    LApply.ApplyUpdates('agenda_aluno', fdqAgendaAluno.Command);
    LApply.ApplyUpdates('agenda_turma', fdqAgendaAluno.Command);
  end;

  if LApply.Errors.Count > 0 then
   // Raise an exception if any errors.
    raise Exception.Create(LApply.Errors.Strings.Text);
end;

procedure TSmEscola.CloseAgenda;
begin
  fdqAgenda.Active := False;
  fdqAgendaAluno.Active := False;
  fdqAgendaTurma.Active := False;
end;

procedure TSmEscola.fdqAgendaBeforePost(DataSet: TDataSet);
begin
  if Dataset.State in [dsInsert]  then
    Dataset.FieldByName('data_insert_server').AsDateTime:=Now;
end;

procedure TSmEscola.fdqAgendaIDBeforePost(DataSet: TDataSet);
begin
  if Dataset.State in [dsInsert]  then
    Dataset.FieldByName('data_insert_server').AsDateTime:=Now;
end;

function TSmEscola.GetAgenda(EscolaId:Integer;FuncionarioId:Integer;
   DtIni,DtFim:TDateTime;ListKeysInserts: TFDJSONDataSets = nil): TFDJSONDataSets;
begin
  //Método para retornar as Agendas
  try
    try
      OpenAgenda(EscolaId, FuncionarioId, DtIni,DtFim,ListKeysInserts);
      Result := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(Result,'agenda',fdqAgenda);
      TFDJSONDataSetsWriter.ListAdd(Result,'agenda_aluno',fdqAgendaAluno);
      TFDJSONDataSetsWriter.ListAdd(Result,'agenda_turma',fdqAgendaTurma);

    except on E:Exception do
      SmMain.SetLogError(E.Message,
                         ExtractFileName(Application.Exename),
                         UnitName,
                         ClassName,
                         'GetAgenda',
                         Now,
                         EscolaId,
                         0,
                         FuncionarioId
                         );


    end;
  finally
    fdqAgenda.Active := False;
    fdqAgendaAluno.Active := False;
    fdqAgendaTurma.Active := False;
  end;
end;

function TSmEscola.GetAlunos(EscolaId, FuncionarioId: Integer): TFDJSONDataSets;
begin
  //Método para retornar os Alunos
  try
    try
      Result := TFDJSONDataSets.Create;

      fdqAluno.Active := False;
      fdqAluno.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result, fdqAluno);
    except on E:Exception do
      SmMain.SetLogError(E.Message,
                         ExtractFileName(Application.Exename),
                         UnitName,
                         ClassName,
                         'GetAlunos',
                         Now,
                         EscolaId,
                         0,
                         FuncionarioId
                         );


    end;
  finally
    fdqAluno.Active := False;
  end;
end;

function TSmEscola.GetFuncionarios(EscolaId,
  FuncionarioId: Integer): TFDJSONDataSets;
begin
  //Método para retornar os Funcionarios
  try
    try
      Result := TFDJSONDataSets.Create;

      fdqFunc.Active := False;
      fdqFunc.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,'funcionario',fdqFunc);

      fdqFuncTipo.Active := False;
      TFDJSONDataSetsWriter.ListAdd(Result,'funcionario_tipo',fdqFuncTipo);

    except on E:Exception do
      SmMain.SetLogError(E.Message,
                         ExtractFileName(Application.Exename),
                         UnitName,
                         ClassName,
                         'GetFuncionarios',
                         Now,
                         EscolaId,
                         0,
                         FuncionarioId
                         );


    end;
  finally
    fdqFunc.Active := False;
    fdqFuncTipo.Active := False;
  end;

end;

function TSmEscola.GetResponsaveis(EscolaId, FuncionarioId:Integer): TFDJSONDataSets;
begin
  //Método para retornar os Responsaveis
  try
    try
      Result := TFDJSONDataSets.Create;

      fdqResp.Active := False;
      fdqResp.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,'responsavel',fdqResp);

      fdqRespAluno.Active := False;
      fdqRespAluno.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,'responsavel_aluno',fdqRespAluno);

      fdqRespTelefone.Active := False;
      fdqRespTelefone.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,'responsavel_telefone',fdqRespTelefone);

      fdqRespTipo.Active := False;
      TFDJSONDataSetsWriter.ListAdd(Result,'responsavel_tipo',fdqRespTipo);

    except on E:Exception do
      SmMain.SetLogError(E.Message,
                         ExtractFileName(Application.Exename),
                         UnitName,
                         ClassName,
                         'GetResponsaveis',
                         Now,
                         EscolaId,
                         0,
                         FuncionarioId
                         );


    end;
  finally
    fdqResp.Active := False;
    fdqRespAluno.Active := False;
    fdqRespTelefone.Active := False;
  end;

end;

function TSmEscola.GetTurmas(EscolaId, FuncionarioId: Integer): TFDJSONDataSets;
begin
  //Método para retornar as Turmas
  try
    try
      Result := TFDJSONDataSets.Create;

      fdqTurma.Active := False;
      fdqTurma.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,'turma',fdqTurma);

      fdqTurmaAluno.Active := False;
      fdqTurmaAluno.ParamByName('escola_id').AsInteger:= EscolaId;
      TFDJSONDataSetsWriter.ListAdd(Result,'turma_aluno',fdqTurmaAluno);

    except on E:Exception do
      SmMain.SetLogError(E.Message,
                         ExtractFileName(Application.Exename),
                         UnitName,
                         ClassName,
                         'GetTurmas',
                         Now,
                         EscolaId,
                         0,
                         FuncionarioId
                         );


    end;
  finally
    fdqTurma.Active := False;
    fdqTurmaAluno.Active := False;
  end;
end;

function TSmEscola.LoginFuncionario(Login, Senha: string): Boolean;
begin
  //Método para retornar os Alunos
  try
    try
      fdqLoginFuncionario.Close;
      fdqLoginFuncionario.ParamByName('login').AsString := Login;
      fdqLoginFuncionario.ParamByName('senha').AsString := Senha;
      fdqLoginFuncionario.Open;
      Result:= not (fdqLoginFuncionario.IsEmpty);
    except on E:Exception do
      SmMain.SetLogError(E.Message,
                         ExtractFileName(Application.Exename),
                         UnitName,
                         ClassName,
                         'LoginFuncionario',
                         Now);


    end;
  finally
    fdqLoginFuncionario.Active := False;
  end;

end;

procedure TSmEscola.OpenAgenda(EscolaId, FuncionarioId: Integer; DtIni,
  DtFim: TDateTime;ListKeysInserts: TFDJSONDataSets = nil);
var
  KeyValues:String;
begin
  CloseAgenda;
  SetSQLAgenda(ListKeysInserts);
  SetParamsAgenda(EscolaId, FuncionarioId, DtIni, DtFim);
  fdqAgenda.Active := True;

  KeyValues:= GetKeyValuesDataSet(fdqAgenda,'agenda_id');
  SetSQLAgendaDet(KeyValues);

  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;

procedure TSmEscola.OpenAgenda(EscolaId, FuncionarioId: Integer;KeyValues:String);
begin
  CloseAgenda;

  SetSQLAgenda(KeyValues);

  fdqAgenda.Active := True;
  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;

function TSmEscola.SalvarAgenda(EscolaId, FuncionarioId: Integer; DtIni, DtFim: TDateTime; LDataSetList: TFDJSONDataSets): String;
var
  LDataSet: TFDDataSet;
  Exceptions:string;
  KeyValues: string;
begin
  //Método para Salvar a Agenda
  try
    Result:=EmptyStr;
    Exceptions:=EmptyStr;
    KeyValues:= EmptyStr;

    try
      //Pegando dados da agenda
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda');

      if LDataSet.IsEmpty then
        Exit;

      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      OpenAgenda(EscolaId,FuncionarioId,KeyValues);
      CopyDataSet(LDataSet,fdqAgenda,False,[coAppend,coEdit]);

      //Pegando dados da agenda_aluno
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_aluno');
      CopyDataSet(LDataSet,fdqAgendaAluno,False,[coAppend,coEdit]);

      //Pegando dados da agenda_turma
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_turma');
      CopyDataSet(LDataSet,fdqAgendaTurma,False,[coAppend,coEdit]);


    except on E:Exception do
      Exceptions:=  Exceptions + E.Message;
    end;

    if (Exceptions <> EmptyStr) then
    begin
      Result:= 'Erro ao salvar agenda' + #13 + Exceptions;
      SmMain.SetLogError(Exceptions,
                         ExtractFileName(Application.Exename),
                         UnitName,
                         ClassName,
                         'SalvarAgenda',
                         Now,
                         EscolaId,
                         0,
                         FuncionarioId);
    end;
  finally
    CloseAgenda;
  end;
end;

procedure TSmEscola.SetParamsAgenda(EscolaId, FuncionarioId: Integer; DtIni,
  DtFim: TDateTime);
begin
  fdqAgenda.ParamByName('escola_id').AsInteger:= EscolaId;
  //fdqAgenda.ParamByName('funcionario_id').AsInteger:= FuncionarioId;
  fdqAgenda.ParamByName('dt_ini').AsDateTime:= DtIni;
  fdqAgenda.ParamByName('dt_fim').AsDateTime:= DtFim;

 { fdqAgendaAluno.ParamByName('escola_id').AsInteger:= EscolaId;
  //fdqAgendaAluno.ParamByName('funcionario_id').AsInteger:= FuncionarioId;
  fdqAgendaAluno.ParamByName('dt_ini').AsDateTime:= DtIni;
  fdqAgendaAluno.ParamByName('dt_fim').AsDateTime:= DtFim;

  fdqAgendaTurma.ParamByName('escola_id').AsInteger:= EscolaId;
  //fdqAgendaTurma.ParamByName('funcionario_id').AsInteger:= FuncionarioId;
  fdqAgendaTurma.ParamByName('dt_ini').AsDateTime:= DtIni;
  fdqAgendaTurma.ParamByName('dt_fim').AsDateTime:= DtFim;  }
end;



procedure TSmEscola.SetSQLAgenda(ListKeysInserts: TFDJSONDataSets = nil);
var
  LDataSet: TFDDataSet;
  KeyValues: string;
begin
  LDataSet := TFDJSONDataSetsReader.GetListValue(ListKeysInserts,0);
  KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');


  fdqAgenda.SQL.Clear;
  fdqAgenda.SQL.Add('select');
  fdqAgenda.SQL.Add('  ag.*');
  fdqAgenda.SQL.Add('from agenda ag');
  fdqAgenda.SQL.Add('inner join agenda_aluno al on (ag.agenda_id = al.agenda_id)');
  fdqAgenda.SQL.Add('inner join turma_aluno ta on (ta.aluno_id = al.aluno_id)');
  fdqAgenda.SQL.Add('inner join turma t on (t.turma_id = ta.turma_id)');
  fdqAgenda.SQL.Add('inner join funcionario f on (f.funcionario_id = t.funcionario_id)');
  fdqAgenda.SQL.Add('where 1=1');
  //fdqAgenda.SQL.Add('and t.funcionario_id = :funcionario_id');
  fdqAgenda.SQL.Add('and ag.escola_id = :escola_id');
  fdqAgenda.SQL.Add('and ag.data between :dt_ini and :dt_fim');
  fdqAgenda.SQL.Add('and ag.agenda_id not in (' + KeyValues + ')');
  fdqAgenda.SQL.Add('group by agenda_id');
  exit;

  {fdqAgendaAluno.SQL.Clear;
  fdqAgendaAluno.SQL.Add('select');
  fdqAgendaAluno.SQL.Add('  al.*');
  fdqAgendaAluno.SQL.Add('from agenda ag');
  fdqAgendaAluno.SQL.Add('inner join agenda_aluno al on (ag.agenda_id = al.agenda_id)');
  fdqAgendaAluno.SQL.Add('inner join turma_aluno ta on (ta.aluno_id = al.aluno_id)');
  fdqAgendaAluno.SQL.Add('inner join turma t on (t.turma_id = ta.turma_id)');
  fdqAgendaAluno.SQL.Add('inner join funcionario f on (f.funcionario_id = t.funcionario_id)');
  fdqAgendaAluno.SQL.Add('where 1=1');
  //fdqAgendaAluno.SQL.Add('and t.funcionario_id = :funcionario_id');
  fdqAgendaAluno.SQL.Add('and ag.escola_id = :escola_id');
  fdqAgendaAluno.SQL.Add('and ag.data between :dt_ini and :dt_fim');
  fdqAgendaAluno.SQL.Add('group by al.agenda_id,al.aluno_id');

  fdqAgendaTurma.SQL.Clear;
  fdqAgendaTurma.SQL.Add('select');
  fdqAgendaTurma.SQL.Add('  at.*');
  fdqAgendaTurma.SQL.Add('from agenda ag');
  fdqAgendaTurma.SQL.Add('inner join agenda_turma at on (ag.agenda_id = at.agenda_id)');
  fdqAgendaTurma.SQL.Add('inner join turma t on (t.turma_id = at.turma_id)');
  fdqAgendaTurma.SQL.Add('inner join funcionario f on (f.funcionario_id = t.funcionario_id)');
  fdqAgendaTurma.SQL.Add('where 1=1');
  //fdqAgendaTurma.SQL.Add('and t.funcionario_id = :funcionario_id');
  fdqAgendaTurma.SQL.Add('and ag.escola_id = :escola_id');
  fdqAgendaTurma.SQL.Add('and ag.data between :dt_ini and :dt_fim');
  fdqAgendaTurma.SQL.Add('group by at.agenda_id,at.turma_id'); }

  fdqAgendaAluno.SQL.Clear;
  fdqAgendaAluno.SQL.Add('select al.*');
  fdqAgendaAluno.SQL.Add('from agenda_aluno al');
  fdqAgendaAluno.SQL.Add('where agenda_id in ( :KeyValues )');

  fdqAgendaTurma.SQL.Clear;
  fdqAgendaTurma.SQL.Add('select at.*');
  fdqAgendaTurma.SQL.Add('from agenda_turma at');
  fdqAgendaTurma.SQL.Add('where agenda_id in ( :KeyValues )');

end;
procedure TSmEscola.SetSQLAgenda(KeyValues: String);
begin
  fdqAgenda.SQL.Clear;
  fdqAgenda.SQL.Add('select ag.*');
  fdqAgenda.SQL.Add('from agenda ag');
  fdqAgenda.SQL.Add('where agenda_id in (' + KeyValues + ')');

  fdqAgendaAluno.SQL.Clear;
  fdqAgendaAluno.SQL.Add('select al.*');
  fdqAgendaAluno.SQL.Add('from agenda_aluno al');
  fdqAgendaAluno.SQL.Add('where agenda_id in (' + KeyValues + ')');

  fdqAgendaTurma.SQL.Clear;
  fdqAgendaTurma.SQL.Add('select at.*');
  fdqAgendaTurma.SQL.Add('from agenda_turma at');
  fdqAgendaTurma.SQL.Add('where agenda_id in (' + KeyValues + ')');
end;


procedure TSmEscola.SetSQLAgendaDet(KeyValues:String);
begin
  fdqAgendaAluno.SQL.Clear;
  fdqAgendaAluno.SQL.Add('select al.*');
  fdqAgendaAluno.SQL.Add('from agenda_aluno al');
  fdqAgendaAluno.SQL.Add('where agenda_id in (' + KeyValues + ')');

  fdqAgendaTurma.SQL.Clear;
  fdqAgendaTurma.SQL.Add('select at.*');
  fdqAgendaTurma.SQL.Add('from agenda_turma at');
  fdqAgendaTurma.SQL.Add('where agenda_id in (' + KeyValues + ')');
end;

end.
