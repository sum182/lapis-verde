unit untDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.IOUtils,
  FMX.Types, FMX.Controls, System.ImageList, FMX.ImgList, FGX.ProgressDialog,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Types, untLibGeral, untTypes, untResourceString, untLibDevicePortable,
  Vcl.ExtCtrls
  //Erro apagar o texto que esta no exemplo abaixo
  //,Vcl.ExtCtrls
  //


  {$IF DEFINED(MSWINDOWS)}
  ,
  WinApi.Windows,
  WinApi.ShlObj
  {$ENDIF}

  ;

type
  TDm = class(TDataModule)
    FDConnectionDB: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    fgActivityDialog: TfgActivityDialog;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    fdqLogError: TFDQuery;
    FDCreateDB: TFDConnection;
    fdqProcessoAtualizacao: TFDQuery;
    TimerSyncBasico: TTimer;
    TimerSyncGeral: TTimer;
    fdqAluno: TFDQuery;
    fdqTurma: TFDQuery;
    fdqTurmaAluno: TFDQuery;
    fdqResp: TFDQuery;
    fdqRespAluno: TFDQuery;
    fdqRespTelefone: TFDQuery;
    fdqRespTipo: TFDQuery;
    fdqFunc: TFDQuery;
    fdqFuncTipo: TFDQuery;
    fdqLoginRealizado: TFDQuery;
    FDConnectionDBWin32Release: TFDConnection;
    FDConnectionDBWin32Debug: TFDConnection;
    fdqLoginUltimo: TFDQuery;
    fdqUsuarioLogado: TFDQuery;
    fdqParametro: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure TimerSyncGeralTimer(Sender: TObject);
    procedure TimerSyncBasicoTimer(Sender: TObject);
    procedure fgActivityDialogCancel(Sender: TObject);
  private
    SyncServer: Boolean;
    procedure ConectarSQLite(FDConnection: TFDConnection; DataBaseName: String);
    procedure ConectarBases;
    procedure ConectarDB;
    procedure SetModoTeste;
    procedure GetInfoFileApp;
    procedure GetConfiguracoes;
  public

    AppName      : String;
    AppPath      : String;

    IsModoTeste: Boolean;
    IsTesteApp: Boolean;

    fEscolaId: Integer;


    procedure SetSQLAlunos;
    procedure OpenAlunos;
    procedure OpenTurmas;
    procedure OpenTurmaAluno; overload;
    procedure OpenTurmaAluno(TurmaId: Integer); overload;
    procedure OpenResponsaveis;
    procedure OpenFuncionarios;
    procedure CloseResponsaveis;
    procedure CloseFuncionarios;

    procedure ResetRESTConnection;
    procedure SetLogError(MsgError, Aplicacao, UnitNome, Classe, Metodo: string; Data: TDateTime; MsgUsuario: string = '');
    procedure OpenProcessoAtualizacao;
    procedure OpenParametro;
    procedure OpenQuerys;


    procedure PrimeiroAcessoVerificar;
    procedure PrimeiroAcessoExecutar;


    function ProcessHasUpdate(Process: string): Boolean;
    procedure ProcessSaveUpdate(Process: string);

    procedure SetLogin(IdUsuario:Integer; TipoUsuario: TUsuarioTipo;EscolaId:Integer);

    procedure OpenUsuarioLogado;

    procedure LoginAuto;

    function AllowSyncronizar:Boolean;
    procedure SyncronizarDadosServerGeral;
    procedure SyncronizarDadosServerBasico;

  end;

var
  Dm: TDm;
  Usuario: TUsuario;
  Configuracoes:TConfiguracoes;
  FActivityDialogThread: TThread;
  PrimeiroAcessoOK:Boolean;
  PrimeiroAcessoInExecute:Boolean;

const
  BASE_URL: String =
    'http://54.200.116.223:8080/datasnap/rest/TSrvServerMetodos';

implementation

{ %CLASSGROUP 'FMX.Controls.TControl' }

