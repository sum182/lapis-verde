unit f_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Comp.UI, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Phys.MySQLDef;

type
  Tfrm_principal = class(TForm)
    btn_open: TBitBtn;
    btn_incluir: TBitBtn;
    btn_salvar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_editar: TBitBtn;
    fdq_mestre: TFDQuery;
    dts_mestre: TDataSource;
    pnl_sub: TPanel;
    btn_sub_incluir: TBitBtn;
    btn_sub_alvar: TBitBtn;
    btn_sub_cancelar: TBitBtn;
    btn_sub_excluir: TBitBtn;
    btn_sub_alterar: TBitBtn;
    fdq_detalhe: TFDQuery;
    dts_detalhe: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    fdq_mestreescola_id: TFDAutoIncField;
    fdq_mestrenome_fantasia: TStringField;
    fdq_mestrerazao_social: TStringField;
    fdq_mestrecnpj: TLargeintField;
    fdq_mestreativo: TStringField;
    fdq_mestredata_cadastro: TDateField;
    fdq_mestreemail: TStringField;
    fdq_mestreinformacoes_gerais: TMemoField;
    fds_principal: TFDSchemaAdapter;
    procedure btn_openClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sub_incluirClick(Sender: TObject);
    procedure btn_sub_alterarClick(Sender: TObject);
    procedure btn_sub_alvarClick(Sender: TObject);
    procedure btn_sub_cancelarClick(Sender: TObject);
    procedure btn_sub_excluirClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
     procedure FdsAfterApply(Sender : TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_principal: Tfrm_principal;

implementation

{$R *.dfm}

uses untDM;

procedure Tfrm_principal.btn_cancelarClick(Sender: TObject);
begin
   fdq_mestre.Cancel;

   //executa o cencalupdates para cancelar todas as alterações em cache
   fdq_mestre.CancelUpdates;
   fdq_detalhe.CancelUpdates;
   //executa o commitupdates para limpar o cache
   fdq_mestre.CommitUpdates;
   fdq_detalhe.CommitUpdates;
end;

procedure Tfrm_principal.btn_editarClick(Sender: TObject);
begin
   fdq_mestre.Edit;
end;

procedure Tfrm_principal.btn_excluirClick(Sender: TObject);
begin
   fdq_mestre.Delete;
   //executa o applyupdates no schemme adapter para aplicar as alterações nas duas querys
   fds_principal.ApplyUpdates(0);
end;

procedure Tfrm_principal.btn_incluirClick(Sender: TObject);
begin
   fdq_mestre.Append;

   //da o post depois o edit para poder inserir o sub cadastro
   fdq_mestre.Post;
   fdq_mestre.Edit;
end;

procedure Tfrm_principal.btn_openClick(Sender: TObject);
begin
   fds_principal.AfterApplyUpdate := FdsAfterApply;
   fdq_mestre.Open;
   fdq_detalhe.Open;

end;

procedure Tfrm_principal.btn_salvarClick(Sender: TObject);
begin
   fdq_mestre.Post;

   //executa o applyupdates no schemme adapter para aplicar as alterações nas duas querys
   fds_principal.ApplyUpdates(0);

   fdq_mestre.Refresh;
   fdq_detalhe.Refresh;


end;

procedure Tfrm_principal.btn_sub_alterarClick(Sender: TObject);
begin
   fdq_detalhe.Edit;
end;

procedure Tfrm_principal.btn_sub_alvarClick(Sender: TObject);
begin
   fdq_detalhe.Post;
end;

procedure Tfrm_principal.btn_sub_cancelarClick(Sender: TObject);
begin
   fdq_detalhe.Cancel;
end;

procedure Tfrm_principal.btn_sub_excluirClick(Sender: TObject);
begin
   fdq_detalhe.Delete;
end;

procedure Tfrm_principal.btn_sub_incluirClick(Sender: TObject);
begin
   fdq_detalhe.Append;
end;

procedure Tfrm_principal.FdsAfterApply(Sender : TObject);
begin
   //executa o commitupdates para limpar o cache das duas querys
   fdq_mestre.CommitUpdates;
   fdq_detalhe.CommitUpdates;
end;

procedure Tfrm_principal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  frm_principal:=nil;
end;

end.
