unit untPrinicpal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.StdCtrls, FMX.ListView,ClientClassesUnit1,
  ClientModuleUnit1,Data.FireDacJSONReflect, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    ListView1: TListView;
    btnRefresh: TSpeedButton;
    fdmAlunos: TFDMemTable;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ClientRest: TServerMethods1Client;

implementation

{$R *.fmx}

procedure TForm1.btnRefreshClick(Sender: TObject);
var
  RetClient: TFDJSONDataSets;
  ItemAdd: TListViewItem;
begin
  ClientRest:= TServerMethods1Client.Create(ClientModule1.DSRestConnection1);
  RetClient:= ClientRest.LisarAlunos('');
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
