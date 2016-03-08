unit untSmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin, FireDAC.Comp.UI, FireDAC.Comp.DataSet, Vcl.AppEvnts;

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
    procedure SetLogError(MsgError,Aplicacao,UnitNome,Classe,Metodo:String;
                          Data:TDateTime;
                          ResponsavelId:Integer=0;FuncionarioId:Integer=0
                          );
  end;

var
  SmMain: TSmMain;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses smGeral, Vcl.Forms;

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

procedure TSmMain.SetLogError(MsgError,Aplicacao,UnitNome,Classe,Metodo:String;
                          Data:TDateTime;
                          ResponsavelId:Integer=0;FuncionarioId:Integer=0);
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
    fdqLogError.FieldByName('responsavel_id').AsInteger:=ResponsavelId;
    fdqLogError.FieldByName('funcionario_id').AsInteger:= FuncionarioId;
    fdqLogError.FieldByName('data').AsDateTime:= Data;
    fdqLogError.FieldByName('data_insert_server').AsDateTime:= Now;
    fdqLogError.Post;
  finally
    fdqLogError.Active:=False;
  end;

end;

end.
