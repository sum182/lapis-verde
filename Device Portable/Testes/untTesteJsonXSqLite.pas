unit untTesteJsonXSqLite;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,Data.FireDACJSONReflect,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, smFrmBase, FMX.Layouts, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.StorageBin, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, FMX.ListBox,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,smFrmBaseToolBar,
  Data.Bind.DBScope, FMX.Controls.Presentation, FMX.Objects;

type
  TfrmTesteJsonXSqLite = class(TfrmBaseToolBar)
    SpeedButton1: TSpeedButton;
    ListBox3: TListBox;
    fdqAluno: TFDQuery;
    fdqAlunoaluno_id: TIntegerField;
    fdqAlunonome: TStringField;
    fdmAlunos: TFDMemTable;
    fdmAlunosaluno_id: TIntegerField;
    fdmAlunosnome: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesteJsonXSqLite: TfrmTesteJsonXSqLite;

implementation

{$R *.fmx}

uses Proxy, untModuloCliente, untDM, untFuncoes;

procedure TfrmTesteJsonXSqLite.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
end;

procedure TfrmTesteJsonXSqLite.SpeedButton1Click(Sender: TObject);
var
  LDataSetList  : TFDJSONDataSets;
begin
  MessageDlg('Confirma sincronismo de dados?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0,
    procedure (const AResult: TModalResult)
    begin
      //Efetua o download da tabela TITULOS vinda do Servidor DataSnap
      LDataSetList := ModuloCliente.SrvServerMetodosClient.GetAlunosTeste;

      //Prepara o MemoryTable temporário
      fdmAlunos.Active := False;

      //Fazemos um teste para verifica se realmente há DataSet no retorno da função
      Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);

      //Adicionamos o conteúdo do DataSet "baixado" ao Memory Table
      fdmAlunos.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));

      fdqAluno.Close;
      fdqAluno.Open;

      fdmAlunos.First;
      while not(fdmAlunos.EOF) do
      begin
        fdqAluno.Append;
        fdqAluno.FieldByName('nome').AsString := fdmAlunos.FieldByName('nome').AsString;
        fdqAluno.Post;

        fdmAlunos.Next;
      end;

      fdqAluno.Close;
      fdqAluno.Open;

    end
  );

end;

end.
