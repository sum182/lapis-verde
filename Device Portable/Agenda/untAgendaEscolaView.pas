unit untAgendaEscolaView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, FMX.ListView, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FMX.TabControl, FMX.ListBox, FMX.Effects, FMX.Edit,
  Data.DB, FGX.VirtualKeyboard,FMX.TextLayout, FMX.ScrollBox, FMX.Memo;

type
  TfrmAgendaEscolaView = class(TfrmBaseToolBar)
    bsAgenda: TBindSourceDB;
    blAgenda: TBindingsList;
    btnAdd: TSpeedButton;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkFillControlToField2: TLinkFillControlToField;
    tbCtrlAgenda: TTabControl;
    tbItemListAgenda: TTabItem;
    Layout6: TLayout;
    lstboxAgenda: TListBox;
    tbItemListAgendaDev: TTabItem;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    Text2: TText;
    imgAdd: TImage;
    Memo1: TMemo;
    ListBoxItem5: TListBoxItem;
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure imgAddClick(Sender: TObject);
  private
    MargemEsquerda:Integer;
    MargemDireita:Integer;


    procedure SetTitulo;

    procedure SetListBoxAgendaGroupHeader;
    procedure SetListBoxAgendaItemData(Data:String);
    procedure SetListBoxAgendaItem(Descricao:String);
    procedure SetListBoxAgendaItemLinhaBranco;
    procedure SetListBoxAgendaFooter;
    procedure SetListBoxItemProperty(ListBoxItem:TListBoxItem);
    procedure SetTextProperty(Text:TText;ListBoxItem:TListBoxItem);
    procedure SetValuesObjets;
  public
    AlunoId: Integer;
    TurmaId: Integer;
    Titulo: String;
    procedure FillListBoxAgenda;
  end;

var
  frmAgendaEscolaView: TfrmAgendaEscolaView;

implementation

{$R *.fmx}

uses untFuncoes, untDmEscola, untDM, untAgendaEscolaAdd, untPrincipal,
  untDMStyles, smMensagensFMX;

procedure TfrmAgendaEscolaView.btnVoltarClick(Sender: TObject);
begin
  fAllowCloseForm := True;
  Close;
  inherited;
end;


procedure TfrmAgendaEscolaView.FillListBoxAgenda;
var
  Data: string;
begin
  lstboxAgenda.BeginUpdate;
  lstboxAgenda.Items.Clear;
  DmEscola.fdqAgenda.Refresh;
  DmEscola.fdqAgenda.First;

  while not DmEscola.fdqAgenda.Eof do
  begin
    if not (DmEscola.fdqAgenda.Bof) then
      SetListBoxAgendaGroupHeader;

    Data := DmEscola.fdqAgenda.FieldByName('data').AsString;
    SetListBoxAgendaItemData(Data);

    while (Data = (DmEscola.fdqAgenda.FieldByName('data').AsString)) and
      not(DmEscola.fdqAgenda.Eof) do
    begin
      SetListBoxAgendaItem(DmEscola.fdqAgenda.FieldByName('descricao').AsString);
      DmEscola.fdqAgenda.Next;
    end;
  end;
  lstboxAgenda.EndUpdate;
end;

procedure TfrmAgendaEscolaView.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
  SetValuesObjets;
  tbCtrlAgenda.TabPosition:= TTabPosition.None;
  tbCtrlAgenda.ActiveTab:= tbItemListAgenda;
end;

procedure TfrmAgendaEscolaView.FormShow(Sender: TObject);
begin
  inherited;
  DmEscola.OpenAgenda(AlunoId, TurmaId);
  SetTitulo;
  FillListBoxAgenda;
end;


procedure TfrmAgendaEscolaView.imgAddClick(Sender: TObject);
begin
  inherited;
  btnAdd.OnClick(self);
end;

procedure TfrmAgendaEscolaView.imgVoltarClick(Sender: TObject);
begin
  inherited;
  btnVoltar.OnClick(self);
end;

procedure TfrmAgendaEscolaView.SetListBoxAgendaFooter;
begin
//
end;

procedure TfrmAgendaEscolaView.SetListBoxAgendaGroupHeader;
var
  ListBoxGroupHeader: TListBoxGroupHeader;
begin
  ListBoxGroupHeader := TListBoxGroupHeader.Create(lstboxAgenda);
  ListBoxGroupHeader.TextSettings.HorzAlign := TTextAlign.Center;
  ListBoxGroupHeader.TextSettings.WordWrap := True;
  ListBoxGroupHeader.Height:=15;
  lstboxAgenda.AddObject(ListBoxGroupHeader);
