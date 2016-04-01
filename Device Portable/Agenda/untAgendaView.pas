unit untAgendaView;

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
  Data.DB, FGX.VirtualKeyboard,FMX.TextLayout, FMX.ScrollBox, FMX.Memo,
  FMX.DateTimeCtrls, FMX.Calendar, FMX.ExtCtrls,DateUtils, FMX.Gestures;

type
  TfrmAgendaView = class(TfrmBaseToolBar)
    bsAgenda: TBindSourceDB;
    blAgenda: TBindingsList;
    btnAdd: TSpeedButton;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkFillControlToField2: TLinkFillControlToField;
    tbCtrlAgenda: TTabControl;
    tbItemListAgenda: TTabItem;
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
    layData: TLayout;
    layCalendar: TLayout;
    Calendar: TCalendar;
    btnCalendar: TSpeedButton;
    gbxCalendar: TGroupBox;
    GestureManager1: TGestureManager;
    imgCalendarLeft: TImage;
    imgCalendarDown: TImage;
    imgCalendarRight: TImage;
    imgCalendarUp: TImage;
    imgCalendar: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure imgAddClick(Sender: TObject);
    procedure CalendarDateSelected(Sender: TObject);
    procedure btnCalendarClick(Sender: TObject);
    procedure btnCalendarRightClick(Sender: TObject);
    procedure btnCalendarLeftClick(Sender: TObject);
    procedure btnCalendarDownClick(Sender: TObject);
    procedure btnCalendarTopClick(Sender: TObject);
    procedure lstboxAgendaGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure imgCalendarLeftClick(Sender: TObject);
    procedure imgCalendarRightClick(Sender: TObject);
    procedure imgCalendarDownClick(Sender: TObject);
    procedure imgCalendarUpClick(Sender: TObject);
  private
    MargemEsquerda:Integer;
    MargemDireita:Integer;
    fActivityDialogThread: TThread;
    procedure SetTitulo;
    procedure SetListBoxAgendaGroupHeader;
    procedure SetListBoxAgendaItemData(Data:String);
    procedure SetListBoxAgendaItem(Descricao:String);
    procedure SetListBoxAgendaItemLinhaBranco;
    procedure SetListBoxAgendaFooter;
    procedure SetListBoxItemProperty(ListBoxItem:TListBoxItem);
    procedure SetTextProperty(Text:TText;ListBoxItem:TListBoxItem);
    procedure SetValuesObjects;
    procedure SetStateObjects;
  public
    AlunoId: Integer;
    TurmaId: Integer;
    OwnerAgenda: String;
    DataSetAgenda: TDataSet;
    procedure FillListBoxAgenda;
    procedure FillListBoxAgendaWait;
    procedure RefreshForm;

  end;

var
  frmAgendaView: TfrmAgendaView;

implementation

{$R *.fmx}

uses untFuncoes, untDmEscola, untDM, untAgendaEscolaAdd, untPrincipal,
  untDMStyles, smMensagensFMX;

procedure TfrmAgendaView.btnVoltarClick(Sender: TObject);
begin
  fAllowCloseForm := True;
  Close;
  inherited;
end;


procedure TfrmAgendaView.CalendarDateSelected(Sender: TObject);
begin
  inherited;
  RefreshForm;
  layCalendar.Visible := not layCalendar.Visible;
  SetStateObjects;
end;

procedure TfrmAgendaView.FillListBoxAgenda;
var
  Data: string;
begin
  try
    lstboxAgenda.BeginUpdate;
    lstboxAgenda.Items.Clear;
    DataSetAgenda.Refresh;
    DataSetAgenda.DisableControls;
    DataSetAgenda.First;

    while not DataSetAgenda.Eof do
    begin
        SetListBoxAgendaItem(DataSetAgenda.FieldByName('descricao').AsString);
        SetListBoxAgendaGroupHeader;
        DataSetAgenda.Next;
      end;
  finally
    lstboxAgenda.EndUpdate;
    DataSetAgenda.EnableControls;
  end;
end;

procedure TfrmAgendaView.FillListBoxAgendaWait;
begin
 //Este método não esta sendo utilizado, ao utilizar no show do form trava a app e fecha
 if not DM.fgActivityDialog.IsShown then
  begin
    FActivityDialogThread := TThread.CreateAnonymousThread(procedure
    begin
      try
        TThread.Synchronize(nil, procedure
        begin
          DM.fgActivityDialog.Message := 'Carregando Agenda';
          DM.fgActivityDialog.Show;
        end);

        FillListBoxAgenda;

        if TThread.CheckTerminated then
          Exit;


      finally
        if not TThread.CheckTerminated then
          TThread.Synchronize(nil, procedure
          begin
              DM.fgActivityDialog.Hide;
              Application.ProcessMessages;
          end);
      end;
    end);
    FActivityDialogThread.FreeOnTerminate := False;
    FActivityDialogThread.Start;
  end;
end;

procedure TfrmAgendaView.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
  SetValuesObjects;
  tbCtrlAgenda.TabPosition:= TTabPosition.None;
  tbCtrlAgenda.ActiveTab:= tbItemListAgenda;
end;

procedure TfrmAgendaView.FormShow(Sender: TObject);
begin
  inherited;

  layCalendar.Visible:=False;
  Calendar.Date := Now;
  RefreshForm;
end;


procedure TfrmAgendaView.imgCalendarRightClick(Sender: TObject);
begin
  inherited;
  Calendar.Date :=  IncDay(Calendar.date,1);
  RefreshForm;
end;

procedure TfrmAgendaView.imgCalendarUpClick(Sender: TObject);
begin
  inherited;
 btnCalendar.OnClick(self);
end;

