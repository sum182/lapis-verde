unit UntTitulos;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Rtti,
  System.Bindings.Outputs,
  System.Actions,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Layouts,
  FMX.ListView.Types,
  FMX.ListView,
  FMX.Ani,
  FMX.Bind.GenData,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Memo,
  FMX.Effects,
  FMX.Gestures,
  FMX.ActnList,
  FMX.StdActns,
  FMX.Objects,
  FMX.ListBox,
  FMX.MediaLibrary.Actions,
  FMX.Bind.Editors,
  FMX.Bind.DBEngExt,

  Data.Bind.GenData,
  Data.Bind.EngExt,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Data.Bind.DBScope,
  Data.Db,
  Data.FireDACJSONReflect,

  MultiDetailAppearanceU,
  UntModuloCliente;

type
  TfrmTitulos = class(TForm)
    toolTitulos: TToolBar;
    lytTitulos: TLayout;
    tabctrlTitulos: TTabControl;
    tbitemLisTitulos: TTabItem;
    spbBack: TSpeedButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    tbitemDetalhes: TTabItem;
    ToolBar1: TToolBar;
    spbVoltar: TSpeedButton;
    lsboxDetalhe: TListBox;
    lsitTituloSub: TListBoxItem;
    imgFoto: TImage;
    lstitAnoLancamento: TListBoxItem;
    Layout1: TLayout;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    spbEdicao: TSpeedButton;
    SpeedButton2: TSpeedButton;
    AcoesGeral: TActionList;
    actFotoBiblioteca: TTakePhotoFromLibraryAction;
    actFotoCamera: TTakePhotoFromCameraAction;
    SpeedButton1: TSpeedButton;
    spbSalvar: TSpeedButton;
    spbCancelar: TSpeedButton;
    lstPopUpFoto: TListBox;
    lstitNovaFoto: TListBoxItem;
    lstitBiblioteca: TListBoxItem;
    lstitCancelar: TListBoxItem;
    edtAno: TEdit;
    LinkControlToField1: TLinkControlToField;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    LinkControlToField2: TLinkControlToField;
    ShadowEffect1: TShadowEffect;
    spbNovo: TSpeedButton;
    lsvTitulos: TListView;
    LinkListControlToField1: TLinkListControlToField;
    lblTituloDet: TLabel;
    ToolBar3: TToolBar;
    spbExcluir: TSpeedButton;
    lblTituloT: TLabel;
    ListBox2: TListBox;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    LinkControlToField3: TLinkControlToField;
    procedure FormCreate(Sender: TObject);
    procedure spbVoltarClick(Sender: TObject);
    procedure actFotoBibliotecaDidFinishTaking(Image: TBitmap);
    procedure spbEdicaoClick(Sender: TObject);
    procedure actFotoCameraDidFinishTaking(Image: TBitmap);
    procedure spbSalvarClick(Sender: TObject);
    procedure spbCancelarClick(Sender: TObject);
    procedure lstitNovaFotoClick(Sender: TObject);
    procedure lstitBibliotecaClick(Sender: TObject);
    procedure lstitCancelarClick(Sender: TObject);
    procedure imgFotoClick(Sender: TObject);
    procedure spbNovoClick(Sender: TObject);
    procedure lsvTitulosPullRefresh(Sender: TObject);
    procedure lsvTitulosDeletingItem(Sender: TObject; AIndex: Integer;
      var ACanDelete: Boolean);
    procedure lsvTitulosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure LinkListControlToField1FilledListItem(Sender: TObject;
      const AEditor: IBindListEditorItem);
    procedure spbExcluirClick(Sender: TObject);
  private
    { Private declarations }
    const
      sTitulos = 'TITULOS';

    procedure AtualizarBotoes;
    procedure HidePopup;
  public
    { Public declarations }
    procedure PressionouVoltar;
    procedure PressionouMenu;
  end;

implementation

uses
  UntMain, UntDM;

{$R *.fmx}
{$R *.iPhone4in.fmx IOS}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.iPad.fmx IOS}
{$R *.LgXhdpiTb.fmx ANDROID}

