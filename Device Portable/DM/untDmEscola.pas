unit untDmEscola;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,DateUtils;

type
  TDmEscola = class(TDataModule)
    fdqAluno: TFDQuery;
    fdqTurma: TFDQuery;
    fdStanStorageBinLink: TFDStanStorageBinLink;
    fdqAgenda: TFDQuery;
    fdqAgendaAluno: TFDQuery;
    fdqAgendaTurma: TFDQuery;
    fdqAgendaSaveServer: TFDQuery;
    fdqAgendaAlunoSaveServer: TFDQuery;
    fdqAgendaTurmaSaveServer: TFDQuery;
    fdqAgendaAlunoSaveServeragenda_id: TStringField;
    fdqAgendaAlunoSaveServeraluno_id: TIntegerField;
    fdqAgendaTurmaSaveServeragenda_id: TStringField;
    fdqAgendaTurmaSaveServerturma_id: TIntegerField;
    fdqTurmaAluno: TFDQuery;
    dsTurmaAluno: TDataSource;
    fdqAgendaAlunoagenda_id: TStringField;
    fdqAgendaAlunoaluno_id: TIntegerField;
    fdqAgendaTurmaagenda_id: TStringField;
    fdqAgendaTurmaturma_id: TIntegerField;
  private

    { Private declarations }
  public

    procedure OpenAlunos;
    procedure OpenTurmas;


    procedure GetAlunos;
    procedure GetTurmas;

    //Metodos para Agenda

    procedure SetSQLAgenda(AlunoId:Integer;TurmaId:Integer);overload;
    procedure SetSQLAgenda;overload;
    procedure SetSQLAgenda(KeyValues:String);overload;
    procedure SetSQLAgendaAluno(KeyValues:String);overload;
    procedure SetSQLAgendaTurma(KeyValues:String);overload;

    procedure SetParamsAgenda(AlunoId:Integer;TurmaId:Integer);


    procedure OpenAgenda(AlunoId:Integer;TurmaId:Integer);overload;
    procedure OpenAgenda;overload;
    procedure OpenAgenda(KeyValues:String);overload;
    procedure OpenAgendaAluno(KeyValues:String);overload;
    procedure OpenAgendaTurma(KeyValues:String);overload;


    procedure CloseAgenda;


    procedure GetAgenda;
    procedure CriarAgenda(Texto:string;AlunoId:Integer=0;TurmaId:Integer=0);
    procedure SalvarAgenda;
    procedure AgendaApplyChanges;

    procedure SalvarDadosServer;
  end;

var
  DmEscola: TDmEscola;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untModuloCliente, Data.FireDACJSONReflect, smDBFireDac,
  FMX.Dialogs, System.SysUtils, smGeralFMX, untFuncoes, FMX.Forms;

{$R *.dfm}

{ TDmEscola }

procedure TDmEscola.AgendaApplyChanges;
var
  Deltas:TFDJSONDeltas;
  fdmTempAgenda : TFDMemTable;
  fdmTempAgendaAluno : TFDMemTable;
  fdmTempAgendaTurma : TFDMemTable;
