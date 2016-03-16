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
  Data.DB;

type
  TfrmAgendaEscolaView = class(TfrmBaseToolBar)
    bsAgenda: TBindSourceDB;
    blAgenda: TBindingsList;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    lstAgenda: TListView;
    LinkListControlToField2: TLinkListControlToField;
    ListView1: TListView;
    ToolBar2: TToolBar;
    SpeedButton3: TSpeedButton;
    TabItem3: TTabItem;
    ListBox1: TListBox;
    LinkListControlToField1: TLinkListControlToField;
    TabItem4: TTabItem;
    ToolBar3: TToolBar;
    SpeedButton4: TSpeedButton;
    Layout1: TLayout;
    VSB: TVertScrollBox;
    Panel1: TPanel;
    ShadowEffect1: TShadowEffect;
    Text1: TText;
    TabItem5: TTabItem;
    Layout2: TLayout;
    ListBox2: TListBox;
    LinkFillControlToField1: TLinkFillControlToField;
    TabItem6: TTabItem;
    Layout3: TLayout;
    ListBox3: TListBox;
    ToolBar4: TToolBar;
    SpeedButton5: TSpeedButton;
    TabItem7: TTabItem;
    Layout4: TLayout;
    ListBox4: TListBox;
    ToolBar5: TToolBar;
    SpeedButton6: TSpeedButton;
    TabItem8: TTabItem;
    Layout5: TLayout;
    ListBox5: TListBox;
    ToolBar6: TToolBar;
    SpeedButton7: TSpeedButton;
    TabItem9: TTabItem;
    Layout6: TLayout;
    ToolBar7: TToolBar;
    SpeedButton8: TSpeedButton;
    ListBox6: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lstAgendaUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    procedure SetTitulo;
    procedure RefreshDataSet(DataSet: TDataSet);
    procedure FillListCategory;
    Function CountChar(Texto: String; C: Char): Integer;

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

procedure TfrmAgendaEscolaView.FillListCategory;
var
  Item: TListBoxItem;
  LblTitle: TLabel;
  LblDetail: TLabel;
  LblDescription: TLabel;
  BtnAccessory: TSpeedButton;
  ImgTumbnail: TImageControl;

  BtnEstrela: TImage;
begin
  ListBox4.BeginUpdate;
  ListBox4.Items.Clear;

  // Animator1.StartAnimate('Loading');
  // Animator1.Repaint;
  // Animator1.Visible := True;
  with DmEscola.fdqAgenda do
  begin
    First;
    while not Eof do
    begin
      Item := TListBoxItem.Create(ListBox4);
      Item.Parent := ListBox4;
      Item.Text := '';
      Item.ItemData.Accessory := TListBoxItemData.TAccessory.aMore;
      // Item.Tag := DmEscola.fdqAgenda.FieldByName('agenda_id').AsInteger;

      LblTitle.Parent := Item;
      LblTitle.StyledSettings := [TStyledSetting.ssFamily,
        TStyledSetting.ssSize, TStyledSetting.ssFontColor];
      LblTitle.StyleLookup := 'listboxitemdetaillabel';
      LblTitle.Position.X := 64;
      LblTitle.Position.Y := 8;
      LblTitle.Width := self.Width - 25 - 64;
      LblTitle.Height := 40;
      LblTitle.Font.Size := 10;
      LblTitle.TextAlign := TTextAlign.taLeading;
      LblTitle.VertTextAlign := TTextAlign.taLeading;
      LblTitle.Font.Family := 'Lucida Console';
      LblTitle.Font.Style := [TFontStyle.fsBold];
      // LblTitle.Text := DmEscola.fdqAgenda.FieldByName('data').AsString;
      LblDescription := TLabel.Create(Item);
      LblDescription.Parent := Item;
      LblDescription.StyledSettings := [TStyledSetting.ssFamily,
        TStyledSetting.ssSize, TStyledSetting.ssFontColor];
      LblDescription.StyleLookup := 'listboxitemdetaillabel';
      LblDescription.Position.X := 64;
      LblDescription.Position.Y := 32;
      LblDescription.Width := LblTitle.Width;
      LblDescription.Height := 50;
      LblDescription.Font.Size := 10;
      LblDescription.TextAlign := TTextAlign.taLeading;
      LblDescription.VertTextAlign := TTextAlign.taLeading;
      LblDescription.Font.Family := 'Lucida Console';
      LblDescription.Font.Style := [];
      LblDescription.Text := DmEscola.fdqAgenda.FieldByName
        ('descricao').AsString;
      // Animator1.Repaint;
      Next;
    end;
  end;
  // Animator1.StopAnimate('Loading');
  // Animator1.Repaint;
  // Animator1.Visible := False;
  ListBox4.EndUpdate;
end;

procedure TfrmAgendaEscolaView.FormCreate(Sender: TObject);
begin
  inherited;
  // SetStyle(Self);
end;

