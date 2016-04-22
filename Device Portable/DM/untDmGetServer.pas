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
  end;

var
  DmGetServer: TDmGetServer;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM, untModuloCliente, smDBFireDac,
  FMX.Dialogs, System.SysUtils, smGeralFMX, untFuncoes, FMX.Forms,smMensagensFMX,smNetworkState;

{$R *.dfm}

{ TDmGetServer }

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

end.