uses smGeralFMX, FMX.Dialogs, Data.FireDACJSONReflect, untRestClient, smDBFireDac, smMensagensFMX, smNetworkState, untDmGetServer,
  untDmSaveServer;

{$R *.dfm}

function TDm.AllowSyncronizar: Boolean;
begin
  Result := False;

  if SyncServer then
      Exit;

  if Usuario.Id <= 0 then
      Exit;

  if not smNetworkState.IsConnected then
    Exit;

  if not PrimeiroAcessoOK then
    if not PrimeiroAcessoInExecute then
      Exit;

  Result:= True;
end;

procedure TDm.CloseFuncionarios;
begin
  fdqFunc.Close;
  fdqFuncTipo.Close;
end;

procedure TDm.CloseResponsaveis;
begin
  fdqResp.Close;
  fdqRespAluno.Close;
  fdqRespTelefone.Close;
  fdqRespTipo.Close;
end;

procedure TDm.ConectarBases;
begin
  ConectarDB;
end;

procedure TDm.ConectarDB;
begin
  //ConectarSQLite(FDCreateDB, 'db.s3db');
  FDCreateDB.Close;
  ConectarSQLite(FDConnectionDB, 'db.s3db');
end;

procedure TDm.ConectarSQLite(FDConnection: TFDConnection; DataBaseName: String);
var
  DataBase: string;
begin

  try
    FDConnection.Close;

    if smGeralFMX.IsSysOSAndroid or (smGeralFMX.IsSysOSiOS) then
    begin
      DataBase := TPath.GetDocumentsPath + PathDelim + DataBaseName;
      FDConnection.Params.Values['Database'] := DataBase;
    end;

    if smGeralFMX.IsSysOSWindows then
    begin
      DataBase := AppPath + 'BD' + PathDelim + DataBaseName;
    end;

    FDConnection.Params.Values['Database'] := DataBase;
    FDConnection.Open;
  except
    on E: Exception do
      ShowMessage('Erro ao conectar ao banco de dados local!' + #13 +
        E.Message);
  end;

end;

procedure TDm.DataModuleCreate(Sender: TObject);
begin
  GetInfoFileApp;
  GetConfiguracoes;
  FDConnectionDB.Close;
  FDCreateDB.Close;
  ConectarBases;

  Usuario := TUsuario.Create;

  PrimeiroAcessoInExecute:=False;
  PrimeiroAcessoOK:=False;

  SetModoTeste;
  OpenParametro;
end;

procedure TDm.fgActivityDialogCancel(Sender: TObject);
begin
  FActivityDialogThread.Terminate;
end;

procedure TDm.GetConfiguracoes;
begin
  Configuracoes:=TConfiguracoes.Create;
  Configuracoes.GetConfiguracoes;
end;

procedure TDm.GetInfoFileApp;
var
  Path         : array [0..1023] of Char;
  AppExeName   : array [0..1023] of Char;
begin
  {$IF DEFINED(MSWINDOWS)}
  GetModuleFileName(0, AppExeName, Sizeof(AppExeName));
  SHGetFolderPath(0, CSIDL_LOCAL_APPDATA, 0, SHGFP_TYPE_CURRENT, @Path[0]);
  AppName:= ChangeFileExt(ExtractFileName(AppExeName), '');
  AppPath:= ExtractFilePath(AppExeName);
  {$ENDIF}
end;

procedure TDm.PrimeiroAcessoVerificar;
var
  Chave:String;
  FieldUsuario:String;
begin
  PrimeiroAcessoOK:=False;
  OpenParametro;
  Chave:='primeiro_acesso';
  fdqParametro.IndexFieldNames := 'chave';
  if fdqParametro.FindKey([Chave]) Then
    if fdqParametro.FieldByName('valor').AsString = 'OK' then
    begin
      PrimeiroAcessoOK:=True;
      Exit;
    end;
end;

procedure TDm.LoginAuto;
begin
  fdqLoginUltimo.Close;
  fdqLoginUltimo.Open;

  if fdqLoginUltimo.IsEmpty then
    Exit;

  SetLogin(fdqLoginUltimo.FieldByName('usuario_id').AsInteger,
              TUsuarioTipo(fdqLoginUltimo.FieldByName('usuario_tipo').AsInteger),
              fdqLoginUltimo.FieldByName('escola_id').AsInteger);
