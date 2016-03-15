unit untAgendaEscolaView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, FMX.ListView, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FMX.TabControl, FMX.ListBox, FMX.Effects;

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
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lstAgendaUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    procedure SetTitulo;

  public
    AlunoId:Integer;
    TurmaId:Integer;
    Titulo:String;
  end;

var
  frmAgendaEscolaView: TfrmAgendaEscolaView;

implementation

{$R *.fmx}

uses untFuncoes, untDmEscola, untDM, untAgendaEscolaAdd, untPrincipal,
  untDMStyles;

procedure TfrmAgendaEscolaView.btnVoltarClick(Sender: TObject);
begin
  fAllowCloseForm:=True;
  Close;
  inherited;
end;

procedure TfrmAgendaEscolaView.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
end;

procedure TfrmAgendaEscolaView.FormShow(Sender: TObject);
begin
  inherited;
  DmEscola.OpenAgenda(AlunoId,TurmaId);
  SetTitulo;
  lstAgenda.ItemAppearanceObjects.ItemObjects.Detail.WordWrap:= True;
  Panel1.Visible:= False;
 // lstAgenda.ItemAppearanceObjects.ItemObjects.Detail.Trimming:=None;
end;

procedure TfrmAgendaEscolaView.lstAgendaUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
  // In order for text to be truncated properly, shorten text object
//  AItem.Objects.TextObject.Width := AItem.Objects.TextObject.Width - (5 + AItem.Objects.AccessoryObject.Width);

//  AItem.Objects.TextObject.Height := Length(DmEscola.fdqAgenda.FieldByName('descricao').Text) * 25;
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
  DmEscola.OpenAgenda(AlunoId,TurmaId);
  DmEscola.SalvarDadosServer;
  Dm.SalvarDadosServer;
end;

procedure TfrmAgendaEscolaView.SpeedButton2Click(Sender: TObject);
begin
  inherited;
 if not Assigned(frmAgendaEscolaAdd) then
    Application.CreateForm(TfrmAgendaEscolaAdd, frmAgendaEscolaAdd);

  frmAgendaEscolaAdd.AlunoId:= AlunoId;
  frmAgendaEscolaAdd.TurmaId:= TurmaId;
  frmAgendaEscolaAdd.Titulo:= Titulo;
  frmAgendaEscolaAdd.Show;
end;

procedure TfrmAgendaEscolaView.SpeedButton3Click(Sender: TObject);
var
  LItem: TListViewItem;
  I: Integer;
  CR: TCalloutRectangle;
L: TText;
TmpImg: TImage;


begin
  ListView1.BeginUpdate;
  try
    for I := 1 to 10 do
    begin
      LItem := ListView1.Items.Add;
      LItem.Text := IntToStr(I);
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
  L.AutoSize := True;       }
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
//CR: TCalloutRectangle;
  CR: TPanel;
  L: TText;
  TmpImg: TImage;
  Shadow: TShadowEffect;
begin
  DmEscola.fdqAgenda.First;
  while not (DmEscola.fdqAgenda.Eof) do
  begin
    //CR := TCalloutRectangle.Create(Self);
    CR:= TPanel.Create(self);
    CR.Parent := VSB;
    CR.Align := TAlignLayout.alTop;
    //CR.CalloutPosition := TCalloutPosition.cpRight;
    CR.Margins.Top := 10;
    CR.Margins.Bottom := 10;
    CR.Margins.Left := 5;
    CR.Height := 75;

    Shadow := TShadowEffect.Create(self);
    Shadow.Parent := cr;

    L := TText.Create(Self);
    L.Parent := CR;
    L.Align := TAlignLayout.alClient;
    //L.Text := 'A quick brown fox jumped over the yellow log running away from the pink dog and ran down the lane.';
    L.Text :=  DmEscola.fdqAgenda.FieldByName('descricao').AsString;

    L.Font.Size := 14;
    L.Font.Size := 12;

    L.Margins.Right := 15;
    L.Margins.Left := 5;
    L.Width := CR.Width-20;

    L.WordWrap := True;
    L.AutoSize := True;
   // L.OnPaint := LabelPaint;


    {TmpImg := TImage.Create(Self);
    TmpImg.Parent := CR;
    TmpImg.Align := TAlignLayout.alLeft;
    //TmpImg.Bitmap.Assign(Image1.Bitmap);
    TmpImg.Width := 75; }
    DmEscola.fdqAgenda.Next;
  end;

end;

end.
