unit untDmEscola;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,DateUtils,
  FMX.Types, Data.FireDACJSONReflect;

type
  TDmEscola = class(TDataModule)
    fdqAluno: TFDQuery;
    fdqTurma: TFDQuery;
    fdStanStorageBinLink: TFDStanStorageBinLink;
    fdqAgenda: TFDQuery;
    fdqAgendaAluno: TFDQuery;
    fdqAgendaTurma: TFDQuery;
    fdqTurmaAluno: TFDQuery;
    dsTurmaAluno: TDataSource;
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
    TimerSyncBasico: TTimer;
    fdqAgendaCriar: TFDQuery;
    TimerSyncGeral: TTimer;
  private
  public
    procedure OpenAlunos;
    procedure OpenTurmas;
    procedure OpenTurmaAluno;overload;
    procedure OpenTurmaAluno(TurmaId:Integer);overload;
    procedure OpenResponsaveis;
    procedure OpenFuncionarios;
    procedure CloseResponsaveis;
    procedure CloseFuncionarios;

    //Metodos para Agenda
    procedure SetSQLAgenda;overload;
    procedure SetSQLAgenda(AlunoId:Integer;TurmaId:Integer);overload;
    procedure SetParamsAgenda(AlunoId:Integer;TurmaId:Integer;Data:TDate);
    procedure OpenAgenda;overload;
    procedure OpenAgenda(AlunoId:Integer;TurmaId:Integer;Data:TDate);overload;
    procedure CloseAgenda;
    procedure CriarAgenda(Texto:string;Data:TDate;AlunoId:Integer=0;
                          TurmaId:Integer=0);


  end;

var
  DmEscola: TDmEscola;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untModuloCliente, smDBFireDac,
  FMX.Dialogs, System.SysUtils, smGeralFMX, untFuncoes, FMX.Forms,smMensagensFMX,smNetworkState,
  untDmGetServer, untDmSaveServer;

{$R *.dfm}

{ TDmEscola }


procedure TDmEscola.CloseAgenda;
begin
  fdqAgenda.Active := False;
  fdqAgendaAluno.Active := False;
  fdqAgendaTurma.Active := False;
end;


procedure TDmEscola.CloseFuncionarios;
begin
  fdqFunc.Close;
  fdqFuncTipo.Close;
end;

procedure TDmEscola.CloseResponsaveis;
begin
  fdqResp.Close;
  fdqRespAluno.Close;
  fdqRespTelefone.Close;
  fdqRespTipo.Close;
end;

procedure TDmEscola.CriarAgenda(Texto:string;Data:TDate;AlunoId:Integer=0;
                                TurmaId:Integer=0);
var
  Id:String;
  Thread: TThread;
begin
  //Método para Criar a agenda localmente
  try
    if Texto = EmptyStr then
      Exit;

    if fdqAgendaCriar.State in [dsInactive] then
      fdqAgendaCriar.Open;

    if fdqAgendaAluno.State in [dsInactive] then
      fdqAgendaAluno.Open;

    if fdqAgendaTurma.State in [dsInactive] then
      fdqAgendaTurma.Open;


    Id:= GetGUID;
    fdqAgendaCriar.Append;
    fdqAgendaCriar.FieldByName('agenda_id').AsString:= Id;
    fdqAgendaCriar.FieldByName('descricao').AsString:=Texto;
    fdqAgendaCriar.FieldByName('data').AsDateTime:=Data;
    fdqAgendaCriar.FieldByName('data_insert_local').AsDateTime:=Now;
    fdqAgendaCriar.FieldByName('funcionario_id').AsInteger:=GetFuncionarioId;
    fdqAgendaCriar.FieldByName('escola_id').AsInteger:=GetEscolaId;
    fdqAgendaCriar.Post;

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

      OpenTurmaAluno(TurmaId);
      fdqTurmaAluno.First;
      while not (fdqTurmaAluno.Eof)do
      begin
        fdqAgendaAluno.Append;
        fdqAgendaAluno.FieldByName('agenda_id').AsString := Id;
        fdqAgendaAluno.FieldByName('aluno_id').AsInteger := fdqTurmaAluno.FieldByName('aluno_id').AsInteger;
        fdqAgendaAluno.Post;
        fdqTurmaAluno.Next;
      end;
    end;


    Thread := TThread.CreateAnonymousThread(procedure
    begin
      DmSaveServer.SaveAgenda;
    end);
    Thread.Start;


  except on E:Exception do
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'CriarAgenda',
                    Now,
                    'Erro ao Criar Agenda' + #13 + E.Message,
                    GetEscolaId,
                    GetResponsavelId,
                    GetFuncionarioId
                  );
  end;

   MsgPoupUp('Agenda criada com sucesso');