end;

procedure TDm.OpenAlunos;
begin
  fdqAluno.Close;
  SetSQLAlunos;

  if Usuario.Tipo = Funcionario then
    fdqAluno.ParamByName('escola_id').AsInteger := GetEscolaId;

  if Usuario.Tipo = Responsavel then
    fdqAluno.ParamByName('responsavel_id').AsInteger := Usuario.Id;

  fdqAluno.Open;
end;

procedure TDm.OpenFuncionarios;
begin
  fdqFunc.Close;
  fdqFunc.ParamByName('escola_id').AsInteger := GetEscolaId;
  fdqFunc.Open;

  fdqFuncTipo.Close;
  fdqFuncTipo.Open;
end;

procedure TDm.OpenParametro;
begin
  fdqParametro.Close;
  fdqParametro.SQL.Clear;
  fdqParametro.SQL.Add('select * from parametro');
  fdqParametro.SQL.Add('where 1=1');
  fdqParametro.SQL.Add('and ((responsavel_id is null) and (funcionario_id is null)');

  if Usuario.Tipo = Funcionario then
  begin
    fdqParametro.SQL.Add(' or (funcionario_id = :funcionario_id)');
    fdqParametro.ParamByName('funcionario_id').AsInteger:=Usuario.Id;
  end;

  if Usuario.Tipo = Responsavel then
  begin
    fdqParametro.SQL.Add(' or (responsavel_id = :responsavel_id)');
    fdqParametro.ParamByName('responsavel_id').AsInteger:=Usuario.Id;
  end;

  fdqParametro.SQL.Add(')');
  fdqParametro.Open;
end;

procedure TDm.OpenProcessoAtualizacao;
begin
  fdqProcessoAtualizacao.Close;
  fdqProcessoAtualizacao.SQL.Clear;


  if Usuario.Tipo = Funcionario then
  begin
    fdqProcessoAtualizacao.SQL.Add('SELECT * FROM processo_atualizacao');
    fdqProcessoAtualizacao.SQL.Add('where ((escola_id = :escola_id) or (escola_id = 0))');
    fdqProcessoAtualizacao.ParamByName('escola_id').AsInteger := GetEscolaId;
  end;


   if Usuario.Tipo = Responsavel then
  begin
    fdqProcessoAtualizacao.SQL.Add('SELECT * FROM processo_atualizacao');
    fdqProcessoAtualizacao.SQL.Add('where (escola_id = 0) ' + GetSQLEscolaId('escola_id','or'));
  end;

  fdqProcessoAtualizacao.Open;
end;

procedure TDm.OpenQuerys;
begin
  OpenAlunos;
  OpenTurmas;
end;

procedure TDm.OpenResponsaveis;
begin
  fdqResp.Close;
  fdqResp.ParamByName('escola_id').AsInteger := GetEscolaId;
  fdqResp.Open;

  fdqRespAluno.Close;
  fdqRespAluno.ParamByName('escola_id').AsInteger := GetEscolaId;
  fdqRespAluno.Open;

  fdqRespTelefone.Close;
  fdqRespTelefone.ParamByName('escola_id').AsInteger := GetEscolaId;
  fdqRespTelefone.Open;

  fdqRespTipo.Close;
  fdqRespTipo.Open;
end;

procedure TDm.OpenTurmaAluno;
begin
  fdqTurmaAluno.Close;
  fdqTurmaAluno.SQL.Clear;
  fdqTurmaAluno.SQL.Add('select');
  fdqTurmaAluno.SQL.Add('ta.*');
  fdqTurmaAluno.SQL.Add('from turma_aluno ta');

  fdqTurmaAluno.SQL.Add('inner join turma t on (t.turma_id = ta.turma_id )');
  fdqTurmaAluno.SQL.Add('where t.escola_id = :escola_id');

  fdqTurmaAluno.ParamByName('escola_id').AsInteger := GetEscolaId;

  fdqTurmaAluno.Open;
