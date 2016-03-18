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
  Data.DB, FGX.VirtualKeyboard;

type
  TfrmAgendaEscolaView = class(TfrmBaseToolBar)
    bsAgenda: TBindSourceDB;
    blAgenda: TBindingsList;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    TabControl1: TTabControl;
    LinkFillControlToField1: TLinkFillControlToField;
    TabItem6: TTabItem;
    Layout3: TLayout;
    TabItem9: TTabItem;
    Layout6: TLayout;
    ToolBar7: TToolBar;
    SpeedButton8: TSpeedButton;
    lstboxAgenda: TListBox;
    ListBox2: TListBox;
    LinkFillControlToField2: TLinkFillControlToField;
    TabItem1: TTabItem;
    lstMnuMain: TListBox;
    lblTipoCombustivel: TListBoxItem;
    cmbTipoCombustivel: TComboBox;
    lbKMs: TListBoxItem;
    edtKMs: TEdit;
    lbLitros: TListBoxItem;
    edtLitros: TEdit;
    ListBoxItem2: TListBoxItem;
    btnCalcular: TButton;
    lblResultado: TListBoxItem;
    StyleBook1: TStyleBook;
    TabItem2: TTabItem;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lstAgendaUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure SpeedButton8Click(Sender: TObject);
  private
    procedure SetTitulo;

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

  lstboxAgenda.BeginUpdate;
  lstboxAgenda.Items.Clear;
  DmEscola.fdqAgenda.First;

  while not DmEscola.fdqAgenda.Eof do
  begin
    ListBoxGroupHeader := TListBoxGroupHeader.Create(lstboxAgenda);
    ListBoxGroupHeader.TextSettings.HorzAlign := TTextAlign.Center;
    ListBoxGroupHeader.TextSettings.WordWrap := True;

    DataHeader := DmEscola.fdqAgenda.FieldByName('data').AsString;
    ListBoxGroupHeader.Text := DataHeader;
    lstboxAgenda.AddObject(ListBoxGroupHeader);

    while (DataHeader = (DmEscola.fdqAgenda.FieldByName('data').AsString)) and
      not(DmEscola.fdqAgenda.Eof) do
    begin
      // StringOfChar returns a string with a specified number of repeating characters.

      // Simply add item
      // lstboxAgenda.Items.Add(Buffer);

      // or, you can add items by creating an instance of TListBoxItem by yourself
      ListBoxItem := TListBoxItem.Create(lstboxAgenda);
      ListBoxItem.Text := DmEscola.fdqAgenda.FieldByName('descricao').AsString;
      ListBoxItem.TextSettings.WordWrap := True;
      ListBoxItem.Selectable:=False;
            ListBoxItem.Selectable:=False;
     // ListBoxItem.StyleLookup := 'listboxitemnodetail';

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
      lstboxAgenda.AddObject(ListBoxItem);

      DmEscola.fdqAgenda.Next;

      ListBoxItem := TListBoxItem.Create(lstboxAgenda);
      ListBoxItem.Text := '';
      ListBoxItem.Selectable:=False;
      //ListBoxItem.StyleLookup := 'listboxitemnodetail';
      lstboxAgenda.AddObject(ListBoxItem);


    end;
  end;
  lstboxAgenda.EndUpdate;

end;

end.