procedure TfrmTitulos.HidePopup;
begin
  frmMain.HideBackground;
  lstPopUpFoto.AnimateFloat('position.y', lstPopUpFoto.Height * -1);
  lstPopUpFoto.Visible := False;
end;

procedure TfrmTitulos.actFotoBibliotecaDidFinishTaking(Image: TBitmap);
begin
  DM.qryTitulosFOTO.Assign(Image);
end;

procedure TfrmTitulos.actFotoCameraDidFinishTaking(Image: TBitmap);
begin
  DM.qryTitulosFOTO.Assign(Image);
end;

procedure TfrmTitulos.FormCreate(Sender: TObject);
begin
  tabctrlTitulos.TabPosition := TTabPosition.None;
  tabctrlTitulos.ActiveTab   := tbitemLisTitulos;

  if not (DM.qryTitulos.Active) then
  begin
      DM.qryTitulos.Active     := False;
      DM.qryTitulos.Active     := True;
  end;

  lstPopUpFoto.Width        := ClientWidth - 20;
  lstPopUpFoto.Position.X   := (ClientWidth - lstPopUpFoto.Width) / 2;
  lstPopUpFoto.Position.Y   := lstPopUpFoto.Height * -1;
  lstPopUpFoto.Visible      := False;

  AtualizarBotoes;
end;

procedure TfrmTitulos.imgFotoClick(Sender: TObject);
begin
  if DM.qryTitulos.State in dsEditModes then
  begin
    frmMain.ShowBackground(Self.lytTitulos, lstitCancelarClick);
    lstPopUpFoto.Visible := True;
    lstPopUpFoto.AnimateFloat('position.y', 0);
    lstPopUpFoto.BringToFront;
  end
  else
    ShowMessage('Você precisa estar em modo de edição!');
end;

procedure TfrmTitulos.LinkListControlToField1FilledListItem(Sender: TObject;
  const AEditor: IBindListEditorItem);
var
  LItem : TListViewItem;
begin
  LItem     := lsvTitulos.Items[AEditor.CurrentIndex];
  LItem.Tag := DM.qryTitulosID_TITULO.AsInteger;
end;

procedure TfrmTitulos.lstitBibliotecaClick(Sender: TObject);
begin
  HidePopup;
  actFotoBiblioteca.ExecuteTarget(Sender);
end;

procedure TfrmTitulos.lstitCancelarClick(Sender: TObject);
begin
  HidePopup;
  frmMain.HideBackground;
end;

procedure TfrmTitulos.lstitNovaFotoClick(Sender: TObject);
begin
  HidePopup;
  actFotoCamera.ExecuteTarget(Sender);
end;

procedure TfrmTitulos.lsvTitulosDeletingItem(Sender: TObject; AIndex: Integer;
  var ACanDelete: Boolean);
