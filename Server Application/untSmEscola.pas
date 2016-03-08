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
    fdqLoginFuncionario: TFDQuery;
    fdqAgenda: TFDQuery;
    fdqAgendaAluno: TFDQuery;
    fdqTurmaAluno: TFDQuery;
    fdqTurma: TFDQuery;
    fdqAluno: TFDQuery;
    fdqAgendaTurma: TFDQuery;
    dsAgenda: TDataSource;
    procedure fdqAgendaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    function LoginFuncionario(Login:string; Senha:string):Boolean;
    function GetAlunos(EscolaId:Integer;FuncionarioId:Integer):TFDJSONDataSets;
    function GetTurmas(EscolaId:Integer;FuncionarioId:Integer):TFDJSONDataSets;

    //Metodos de Agenda
    function GetAgenda(EscolaId:Integer;FuncionarioId:Integer;AgendaId:Integer):TFDJSONDataSets;
    function SalvarAgenda(EscolaId, FuncionarioId: Integer; LDataSetList: TFDJSONDataSets):String;
    procedure ApplyChangesAgenda(EscolaId, FuncionarioId: Integer; const ADeltaList: TFDJSONDeltas);
  end;

var
  SmEscola: TSmEscola;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses untSmMain, smDBFireDac, Vcl.Forms, smGeralFMX;

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

procedure TSmEscola.fdqAgendaBeforePost(DataSet: TDataSet);
begin
  if Dataset.State in [dsInsert]  then
    Dataset.FieldByName('data_insert_server').AsDateTime:=Now;

  Dataset.FieldByName('enviado_server').AsString:= 'S';
end;

function TSmEscola.GetAgenda(EscolaId, FuncionarioId,
  AgendaId: Integer): TFDJSONDataSets;
begin
  //Método para retornar as Agendas
  try
    try
      fdqAgenda.Active := False;
      fdqAgendaAluno.Active := False;
      fdqAgendaTurma.Active := False;

      fdqAgenda.ParamByName('escola_id').AsInteger:= EscolaId;
      //fdqAgenda.ParamByName('agenda_id').AsInteger:= AgendaId;

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
      fdqAluno.Active := False;
      fdqAluno.ParamByName('escola_id').AsInteger:= EscolaId;

      Result := TFDJSONDataSets.Create;
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

function TSmEscola.GetTurmas(EscolaId, FuncionarioId: Integer): TFDJSONDataSets;
begin
  //Método para retornar as Turmas
  try
    try
      fdqTurma.Active := False;
      fdqTurma.ParamByName('escola_id').AsInteger:= EscolaId;

      Result := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(Result, fdqTurma);
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

function TSmEscola.SalvarAgenda(EscolaId, FuncionarioId: Integer; LDataSetList: TFDJSONDataSets): String;
var
  LDataSet: TFDDataSet;
  Exceptions:string;
begin
  //Método para Salvar a Agenda
  try
    Result:=EmptyStr;
    Exceptions:=EmptyStr;

    try
      //Pegando dados da agenda
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda');
      CopyDataSetByRecord(LDataSet,fdqAgenda,Exceptions);

      //Pegando dados da agenda_aluno
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_aluno');
      CopyDataSetByRecord(LDataSet,fdqAgendaAluno,Exceptions);

      //Pegando dados da agenda_turma
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'agenda_turma');
      CopyDataSetByRecord(LDataSet,fdqAgendaTurma,Exceptions);

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
    fdqAgenda.Close;
    fdqAgendaAluno.Close;
    fdqAgendaTurma.Close;
  end;
end;

end.