begin
   //Não utilizar este metodo, usar o salvar
   try
    // Post if editing
    if fdqAgenda.State in dsEditModes then
      fdqAgenda.Post;

    if fdqAgendaAluno.State in dsEditModes then
      fdqAgendaAluno.Post;

    if fdqAgendaTurma.State in dsEditModes then
      fdqAgendaTurma.Post;


    fdmTempAgenda := TFDMemTable.Create(self);
    fdmTempAgendaAluno := TFDMemTable.Create(self);
    fdmTempAgendaTurma := TFDMemTable.Create(self);

    fdmTempAgenda.Data := fdqAgenda.Delta;
    fdmTempAgendaAluno.Data := fdqAgendaAluno.Delta;
    fdmTempAgendaTurma.Data := fdqAgendaTurma.Delta;

    // Create a delta list
    Deltas := TFDJSONDeltas.Create;
    // Add deltas
    TFDJSONDeltasWriter.ListAdd(Deltas, 'agenda', fdmTempAgenda);
    TFDJSONDeltasWriter.ListAdd(Deltas, 'agenda_aluno', fdmTempAgendaAluno);
    TFDJSONDeltasWriter.ListAdd(Deltas, 'agenda_turma', fdmTempAgendaTurma);



    try
      ModuloCliente.SmEscolaClient.ApplyChangesAgenda(GetEscolaId,GetFuncionarioId,Deltas);
    except on E:Exception do
      ShowMessage('Erro no apply' + #13 + E.Message);
    end;

  finally

    fdmTempAgenda.DisposeOf;
    fdmTempAgendaAluno.DisposeOf;
    fdmTempAgendaTurma.DisposeOf;
  end;
end;

procedure TDmEscola.CloseAgenda;
begin
  fdqAgenda.Active := False;
  fdqAgendaAluno.Active := False;
  fdqAgendaTurma.Active := False;
end;

procedure TDmEscola.CriarAgenda(Texto:string;AlunoId:Integer=0;TurmaId:Integer=0);
var
  Id:String;
begin
  //Método para Criar a agenda localmente
  try
    if Texto = EmptyStr then
      Exit;

    if fdqAgenda.State in [dsInactive] then
      fdqAgenda.Open;

    if fdqAgendaAluno.State in [dsInactive] then
      fdqAgendaAluno.Open;

    if fdqAgendaTurma.State in [dsInactive] then
      fdqAgendaTurma.Open;


    Id:= GetGUID;
    fdqAgenda.Append;
    fdqAgenda.FieldByName('agenda_id').AsString:= Id;
    fdqAgenda.FieldByName('descricao').AsString:=Texto;
    fdqAgenda.FieldByName('data_insert_local').AsDateTime:=Now;
    fdqAgenda.FieldByName('funcionario_id').AsInteger:=GetFuncionarioId;
    fdqAgenda.FieldByName('escola_id').AsInteger:=GetEscolaId;
    fdqAgenda.Post;

    if AlunoId > 0 then
    begin
      fdqAgendaAluno.Append;
      fdqAgendaAluno.FieldByName('agenda_id').AsString := Id;
      fdqAgendaAluno.FieldByName('aluno_id').AsInteger := AlunoId;
      fdqAgendaAluno.Post;
    end;

    if TurmaId > 0 then
    begin
      fdqAgendaTurma.Append;
      fdqAgendaTurma.FieldByName('agenda_id').AsString := Id;
      fdqAgendaTurma.FieldByName('turma_id').AsInteger := TurmaId;
      fdqAgendaTurma.Post;
    end;


  except on E:Exception do
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'CriarAgenda',
                    Now,
                    'Erro ao Criar Agenda' + #13 + E.Message,
                    GetEscolaId,
                    0,
                    GetFuncionarioId
                  );
  end;
end;

procedure TDmEscola.GetAgenda;
var
  LDataSetList: TFDJSONDataSets;
  LDataSet: TFDDataSet;
  KeyValues: string;
begin
  //Método para retornar as Agendas
  try
    try
      KeyValues:= EmptyStr;
      LDataSetList := ModuloCliente.SmEscolaClient.GetAgenda(GetEscolaId,GetFuncionarioId,Now -30,Now +1 );

      //Pegando dados da agenda
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda');

     if LDataSet.IsEmpty then
        Exit;

      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      OpenAgenda(KeyValues);

      CopyDataSet(LDataSet,fdqAgenda,False,[coAppend,coEdit]);

      //Pegando dados da agenda_aluno
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_aluno');
      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      OpenAgendaAluno(KeyValues);
      CopyDataSet(LDataSet,fdqAgendaAluno,False,[coAppend,coEdit]);

      //Pegando dados da agenda_turma
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_turma');
      KeyValues:= GetKeyValuesDataSet(LDataSet,'agenda_id');
      OpenAgendaTurma(KeyValues);
      CopyDataSet(LDataSet,fdqAgendaTurma,False,[coAppend,coEdit]);

    except on E:Exception do
      DM.SetLogError( E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'GetAgenda',
                      Now,
                      'Erro na busca da agenda' + #13 + E.Message,
                      GetEscolaId,
                      0,
                      GetFuncionarioId
                    );
    end;
  finally
  end;
end;



procedure TDmEscola.GetAlunos;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    LDataSetList := ModuloCliente.SmEscolaClient.GetAlunos(GetEscolaId,GetFuncionarioId);
    LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);
    CopyDataSet(LDataSet,fdqAluno);
  except on E:Exception do
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'GetAlunos',
                    Now,
                    'Erro na busca de alunos' + #13 + E.Message,
                    GetEscolaId,
                    0,
                    GetFuncionarioId
                    );
  end;
