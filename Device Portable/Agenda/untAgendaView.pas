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
  FMX.DateTimeCtrls, FMX.Calendar, FMX.ExtCtrls,DateUtils;

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
    Calendar1: TCalendar;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure imgAddClick(Sender: TObject);
    procedure Calendar1DateSelected(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
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
    procedure SetValuesObjets;
  public
    AlunoId: Integer;
    TurmaId: Integer;
    Titulo: String;
    DataSetAgenda: TDataSet;
    procedure FillListBoxAgenda;
    procedure FillListBoxAgendaWait;

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


procedure TfrmAgendaView.Calendar1DateSelected(Sender: TObject);
begin
  inherited;
//layData.Height := layData.Height - ListBoxItem8.Height;
  layCalendar.Visible := False;

  SpeedButton1.Text := Format('%s', [FormatDateTime('dddddd', Calendar1.Date)]);


  if UsuarioLogadoIsFuncionario then
    DmEscola.OpenAgenda(AlunoId, TurmaId,Calendar1.Date);

  SetTitulo;
  FillListBoxAgenda;

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
        SetListBoxAgendaGroupHeader;
        SetListBoxAgendaItem(DataSetAgenda.FieldByName('descricao').AsString);
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
  SetValuesObjets;
  tbCtrlAgenda.TabPosition:= TTabPosition.None;
  tbCtrlAgenda.ActiveTab:= tbItemListAgenda;
end;

procedure TfrmAgendaView.FormShow(Sender: TObject);
begin
  inherited;
  if UsuarioLogadoIsFuncionario then
    DmEscola.OpenAgenda(AlunoId, TurmaId,Calendar1.Date);


  SetTitulo;
//  FillListBoxAgenda;

  layCalendar.Visible:=False;
  Calendar1.Date := Now;
  Calendar1.OnDateSelected(self);
end;


procedure TfrmAgendaView.imgAddClick(Sender: TObject);
begin
  inherited;
  btnAdd.OnClick(self);
end;

procedure TfrmAgendaView.imgVoltarClick(Sender: TObject);
begin
  inherited;
  btnVoltar.OnClick(self);
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
  ListBoxGroupHeader.TextSettings.WordWrap := True;
  ListBoxGroupHeader.Height:=15;
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


  SetListBoxAgendaItemLinhaBranco;
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
  ListBoxItem.TextSettings.WordWrap := True;
  ListBoxItem.Selectable:=False;
  ListBoxItem.Margins.Left:=MargemEsquerda;
  ListBoxItem.Margins.Right := MargemDireita;
  ListBoxItem.Height:= 25;
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
  lblTitulo.Text := Titulo;
end;

procedure TfrmAgendaView.SetValuesObjets;
begin
  MargemEsquerda:=8;
  MargemDireita:=8;
end;

procedure TfrmAgendaView.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  layCalendar.Visible := not layCalendar.Visible;

//layData.Height := layData.Height + ListBoxItem8.Height;
end;

procedure TfrmAgendaView.SpeedButton2Click(Sender: TObject);
begin
  inherited;
//  Calendar1.Date :=

 Calendar1.Date :=  IncDay(Calendar1.date,1);
 Calendar1DateSelected(self);
end;

procedure TfrmAgendaView.SpeedButton3Click(Sender: TObject);
begin
  inherited;
 Calendar1.Date :=  IncDay(Calendar1.date,-1);
 Calendar1DateSelected(self);
end;

procedure TfrmAgendaView.btnAddClick(Sender: TObject);
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