procedure TfrmAgendaView.imgCalendarDownClick(Sender: TObject);
begin
  inherited;
  btnCalendar.OnClick(self);
end;

procedure TfrmAgendaView.imgAddClick(Sender: TObject);
begin
  inherited;
  btnAdd.OnClick(self);
end;

procedure TfrmAgendaView.imgCalendarLeftClick(Sender: TObject);
begin
  inherited;
  Calendar.Date :=  IncDay(Calendar.date,-1);
  RefreshForm;
end;

procedure TfrmAgendaView.imgVoltarClick(Sender: TObject);
begin
  inherited;
  btnVoltar.OnClick(self);
end;

procedure TfrmAgendaView.lstboxAgendaGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  Gesto : string;
begin
  if GestureToIdent(EventInfo.GestureID, Gesto) then
    begin
      case EventInfo.GestureID of
        sgiLeft : imgCalendarRight.OnClick(self);
        sgiRight: imgCalendarLeft.OnClick(self);
      end;
    end;
end;

procedure TfrmAgendaView.RefreshForm;
begin
  btnCalendar.Text := Format('%s', [FormatDateTime('dddddd', Calendar.Date)]);
  btnAdd.Enabled:= (Calendar.Date >= Date);

  if UsuarioLogadoIsFuncionario then
    DmEscola.OpenAgenda(AlunoId, TurmaId,Calendar.Date);

  SetTitulo;
  FillListBoxAgenda;
  SetStateObjects;
end;

procedure TfrmAgendaView.SetListBoxAgendaFooter;
begin
//
end;

procedure TfrmAgendaView.SetListBoxAgendaGroupHeader;
var
  ListBoxGroupHeader: TListBoxGroupHeader;
begin
  ListBoxGroupHeader := TListBoxGroupHeader.Create(lstboxAgenda);
  ListBoxGroupHeader.TextSettings.HorzAlign := TTextAlign.Center;
  //ListBoxGroupHeader.TextSettings.WordWrap := True;
  ListBoxGroupHeader.Height:=20;
  lstboxAgenda.AddObject(ListBoxGroupHeader);
end;

procedure TfrmAgendaView.SetListBoxAgendaItem(Descricao:String);
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
  Text.TextSettings.Font.Size :=  16;
  Text.AutoSize:=True;
  ListBoxItem.Height:=  (Text.Height)+ 4;
  Text.Parent := ListBoxItem;
  Text.EndUpdate;
  lstboxAgenda.AddObject(ListBoxItem);

  //SetListBoxAgendaItemLinhaBranco;
end;

procedure TfrmAgendaView.SetListBoxAgendaItemData(Data:String);
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

procedure TfrmAgendaView.SetListBoxAgendaItemLinhaBranco;
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


procedure TfrmAgendaView.SetListBoxItemProperty(
  ListBoxItem: TListBoxItem);
begin
  ListBoxItem.StyleLookup := 'listboxitemstyle';
  ListBoxItem.TextSettings.WordWrap := True;
  ListBoxItem.TextSettings.VertAlign := TTextAlign.Center;
  ListBoxItem.Selectable:=False;
  ListBoxItem.Margins.Left:=MargemEsquerda;
  ListBoxItem.Margins.Right := MargemDireita;
  ListBoxItem.Margins.Top := 5;
  ListBoxItem.Margins.Bottom := 5;
  ListBoxItem.Height:= 25;
end;

procedure TfrmAgendaView.SetStateObjects;
begin
  imgCalendarDown.Visible := not layCalendar.Visible;
  imgCalendarUp.Visible := layCalendar.Visible;
end;

procedure TfrmAgendaView.SetTextProperty(Text: TText;ListBoxItem:TListBoxItem);
begin
  Text.Align := TAlignLayout.alClient;
  Text.TextSettings.HorzAlign := TTextAlign.Leading;
  Text.TextSettings.VertAlign := TTextAlign.Leading;

  Text.Width := lstboxAgenda.Width;
  Text.Padding := ListBoxItem.Padding;
  Text.Margins := ListBoxItem.Margins;
  Text.TextSettings.WordWrap:=True;
end;

procedure TfrmAgendaView.SetTitulo;
begin
  lblTitulo.Text := OwnerAgenda;
end;

procedure TfrmAgendaView.SetValuesObjects;
begin
  MargemEsquerda:=8;
  MargemDireita:=8;
end;

procedure TfrmAgendaView.btnCalendarClick(Sender: TObject);
begin
  inherited;
  layCalendar.Visible := not layCalendar.Visible;
  SetStateObjects;
end;

procedure TfrmAgendaView.btnCalendarRightClick(Sender: TObject);
begin
  inherited;
  Calendar.Date :=  IncDay(Calendar.date,1);
  RefreshForm;
end;

procedure TfrmAgendaView.btnCalendarTopClick(Sender: TObject);
begin
  inherited;
  btnCalendar.OnClick(self);
end;

procedure TfrmAgendaView.btnCalendarLeftClick(Sender: TObject);
begin
  inherited;
  Calendar.Date :=  IncDay(Calendar.date,-1);
  RefreshForm;
end;

procedure TfrmAgendaView.btnCalendarDownClick(Sender: TObject);
begin
  inherited;
  btnCalendar.OnClick(self);
end;

procedure TfrmAgendaView.btnAddClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmAgendaEscolaAdd) then
    Application.CreateForm(TfrmAgendaEscolaAdd, frmAgendaEscolaAdd);

  frmAgendaEscolaAdd.AlunoId := AlunoId;
  frmAgendaEscolaAdd.TurmaId := TurmaId;
  frmAgendaEscolaAdd.OwnerAgenda := OwnerAgenda;
  frmAgendaEscolaAdd.Data := Calendar.Date;
  frmAgendaEscolaAdd.Show;
end;

end.