end;

procedure TDm.OpenTurmaAluno(TurmaId: Integer);
begin
  fdqTurmaAluno.Close;
  fdqTurmaAluno.SQL.Clear;
  fdqTurmaAluno.SQL.Add('select');
  fdqTurmaAluno.SQL.Add('ta.*');
  fdqTurmaAluno.SQL.Add('from turma_aluno ta');

  fdqTurmaAluno.SQL.Add('inner join turma t on (t.turma_id = ta.turma_id )');
  fdqTurmaAluno.SQL.Add('where t.escola_id = :escola_id');

  fdqTurmaAluno.SQL.Add('and t.turma_id = :turma_id');

  fdqTurmaAluno.ParamByName('turma_id').AsInteger := TurmaId;

  fdqTurmaAluno.ParamByName('escola_id').AsInteger := GetEscolaId;

  fdqTurmaAluno.Open;
end;

procedure TDm.OpenTurmas;
begin
  fdqTurma.Close;
  fdqTurma.ParamByName('escola_id').AsInteger := GetEscolaId;
  fdqTurma.Open;
  OpenTurmaAluno;
end;

procedure TDm.OpenUsuarioLogado;
begin
  fdqUsuarioLogado.Close;
  fdqUsuarioLogado.SQL.Clear;

  if Usuario.Tipo = Responsavel then
  begin
    fdqUsuarioLogado.SQL.Add('select * from responsavel r');
    fdqUsuarioLogado.SQL.Add('where r.responsavel_id = :responsavel_id');
    fdqUsuarioLogado.ParamByName('responsavel_id').AsInteger := Usuario.Id;
  end;

  if Usuario.Tipo = Funcionario then
  begin
    fdqUsuarioLogado.SQL.Add('select * from funcionario f');
    fdqUsuarioLogado.SQL.Add('where f.escola_id = :escola_id');
    fdqUsuarioLogado.SQL.Add('and f.funcionario_id = :funcionario_id');
    fdqUsuarioLogado.ParamByName('escola_id').AsInteger := GetEscolaId;
    fdqUsuarioLogado.ParamByName('funcionario_id').AsInteger := Usuario.Id;
  end;


  fdqUsuarioLogado.Open;

  Usuario.Nome := fdqUsuarioLogado.FieldByName('nome').AsString;
  Usuario.Sobrenome := fdqUsuarioLogado.FieldByName('Sobrenome').AsString;
end;

procedure TDm.PrimeiroAcessoExecutar;
var
  Chave:String;
  FieldUsuario:String;
begin
  try
    try
      PrimeiroAcessoInExecute:=True;
      MsgPoupUpTeste('ini primeiro acesso');
      PrimeiroAcessoOK:=False;
      OpenParametro;
      Chave:='primeiro_acesso';
      fdqParametro.IndexFieldNames := 'chave';
      if not fdqParametro.FindKey([Chave]) Then
      begin
        if Usuario.Tipo = Funcionario then
          FieldUsuario:='funcionario_id';

        if Usuario.Tipo = Responsavel then
          FieldUsuario:='responsavel_id';

        fdqParametro.Append;
        fdqParametro.FieldByName('parametro_id').AsString:=GetGUID;
        fdqParametro.FieldByName('Chave').AsString:=Chave;
        fdqParametro.FieldByName(FieldUsuario).AsInteger:=Usuario.Id;
        fdqParametro.Post;
      end
      else if fdqParametro.FieldByName('valor').AsString = 'OK' then
      begin
        PrimeiroAcessoOK:=True;
        Exit;
      end;

      if not smNetworkState.ValidarConexao then
        Exit;

      SyncronizarDadosServerGeral;
      fdqParametro.Edit;
      fdqParametro.FieldByName('valor').AsString:='OK';
      fdqParametro.Post;
      PrimeiroAcessoOK:=True;
    finally
      if not PrimeiroAcessoOK then
        ShowMessage('Não foi possível syncronizar dados para seu primeiro acesso!');

      MsgPoupUpTeste('fim primeiro acesso');
      PrimeiroAcessoInExecute:=False;
    end;

  except on E:Exception do
    begin
        DM.SetLogError( E.Message,
                        GetApplicationName,
                        UnitName,
                        ClassName,
                        'PrimeiroAcessoExecutar',
                        Now,
                        'Erro ao Syncronizar informações do primeiro acesso' + #13 + E.Message
                      );
    end;
  end;