end;

procedure TDmEscola.GetTurmas;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    LDataSetList := ModuloCliente.SmEscolaClient.GetTurmas(GetEscolaId,GetFuncionarioId);
    LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);
    CopyDataSet(LDataSet,fdqTurma);
  except on E:Exception do
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'GetTurmas',
                    Now,
                    'Erro na busca das turmas' + #13 + E.Message,
                    GetEscolaId,
                    0,
                    GetFuncionarioId
                    );
  end;


end;

procedure TDmEscola.OpenAgenda;
begin
  CloseAgenda;

  SetSQLAgenda;

  fdqAgenda.Active := True;
  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;



procedure TDmEscola.OpenAgendaAluno(KeyValues: String);
begin
  fdqAgendaAluno.Active := False;
  SetSQLAgendaAluno(KeyValues);
  fdqAgendaAluno.Active := True;
end;

procedure TDmEscola.OpenAgendaTurma(KeyValues: String);
begin
  fdqAgendaTurma.Active := False;
  SetSQLAgendaTurma(KeyValues);
  fdqAgendaTurma.Active := True;
end;

procedure TDmEscola.OpenAgenda(KeyValues: String);
begin
  CloseAgenda;
  SetSQLAgenda(KeyValues);
  fdqAgenda.Active := True;
end;

procedure TDmEscola.OpenAgenda(AlunoId, TurmaId: Integer);
begin
  CloseAgenda;

  SetSQLAgenda(AlunoId,TurmaId);
  SetParamsAgenda(AlunoId,TurmaId);

  fdqAgenda.Active := True;
  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;

procedure TDmEscola.OpenAlunos;
begin
  fdqAluno.Close;
  fdqAluno.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqAluno.Open;
end;

procedure TDmEscola.OpenTurmas;
begin
  fdqTurma.Close;
  fdqTurma.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqTurma.Open;

  fdqTurmaAluno.Close;
  fdqTurmaAluno.Open;
end;

procedure TDmEscola.SalvarAgenda;
var
  LDataSetList  : TFDJSONDataSets;
  MsgRetornoServer:string;
begin
  //Método para salvar a agenda no server
  try
    try
      //GetAgenda(GetFuncionarioId,0);
      fdqAgendaSaveServer.Active := False;
      fdqAgendaSaveServer.Active := True;

      if fdqAgendaSaveServer.IsEmpty  then
        Exit;

      fdqAgendaSaveServer.Active := False;
      fdqAgendaAlunoSaveServer.Active := False;
      fdqAgendaTurmaSaveServer.Active := False;

      LDataSetList := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,'agenda',fdqAgendaSaveServer);
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,'agenda_aluno',fdqAgendaAlunoSaveServer);
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,'agenda_turma',fdqAgendaTurmaSaveServer);


      MsgRetornoServer:= ModuloCliente.SmEscolaClient.SalvarAgenda(GetEscolaId,GetFuncionarioId,Now-30,Now,LDataSetList);

      //Flagando registros como enviado
      if MsgRetornoServer = EmptyStr then
        SetFlagEnviado(fdqAgendaSaveServer);

    except on E:Exception do
      MsgRetornoServer := MsgRetornoServer + E.Message;
    end;
  finally
    if MsgRetornoServer <> EmptyStr then
      DM.SetLogError( MsgRetornoServer,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'SalvarAgenda',
                      Now,
                      'Erro ao Salvar Agenda' + #13 + MsgRetornoServer,
                      GetEscolaId,
                      0,
                      GetFuncionarioId
                    );
      fdqAgendaSaveServer.Active := False;
      fdqAgendaAlunoSaveServer.Active := False;
      fdqAgendaTurmaSaveServer.Active := False;
  end;
end;

procedure TDmEscola.SalvarDadosServer;
begin
  //Método para salvar todos os dados da escola no server
  SalvarAgenda;
end;




procedure TDmEscola.SetParamsAgenda(AlunoId, TurmaId: Integer);
begin
  fdqAgenda.ParamByName('escola_id').AsInteger:= GetEscolaId;

  if AlunoId > 0 then
    fdqAgenda.ParamByName('aluno_id').AsInteger:= AlunoId;

  if TurmaId > 0 then
    fdqAgenda.ParamByName('turma_id').AsInteger:= TurmaId;
