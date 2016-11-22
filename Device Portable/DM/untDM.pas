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
  REST.Types, untLibGeral, untTypes, untResourceString, untLibDevicePortable
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
    fdqRespEscola: TFDQuery;
    fdqConfiguracoes: TFDQuery;
    fdqDeviceUsuario: TFDQuery;
    TimerSaveGeral: TTimer;
    procedure DataModuleCreate(Sender: TObject);
    procedure TimerSyncGeralTimer(Sender: TObject);
    procedure TimerSyncBasicoTimer(Sender: TObject);
    procedure fgActivityDialogCancel(Sender: TObject);
    procedure TimerSaveGeralTimer(Sender: TObject);
  private
    procedure ConectarSQLite(FDConnection: TFDConnection; DataBaseName: String);
    procedure ConectarBases;
    procedure ConectarDB;
    procedure SetModoTeste;
    procedure GetInfoFileApp;
    procedure GetConfiguracoes;
    procedure SetVariables;
  public
    SyncServer: Boolean;
    AppName      : String;
    AppPath      : String;

    IsModoTeste: Boolean;
    IsTesteApp: Boolean;

    fEscolaId: Integer;
    fSistemaOperacionalTipo:TSistemaOperacional;

    procedure DeleteTabel(Tabela:String);
    procedure DeleteAllTabels;

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
    procedure OpenConfiguracoes;
    procedure OpenConfiguracoesLoginUltimo;
    procedure OpenDeviceUsuario;
    procedure OpenLoginUltimo;
    procedure OpenParametro;
    procedure OpenQuerys;


    procedure PrimeiroAcessoVerificar;
    procedure PrimeiroAcessoExecutar;


    function ProcessHasUpdate(Process: string): Boolean;
    procedure ProcessSaveUpdate(Process: string);

    procedure SetLogin(IdUsuario:Integer; TipoUsuario: TUsuarioTipo;EscolaId:Integer);
    procedure SetDeviceUsuario;
    procedure SetSistemaOperacionalTipo;


    procedure OpenUsuarioLogado;

    procedure LoginAuto;

    function AllowSyncronizar:Boolean;
    procedure SyncronizarSaveServerGeral;
    procedure SyncronizarSaveServerBasico;

    procedure SyncronizarGetServerGeral;
    procedure SyncronizarGetServerBasico;


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

  DtSyncBasicoIni:TDateTime;
  DtSyncBasicoFim:TDateTime;

  DtSyncBasicoExecIni:TDateTime;
  DtSyncBasicoExecFim:TDateTime;

  DtSyncGeralIni:TDateTime;
  DtSyncGeralFim:TDateTime;

  FirstSyncExecute:Boolean;


const
  BASE_URL: String =
    'http://54.200.116.223:8080/datasnap/rest/TSrvServerMetodos';

implementation

{ %CLASSGROUP 'FMX.Controls.TControl' }

uses smGeralFMX, FMX.Dialogs, Data.FireDACJSONReflect, untRestClient, smDBFireDac, smMensagensFMX, smNetworkState, untDmGetServer,
  untDmSaveServer, untSQLs, untDMCloudMessaging;

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
  //Não mudar esta ordem
  Usuario := TUsuario.Create;
  SetVariables;
  GetInfoFileApp;
  FDConnectionDB.Close;
  FDCreateDB.Close;
  ConectarBases;

  SetSistemaOperacionalTipo;

  //Pega as configurações do ultimo usuario logado
  GetConfiguracoes;

  PrimeiroAcessoInExecute:=False;
  PrimeiroAcessoOK:=False;

  SetModoTeste;
  OpenParametro;

  //Pega as configurações do novo acesso
  GetConfiguracoes;

  //Seta as informações de device do usuario
  //SetDeviceUsuario;
end;

