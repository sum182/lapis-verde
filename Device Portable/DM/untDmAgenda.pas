unit untDmAgenda;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,DateUtils,
  FMX.Types, Data.FireDACJSONReflect;

type
  TDmAgenda = class(TDataModule)
    fdStanStorageBinLink: TFDStanStorageBinLink;
    fdqAgenda: TFDQuery;
    fdqAgendaAluno: TFDQuery;
    fdqAgendaTurma: TFDQuery;
    fdqAgendaAlunoagenda_id: TStringField;
    fdqAgendaAlunoaluno_id: TIntegerField;
    fdqAgendaTurmaagenda_id: TStringField;
    fdqAgendaTurmaturma_id: TIntegerField;
    fdqAgendaCriar: TFDQuery;
  private
  public
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
  DmAgenda: TDmAgenda;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untRestClient, smDBFireDac,
  FMX.Dialogs, System.SysUtils, smGeralFMX, untFuncoes, FMX.Forms,smMensagensFMX,smNetworkState,
  untDmGetServer, untDmSaveServer;

{$R *.dfm}

{ TDmEscola }


procedure TDmAgenda.CloseAgenda;
begin
  fdqAgenda.Active := False;
  fdqAgendaAluno.Active := False;
  fdqAgendaTurma.Active := False;
end;



procedure TDmAgenda.CriarAgenda(Texto:string;Data:TDate;AlunoId:Integer=0;
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

      Dm.OpenTurmaAluno(TurmaId);
      Dm.fdqTurmaAluno.First;
      while not (Dm.fdqTurmaAluno.Eof)do
      begin
        fdqAgendaAluno.Append;
        fdqAgendaAluno.FieldByName('agenda_id').AsString := Id;
        fdqAgendaAluno.FieldByName('aluno_id').AsInteger := Dm.fdqTurmaAluno.FieldByName('aluno_id').AsInteger;
        fdqAgendaAluno.Post;
        Dm.fdqTurmaAluno.Next;
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


procedure TDmAgenda.OpenAgenda;
begin
  CloseAgenda;

  SetSQLAgenda;

  fdqAgenda.Active := True;
  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;




procedure TDmAgenda.OpenAgenda(AlunoId, TurmaId: Integer;Data:TDate);
begin
  CloseAgenda;

  SetSQLAgenda(AlunoId,TurmaId);
  SetParamsAgenda(AlunoId,TurmaId,Data);

  fdqAgenda.Active := True;
  fdqAgendaAluno.Active := True;
  fdqAgendaTurma.Active := True;
end;

procedure TDmAgenda.SetParamsAgenda(AlunoId, TurmaId: Integer;Data:TDate);
begin
  fdqAgenda.ParamByName('escola_id').AsInteger:= GetEscolaId;

  if AlunoId > 0 then
    fdqAgenda.ParamByName('aluno_id').AsInteger:= AlunoId;

  if TurmaId > 0 then
    fdqAgenda.ParamByName('turma_id').AsInteger:= TurmaId;

  fdqAgenda.ParamByName('data').AsDate:= Data;
end;

procedure TDmAgenda.SetSQLAgenda;
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


procedure TDmAgenda.SetSQLAgenda(AlunoId, TurmaId: Integer);
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