procedure TfrmAgendaEscolaView.FormShow(Sender: TObject);
begin
  inherited;
  DmEscola.OpenAgenda(AlunoId, TurmaId);
  SetTitulo;
  lstAgenda.ItemAppearanceObjects.ItemObjects.Detail.WordWrap := True;
  Panel1.Visible := False;
  // lstAgenda.ItemAppearanceObjects.ItemObjects.Detail.Trimming:=None;
end;

procedure TfrmAgendaEscolaView.lstAgendaUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
  // In order for text to be truncated properly, shorten text object
  // AItem.Objects.TextObject.Width := AItem.Objects.TextObject.Width - (5 + AItem.Objects.AccessoryObject.Width);

  // AItem.Objects.TextObject.Height := Length(DmEscola.fdqAgenda.FieldByName('descricao').Text) * 25;
  // Restore checked state when device is rotated.
  // When listview is resized because of rotation, accessory properties will be reset to default values
  // AItem.Objects.AccessoryObject.Visible := FChecked.Contains(AItem.Index);

end;

procedure TfrmAgendaEscolaView.RefreshDataSet(DataSet: TDataSet);
begin
  if not DataSet.Active then
    DataSet.Open
  else
  begin
    DataSet.Close;
    DataSet.Open;
  end;
  FillListCategory;
end;

procedure TfrmAgendaEscolaView.SetTitulo;
begin
  lblTitulo.Text := Titulo;
end;

procedure TfrmAgendaEscolaView.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DmEscola.GetAgenda;
  DmEscola.OpenAgenda(AlunoId, TurmaId);
  DmEscola.SalvarDadosServer;
  Dm.SalvarDadosServer;
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
end;

procedure TfrmAgendaEscolaView.SpeedButton3Click(Sender: TObject);
var
  LItem: TListViewItem;
  i: Integer;
  CR: TCalloutRectangle;
  L: TText;
  TmpImg: TImage;

begin
  ListView1.BeginUpdate;
  try
    for i := 1 to 10 do
    begin
      LItem := ListView1.Items.Add;
      LItem.Text := IntToStr(i);
    end;
  finally
    ListView1.EndUpdate;
  end;

  {

    CR := TCalloutRectangle.Create(Self);
    CR.Parent := LItem;
    CR.Align := TAlignLayout.alTop;
    CR.CalloutPosition := TCalloutPosition.cpLeft;
    CR.Margins.Top := 10;
    CR.Margins.Bottom := 10;
    CR.Margins.Right := 5;
    CR.Height := 75;

    L := TText.Create(Self);
    L.Parent := CR;
    L.Align := TAlignLayout.alClient;
    L.Text := 'A quick brown fox jumped over the yellow log running away from the pink dog and ran down the lane.';
    L.Margins.Left := 15;
    L.Margins.Right := 5;
    L.Width := CR.Width-20;

    L.WordWrap := True;
    L.AutoSize := True; }
  // L.OnPaint := LabelPaint;

  { TmpImg := TImage.Create(Self);
    TmpImg.Parent := CR;
    TmpImg.Align := TAlignLayout.alRight;
    TmpImg.Bitmap.Assign(Image1.Bitmap);
    TmpImg.Width := 75;
  }

end;

procedure TfrmAgendaEscolaView.SpeedButton4Click(Sender: TObject);
var
  // CR: TCalloutRectangle;
  CR: TPanel;
  L: TText;
  TmpImg: TImage;
  Shadow: TShadowEffect;
begin
  DmEscola.fdqAgenda.First;
  while not(DmEscola.fdqAgenda.Eof) do
  begin
    // CR := TCalloutRectangle.Create(Self);
    CR := TPanel.Create(self);
    CR.Parent := VSB;
    CR.Align := TAlignLayout.alTop;
    // CR.CalloutPosition := TCalloutPosition.cpRight;
    CR.Margins.Top := 10;
    CR.Margins.Bottom := 10;
    CR.Margins.Left := 5;
    CR.Height := 75;

    Shadow := TShadowEffect.Create(self);
    Shadow.Parent := CR;

    L := TText.Create(self);
    L.Parent := CR;
    L.Align := TAlignLayout.alClient;
    // L.Text := 'A quick brown fox jumped over the yellow log running away from the pink dog and ran down the lane.';
    L.Text := DmEscola.fdqAgenda.FieldByName('descricao').AsString;

    L.Font.Size := 14;
    L.Font.Size := 12;

    L.Margins.Right := 15;
    L.Margins.Left := 5;
    L.Width := CR.Width - 20;

    L.WordWrap := True;
    L.AutoSize := True;
    // L.OnPaint := LabelPaint;

    { TmpImg := TImage.Create(Self);
      TmpImg.Parent := CR;
      TmpImg.Align := TAlignLayout.alLeft;
      //TmpImg.Bitmap.Assign(Image1.Bitmap);
      TmpImg.Width := 75; }
    DmEscola.fdqAgenda.Next;
  end;

end;

procedure TfrmAgendaEscolaView.SpeedButton5Click(Sender: TObject);
var
  C: Char;
  i: Integer;
  Buffer: String;
  ListBoxItem: TListBoxItem;
  ListBoxGroupHeader: TListBoxGroupHeader;