end;

procedure TDmEscola.SetSQLAgenda(KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqAgenda.SQL.Clear;
  fdqAgenda.SQL.Add('select');
  fdqAgenda.SQL.Add('  ag.*,');
  fdqAgenda.SQL.Add('  strftime("%d/%m/%Y",ag.data_insert_local) as data');
  fdqAgenda.SQL.Add('from agenda ag');
  fdqAgenda.SQL.Add('where agenda_id in (' + KeyValues + ')');
  fdqAgenda.SQL.Add('order by ag.data_insert_local desc');
end;

procedure TDmEscola.SetSQLAgendaAluno(KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqAgendaAluno.SQL.Clear;
  fdqAgendaAluno.SQL.Add('select al.*');
  fdqAgendaAluno.SQL.Add('from agenda_aluno al');
  fdqAgendaAluno.SQL.Add('where agenda_id in (' + KeyValues + ')');
end;

procedure TDmEscola.SetSQLAgendaTurma(KeyValues: String);
begin
  if KeyValues = EmptyStr then
    KeyValues:= QuoTedStr('0');

  fdqAgendaTurma.SQL.Clear;
  fdqAgendaTurma.SQL.Add('select at.*');
  fdqAgendaTurma.SQL.Add('from agenda_turma at');
  fdqAgendaTurma.SQL.Add('where agenda_id in (' + KeyValues + ')');
end;

procedure TDmEscola.SetSQLAgenda;
begin
  fdqAgenda.SQL.Clear;
  fdqAgenda.SQL.Add('select');
  fdqAgenda.SQL.Add('  ag.*,');
  fdqAgenda.SQL.Add('  strftime("%d/%m/%Y",ag.data_insert_local) as data');
  fdqAgenda.SQL.Add('from agenda ag');
  fdqAgenda.SQL.Add('order by ag.data_insert_local desc');
end;


procedure TDmEscola.SetSQLAgenda(AlunoId, TurmaId: Integer);
begin
  fdqAgenda.SQL.Clear;

  if AlunoId > 0 then
  begin
    fdqAgenda.SQL.Clear;
    fdqAgenda.SQL.Add('select');
    fdqAgenda.SQL.Add('  ag.*,');
    fdqAgenda.SQL.Add('  strftime("%d/%m/%Y",ag.data_insert_local) as data');
    fdqAgenda.SQL.Add('from agenda ag');
    fdqAgenda.SQL.Add('inner join agenda_aluno al on (ag.agenda_id = al.agenda_id)');
    fdqAgenda.SQL.Add('where 1=1');
    fdqAgenda.SQL.Add('and ag.escola_id = :escola_id');
    fdqAgenda.SQL.Add('and al.aluno_id = :aluno_id');
    fdqAgenda.SQL.Add('order by ag.data_insert_local desc');
  end;


  if TurmaId > 0 then
  begin
    fdqAgenda.SQL.Clear;
    fdqAgenda.SQL.Add('select');
    fdqAgenda.SQL.Add('  ag.*,');
    fdqAgenda.SQL.Add('  strftime("%d/%m/%Y",ag.data_insert_local) as data');
    fdqAgenda.SQL.Add('from agenda ag');
    fdqAgenda.SQL.Add('inner join agenda_turma at on (ag.agenda_id = at.agenda_id)');
    fdqAgenda.SQL.Add('where 1=1');
    fdqAgenda.SQL.Add('and ag.escola_id = :escola_id');
    fdqAgenda.SQL.Add('and at.turma_id = :turma_id');
    fdqAgenda.SQL.Add('order by ag.data_insert_local desc');
  end;

  fdqAgendaAluno.SQL.Clear;
  fdqAgendaAluno.SQL.Add('select * from agenda_aluno al');
  fdqAgendaAluno.SQL.Add('where al.agenda_id = :agenda_id');
  fdqAgendaAluno.ParamByName('agenda_id').AsInteger:=0;

  fdqAgendaTurma.SQL.Clear;
  fdqAgendaTurma.SQL.Add('select * from agenda_turma at');
  fdqAgendaTurma.SQL.Add('where at.agenda_id = :agenda_id');
  fdqAgendaTurma.ParamByName('agenda_id').AsInteger:=0;

end;

end.











