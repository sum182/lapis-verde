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
    fdqFunc: TFDQuery;
    procedure fdqAgendaBeforePost(DataSet: TDataSet);
    procedure fdqAgendaIDBeforePost(DataSet: TDataSet);
  private
    procedure SetSQLAgenda(ListKeysInserts: TFDJSONDataSets = nil);overload;
    procedure SetSQLAgenda(KeyValues:String);overload;
    procedure SetSQLAgendaDet(KeyValues:String);

    procedure SetParamsAgenda(EscolaId:Integer;DtIni,DtFim:TDateTime);

    procedure OpenAgenda(EscolaId:Integer;DtIni,DtFim:TDateTime;ListKeysInserts: TFDJSONDataSets = nil);overload;
    procedure OpenAgenda(EscolaId:Integer;KeyValues:String);overload;
    procedure CloseAgenda;


 {$METHODINFO ON}

  public
    function LoginFuncionario(Login:string; Senha:string):Boolean;

    //Metodos de Agenda
    function GetAgenda(EscolaId:Integer;pUsuario:TJSONValue;DtIni,DtFim:TDateTime;ListKeysInserts: TFDJSONDataSets = nil):TFDJSONDataSets;
    function SalvarAgenda(EscolaId:Integer; pUsuario:TJSONValue; DtIni, DtFim: TDateTime; LDataSetList: TFDJSONDataSets):String;

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

function TSmEscola.GetAgenda(EscolaId:Integer;pUsuario:TJSONValue;
   DtIni,DtFim:TDateTime;ListKeysInserts: TFDJSONDataSets = nil): TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar as Agendas
  try
    try
      Usuario:= Usuario.UnMarshal(pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'GetAgenda',
                                            EscolaId,
                                            Usuario);

      OpenAgenda(EscolaId,DtIni,DtFim,ListKeysInserts);
      Result := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(Result,'agenda',fdqAgenda);
      TFDJSONDataSetsWriter.ListAdd(Result,'agenda_aluno',fdqAgendaAluno);
      TFDJSONDataSetsWriter.ListAdd(Result,'agenda_turma',fdqAgendaTurma);
      SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      begin
        LogServerRequest.SetError(E.Message);
        SmMain.SaveLogError(LogServerRequest);
      end;
    end;
  finally
    fdqAgenda.Active := False;
    fdqAgendaAluno.Active := False;
    fdqAgendaTurma.Active := False;
    LogServerRequest.Free;
  end;
end;

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

procedure TSmEscola.OpenAgenda(EscolaId:Integer; DtIni,
  DtFim: TDateTime;ListKeysInserts: TFDJSONDataSets = nil);
var
  KeyValues:String;
begin
  CloseAgenda;
  SetSQLAgenda(ListKeysInserts);
  SetParamsAgenda(EscolaId,DtIni, DtFim);
  fdqAgenda.Active := True;
  KeyValues:= GetKeyValuesDataSet(fdqAgenda,'agenda_id');
  SetSQLAgendaDet(KeyValues);

  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;

procedure TSmEscola.OpenAgenda(EscolaId:Integer;KeyValues:String);
begin
  CloseAgenda;

  SetSQLAgenda(KeyValues);

  fdqAgenda.Active := True;
  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;

function TSmEscola.SalvarAgenda(EscolaId:Integer;pUsuario:TJSONValue; DtIni, DtFim: TDateTime; LDataSetList: TFDJSONDataSets): String;
var
  LDataSet: TFDDataSet;
  Exceptions:string;
  KeyValues: string;
  LogServerRequest:TLogServerRequest;
begin
  //Método para Salvar a Agenda
  try
    Result:=EmptyStr;
    Exceptions:=EmptyStr;
    KeyValues:= EmptyStr;

    try
      Usuario:= Usuario.UnMarshal(pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'SalvarAgenda',
                                            EscolaId,
                                            Usuario);

      //Pegando dados da agenda
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda');

      if LDataSet.IsEmpty then
        Exit;

      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      OpenAgenda(EscolaId,KeyValues);
      CopyDataSet(LDataSet,fdqAgenda,False,[coAppend,coEdit]);

      //Pegando dados da agenda_aluno
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_aluno');
      CopyDataSet(LDataSet,fdqAgendaAluno,False,[coAppend,coEdit]);

      //Pegando dados da agenda_turma
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_turma');
      CopyDataSet(LDataSet,fdqAgendaTurma,False,[coAppend,coEdit]);

       SmMain.SaveLogServerRequest(LogServerRequest);
    except on E:Exception do
      Exceptions:=  Exceptions + E.Message;
    end;

    if (Exceptions <> EmptyStr) then
    begin
      Result:= 'Erro ao salvar agenda' + #13 + Exceptions;
      LogServerRequest.SetError(Exceptions);
      SmMain.SaveLogError(LogServerRequest);
    end;
  finally
    CloseAgenda;
    LogServerRequest.Free;
  end;
end;

procedure TSmEscola.SetParamsAgenda(EscolaId:Integer;DtIni,
  DtFim: TDateTime);
begin
   DtIni:= StrToDate(FormatDateTime('dd/mm/yyyy',DtIni));
   DtFim:= StrToDate(FormatDateTime('dd/mm/yyyy',DtFim));


  fdqAgenda.ParamByName('escola_id').AsInteger:= EscolaId;
  //fdqAgenda.ParamByName('funcionario_id').AsInteger:= FuncionarioId;
  fdqAgenda.ParamByName('dt_ini').AsDate:= DtIni;
  fdqAgenda.ParamByName('dt_fim').AsDate:= DtFim;

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