end;


procedure TDmEscola.OpenAgenda;
begin
  CloseAgenda;

  SetSQLAgenda;

  fdqAgenda.Active := True;
  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;




procedure TDmEscola.OpenAgenda(AlunoId, TurmaId: Integer;Data:TDate);
begin
  CloseAgenda;

  SetSQLAgenda(AlunoId,TurmaId);
  SetParamsAgenda(AlunoId,TurmaId,Data);

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

procedure TDmEscola.OpenFuncionarios;
begin
  fdqFunc.Close;
  fdqFunc.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqFunc.Open;

  fdqFuncTipo.Close;
  fdqFuncTipo.Open;
end;

procedure TDmEscola.OpenResponsaveis;
begin
  fdqResp.Close;
  fdqResp.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqResp.Open;

  fdqRespAluno.Close;
  fdqRespAluno.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqRespAluno.Open;

  fdqRespTelefone.Close;
  fdqRespTelefone.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqRespTelefone.Open;

  fdqRespTipo.Close;
  fdqRespTipo.Open;
end;

procedure TDmEscola.OpenTurmaAluno(TurmaId:Integer);
begin
  fdqTurmaAluno.Close;
  fdqTurmaAluno.SQL.Clear;
  fdqTurmaAluno.SQL.Add('select');
  fdqTurmaAluno.SQL.Add('ta.*');
  fdqTurmaAluno.SQL.Add('from turma_aluno ta');
  fdqTurmaAluno.SQL.Add('inner join turma t on (t.turma_id = ta.turma_id )');
  fdqTurmaAluno.SQL.Add('where t.escola_id = :escola_id');
  fdqTurmaAluno.SQL.Add('and t.turma_id = :turma_id');
  fdqTurmaAluno.ParamByName('turma_id').AsInteger:= TurmaId;
  fdqTurmaAluno.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqTurmaAluno.Open;
end;

procedure TDmEscola.OpenTurmaAluno;
begin
  fdqTurmaAluno.Close;
  fdqTurmaAluno.SQL.Clear;
  fdqTurmaAluno.SQL.Add('select');
  fdqTurmaAluno.SQL.Add('ta.*');
  fdqTurmaAluno.SQL.Add('from turma_aluno ta');
  fdqTurmaAluno.SQL.Add('inner join turma t on (t.turma_id = ta.turma_id )');
  fdqTurmaAluno.SQL.Add('where t.escola_id = :escola_id');
  fdqTurmaAluno.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqTurmaAluno.Open;
end;

procedure TDmEscola.OpenTurmas;
begin
  fdqTurma.Close;
  fdqTurma.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqTurma.Open;
  OpenTurmaAluno;
end;




procedure TDmEscola.SetParamsAgenda(AlunoId, TurmaId: Integer;Data:TDate);
begin
  fdqAgenda.ParamByName('escola_id').AsInteger:= GetEscolaId;

  if AlunoId > 0 then
    fdqAgenda.ParamByName('aluno_id').AsInteger:= AlunoId;

  if TurmaId > 0 then
    fdqAgenda.ParamByName('turma_id').AsInteger:= TurmaId;

  fdqAgenda.ParamByName('data').AsDate:= Data;
end;

procedure TDmEscola.SetSQLAgenda;
begin
  fdqAgenda.SQL.Clear;
  fdqAgenda.SQL.Add('select');
  fdqAgenda.SQL.Add('  ag.*,');
  fdqAgenda.SQL.Add('  strftime("%d/%m/%Y",ag.data_insert_local) as data_criacao,');
  fdqAgenda.SQL.Add('  strftime("%H:%M",data_insert_local) as hora_criacao,');
  fdqAgenda.SQL.Add('  f.nome as funcionario_nome,');
  fdqAgenda.SQL.Add('  ft.descricao as funcionario_tipo,');
  fdqAgenda.SQL.Add('  r.nome as responsavel_nome,');
  fdqAgenda.SQL.Add('  rt.descricao as responsavel_tipo');
  fdqAgenda.SQL.Add('from agenda ag');
  fdqAgenda.SQL.Add('left outer join funcionario f on (f.funcionario_id = ag.funcionario_id)');
  fdqAgenda.SQL.Add('left outer join funcionario_tipo ft on (ft.funcionario_tipo_id = f.funcionario_tipo_id)');
  fdqAgenda.SQL.Add('left outer join responsavel r on (r.responsavel_id = ag.responsavel_id)');
  fdqAgenda.SQL.Add('left outer join responsavel_tipo rt on (rt.responsavel_tipo_id = r.responsavel_tipo_id)');
  fdqAgenda.SQL.Add('order by ag.data_insert_local');
