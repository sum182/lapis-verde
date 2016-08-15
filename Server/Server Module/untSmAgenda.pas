unit untSmAgenda;

interface

uses
  System.Classes, System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,Data.FireDACJSONReflect,
  Vcl.AppEvnts, untLibGeral, System.JSON, FireDAC.Phys.MySQLDef, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Stan.StorageBin;

type

{$METHODINFO ON}

  TSmAgenda = class(TDataModule)

 {$METHODINFO OFF}
    fdqAgenda: TFDQuery;
    fdqAgendaAluno: TFDQuery;
    fdqAgendaTurma: TFDQuery;
    fdqAgendaAlunoagenda_id: TStringField;
    fdqAgendaAlunoaluno_id: TIntegerField;
    fdqAgendaTurmaagenda_id: TStringField;
    fdqAgendaTurmaturma_id: TIntegerField;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    procedure fdqAgendaBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure SetSQLAgenda(KeysInserts: String = '');overload;
    procedure SetSQLAgendaByKey(KeyValues:String);overload;
    procedure SetSQLAgendaDet(KeyValues:String);

    procedure SetParamsAgenda(DtIni,DtFim:TDateTime);

    procedure OpenAgenda(DtIni,DtFim:TDateTime;KeysInserts: String = '');overload;
    procedure OpenAgenda(KeyValues:String);overload;
    procedure CloseAgenda;


     procedure OpenAgendaTeste(DtIni,DtFim:TDateTime);
     procedure SetSQLAgendaTeste;



 {$METHODINFO ON}
  public
    function GetAgenda(pEscolaId:Integer;pUsuario:TJSONValue;DtIni,DtFim:TDateTime;KeysInserts: String = '' ):TFDJSONDataSets;
    function GetAgendaTeste(pEscolaId:Integer;pUsuario:TJSONValue;DtIni,DtFim:TDateTime;KeysInserts: String = '' ):TFDJSONDataSets;
    function SalvarAgenda(pEscolaId:Integer; pUsuario:TJSONValue; DtIni, DtFim: TDateTime; LDataSetList: TFDJSONDataSets):String;
  end;

var
  SmAgenda: TSmAgenda;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses untSmMain, smDBFireDac, Vcl.Forms, smGeralFMX, smGeral,untLibServer;

{$R *.dfm}

{ TSmAgenda }


procedure TSmAgenda.CloseAgenda;
begin
  fdqAgenda.Active := False;
  fdqAgendaAluno.Active := False;
  fdqAgendaTurma.Active := False;
end;

procedure TSmAgenda.DataModuleCreate(Sender: TObject);
begin
  if not Assigned(SmMain) then
    Application.CreateForm(TSmMain, SmMain);
end;

procedure TSmAgenda.fdqAgendaBeforePost(DataSet: TDataSet);
begin
  if Dataset.State in [dsInsert]  then
    Dataset.FieldByName('data_insert_server').AsDateTime:=Now;
end;


function TSmAgenda.GetAgenda(pEscolaId:Integer;pUsuario:TJSONValue;
   DtIni,DtFim:TDateTime;KeysInserts: String = ''): TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin

  //Método para retornar as Agendas
  try
    try
      SmMain.SetParamsServer(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'GetAgenda',
                                            EscolaId,
                                            Usuario);

      OpenAgenda(DtIni,DtFim,KeysInserts);
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
    LogServerRequest.Free;
  end;
end;



function TSmAgenda.GetAgendaTeste(pEscolaId: Integer; pUsuario: TJSONValue;
  DtIni, DtFim: TDateTime;KeysInserts: String = '' ): TFDJSONDataSets;
var
  LogServerRequest:TLogServerRequest;
begin
  //Método para retornar as Agendas
  try
    try
      SmMain.SetParamsServer(pEscolaId,pUsuario);
      LogServerRequest:=TLogServerRequest.Create;
      LogServerRequest.SetLogServerRequest( UnitName,
                                            ClassName,
                                            'GetAgendaTeste',
                                            EscolaId,
                                            Usuario);

      OpenAgendaTeste(DtIni,DtFim);
      //OpenAgenda(DtIni,DtFim,KeysInserts);
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
    LogServerRequest.Free;
  end;
end;




procedure TSmAgenda.OpenAgenda(DtIni,DtFim: TDateTime;KeysInserts: String = '');
var
  KeyValues:String;
begin
  CloseAgenda;
  SetSQLAgenda(KeysInserts);
  SetParamsAgenda(DtIni, DtFim);
  fdqAgenda.Active := True;
  KeyValues:= GetKeyValuesDataSet(fdqAgenda,'agenda_id');
  SetSQLAgendaDet(KeyValues);

  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;

procedure TSmAgenda.OpenAgenda(KeyValues:String);
begin
  CloseAgenda;

  SetSQLAgendaByKey(KeyValues);

  fdqAgenda.Active := True;
  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;

procedure TSmAgenda.OpenAgendaTeste(DtIni, DtFim: TDateTime);
var
  KeyValues:String;
begin
  CloseAgenda;
  SetSQLAgendaTeste;
  SetParamsAgenda(DtIni,DtFim);
  fdqAgenda.Active := True;
  KeyValues:= GetKeyValuesDataSet(fdqAgenda,'agenda_id');
  SetSQLAgendaDet(KeyValues);

  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;


function TSmAgenda.SalvarAgenda(pEscolaId:Integer;pUsuario:TJSONValue; DtIni, DtFim: TDateTime; LDataSetList: TFDJSONDataSets): String;
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
      SmMain.SetParamsServer(pEscolaId,pUsuario);
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
      OpenAgenda(KeyValues);
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

procedure TSmAgenda.SetParamsAgenda(DtIni,DtFim: TDateTime);
begin
  DtIni:= StrToDate(FormatDateTime('dd/mm/yyyy',DtIni));
  DtFim:= StrToDate(FormatDateTime('dd/mm/yyyy',DtFim));


  //fdqAgenda.ParamByName('escola_id').AsInteger:= EscolaId;

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



procedure TSmAgenda.SetSQLAgenda(KeysInserts: String = '');
begin
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

  //fdqAgenda.SQL.Add('and ag.escola_id = :escola_id');
  fdqAgenda.SQL.Add(SmMain.GetSQLEscolaId('ag.escola_id'));


  fdqAgenda.SQL.Add('and ag.data between :dt_ini and :dt_fim');

  if KeysInserts <> '' then
    fdqAgenda.SQL.Add('and ag.agenda_id not in (' + KeysInserts + ')');

  fdqAgenda.SQL.Add('group by agenda_id');
end;
procedure TSmAgenda.SetSQLAgendaByKey(KeyValues: String);
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


procedure TSmAgenda.SetSQLAgendaDet(KeyValues:String);
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

procedure TSmAgenda.SetSQLAgendaTeste;
var
  LDataSet: TFDDataSet;
  KeyValues: string;
begin

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

  fdqAgenda.SQL.Add('group by agenda_id');
  exit;
end;

end.