procedure TDm.DeleteAllTabels;
begin
  DeleteTabel('agenda');
  DeleteTabel('agenda_aluno');
  DeleteTabel('agenda_tipo');
  DeleteTabel('agenda_turma');
  DeleteTabel('aluno');
  DeleteTabel('aluno_foto');
  DeleteTabel('configuracoes');
  DeleteTabel('device_usuario');
  DeleteTabel('escola');
  DeleteTabel('escola_endereco');
  DeleteTabel('escola_telefone');
  DeleteTabel('funcionario');
  DeleteTabel('funcionario_foto');
  DeleteTabel('funcionario_tipo');
  DeleteTabel('log_error');
  DeleteTabel('login_realizado');
  DeleteTabel('mensagem');
  DeleteTabel('mensagem_tipo');
  DeleteTabel('parametro');
  DeleteTabel('periodo_tipo');
  DeleteTabel('processo_atualizacao');
  DeleteTabel('responsavel');
  DeleteTabel('responsavel_aluno');
  DeleteTabel('responsavel_escola');
  DeleteTabel('responsavel_foto');
  DeleteTabel('responsavel_telefone');
  DeleteTabel('responsavel_tipo');
  DeleteTabel('sistema_operacional_tipo');
  DeleteTabel('telefone_tipo');
  DeleteTabel('turma');
  DeleteTabel('turma_aluno');
end;

procedure TDm.DeleteTabel(Tabela: String);
begin
  FDConnectionDB.ExecSQL('delete from ' + Tabela);
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
  OpenLoginUltimo;

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

procedure TDm.OpenConfiguracoes;
begin
  fdqConfiguracoes.Close;
  fdqConfiguracoes.SQL.Clear;
  fdqConfiguracoes.SQL.Add('select * from configuracoes');
  fdqConfiguracoes.SQL.Add('where 1=1');
  fdqConfiguracoes.SQL.Add('and ((responsavel_id is null) and (funcionario_id is null)');

  if Usuario.Tipo = Funcionario then
  begin
    fdqConfiguracoes.SQL.Add(' or (funcionario_id = :funcionario_id)');
    fdqConfiguracoes.ParamByName('funcionario_id').AsInteger:=Usuario.Id;
  end;

  if Usuario.Tipo = Responsavel then
  begin
    fdqConfiguracoes.SQL.Add(' or (responsavel_id = :responsavel_id)');
    fdqConfiguracoes.ParamByName('responsavel_id').AsInteger:=Usuario.Id;
  end;

  fdqConfiguracoes.SQL.Add(')');
  fdqConfiguracoes.Open;
end;

procedure TDm.OpenConfiguracoesLoginUltimo;
begin
  OpenLoginUltimo;

  fdqConfiguracoes.Close;
  fdqConfiguracoes.SQL.Clear;
  fdqConfiguracoes.SQL.Add('select * from configuracoes');
  fdqConfiguracoes.SQL.Add('where 1=1');
  fdqConfiguracoes.SQL.Add('and ((responsavel_id is null) and (funcionario_id is null)');

  if TUsuarioTipo(fdqLoginUltimo.FieldByName('usuario_tipo').AsInteger) = Funcionario then
  begin
    fdqConfiguracoes.SQL.Add(' or (funcionario_id = :funcionario_id)');
    fdqConfiguracoes.ParamByName('funcionario_id').AsInteger:=fdqLoginUltimo.FieldByName('usuario_id').AsInteger;
  end;

  if TUsuarioTipo(fdqLoginUltimo.FieldByName('usuario_tipo').AsInteger) = Responsavel then
  begin
    fdqConfiguracoes.SQL.Add(' or (responsavel_id = :responsavel_id)');
    fdqConfiguracoes.ParamByName('responsavel_id').AsInteger:=fdqLoginUltimo.FieldByName('usuario_id').AsInteger;
  end;

  fdqConfiguracoes.SQL.Add(')');
  fdqConfiguracoes.Open;
end;

procedure TDm.OpenDeviceUsuario;
begin
  fdqDeviceUsuario.Close;
  fdqDeviceUsuario.SQL.Clear;
  fdqDeviceUsuario.SQL.Add('select * from device_usuario');
  fdqDeviceUsuario.SQL.Add('where ' + Usuario.FieldName + ' = ' + IntToStr(Usuario.Id));
  fdqDeviceUsuario.SQL.Add('and device_id = ' + QuoTedStr(DeviceId) );
  fdqDeviceUsuario.Open;
end;

procedure TDm.OpenFuncionarios;
begin
  fdqFunc.Close;
  fdqFunc.SQL.Clear;
  fdqFunc.SQL.Add(rs_SQLFuncionario);
  fdqFunc.SQL.Add(GetSQLEscolaId);
  fdqFunc.Open;

  fdqFuncTipo.Close;
  fdqFuncTipo.Open;
end;

