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
  Data.DB, FGX.VirtualKeyboard,FMX.TextLayout;

type
  TfrmAgendaEscolaView = class(TfrmBaseToolBar)
    bsAgenda: TBindSourceDB;
    blAgenda: TBindingsList;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
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
    Text1: TText;
    Text2: TText;
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    MargemEsquerda:Integer;

    procedure SetTitulo;
    procedure FillListBoxAgenda;
    procedure SetListBoxAgendaGroupHeader;
    procedure SetListBoxAgendaItemData(Data:String);
    procedure SetListBoxAgendaItem(Descricao:String);
    procedure SetListBoxAgendaFooter;
    procedure SetListBoxItemProperty(ListBoxItem:TListBoxItem);
    procedure SetListBoxItemHeight(ListBoxItem:TListBoxItem);
    procedure SetValuesObjets;
    function CountChar(Texto: String; C: Char): Integer;

  public
    AlunoId: Integer;
    TurmaId: Integer;
    Titulo: String;
  end;

var
  frmAgendaEscolaView: TfrmAgendaEscolaView;

implementation

{$R *.fmx}

uses untFuncoes, untDmEscola, untDM, untAgendaEscolaAdd, untPrincipal,
  untDMStyles;

procedure TfrmAgendaEscolaView.btnVoltarClick(Sender: TObject);
begin
  fAllowCloseForm := True;
  Close;
  inherited;
end;

function TfrmAgendaEscolaView.CountChar(Texto: String; C: Char): Integer;
var
  i, vTot: Integer;
begin
  vTot := 0;
  For i := 1 to Length(Texto) do
  begin
    If (Texto[i] = C) or (LowerCase(Texto[i]) = LowerCase(C)) then
      vTot := vTot + 1;
  end; // For
  Result := vTot;
end;


procedure TfrmAgendaEscolaView.FillListBoxAgenda;
var
  Data: string;
begin
  lstboxAgenda.BeginUpdate;
  lstboxAgenda.Items.Clear;
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
  lstboxAgenda.AddObject(ListBoxGroupHeader);
end;

procedure TfrmAgendaEscolaView.SetListBoxAgendaItem(Descricao:String);
var
  ListBoxItem: TListBoxItem;
  HeightItem: Double;
begin
  ListBoxItem := TListBoxItem.Create(lstboxAgenda);
  SetListBoxItemProperty(ListBoxItem);
  ListBoxItem.Text := Descricao;
  SetListBoxItemHeight(ListBoxItem);
  lstboxAgenda.AddObject(ListBoxItem);

  ListBoxItem := TListBoxItem.Create(lstboxAgenda);
  SetListBoxItemProperty(ListBoxItem);
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
  Text.Parent := ListBoxItem;
  Text.Align := TAlignLayout.alClient;
  Text.HorzTextAlign := TTextAlign.Leading;
  Text.color := TAlphaColors.Darkseagreen;
  Text.TextSettings.Font.Style :=  [TFontStyle.fsBold];
  Text.Text := Data;
  Text.Margins.Left := MargemEsquerda;

  lstboxAgenda.AddObject(ListBoxItem);
end;

procedure TfrmAgendaEscolaView.SetListBoxItemHeight(ListBoxItem: TListBoxItem);
var
  myLayout: TTextLayout;
  i: integer;
  aPoint: TPointF;
  HeightItem:Integer;
begin
  myLayout := TTextLayoutManager.DefaultTextLayout.Create;
  myLayout.BeginUpdate;

  // Setting the layout MaxSize
  aPoint.X := lstboxAgenda.Width;
  aPoint.Y := lstboxAgenda.Height;

  myLayout.MaxSize:= aPoint;
  myLayout.Text:=ListBoxItem.Text;
  myLayout.WordWrap:= True ;
  myLayout.Font:=ListBoxItem.Font;
  myLayout.HorizontalAlign:= ListBoxItem.TextSettings.HorzAlign;
  myLayout.VerticalAlign:= ListBoxItem.TextSettings.VertAlign;
  myLayout.Padding:=ListBoxItem.Padding;
  myLayout.EndUpdate;

  HeightItem:=  Trunc(myLayout.TextHeight) + 4;

  if HeightItem < 25 then
    HeightItem:= 25;

  ListBoxItem.Height := HeightItem;
end;

procedure TfrmAgendaEscolaView.SetListBoxItemProperty(
  ListBoxItem: TListBoxItem);
begin
  ListBoxItem.TextSettings.WordWrap := True;
  ListBoxItem.Selectable:=False;
  ListBoxItem.Margins.Left:=MargemEsquerda;
end;

procedure TfrmAgendaEscolaView.SetTitulo;
begin
  lblTitulo.Text := Titulo;
end;

procedure TfrmAgendaEscolaView.SetValuesObjets;
begin
  MargemEsquerda:=8;
end;

procedure TfrmAgendaEscolaView.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  FillListBoxAgenda;
  DmEscola.GetAgenda;
  DmEscola.OpenAgenda(AlunoId, TurmaId);
  DmEscola.SalvarDadosServer;
  Dm.SalvarDadosServer;
  FillListBoxAgenda;
end;

procedure TfrmAgendaEscolaView.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not Assigned(frmAgendaEscolaAdd) then
    Application.CreateForm(TfrmAgendaEscolaAdd, frmAgendaEscolaAdd);

  frmAgendaEscolaAdd.AlunoId := AlunoId;
  frmAgendaEscolaAdd.TurmaId := TurmaId;
  frmAgendaEscolaAdd.Titulo := Titulo;
  frmAgendaEscolaAdd.Show;
  FillListBoxAgenda;
end;

end.
