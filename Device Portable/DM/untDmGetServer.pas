unit untDmGetServer;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,DateUtils,
  FMX.Types, Data.FireDACJSONReflect;

type
  TDmGetServer = class(TDataModule)
    fdStanStorageBinLink: TFDStanStorageBinLink;
    fdqProcessoAtualizacao: TFDQuery;
  private
  public
    procedure OpenProcessoAtualizacao;
    procedure GetProcessoAtualizacao;

    procedure GetDataSet(Nome: String;
                         UtilizaParamEscolaId:Boolean=True;
                         Condicoes: String=''
                         );

    procedure GetEscola;
    procedure PeriodoTipo;
    procedure ResponsavelTipo;
    procedure FuncionarioTipo;
    procedure TelefoneTipo;
    procedure AgendaTipo;

  end;

var
  DmGetServer: TDmGetServer;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untModuloCliente, smDBFireDac,
  FMX.Dialogs, System.SysUtils, smGeralFMX, untFuncoes, FMX.Forms,smMensagensFMX,smNetworkState;

{$R *.dfm}

{ TDmGetServer }

procedure TDmGetServer.AgendaTipo;
begin
  GetDataSet('agenda_tipo',False);
end;

procedure TDmGetServer.FuncionarioTipo;
begin
  GetDataSet('funcionario_tipo',False);
end;

procedure TDmGetServer.GetDataSet(Nome: String; UtilizaParamEscolaId: Boolean;
  Condicoes: String);
var
  LDataSetList  : TFDJSONDataSets;
  LDataSetServer: TFDDataSet;
  fdqDataSet: TFDQuery;
begin
  try
    try
      if Nome = '' then
       raise Exception.Create('GetDataSet: Nome não definido');

      if not Dm.ProcessHasUpdate(Nome) then
       Exit;

      fdqDataSet := TFDQuery.Create(self);
      fdqDataSet.Connection:=Dm.FDConnectionDB;

      fdqDataSet.Active := False;

      fdqDataSet.SQL.Clear;
      fdqDataSet.SQL.Add('select * from ' + Nome);
      fdqDataSet.SQL.Add('where 1 = 1');

      if UtilizaParamEscolaId then
        fdqDataSet.SQL.Add('and escola_id = ' + IntToStr(GetEscolaId));

      if Condicoes <> EmptyStr then
        fdqDataSet.SQL.Add(Condicoes);


      LDataSetList := ModuloCliente.SmMainClient.GetDataSet(GetEscolaId,
                                                            Nome,
                                                            GetResponsavelId,
                                                            GetFuncionarioId,
                                                            UtilizaParamEscolaId,
                                                            Condicoes);

      LDataSetServer := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);
      CopyDataSet(LDataSetServer,fdqDataSet,False,[coAppend,coEdit]);
      DM.ProcessSaveUpdate(Nome);
    except on E:Exception do
      DM.SetLogError( E.Message,
                      GetApplicationName,
                      UnitName,
                      ClassName,
                      'GetDataSet:' + Nome,
                      Now,
                      'Erro na busca GetDataSet:' + Nome + #13 + E.Message,
                      GetEscolaId,
                      GetResponsavelId,
                      GetFuncionarioId
                      );
    end;
  finally
    fdqDataSet.DisposeOf;
  end;

end;

procedure TDmGetServer.GetEscola;
begin
  GetDataSet('escola');
end;

procedure TDmGetServer.GetProcessoAtualizacao;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    OpenProcessoAtualizacao;
    LDataSetList := ModuloCliente.SmMainClient.GetProcessoAtualizacao(GetEscolaId,GetResponsavelId,GetFuncionarioId);
    LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);
    CopyDataSet(LDataSet,fdqProcessoAtualizacao,False,[coAppend,coEdit]);
  except on E:Exception do
    DM.SetLogError( E.Message,
                    GetApplicationName,
                    UnitName,
                    ClassName,
                    'GetTabelaAtualizacao',
                    Now,
                    'Erro na busca de Tabelas Atualização' + #13 + E.Message,
                    GetEscolaId,
                    GetResponsavelId,
                    GetFuncionarioId
                    );
  end;
end;

procedure TDmGetServer.OpenProcessoAtualizacao;
begin
  fdqProcessoAtualizacao.Close;
  fdqProcessoAtualizacao.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqProcessoAtualizacao.Open;
end;

procedure TDmGetServer.PeriodoTipo;
begin
  GetDataSet('periodo_tipo',False);
end;

procedure TDmGetServer.ResponsavelTipo;
begin
  GetDataSet('responsavel_tipo',False);
end;

procedure TDmGetServer.TelefoneTipo;
begin
  GetDataSet('telefone_tipo',False);
end;

end.