procedure TDm.OpenLoginUltimo;
begin
  fdqLoginUltimo.Close;
  fdqLoginUltimo.Open;
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
    fdqProcessoAtualizacao.SQL.Add('where ((escola_id = :escola_id) or (escola_id = 0) or (funcionario_id = :funcionario_id) )');
    fdqProcessoAtualizacao.ParamByName('escola_id').AsInteger := GetEscolaId;
    fdqProcessoAtualizacao.ParamByName('funcionario_id').AsInteger := Usuario.Id;
  end;


  if Usuario.Tipo = Responsavel then
  begin
    fdqProcessoAtualizacao.SQL.Add('SELECT * FROM processo_atualizacao');
    fdqProcessoAtualizacao.SQL.Add('where ((escola_id = 0) ' + GetSQLEscolaId('escola_id','or'));
    fdqProcessoAtualizacao.SQL.Add('or (responsavel_id = :responsavel_id))');
    fdqProcessoAtualizacao.ParamByName('responsavel_id').AsInteger := Usuario.Id;

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
  //Tabela responsavel
  fdqResp.Active := False;
  fdqResp.SQL.Clear;
  fdqResp.SQL.Add(rs_SQLResposavel);
  fdqResp.SQL.Add(GetSQLEscolaId('re.escola_id'));

  //Tabela de responsavel_escola
  fdqRespEscola.Active := False;
  fdqRespEscola.SQL.Clear;
  fdqRespEscola.SQL.Add(rs_SQLResposavelEscola);
  fdqRespEscola.SQL.Add(GetSQLEscolaId('re.escola_id'));

  //Tabela de responsavel_aluno
  fdqRespAluno.Active := False;
  fdqRespAluno.SQL.Clear;
  fdqRespAluno.SQL.Add(rs_SQLResposavelAluno);
  fdqRespAluno.SQL.Add(GetSQLEscolaId('re.escola_id'));

  //Tabela de responsavel_telefone
  fdqRespTelefone.Active := False;
  fdqRespTelefone.SQL.Clear;
  fdqRespTelefone.SQL.Add(rs_SQLResposavelTelefone);
  fdqRespTelefone.SQL.Add(GetSQLEscolaId('re.escola_id'));

  fdqRespTipo.Close;
  fdqRespTipo.Open;
end;

procedure TDm.OpenTurmaAluno;
begin
  fdqTurmaAluno.Close;
  fdqTurmaAluno.SQL.Clear;
  fdqTurmaAluno.SQL.Clear;
  fdqTurmaAluno.SQL.Add(rs_SQLTurmaAluno);
  fdqTurmaAluno.SQL.Add(GetSQLEscolaId());
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
  fdqTurma.SQL.Clear;
  fdqTurma.SQL.Clear;
  fdqTurma.SQL.Add(rs_SQLTurma);
  fdqTurma.SQL.Add(GetSQLEscolaId);
  fdqTurma.SQL.Add('order by nome');
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
begin
  try
    try
      PrimeiroAcessoInExecute:=True;
      PrimeiroAcessoOK:=False;
      OpenParametro;
      Chave:='primeiro_acesso';
      fdqParametro.IndexFieldNames := 'chave';
      if not fdqParametro.FindKey([Chave]) Then
      begin
        fdqParametro.Append;
        fdqParametro.FieldByName('parametro_id').AsString:=GetGUID;
        fdqParametro.FieldByName('Chave').AsString:=Chave;
        fdqParametro.FieldByName(Usuario.FieldName).AsInteger:=Usuario.Id;
        fdqParametro.Post;
      end
      else if fdqParametro.FieldByName('valor').AsString = 'OK' then
      begin
        PrimeiroAcessoOK:=True;
        Exit;
      end;

      if not smNetworkState.ValidarConexao then
        Exit;

      SyncronizarSaveServerGeral;
      SyncronizarGetServerGeral;
      //SyncronizarDadosServerGeral;
      SetDeviceUsuario;
      SyncronizarSaveServerGeral;

      fdqParametro.Edit;
      fdqParametro.FieldByName('valor').AsString:='OK';
      fdqParametro.Post;
      PrimeiroAcessoOK:=True;
    finally
      if not PrimeiroAcessoOK then
        ShowMessage('Não foi possível syncronizar dados para seu primeiro acesso!');

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

  if PrimeiroAcessoInExecute then
  begin
    Result:=True;
    Exit;
  end;

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

