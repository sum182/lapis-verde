unit untTesteJsonFdMem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, smFrmBase, FMX.ListView.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ListView, FMX.Layouts,Data.FireDACJSONReflect,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,smFrmBaseToolBar,
  Data.Bind.DBScope, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation, FMX.Objects;

type
  TfrmTesteJsonFdMem = class(TfrmBaseToolBar)
    SpeedButton1: TSpeedButton;
    ListView1: TListView;
    fdmAlunos: TFDMemTable;
    fdmAlunosaluno_id: TIntegerField;
    fdmAlunosnome: TStringField;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    SpeedButton2: TSpeedButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    ListView2: TListView;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesteJsonFdMem: TfrmTesteJsonFdMem;

implementation

{$R *.fmx}

uses Proxy, untModuloCliente, untFuncoes;

procedure TfrmTesteJsonFdMem.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
end;

procedure TfrmTesteJsonFdMem.SpeedButton1Click(Sender: TObject);
var
  ClientRest: TSmTesteClient;
  RetClient: TFDJSONDataSets;
  ItemAdd: TListViewItem;
begin
  ListView1.Visible:=False;
  ListView2.Visible:=True;

  ClientRest:= TSmTesteClient.Create(ModuloCliente.DSRestConnection1);
  RetClient:= ClientRest.GetAlunosTeste;
  Assert(TFDJSONDataSetsReader.GetListCount(RetClient) = 1);

  fdmAlunos.Close;
  fdmAlunos.AppendData(TFDJSONDataSetsReader.GetListValue(RetClient,0));
  fdmAlunos.First;

  ListView2.Items.Clear;
  while not(fdmAlunos.Eof) do
  begin
    ItemAdd:= ListView2.Items.Add;
    ItemAdd.Text:= fdmAlunos.FieldByName('nome').AsString;
    ItemAdd.Detail:= fdmAlunos.FieldByName('aluno_id').AsString;

    fdmAlunos.Next;
  end;

  fdmAlunos.Close;

end;

procedure TfrmTesteJsonFdMem.SpeedButton2Click(Sender: TObject);
var
  LDataSetList  : TFDJSONDataSets;
begin
  ListView1.Visible:=True;
  ListView2.Visible:=False;


  //Efetua o download da tabela TITULOS vinda do Servidor DataSnap
  LDataSetList := ModuloCliente.SmTesteClient.GetAlunosTeste;

  //Prepara o MemoryTable temporário
  fdmAlunos.Active := False;

  //Fazemos um teste para verifica se realmente há DataSet no retorno da função
  Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);

  //Adicionamos o conteúdo do DataSet "baixado" ao Memory Table
  fdmAlunos.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));


end;

end.