end;


procedure TDmEscola.SetSQLAgenda(AlunoId, TurmaId: Integer);
begin
  fdqAgenda.SQL.Clear;

  if AlunoId > 0 then
  begin
    fdqAgenda.SQL.Clear;
    fdqAgenda.SQL.Add('select');
    fdqAgenda.SQL.Add('  ag.*,');
    fdqAgenda.SQL.Add('  strftime("%d/%m/%Y",ag.data_insert_local) as data_criacao,');
    fdqAgenda.SQL.Add('  strftime("%H:%M",data_insert_local) as hora_criacao,');
    fdqAgenda.SQL.Add('  f.nome as funcionario_nome,');
    fdqAgenda.SQL.Add('  ft.descricao as funcionario_tipo,');
    fdqAgenda.SQL.Add('  r.nome as responsavel_nome,');
    fdqAgenda.SQL.Add('  rt.descricao as responsavel_tipo');
    fdqAgenda.SQL.Add('from agenda ag');
    fdqAgenda.SQL.Add('inner join agenda_aluno al on (ag.agenda_id = al.agenda_id)');
    fdqAgenda.SQL.Add('left outer join funcionario f on (f.funcionario_id = ag.funcionario_id)');
    fdqAgenda.SQL.Add('left outer join funcionario_tipo ft on (ft.funcionario_tipo_id = f.funcionario_tipo_id)');
    fdqAgenda.SQL.Add('left outer join responsavel r on (r.responsavel_id = ag.responsavel_id)');
    fdqAgenda.SQL.Add('left outer join responsavel_tipo rt on (rt.responsavel_tipo_id = r.responsavel_tipo_id)');

    fdqAgenda.SQL.Add('where 1=1');
    fdqAgenda.SQL.Add('and data = :data');
    fdqAgenda.SQL.Add('and ag.escola_id = :escola_id');
    fdqAgenda.SQL.Add('and al.aluno_id = :aluno_id');
    fdqAgenda.SQL.Add('order by ag.data_insert_local ');
  end;


  if TurmaId > 0 then
  begin
    fdqAgenda.SQL.Clear;
    fdqAgenda.SQL.Add('select');
    fdqAgenda.SQL.Add('  ag.*,');
    fdqAgenda.SQL.Add('  strftime("%d/%m/%Y",ag.data_insert_local) as data_criacao,');
    fdqAgenda.SQL.Add('  strftime("%H:%M",data_insert_local) as hora_criacao,');
    fdqAgenda.SQL.Add('  f.nome as funcionario_nome,');
    fdqAgenda.SQL.Add('  ft.descricao as funcionario_tipo,');
    fdqAgenda.SQL.Add('  r.nome as responsavel_nome,');
    fdqAgenda.SQL.Add('  rt.descricao as responsavel_tipo');
    fdqAgenda.SQL.Add('from agenda ag');
    fdqAgenda.SQL.Add('inner join agenda_turma at on (ag.agenda_id = at.agenda_id)');
    fdqAgenda.SQL.Add('left outer join funcionario f on (f.funcionario_id = ag.funcionario_id)');
    fdqAgenda.SQL.Add('left outer join funcionario_tipo ft on (ft.funcionario_tipo_id = f.funcionario_tipo_id)');
    fdqAgenda.SQL.Add('left outer join responsavel r on (r.responsavel_id = ag.responsavel_id)');
    fdqAgenda.SQL.Add('left outer join responsavel_tipo rt on (rt.responsavel_tipo_id = r.responsavel_tipo_id)');
    fdqAgenda.SQL.Add('where 1=1');
    fdqAgenda.SQL.Add('and data = :data');
    fdqAgenda.SQL.Add('and ag.escola_id = :escola_id');
    fdqAgenda.SQL.Add('and at.turma_id = :turma_id');
    fdqAgenda.SQL.Add('order by ag.data_insert_local ');
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
