unit untSmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin, FireDAC.Comp.UI, FireDAC.Comp.DataSet, Vcl.AppEvnts,
  Data.FireDACJSONReflect;

type
{$METHODINFO ON}
  TSmMain = class(TDataModule)
    fdqAlunos: TFDQuery;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDWaitCursor: TFDGUIxWaitCursor;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDConnection: TFDConnection;
    FDConnectionLocal: TFDConnection;
    fdqLogError: TFDQuery;
    ApplicationEvents: TApplicationEvents;
    procedure DataModuleCreate(Sender: TObject);
    procedure fdqLogErrorBeforePost(DataSet: TDataSet);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
  private
    { Private declarations }
  public
    function SalvarLogError(EscolaId, FuncionarioId: Integer; LDataSetList: TFDJSONDataSets):String;
    procedure SetLogError( MsgError,Aplicacao,UnitNome,Classe,Metodo:String;
                           Data:TDateTime;
                           EscolaId:Integer = 0;
                           ResponsavelId:Integer=0;
                           FuncionarioId:Integer=0
                          );
  end;

var
  SmMain: TSmMain;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses smGeral, Vcl.Forms, smDBFireDac;

{$R *.dfm}

procedure TSmMain.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  SetLogError(E.Message,
              ExtractFileName(Application.Exename),
              UnitName,
              ClassName,
              'ApplicationEventsException',
              Now);
end;

procedure TSmMain.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Close;
  FDConnection.Open;

  FDConnectionLocal.Close;
end;

procedure TSmMain.fdqLogErrorBeforePost(DataSet: TDataSet);
begin
  if Dataset.State in [dsInsert]  then
    Dataset.FieldByName('data_insert_server').AsDateTime:=Now;
end;

function TSmMain.SalvarLogError(EscolaId, FuncionarioId: Integer;
  LDataSetList: TFDJSONDataSets): String;
var
  LDataSet: TFDDataSet;
  Exceptions:string;
begin
  //Método para Salvar Logs de Erros
  try
    Result:=EmptyStr;
    Exceptions:=EmptyStr;

    try
      //Pegando dados da tabela log_error
      LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'log_error');
      CopyDataSetByRecord(LDataSet,fdqLogError,Exceptions);

    except on E:Exception do
      Exceptions:=  Exceptions + E.Message;
    end;

    if (Exceptions <> EmptyStr) then
    begin
      Result:= 'Erro ao Salvar logs' + #13 + Exceptions;
      SmMain.SetLogError(Exceptions,
                         ExtractFileName(Application.Exename),
                         UnitName,
                         ClassName,
                         'SalvarLogError',
                         Now,
                         EscolaId,
                         0,
                         FuncionarioId);
    end;
  finally
    fdqLogError.Close;
  end;

end;

procedure TSmMain.SetLogError( MsgError,Aplicacao,UnitNome,Classe,Metodo:String;
                               Data:TDateTime;
                               EscolaId:Integer = 0;
                               ResponsavelId:Integer=0;
                               FuncionarioId:Integer=0);
begin
  try
    fdqLogError.Active:=False;
    fdqLogError.Active:=True;

    fdqLogError.Append;
    fdqLogError.FieldByName('log_error_id').AsString:= smGeral.GetGUID;
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
    fdqLogError.FieldByName('data_insert_server').AsDateTime:= Now;
    fdqLogError.Post;
  finally
    fdqLogError.Active:=False;
  end;

end;

end.