begin
  ACanDelete :=  False;
  lsvTitulos.BeginUpdate;
  if MessageDlg('Confirma exclusão de título?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0 ) = mrYes then
  begin
    DM.qryTitulos.RecNo := AIndex+1;
    //DM.qryTitulos.Locate('ID_TITULO', AIndex+1, []);
    DM.qryTitulos.Delete;
  end;
  lsvTitulos.EndUpdate;
end;

procedure TfrmTitulos.lsvTitulosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if not lsvTitulos.EditMode then
  begin
    AtualizarBotoes;
    tabctrlTitulos.Next;
  end;
end;

procedure TfrmTitulos.lsvTitulosPullRefresh(Sender: TObject);
begin
  DM.qryTitulos.Active := False;
  DM.qryTitulos.Active := True;
end;

procedure TfrmTitulos.PressionouVoltar;
begin
  if tabctrlTitulos.ActiveTab = tbitemDetalhes then
    tabctrlTitulos.Previous();
end;

procedure TfrmTitulos.PressionouMenu;
begin
  if (tabctrlTitulos.ActiveTab = tbitemLisTitulos) then
    frmMain.MultiView1.ShowMaster
  else if (tabctrlTitulos.ActiveTab = tbitemLisTitulos) and (DM.qryTitulos.State in dsEditModes) then
    imgFotoClick(imgFoto);
end;

procedure TfrmTitulos.spbVoltarClick(Sender: TObject);
begin
  if DM.qryTitulos.State in dsEditModes then
    DM.qryTitulos.Cancel;

  DM.qryTitulos.Active := False;
  DM.qryTitulos.Active := True;

  tabctrlTitulos.Previous;
end;

procedure TfrmTitulos.spbCancelarClick(Sender: TObject);
begin
  DM.qryTitulos.Cancel;
  AtualizarBotoes;
end;

procedure TfrmTitulos.spbEdicaoClick(Sender: TObject);
begin
  DM.qryTitulos.Edit;
  AtualizarBotoes;
  edtTitulo.SetFocus;
end;

procedure TfrmTitulos.spbExcluirClick(Sender: TObject);
begin
  MessageDlg('Confirma exclusão do título selecionado?', System.UITypes.TMsgDlgType.mtConfirmation,
      [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
        procedure(const AResult: TModalResult)
        begin
          case AResult of
            mrYES :
            begin
              if ModuloCliente.SrvServerMetodosClient.ExcluirTitulo(DM.qryTitulosID_TITULO.AsInteger) then
              begin
                DM.qryTitulos.Delete;
                Self.spbVoltarClick(Sender);
              end
              else
                ShowMessage('Ocorreu um erro ao excluir!');
            end;
          end;
        end
      )
end;

procedure TfrmTitulos.spbNovoClick(Sender: TObject);
begin
  DM.qryTitulos.Append;
  tabctrlTitulos.Next;
  AtualizarBotoes;
end;

procedure TfrmTitulos.spbSalvarClick(Sender: TObject);
var
  LDeltaList : TFDJSONDeltas;
  LDataList  : TFDJSONDataSets;
begin
  if DM.qryTitulos.State in [dsInsert] then
    DM.qryTitulos.FieldByName('ID_TITULO').AsInteger := DM.GetIDFromTable('TITULOS');

  DM.qryTitulos.Post;

  LDeltaList := TFDJSONDeltas.Create;
  LDataList := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(LDataList, DM.qryTitulos);
  TFDJSONDeltasWriter.ListAdd(LDeltaList, sTitulos, DM.memTitulos);

  ModuloCliente.SrvServerMetodosClient.ApplyUpdadesTitulos(LDeltaList);
  AtualizarBotoes;
end;

procedure TfrmTitulos.AtualizarBotoes;
begin
  spbVoltar.Visible     := (DM.qryTitulos.State = dsBrowse);
  spbEdicao.Visible     := (DM.qryTitulos.State = dsBrowse);
  spbExcluir.Visible    := (DM.qryTitulos.State = dsBrowse);

  spbCancelar.Visible   := (DM.qryTitulos.State in dsEditModes);
  spbSalvar.Visible     := (DM.qryTitulos.State in dsEditModes);

  edtTitulo.Enabled     := (DM.qryTitulos.State in dsEditModes);
  edtSubTitulo.Enabled  := (DM.qryTitulos.State in dsEditModes);
  edtAno.Enabled        := (DM.qryTitulos.State in dsEditModes);

  edtTitulo.ReadOnly    := (DM.qryTitulos.State = dsBrowse);
  edtSubTitulo.ReadOnly := (DM.qryTitulos.State = dsBrowse);
  edtAno.ReadOnly       := (DM.qryTitulos.State = dsBrowse);

  if (DM.qryTitulos.State in dsEditModes) then
  begin
    edtTitulo.StyleLookup    := 'editstyle';
    edtSubTitulo.StyleLookup := 'editstyle';
    edtAno.StyleLookup       := 'editstyle';
    lblTituloDet.Text        := 'Editando...';
  end
  else
  begin
    edtTitulo.StyleLookup    := 'transparentedit';
    edtSubTitulo.StyleLookup := 'transparentedit';
    edtAno.StyleLookup       := 'transparentedit';
    lblTituloDet.Text        := 'Detalhes';
  end;
end;


end.
