unit untTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, Vcl.Buttons;

type
  TfrmTeste = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    btn_incluir: TBitBtn;
    btn_salvar: TBitBtn;
    FDSchemaAdapter1: TFDSchemaAdapter;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    dts_detalhe: TDataSource;
    fdq_detalhe: TFDQuery;
    fdq_mestre: TFDQuery;
    fdq_mestreescola_id: TFDAutoIncField;
    fdq_mestrenome_fantasia: TStringField;
    fdq_mestrerazao_social: TStringField;
    fdq_mestrecnpj: TLargeintField;
    fdq_mestreativo: TStringField;
    fdq_mestredata_cadastro: TDateField;
    fdq_mestreemail: TStringField;
    fdq_mestreinformacoes_gerais: TMemoField;
    dts_mestre: TDataSource;

    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
  private
    procedure Apply(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmTeste: TfrmTeste;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmTeste.Apply(Sender: TObject);
begin
  fdq_mestre.CommitUpdates;
  fdq_detalhe.CommitUpdates;
end;

procedure TfrmTeste.btn_incluirClick(Sender: TObject);
begin
   fdq_mestre.Append;

   //da o post depois o edit para poder inserir o sub cadastro
   fdq_mestre.Post;
   fdq_mestre.Edit;
end;

procedure TfrmTeste.btn_salvarClick(Sender: TObject);
begin
   fdq_mestre.Post;

   //executa o applyupdates no schemme adapter para aplicar as alterações nas duas querys
   FDSchemaAdapter1.ApplyUpdates(0);

   fdq_mestre.Refresh;
   fdq_detalhe.Refresh;
end;

procedure TfrmTeste.Button1Click(Sender: TObject);
var
  iErrors: integer;
begin

end;

procedure TfrmTeste.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  frmTeste := nil;
end;

procedure TfrmTeste.FormCreate(Sender: TObject);
begin
  fdq_mestre.Close;
  fdq_mestre.Open;

  fdq_detalhe.Close;
  fdq_detalhe.Open;

  FDSchemaAdapter1.AfterApplyUpdate:=Apply;
end;

end.
