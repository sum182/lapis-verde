unit untDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,System.IOUtils,
  FMX.Types, FMX.Controls, System.ImageList, FMX.ImgList, FGX.ProgressDialog,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,REST.Types;

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
    fdqLogErrorSaveServer: TFDQuery;
    FDCreateDB: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure ConectarSQLite(FDConnection: TFDConnection;DataBaseName:String);
    procedure ConectarBases;
    procedure ConectarDB;

  public
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
    procedure SalvarLogError;
    procedure SalvarDadosServer;
    procedure SyncronizarDadosServer;

  end;

var
  Dm: TDm;

const
  BASE_URL: String = 'http://54.200.116.223:8080/datasnap/rest/TSrvServerMetodos';

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses smGeralFMX, FMX.Dialogs, Data.FireDACJSONReflect, untModuloCliente,
  untFuncoes, smDBFireDac, smMensagensFMX;

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

  //Teste Temporario
  fFuncionarioId:=16;
  fEscolaId:=1;
  fResponsavelId:=0;

  fUsuarioLogadoIsFuncionario:=True;
  fUsuarioLogadoIsResponsavel:=False;

end;

procedure TDm.ResetRESTConnection;
begin
  RESTClient1.ResetToDefaults;
  RESTRequest1.ResetToDefaults;
  RESTResponse1.ResetToDefaults;
  RESTClient1.BaseURL := BASE_URL;
end;

procedure TDm.SalvarDadosServer;
begin
  SalvarLogError;
end;

procedure TDm.SalvarLogError;
var
  LDataSetList  : TFDJSONDataSets;
  MsgRetornoServer:string;
begin
  //Método para Salvar os Logs de Erro no Server
  try
    try
      MsgRetornoServer := EmptyStr;
      fdqLogErrorSaveServer.Active := False;
      fdqLogErrorSaveServer.Active := True;

      if fdqLogErrorSaveServer.IsEmpty then
        Exit;

      LDataSetList := TFDJSONDataSets.Create;
      TFDJSONDataSetsWriter.ListAdd(LDataSetList,'log_error',fdqLogErrorSaveServer);

      MsgRetornoServer:= ModuloCliente.SmMainClient.SalvarLogError(GetEscolaId,GetFuncionarioId,LDataSetList);

    except on E:Exception do
      MsgRetornoServer := MsgRetornoServer + E.Message;
    end;
  finally
    if MsgRetornoServer = '' then
      DataSetDelete(fdqLogErrorSaveServer)
    else
      DM.SetLogError( MsgRetornoServer,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'SalvarLogError',
                      Now,
                      'Erro ao Salvar LogError' + #13 + MsgRetornoServer,
                      GetEscolaId,
                      0,
                      GetFuncionarioId
                    );
    fdqLogErrorSaveServer.Active := False;
  end;
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
      raise Exception.Create(MsgUsuario);

  finally
    fdqLogError.Active:=False;
  end;
end;

procedure TDm.SyncronizarDadosServer;
begin

  try
    SalvarDadosServer;
    smMensagensFMX.MsgPoupUp('DM.SalvarDadosServer OK');
  except on E:Exception do
    smMensagensFMX.MsgPoupUp('DM.SalvarDadosServer Erro:' + e.Message);
  end;


end;

end.