procedure TDm.SetDeviceUsuario;
begin
  DMCloudMessaging.GetDeviceInfo;

  if not fdqDeviceUsuario.IsEmpty then
    Exit;

  if DeviceToken = '' then
    Exit;

  DMCloudMessaging.PushEvents.AutoRegisterDevice:=True;

  fdqDeviceUsuario.Append;
  fdqDeviceUsuario.FieldByName('device_usuario_id').AsString:=GetGUID;
  fdqDeviceUsuario.FieldByName(Usuario.FieldName).AsInteger:=Usuario.Id;
  fdqDeviceUsuario.FieldByName('device_id').AsString:=DeviceId;
  fdqDeviceUsuario.FieldByName('device_token').AsString:=DeviceToken;
  fdqDeviceUsuario.FieldByName('sistema_operacional_tipo_id').AsInteger := Integer(fSistemaOperacionalTipo);

  fdqDeviceUsuario.FieldByName('data_insert_server').Clear;
  fdqDeviceUsuario.FieldByName('enviado_server').Clear;
  fdqDeviceUsuario.FieldByName('data_atualizacao').AsDateTime:=Now;

  fdqDeviceUsuario.Post;
  DMCloudMessaging.PushEvents.AutoRegisterDevice:=False;
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

procedure TDm.SetSistemaOperacionalTipo;
begin
  if smGeralFMX.IsSysOSAndroid then
    fSistemaOperacionalTipo := Android
  else if smGeralFMX.IsSysOSWindows then
    fSistemaOperacionalTipo := Windows
  else if smGeralFMX.IsSysOSiOS then
    fSistemaOperacionalTipo := Ios;
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

procedure TDm.SetVariables;
begin
  DtSyncBasicoIni:= Now - 1;
  DtSyncBasicoFim:= Now + 7;

  DtSyncBasicoExecIni:=DtSyncBasicoIni;
  DtSyncBasicoExecFim:=DtSyncBasicoFim;

  DtSyncGeralIni:=Now - 30;
  DtSyncGeralFim:=Now + 30;

  FirstSyncExecute:=False;
end;

procedure TDm.SyncronizarDadosServerGeral;
begin
  try
    if not AllowSyncronizar then
      Exit;

    SyncServer := True;

    try
      DmSaveServer.SaveDadosServerGeral;
      MsgPoupUpTeste('DM.SalvarDadosServer OK');
    except
      on E: Exception do
        MsgPoupUp('DM.SalvarDadosServer Erro:' + E.Message);
    end;

    try
      DmGetServer.GetDadosServerGeral;
      MsgPoupUpTeste('DmGetServer.GetDadosServerGeral OK');
    except
      on E: Exception do
        MsgPoupUp('DmGetServer.GetDadosServerGeral Erro:' + E.Message);
    end;

    if not FirstSyncExecute Then
      FirstSyncExecute:= True;
  finally
    SyncServer := False;
  end;
end;

procedure TDm.SyncronizarGetServerBasico;
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

  finally
    SyncServer := False;
  end;

end;

procedure TDm.SyncronizarGetServerGeral;
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

    if not FirstSyncExecute Then
      FirstSyncExecute:= True;
  finally
    SyncServer := False;
  end;

end;

procedure TDm.SyncronizarSaveServerBasico;
begin
  try
    if not AllowSyncronizar then
      Exit;

    if PrimeiroAcessoInExecute then
      Exit;

    SyncServer := True;


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

procedure TDm.SyncronizarSaveServerGeral;
begin
  try
    if not AllowSyncronizar then
      Exit;

    SyncServer := True;

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
      DmSaveServer.SaveDadosServerBasico;
      MsgPoupUpTeste('DmSaveServer.SaveDadosServerBasico OK');
    except
      on E: Exception do
        MsgPoupUp('DmSaveServer.SaveDadosServerBasico Erro:' + E.Message);
    end;

    try
      DmGetServer.GetDadosServerBasico;
      MsgPoupUpTeste('DmGetServer.GetDadosServerBasico OK');
    except
      on E: Exception do
        MsgPoupUp('DmGetServer.GetDadosServerBasico' + E.Message);
    end;

  finally
    SyncServer := False;
  end;
end;

procedure TDm.TimerSaveGeralTimer(Sender: TObject);
var
  Thread: TThread;
begin
  if IsTesteApp then
    Exit;

  Thread := TThread.CreateAnonymousThread(
    procedure
    begin
      SyncronizarSaveServerGeral;
    end);
  Thread.Start;
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