begin
  ListBox3.BeginUpdate;
  for C := 'a' to 'z' do
  begin
    // Add header ('A' to 'Z') to the List
    ListBoxGroupHeader := TListBoxGroupHeader.Create(ListBox3);
    ListBoxGroupHeader.Text := UpperCase(C);
    ListBox3.AddObject(ListBoxGroupHeader);

    // Add items ('a', 'aa', 'aaa', 'b', 'bb', 'bbb', 'c', ...) to the list
    for i := 1 to 3 do
    begin
      // StringOfChar returns a string with a specified number of repeating characters.
      Buffer := StringOfChar(C, i);
      // Simply add item
      // ListBox3.Items.Add(Buffer);

      // or, you can add items by creating an instance of TListBoxItem by yourself
      ListBoxItem := TListBoxItem.Create(ListBox3);
      ListBoxItem.Text := Buffer;

      if i = 2 then
        ListBoxItem.Height := 200;

      // (aNone=0, aMore=1, aDetail=2, aCheckmark=3)
      ListBoxItem.ItemData.Accessory := TListBoxItemData.TAccessory(i);
      ListBox3.AddObject(ListBoxItem);
    end;
  end;
  ListBox3.EndUpdate;
end;

procedure TfrmAgendaEscolaView.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  FillListCategory;

end;

procedure TfrmAgendaEscolaView.SpeedButton7Click(Sender: TObject);
Var
  Item: TListBoxItem;
begin

  // draw address line and postcode to listbox
  ListBox5.Clear;
  ListBox5.BeginUpdate;

  try

    Item := TListBoxItem.Create(ListBox5);
    DmEscola.fdqAgenda.First;
    while not DmEscola.fdqAgenda.Eof do
    begin
      // create and format listbox to show bottomdetail
      Item := TListBoxItem.Create(ListBox5);
      Item.StyleLookup := 'listboxitembottomdetail';
      // draw address to text part and postcode to bottom detail of Listbox item
      Item.Text := (DmEscola.fdqAgenda.FieldByName('data').AsString);
      Item.ItemData.Detail := (DmEscola.fdqAgenda.FieldByName('descricao')
        .AsString);;
      ListBox5.AddObject(Item);
      DmEscola.fdqAgenda.Next;
    end;
  finally
    ListBox5.EndUpdate;
    DmEscola.fdqAgenda.Close;
  end;

end;

procedure TfrmAgendaEscolaView.SpeedButton8Click(Sender: TObject);
var
  C: Char;
  i: Integer;
  Buffer: String;
  ListBoxItem: TListBoxItem;
  ListBoxGroupHeader: TListBoxGroupHeader;
  DataHeader: string;
  Tamanho: Double;
begin

  ListBox6.BeginUpdate;
  ListBox6.Items.Clear;
  DmEscola.fdqAgenda.First;

  while not DmEscola.fdqAgenda.Eof do
  begin
    ListBoxGroupHeader := TListBoxGroupHeader.Create(ListBox6);
    DataHeader := DmEscola.fdqAgenda.FieldByName('data').AsString;
    ListBoxGroupHeader.Text := DataHeader;
    ListBox6.AddObject(ListBoxGroupHeader);

    while (DataHeader = (DmEscola.fdqAgenda.FieldByName('data').AsString)) and
      not(DmEscola.fdqAgenda.Eof) do
    begin
      // StringOfChar returns a string with a specified number of repeating characters.

      // Simply add item
      // ListBox6.Items.Add(Buffer);

      // or, you can add items by creating an instance of TListBoxItem by yourself
      ListBoxItem := TListBoxItem.Create(ListBox6);
      ListBoxItem.Text := DmEscola.fdqAgenda.FieldByName('descricao').AsString;
      ListBoxItem.TextSettings.WordWrap := True;


      Tamanho := 25 * (Length(DmEscola.fdqAgenda.FieldByName('descricao')
        .AsString) / 35);

      Tamanho := Tamanho + (CountChar(DmEscola.fdqAgenda.FieldByName('descricao').AsString,'#') * 12.5);

      if Tamanho < 25 then
        Tamanho := 25;

     { if DmEscola.fdqAgenda.FieldByName('agenda_id').AsString = 'AE5D7A84-3B0C-420F-B4ED-63336C775E3B'
      then
      begin
        ShowMessage(DmEscola.fdqAgenda.FieldByName('descricao').AsString);
         Tamanho := Tamanho + (CountChar(DmEscola.fdqAgenda.FieldByName('descricao').AsString,'#') * 12.5);
      end; }

      ListBoxItem.Height := Tamanho;

      // (aNone=0, aMore=1, aDetail=2, aCheckmark=3)
      // ListBoxItem.ItemData.Accessory := TListBoxItemData.TAccessory(I);
      ListBox6.AddObject(ListBoxItem);
      DmEscola.fdqAgenda.Next;
    end;
  end;
  ListBox6.EndUpdate;

end;

end.