end;

function TDm.ProcessHasUpdate(Process: string): Boolean;
begin

  if IsTesteApp then
  begin
    Result:=True;
    Exit;
  end;

  {if PrimeiroAcessoInExecute then
  begin
    Result:=True;
    Exit;
  end;}

  OpenProcessoAtualizacao;

  fdqProcessoAtualizacao.IndexFieldNames := 'processo';
  if not fdqProcessoAtualizacao.FindKey([Process]) Then
    Exit;

  Result := (fdqProcessoAtualizacao.FieldByName('data_local').AsDateTime <
    fdqProcessoAtualizacao.FieldByName('data').AsDateTime);

end;

procedure TDm.ProcessSaveUpdate(Process: string);
begin
  OpenProcessoAtualizacao;

  fdqProcessoAtualizacao.IndexFieldNames := 'processo';
  if not fdqProcessoAtualizacao.FindKey([Process]) Then
    Exit;

  fdqProcessoAtualizacao.Edit;
  fdqProcessoAtualizacao.FieldByName('data_local').AsDateTime := Now;
  fdqProcessoAtualizacao.Post;
end;

procedure TDm.ResetRESTConnection;
begin
  RESTClient1.ResetToDefaults;
  RESTRequest1.ResetToDefaults;
  RESTResponse1.ResetToDefaults;
  RESTClient1.BaseURL := BASE_URL;
end;

procedure TDm.SetLogError(MsgError, Aplicacao, UnitNome, Classe, Metodo: string; Data: TDateTime; MsgUsuario: string = '');
begin
  try
    fdqLogError.Active := False;
    fdqLogError.Active := True;

    fdqLogError.Append;
    fdqLogError.FieldByName('log_error_id').AsString := GetGUID;
    fdqLogError.FieldByName('msg_error').AsString := MsgError;
    fdqLogError.FieldByName('aplicacao').AsString := Aplicacao;
    fdqLogError.FieldByName('unit').AsString := UnitNome;
    fdqLogError.FieldByName('class').AsString := Classe;
    fdqLogError.FieldByName('metodo').AsString := Metodo;

    fdqLogError.FieldByName('escola_id').AsInteger := GetEscolaId;

    if Usuario.Tipo = Responsavel then
      fdqLogError.FieldByName('responsavel_id').AsInteger := Usuario.Id;

     if Usuario.Tipo = Funcionario then
      fdqLogError.FieldByName('funcionario_id').AsInteger := Usuario.Id;

    fdqLogError.FieldByName('data').AsDateTime := Data;
    fdqLogError.Post;

    if (MsgUsuario <> '') and not(IsTesteApp) and not((Pos(rs_erro_conexao_internet,MsgError)>0)) then
      ShowMessage(MsgUsuario);

  finally
    fdqLogError.Active := False;
  end;
end;

procedure TDm.SetLogin(IdUsuario: Integer; TipoUsuario: TUsuarioTipo;EscolaId:Integer);
begin
  Usuario.Tipo := TipoUsuario;
  Usuario.Id := IdUsuario;
  OpenUsuarioLogado;
  //Usuario.Nome:= Nome;
  //Usuario.Sobrenome:= Sobrenome;
  Dm.fEscolaId:= EscolaId;

  Dm.fdqLoginRealizado.Close;
  Dm.fdqLoginRealizado.Open;
  Dm.fdqLoginRealizado.Append;
  Dm.fdqLoginRealizado.FieldByName('usuario_id').AsInteger := IdUsuario;
  Dm.fdqLoginRealizado.FieldByName('usuario_tipo').AsInteger := Integer(TipoUsuario);
  Dm.fdqLoginRealizado.FieldByName('data_login').AsDateTime := Now;

  if TipoUsuario = Funcionario then
    Dm.fdqLoginRealizado.FieldByName('escola_id').AsInteger:= EscolaId;

  Dm.fdqLoginRealizado.Post;
  Dm.fdqLoginRealizado.Close;
