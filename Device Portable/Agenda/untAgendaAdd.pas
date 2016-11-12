unit untAgendaAdd;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ScrollBox, FMX.Memo, FGX.VirtualKeyboard, FMX.ListBox;

type
  TfrmAgendaAdd = class(TfrmBaseToolBar)
    memAgenda: TMemo;
    btnEnviar: TSpeedButton;
    lblAgenda: TLabel;
    layEspaco1: TLayout;
    fgKeyboard: TfgVirtualKeyboard;
    layMemo: TLayout;
    VertScrollBox1: TVertScrollBox;
    imgEnviar: TImage;
    lstboxCabecalho: TListBox;
    ListBoxItem1: TListBoxItem;
    layEspaco2: TLayout;
    ListBoxItem2: TListBoxItem;
    lblData: TLabel;
    Image1: TImage;
    imgAluno: TImage;
    imgTurma: TImage;
    lblNome: TLabel;
    tmInternet: TTimer;
    layInternet: TLayout;
    recInternet: TRectangle;
    lblInternet: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memAgendaChangeTracking(Sender: TObject);
    procedure memAgendaChange(Sender: TObject);
    procedure memAgendaClick(Sender: TObject);
    procedure fgKeyboardHide(Sender: TObject; const Bounds: TRect);
    procedure fgKeyboardShow(Sender: TObject; const Bounds: TRect);
    procedure imgEnviarClick(Sender: TObject);
    procedure tmInternetTimer(Sender: TObject);
  private
    procedure SetCabecalho;
    procedure SetEnabledFields;
    procedure SetVisibleObjects;
    procedure SetInternetDisconect;
  public
    AlunoId:Integer;
    TurmaId:Integer;
    OwnerAgenda:String;
    NomeCompleto: String;
    Data:TDate;
  end;

var
  frmAgendaAdd: TfrmAgendaAdd;

implementation

{$R *.fmx}

uses smGeralFMX, untDM, untDmAgenda, untDMStyles, untLibDevicePortable, smMensagensFMX,
  FMX.Forms, untAgendaView,smNetworkState, untResourceString;

procedure TfrmAgendaAdd.btnVoltarClick(Sender: TObject);
begin
  fAllowCloseForm:=True;
  Close;
  inherited;
end;

procedure TfrmAgendaAdd.fgKeyboardHide(Sender: TObject;
  const Bounds: TRect);
begin
  inherited;
  layBase.Align := TAlignLayout.Client;
end;

procedure TfrmAgendaAdd.fgKeyboardShow(Sender: TObject;
  const Bounds: TRect);
begin
  inherited;
  layBase.Align := TAlignLayout.Top;
  if BorderStyle <> TFmxFormBorderStyle.None then
    layBase.Height := Screen.Size.Height - Bounds.Height
  else
    layBase.Height := Screen.Size.Height - Bounds.Height - 20;
end;

procedure TfrmAgendaAdd.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
end;

procedure TfrmAgendaAdd.FormShow(Sender: TObject);
begin
  inherited;
  SetCabecalho;
  SetEnabledFields;
  SetVisibleObjects;
end;

procedure TfrmAgendaAdd.imgEnviarClick(Sender: TObject);
begin
  inherited;
  btnEnviar.OnClick(self);
end;

procedure TfrmAgendaAdd.memAgendaChange(Sender: TObject);
begin
  inherited;
  SetEnabledFields;
end;

procedure TfrmAgendaAdd.memAgendaChangeTracking(Sender: TObject);
begin
  inherited;
  SetEnabledFields;
end;

procedure TfrmAgendaAdd.memAgendaClick(Sender: TObject);
begin
  inherited;
  OnClickFields(Self);
end;

procedure TfrmAgendaAdd.SetEnabledFields;
begin
  lblAgenda.Visible:= (memAgenda.Text = '');
  imgEnviar.Enabled:= not (memAgenda.Text = '');
  btnEnviar.Enabled:= not (memAgenda.Text = '');
end;

procedure TfrmAgendaAdd.SetInternetDisconect;
begin
  layInternet.Visible:= not (smNetworkState.IsConnected);

  if not(layInternet.Visible) then
    Exit;

  if lblInternet.Text = rs_sem_conexao_internet then
  begin
    lblInternet.Text:= rs_informacoes_desatualizadas;
    Exit;
  end;

  if (lblInternet.Text = rs_informacoes_desatualizadas) or (lblInternet.Text = '') then
  begin
    lblInternet.Text:= rs_sem_conexao_internet;
    Exit;
  end;
end;

procedure TfrmAgendaAdd.SetVisibleObjects;
begin
  lblNome.Visible:=False;
  imgAluno.Visible := (AlunoId >= 1);
  imgTurma.Visible := (TurmaId >= 1);
  lblNome.Visible:=True;
  lblInternet.Text:= '';
  SetInternetDisconect;
end;

procedure TfrmAgendaAdd.tmInternetTimer(Sender: TObject);
begin
  inherited;
  SetInternetDisconect;
end;

procedure TfrmAgendaAdd.SetCabecalho;
begin
  //lblNome.Text := 'Para: ' + OwnerAgenda;
  //lblData.Text := 'Data: ' + DateToStr(Data);

  if NomeCompleto <> EmptyStr then
    lblNome.Text := NomeCompleto
  else
    lblNome.Text := OwnerAgenda;

  lblData.Text := Format('%s', [FormatDateTime('dddddd', Data)]);
end;


procedure TfrmAgendaAdd.btnEnviarClick(Sender: TObject);
begin
  inherited;
  if (memAgenda.Text = EmptyStr) Then
    Exit;

  DmAgenda.CriarAgenda(memAgenda.Text,Data,AlunoId,TurmaId);
  memAgenda.Text:=EmptyStr;
  fAllowCloseForm:=True;
  Close;

  if Assigned(frmAgendaView) then
    frmAgendaView.FillListBoxAgenda;
end;



end.
