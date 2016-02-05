unit untTesteJsonFdMem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, smFrmBase, FMX.ListView.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ListView, FMX.Layouts,Data.FireDACJSONReflect;

type
  TfrmTesteJsonFdMem = class(TfrmBase)
    SpeedButton1: TSpeedButton;
    ListView1: TListView;
    fdmAlunos: TFDMemTable;
    fdmAlunosaluno_id: TIntegerField;
    fdmAlunosnome: TStringField;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesteJsonFdMem: TfrmTesteJsonFdMem;

implementation

{$R *.fmx}

uses Proxy, untModuloCliente;

procedure TfrmTesteJsonFdMem.SpeedButton1Click(Sender: TObject);
var
  ClientRest: TSrvServerMetodosClient;
  RetClient: TFDJSONDataSets;
  ItemAdd: TListViewItem;
begin
  ClientRest:= TSrvServerMetodosClient.Create(ModuloCliente.DSRestConnection1);
  RetClient:= ClientRest.GetAlunos;
  Assert(TFDJSONDataSetsReader.GetListCount(RetClient) = 1);

  fdmAlunos.Close;
  fdmAlunos.AppendData(TFDJSONDataSetsReader.GetListValue(RetClient,0));
  fdmAlunos.First;

  ListView1.Items.Clear;
  while not(fdmAlunos.Eof) do
  begin
    ItemAdd:= ListView1.Items.Add;
    ItemAdd.Text:= fdmAlunos.FieldByName('nome').AsString;
    ItemAdd.Detail:= fdmAlunos.FieldByName('aluno_id').AsString;

    fdmAlunos.Next;
  end;

  fdmAlunos.Close;

end;

end.
