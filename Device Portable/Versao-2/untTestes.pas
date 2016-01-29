unit untTestes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.Layouts,
  FMX.ListBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,Data.FireDACJSONReflect, FireDAC.Stan.StorageBin,
  FMX.ListView.Types, FMX.ListView,Proxy;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    ListBox2: TListBox;
    SpeedButton2: TSpeedButton;
    fdmAlunos: TFDMemTable;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    SpeedButton3: TSpeedButton;
    ListView1: TListView;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses untModuloCliente;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Edit1.Text := ModuloCliente.SrvServerMetodosClient.ReverseString(Edit1.Text);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  LDataSetList  : TFDJSONDataSets;
begin
  MessageDlg('Confirma sincronismo de dados?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0,
    procedure (const AResult: TModalResult)
    begin
      //Efetua o download da tabela TITULOS vinda do Servidor DataSnap
      LDataSetList := ModuloCliente.SrvServerMetodosClient.GetAlunos;

      //Prepara o MemoryTable temporário
      fdmAlunos.Active := False;

      //Fazemos um teste para verifica se realmente há DataSet no retorno da função
      Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);

      //Adicionamos o conteúdo do DataSet "baixado" ao Memory Table
      fdmAlunos.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
    end
  );

end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
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