end;

procedure TfrmAgendaEscolaView.SetListBoxAgendaItem(Descricao:String);
var
  ListBoxItem: TListBoxItem;
  HeightItem: Double;
  Text: TText;
begin
  ListBoxItem := TListBoxItem.Create(lstboxAgenda);
  SetListBoxItemProperty(ListBoxItem);

  Text := TText.Create(self);
  Text.BeginUpdate;
  Text.Text := Descricao;
  SetTextProperty(Text,ListBoxItem);
  Text.TextSettings.Font.Size :=  14;
  Text.AutoSize:=True;
  ListBoxItem.Height:=  (Text.Height)+ 4;
  Text.Parent := ListBoxItem;
  lstboxAgenda.AddObject(ListBoxItem);
  Text.EndUpdate;

  //SetListBoxAgendaItemLinhaBranco;

  ListBoxItem := TListBoxItem.Create(lstboxAgenda);
  ListBoxItem.BeginUpdate;
  ListBoxItem.Text:='';
  SetListBoxItemProperty(ListBoxItem);
  ListBoxItem.Height:= 12;
  ListBoxItem.EndUpdate;
  lstboxAgenda.AddObject(ListBoxItem);
end;

procedure TfrmAgendaEscolaView.SetListBoxAgendaItemData(Data:String);
var
  ListBoxItem: TListBoxItem;
  Text: TText;
begin

  ListBoxItem := TListBoxItem.Create(lstboxAgenda);
  SetListBoxItemProperty(ListBoxItem);

  Text := TText.Create(self);
  Text.BeginUpdate;
  Text.Parent := ListBoxItem;
  SetTextProperty(Text,ListBoxItem);
  Text.color := TAlphaColors.Mediumseagreen;
  Text.TextSettings.Font.Style :=  [TFontStyle.fsBold];
  Text.TextSettings.Font.Size :=  16;
  Text.Text := Data;
  Text.EndUpdate;
  lstboxAgenda.AddObject(ListBoxItem);
end;

procedure TfrmAgendaEscolaView.SetListBoxAgendaItemLinhaBranco;
var
  ListBoxItem: TListBoxItem;
begin
  //Linha em Branco
  ListBoxItem := TListBoxItem.Create(lstboxAgenda);
  ListBoxItem.BeginUpdate;
  ListBoxItem.Text:='';
  SetListBoxItemProperty(ListBoxItem);
  ListBoxItem.Height:= 12;
  ListBoxItem.EndUpdate;
  lstboxAgenda.AddObject(ListBoxItem);
end;


procedure TfrmAgendaEscolaView.SetListBoxItemProperty(
  ListBoxItem: TListBoxItem);
begin
  ListBoxItem.TextSettings.WordWrap := True;
  ListBoxItem.Selectable:=False;
  ListBoxItem.Margins.Left:=MargemEsquerda;
  ListBoxItem.Margins.Right := MargemDireita;
  ListBoxItem.Height:= 25;
end;

procedure TfrmAgendaEscolaView.SetTextProperty(Text: TText;ListBoxItem:TListBoxItem);
begin
  Text.Align := TAlignLayout.alClient;
  Text.TextSettings.HorzAlign := TTextAlign.Leading;
  Text.TextSettings.VertAlign := TTextAlign.Leading;

  Text.Width := lstboxAgenda.Width;
  Text.Padding := ListBoxItem.Padding;
  Text.Margins := ListBoxItem.Margins;
  Text.TextSettings.WordWrap:=True;
end;

procedure TfrmAgendaEscolaView.SetTitulo;
begin
  lblTitulo.Text := Titulo;
end;

procedure TfrmAgendaEscolaView.SetValuesObjets;
begin
  MargemEsquerda:=8;
  MargemDireita:=8;
end;

procedure TfrmAgendaEscolaView.btnAddClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmAgendaEscolaAdd) then
    Application.CreateForm(TfrmAgendaEscolaAdd, frmAgendaEscolaAdd);

  frmAgendaEscolaAdd.AlunoId := AlunoId;
  frmAgendaEscolaAdd.TurmaId := TurmaId;
  frmAgendaEscolaAdd.Titulo := Titulo;
  frmAgendaEscolaAdd.Show;
end;

end.
