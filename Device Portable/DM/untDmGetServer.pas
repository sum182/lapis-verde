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
    fdqTabelaAtualizacao: TFDQuery;
  private
  public
    procedure OpenTabelaAtualizacao;
    procedure GetTabelaAtualizacao;
  end;

var
  DmGetServer: TDmGetServer;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untModuloCliente, smDBFireDac,
  FMX.Dialogs, System.SysUtils, smGeralFMX, untFuncoes, FMX.Forms,smMensagensFMX,smNetworkState;

{$R *.dfm}

{ TDmGetServer }

procedure TDmGetServer.GetTabelaAtualizacao;
var
  LDataSetList  : TFDJSONDataSets;
  LDataSet: TFDDataSet;
begin
  try
    OpenTabelaAtualizacao;
    LDataSetList := ModuloCliente.SmMainClient.GetTabelaAtualizacao(GetEscolaId,GetResponsavelId,GetFuncionarioId);
    LDataSet := TFDJSONDataSetsReader.GetListValue(LDataSetList,0);
    CopyDataSet(LDataSet,fdqTabelaAtualizacao,False,[coAppend,coEdit]);
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

procedure TDmGetServer.OpenTabelaAtualizacao;
begin
  fdqTabelaAtualizacao.Close;
  fdqTabelaAtualizacao.ParamByName('escola_id').AsInteger:= GetEscolaId;
  fdqTabelaAtualizacao.Open;
end;

end.
