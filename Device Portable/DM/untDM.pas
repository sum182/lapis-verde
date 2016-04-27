unit untDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,System.IOUtils,
  FMX.Types, FMX.Controls, System.ImageList, FMX.ImgList, FGX.ProgressDialog,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,REST.Types,untLibGeral,untTypes;
type
  TDm = class(TDataModule)
    FDConnectionDB: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    ImageList1: TImageList;
    fgActivityDialog: TfgActivityDialog;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    FDConnectionDBEscola: TFDConnection;
    FDConnectionDBResponsavel: TFDConnection;
    fdqLogError: TFDQuery;
    FDCreateDB: TFDConnection;
    fdqProcessoAtualizacao: TFDQuery;
    TimerSyncBasico: TTimer;
    TimerSyncGeral: TTimer;
    procedure DataModuleCreate(Sender: TObject);
    procedure TimerSyncGeralTimer(Sender: TObject);
    procedure TimerSyncBasicoTimer(Sender: TObject);
  private
    SyncServer:Boolean;
    procedure ConectarSQLite(FDConnection: TFDConnection;DataBaseName:String);
    procedure ConectarBases;
    procedure ConectarDB;
    procedure SetModoTeste;
  public
    IsModoTeste:Boolean;
    fUsuarioLogadoIsResponsavel:boolean;
    fUsuarioLogadoIsFuncionario:boolean;

    fEscolaId:Integer;
    fResponsavelId:Integer;
    fFuncionarioId:Integer;
    procedure ResetRESTConnection;
    procedure SetLogError( MsgError,Aplicacao,UnitNome,Classe,Metodo:String;
                           Data:TDateTime;
                           MsgUsuario:String = '';
                           EscolaId:Integer = 0;
                           ResponsavelId:Integer=0;
                           FuncionarioId:Integer=0
                          );
    procedure OpenProcessoAtualizacao;
    function ProcessHasUpdate(Process:string):Boolean;
    procedure ProcessSaveUpdate(Process:string);

    procedure SyncronizarDadosServerGeral;
    procedure SyncronizarDadosServerBasico;

  end;

var
  Dm: TDm;
  Usuario:TUsuario;

const
  BASE_URL: String = 'http://54.200.116.223:8080/datasnap/rest/TSrvServerMetodos';

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses smGeralFMX, FMX.Dialogs, Data.FireDACJSONReflect, untModuloCliente,
  untFuncoes, smDBFireDac, smMensagensFMX,smNetworkState, untDmGetServer,
  untDmEscola, untDmSaveServer;

{$R *.dfm}

procedure TDm.ConectarBases;
begin
  ConectarDB;
end;

procedure TDm.ConectarDB;
begin
  ConectarSQLite(FDCreateDB,'db.s3db');
  FDCreateDB.Close;
  ConectarSQLite(FDConnectionDB,'db.s3db');
end;


procedure TDm.ConectarSQLite(FDConnection: TFDConnection;DataBaseName:String);
var
  DataBase:string;
begin

  try
    FDConnection.Close;

    if smGeralFMX.IsSysOSAndroid or (smGeralFMX.IsSysOSiOS) then
    begin
      DataBase := TPath.GetDocumentsPath + PathDelim + DataBaseName;
      FDConnection.Params.Values['Database']:= DataBase;
    end;

    FDConnection.Open;
  except
   on E: Exception do
        ShowMessage('Erro ao conectar ao banco de dados local!' + #13 +
          E.Message);
  end;

end;

procedure TDm.DataModuleCreate(Sender: TObject);
begin
  FDConnectionDB.Close;
  FDCreateDB.Close;
  ConectarBases;

  Usuario:= TUsuario.Create;

  SetModoTeste;

  //mudar este por tipo de usuario
  fUsuarioLogadoIsFuncionario:=True;
  fUsuarioLogadoIsResponsavel:=False;
  //
end;

procedure TDm.OpenProcessoAtualizacao;
begin
  fdqProcessoAtualizacao.Close;
  fdqProcessoAtualizacao.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqProcessoAtualizacao.Open;
end;

