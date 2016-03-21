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
    SpeedButton1: TSpeedButton;
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
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure imgAddClick(Sender: TObject);
  private
    MargemEsquerda:Integer;
    MargemDireita:Integer;


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
  untDMStyles, smMensagensFMX;

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
  lstboxAgenda.AddObject(ListBoxGroupHeader);
end;

procedure TfrmAgendaEscolaView.SetListBoxAgendaItem(Descricao:String);
var
  ListBoxItem: TListBoxItem;
  HeightItem: Double;
  Text: TText;
  Memo: TMemo;
begin
  {codigo ok
  ListBoxItem := TListBoxItem.Create(lstboxAgenda);
  ListBoxItem.BeginUpdate;
  SetListBoxItemProperty(ListBoxItem);
  ListBoxItem.Text := Descricao;
  SetListBoxItemHeight(ListBoxItem);
  ListBoxItem.EndUpdate;
  lstboxAgenda.AddObject(ListBoxItem);
  }



  ListBoxItem := TListBoxItem.Create(lstboxAgenda);
  SetListBoxItemProperty(ListBoxItem);

  Memo := TMemo.Create(self);
  Memo.Parent := ListBoxItem;
  Memo.Enabled := False;
  Memo.Align := TAlignLayout.alClient;
  Memo.TextSettings.HorzAlign := TTextAlign.Leading;

  //Memo.TextSettings.Font.Style :=  [TFontStyle.fsBold];
  Memo.TextSettings.Font.Size :=  12;
  Memo.Text := Descricao;
  Memo.Margins.Right := MargemDireita;
  Memo.TextSettings.WordWrap:=True;


  ListBoxItem.Height:=  (Memo.Lines.Count * 25);

  lstboxAgenda.AddObject(ListBoxItem);
  //Text.Margins.Left := MargemEsquerda;
//  Text.Padding.Left := ;




  //Linha em Branco
  ListBoxItem := TListBoxItem.Create(lstboxAgenda);
  ListBoxItem.Text:='';
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
  //Text.color := TAlphaColors.Darkseagreen;
  Text.color := TAlphaColors.Mediumseagreen;

  Text.TextSettings.Font.Style :=  [TFontStyle.fsBold];
  Text.TextSettings.Font.Size :=  16;
  Text.Text := Data;
  //Text.Margins.Left := MargemEsquerda;
//  Text.Padding.Left := ;

  lstboxAgenda.AddObject(ListBoxItem);
end;

procedure TfrmAgendaEscolaView.SetListBoxItemHeight(ListBoxItem: TListBoxItem);
var
  myLayout: TTextLayout;
  i: integer;
  aPoint: TPointF;
  HeightItem:Integer;
  Multiplicador: Integer;
  Soma:Integer;
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

  //HeightItem:=  Trunc(myLayout.TextHeight) + 6;
  HeightItem:=  Trunc(myLayout.Height);

  if HeightItem < 25 then
    HeightItem:= 25;


  if HeightItem > 30 then
  begin
    Multiplicador:= 10;
    Soma:= 20;
  end;

  if HeightItem > 300 then
  begin
    Multiplicador:= 22;
    Soma:= 25;
  end;

  if HeightItem > 400 then
  begin
    Multiplicador:= 25;
    Soma:= 30;
  end;

  if HeightItem > 500 then
  begin
    Multiplicador:= 25;
    Soma:= 30;
  end;

  if HeightItem > 700 then
  begin
    Multiplicador:= 26;
    Soma:= 33;
  end;

  if HeightItem > 30 then
  begin
    HeightItem:= HeightItem + (Trunc((HeightItem  / 60) * Multiplicador));
    HeightItem:= HeightItem + Soma;
  end;

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
  MargemDireita:=8;
end;

procedure TfrmAgendaEscolaView.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DmEscola.GetAgenda;
  DmEscola.OpenAgenda(AlunoId, TurmaId);
  DmEscola.SalvarDadosServer;
  Dm.SalvarDadosServer;
  FillListBoxAgenda;
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
  DmEscola.fdqAgenda.Close;
  DmEscola.fdqAgenda.Open;
  FillListBoxAgenda;
end;

end.