end;

procedure TDm.SetModoTeste;
begin
  IsModoTeste := True;
  fEscolaId := 1;

  //Usuario.Tipo := Funcionario;
  //Usuario.Id := 16;
end;

procedure TDm.SetSQLAlunos;
begin

  fdqAluno.SQL.Clear;

  if Usuario.Tipo = Funcionario then
  begin
    fdqAluno.SQL.Clear;
    fdqAluno.SQL.Add(' select a.*,');
    fdqAluno.SQL.Add('       coalesce(a.nome,'') || ' + ' ' + ' || coalesce(a.sobrenome,'') as nome_completo');
    fdqAluno.SQL.Add('');
    fdqAluno.SQL.Add('from aluno a');
    fdqAluno.SQL.Add('where escola_id = :escola_id');
    fdqAluno.SQL.Add('order by nome');
  end;


  if Usuario.Tipo = Responsavel then
  begin
    fdqAluno.SQL.Clear;
    fdqAluno.SQL.Add(' select a.*,');
    fdqAluno.SQL.Add('       coalesce(a.nome,'') || ' + ' ' + ' || coalesce(a.sobrenome,'') as nome_completo');
    fdqAluno.SQL.Add('');
    fdqAluno.SQL.Add('from aluno a');
    fdqAluno.SQL.Add('inner join responsavel_aluno ra on (ra.aluno_id = a.aluno_id)');
    fdqAluno.SQL.Add('where ra.responsavel_id = :responsavel_id');
    fdqAluno.SQL.Add('order by nome');
  end;
end;

procedure TDm.SyncronizarDadosServerGeral;
begin
  try
    if not AllowSyncronizar then
      Exit;

    SyncServer := True;

    try
      DmGetServer.GetDadosServerGeral;
      MsgPoupUpTeste('DmGetServer.GetDadosServerGeral OK');
    except
      on E: Exception do
        MsgPoupUp('DmGetServer.GetDadosServerGeral Erro:' + E.Message);
    end;

    try
      DmSaveServer.SaveDadosServerGeral;
      MsgPoupUpTeste('DM.SalvarDadosServer OK');
    except
      on E: Exception do
        MsgPoupUp('DM.SalvarDadosServer Erro:' + E.Message);
    end;

  finally
    SyncServer := False;
  end;
end;

procedure TDm.SyncronizarDadosServerBasico;
begin
  try
    if not AllowSyncronizar then
      Exit;

    if PrimeiroAcessoInExecute then
      Exit;

    SyncServer := True;

    try
      DmGetServer.GetDadosServerBasico;
      MsgPoupUpTeste('DmGetServer.GetDadosServerBasico OK');
    except
      on E: Exception do
        MsgPoupUp('DmGetServer.GetDadosServerBasico' + E.Message);
    end;

    try
      DmSaveServer.SaveDadosServerBasico;
      MsgPoupUpTeste('DmSaveServer.SaveDadosServerBasico OK');
    except
      on E: Exception do
        MsgPoupUp('DmSaveServer.SaveDadosServerBasico Erro:' + E.Message);
    end;

  finally
    SyncServer := False;
  end;
end;

procedure TDm.TimerSyncBasicoTimer(Sender: TObject);
var
  Thread: TThread;
begin
  if IsTesteApp then
    Exit;

  Thread := TThread.CreateAnonymousThread(
    procedure
    begin
      SyncronizarDadosServerBasico;
    end);
  Thread.Start;
end;

procedure TDm.TimerSyncGeralTimer(Sender: TObject);
var
  Thread: TThread;
begin
  if IsTesteApp then
    Exit;

  Thread := TThread.CreateAnonymousThread(
    procedure
    begin
      SyncronizarDadosServerGeral;
    end);
  Thread.Start;
end;

end.