function TDm.ProcessHasUpdate(Process: string): Boolean;
begin
  Result:=True;
  exit;
  OpenProcessoAtualizacao;

  fdqProcessoAtualizacao.IndexFieldNames:='processo';
  if not fdqProcessoAtualizacao.FindKey([Process]) Then
    Exit;

  Result:= (
             fdqProcessoAtualizacao.FieldByName('data_local').AsDateTime <
             fdqProcessoAtualizacao.FieldByName('data').AsDateTime
            );

end;

procedure TDm.ProcessSaveUpdate(Process: string);
begin
 OpenProcessoAtualizacao;

  fdqProcessoAtualizacao.IndexFieldNames:='processo';
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



procedure TDm.SetLogError(MsgError, Aplicacao, UnitNome, Classe, Metodo: String;
  Data: TDateTime; MsgUsuario:String; EscolaId, ResponsavelId, FuncionarioId: Integer);
begin
  try
    fdqLogError.Active:=False;
    fdqLogError.Active:=True;

    fdqLogError.Append;
    fdqLogError.FieldByName('log_error_id').AsString:= GetGUID;
    fdqLogError.FieldByName('msg_error').AsString:= MsgError;
    fdqLogError.FieldByName('aplicacao').AsString:= Aplicacao;
    fdqLogError.FieldByName('unit').AsString:= UnitNome;
    fdqLogError.FieldByName('class').AsString:= Classe;
    fdqLogError.FieldByName('metodo').AsString:= Metodo;

    if EscolaId > 0 then
      fdqLogError.FieldByName('escola_id').AsInteger:=EscolaId;

    if ResponsavelId > 0 then
      fdqLogError.FieldByName('responsavel_id').AsInteger:=ResponsavelId;

    if FuncionarioId > 0 then
      fdqLogError.FieldByName('funcionario_id').AsInteger:= FuncionarioId;

    fdqLogError.FieldByName('data').AsDateTime:= Data;
    fdqLogError.Post;

    if MsgUsuario <> '' then
      ShowMessage(MsgUsuario);

  finally
    fdqLogError.Active:=False;
  end;
end;

procedure TDm.SetModoTeste;
begin
  IsModoTeste:=True;
  fFuncionarioId:=16;
  fEscolaId:=1;
  fResponsavelId:=0;

  Usuario.Tipo:=Funcionario;
  Usuario.Id:= 16;
end;

procedure TDm.SyncronizarDadosServerGeral;
begin
  try
    if SyncServer then
      Exit;

    if not smNetworkState.IsConnected then
      Exit;

    SyncServer:=True;

    try
      DmGetServer.GetDadosServerGeral;
      MsgPoupUpTeste('DmGetServer.GetDadosServerGeral OK');
    except on E:Exception do
      MsgPoupUp('DmGetServer.GetDadosServerGeral Erro:' + e.Message);
    end;

    try
      DmSaveServer.SaveDadosServerGeral;
      MsgPoupUpTeste('DM.SalvarDadosServer OK');
    except on E:Exception do
      MsgPoupUp('DM.SalvarDadosServer Erro:' + e.Message);
    end;

  finally
    SyncServer:=False;
  end;
end;

procedure TDm.SyncronizarDadosServerBasico;
begin
  try
    if SyncServer then
      Exit;

    if not smNetworkState.IsConnected then
      Exit;

    SyncServer:=True;

    try
      DmGetServer.GetServerBasico;
      MsgPoupUpTeste('DmGetServer.GetServerBasico OK');
    except on E:Exception do
      MsgPoupUp('DmGetServer.GetServerBasico' + e.Message);
    end;

    try
      DmSaveServer.SaveServerBasico;
      MsgPoupUpTeste('DmSaveServer.SaveServerBasico OK');
    except on E:Exception do
      MsgPoupUp('DmSaveServer.SaveServerBasico Erro:' + e.Message);
    end;

  finally
    SyncServer:=False;
  end;
end;

procedure TDm.TimerSyncBasicoTimer(Sender: TObject);
var
  Thread: TThread;
begin
  Thread := TThread.CreateAnonymousThread(procedure
    begin
      SyncronizarDadosServerBasico;
    end);
  Thread.Start;
end;

procedure TDm.TimerSyncGeralTimer(Sender: TObject);
var
  Thread: TThread;
begin
  Thread := TThread.CreateAnonymousThread(procedure
    begin
      SyncronizarDadosServerGeral;
    end);
  Thread.Start;
end;

end.
