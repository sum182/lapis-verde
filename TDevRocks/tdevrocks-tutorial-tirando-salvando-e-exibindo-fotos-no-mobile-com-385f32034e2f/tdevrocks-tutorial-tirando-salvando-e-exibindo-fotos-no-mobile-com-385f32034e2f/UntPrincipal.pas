unit UntPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.TabControl, FGX.ActionSheet, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.Layouts,
  FMX.Objects, FMX.ListBox, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.ListView, FMX.MediaLibrary.Actions, FMX.StdActns, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  MultiDetailAppearanceU, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, System.IOUtils;

type
  TForm1 = class(TForm)
    ActionList1: TActionList;
    tbctrlPrincipal: TTabControl;
    actMudarAba: TChangeTabAction;
    actFotoDaBiblioteca: TTakePhotoFromLibraryAction;
    actFotoDaCamera: TTakePhotoFromCameraAction;
    tbitemListagem: TTabItem;
    tbitemDetalhe: TTabItem;
    lsviewListagem: TListView;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ToolBar2: TToolBar;
    spbVoltar: TSpeedButton;
    Label2: TLabel;
    lsboxDetalhe: TListBox;
    ListBoxItem1: TListBoxItem;
    imgFotoDetalhe: TImage;
    Layout1: TLayout;
    Label3: TLabel;
    Label4: TLabel;
    fdConexao: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    qryProdutos: TFDQuery;
    qryProdutosFOTO: TBlobField;
    qryProdutosTITULO: TWideStringField;
    qryProdutosDESCRICAO: TWideStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    fgActionSheet1: TfgActionSheet;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    procedure lsviewListagemItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure spbVoltarClick(Sender: TObject);
    procedure fdConexaoBeforeConnect(Sender: TObject);
    procedure actFotoDaCameraDidFinishTaking(Image: TBitmap);
    procedure imgFotoDetalheClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actFotoDaBibliotecaDidFinishTaking(Image: TBitmap);
  private
    { Private declarations }
    procedure MudarAba(ATabItem: TTabItem; Sender: TObject);
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TForm1 }

procedure TForm1.actFotoDaBibliotecaDidFinishTaking(Image: TBitmap);
begin
  if not (qryProdutos.State in dsEditModes)  then
    qryProdutos.Edit;

  qryProdutosFOTO.Assign(Image);
  //imgFotoDetalhe.Bitmap.Assign(Image);

  qryProdutos.Post;
end;

procedure TForm1.actFotoDaCameraDidFinishTaking(Image: TBitmap);
begin
  if not (qryProdutos.State in dsEditModes)  then
    qryProdutos.Edit;

  qryProdutosFOTO.Assign(Image);
  //imgFotoDetalhe.Bitmap.Assign(Image);

  qryProdutos.Post;
end;

procedure TForm1.fdConexaoBeforeConnect(Sender: TObject);
begin
  fdConexao.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'BancoDados.s3db');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  tbctrlPrincipal.ActiveTab := tbitemListagem;
  qryProdutos.Active        := True;
end;

procedure TForm1.imgFotoDetalheClick(Sender: TObject);
begin
  if not (qryProdutos.State in dsEditModes)  then
    qryProdutos.Edit;

  fgActionSheet1.Show;
end;

procedure TForm1.lsviewListagemItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  MudarAba(tbitemDetalhe, Sender);
end;

procedure TForm1.MudarAba(ATabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

procedure TForm1.spbVoltarClick(Sender: TObject);
begin
  MudarAba(tbitemListagem, Sender);
end;

end.
