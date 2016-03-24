unit untAgendaEscolaAdd;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ScrollBox, FMX.Memo, FGX.VirtualKeyboard, FMX.ListBox;

type
  TfrmAgendaEscolaAdd = class(TfrmBaseToolBar)
    memAgenda: TMemo;
    btnEnviar: TSpeedButton;
    lblAgenda: TLabel;
    layEspaco1: TLayout;
    fgVirtualKeyboard1: TfgVirtualKeyboard;
    layMemo: TLayout;
    VertScrollBox1: TVertScrollBox;
    imgEnviar: TImage;
    lblNome: TLabel;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    layEspaco2: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memAgendaChangeTracking(Sender: TObject);
    procedure memAgendaChange(Sender: TObject);
    procedure memAgendaClick(Sender: TObject);
    procedure fgVirtualKeyboard1Hide(Sender: TObject; const Bounds: TRect);
    procedure fgVirtualKeyboard1Show(Sender: TObject; const Bounds: TRect);
    procedure imgEnviarClick(Sender: TObject);
  private
    procedure SetTitulo;
    procedure SetEnabledFields;
  public
    AlunoId:Integer;
    TurmaId:Integer;
    Titulo:String;
  end;

var
  frmAgendaEscolaAdd: TfrmAgendaEscolaAdd;

implementation

{$R *.fmx}

uses smGeralFMX, untDM, untDmEscola, untDMStyles, untFuncoes, smMensagensFMX,
  FMX.Forms, untAgendaEscolaView;

procedure TfrmAgendaEscolaAdd.btnVoltarClick(Sender: TObject);
begin
  fAllowCloseForm:=True;
  Close;
  inherited;
end;

procedure TfrmAgendaEscolaAdd.fgVirtualKeyboard1Hide(Sender: TObject;
  const Bounds: TRect);
begin
  inherited;
  layBase.Align := TAlignLayout.Client;
end;

procedure TfrmAgendaEscolaAdd.fgVirtualKeyboard1Show(Sender: TObject;
  const Bounds: TRect);
begin
  inherited;
  layBase.Align := TAlignLayout.Top;
  if BorderStyle <> TFmxFormBorderStyle.None then
    layBase.Height := Screen.Size.Height - Bounds.Height
  else
    layBase.Height := Screen.Size.Height - Bounds.Height - 20;
end;

procedure TfrmAgendaEscolaAdd.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
end;

procedure TfrmAgendaEscolaAdd.FormShow(Sender: TObject);
begin
  inherited;
  SetTitulo;
  SetEnabledFields;
end;

procedure TfrmAgendaEscolaAdd.imgEnviarClick(Sender: TObject);
begin
  inherited;
  btnEnviar.OnClick(self);
end;

procedure TfrmAgendaEscolaAdd.memAgendaChange(Sender: TObject);
begin
  inherited;
  SetEnabledFields;
end;

procedure TfrmAgendaEscolaAdd.memAgendaChangeTracking(Sender: TObject);
begin
  inherited;
  SetEnabledFields;
end;

procedure TfrmAgendaEscolaAdd.memAgendaClick(Sender: TObject);
begin
  inherited;
  OnClickFields(Self);
end;

procedure TfrmAgendaEscolaAdd.SetEnabledFields;
begin
  lblAgenda.Visible:= (memAgenda.Text = '');
  imgEnviar.Enabled:= not (memAgenda.Text = '');
  btnEnviar.Enabled:= not (memAgenda.Text = '');
end;

procedure TfrmAgendaEscolaAdd.SetTitulo;
begin
  lblNome.Text := 'Para: ' + Titulo;
end;

procedure TfrmAgendaEscolaAdd.btnEnviarClick(Sender: TObject);
begin
  inherited;
  if (memAgenda.Text = EmptyStr) Then
    Exit;

  DmEscola.CriarAgenda(memAgenda.Text,AlunoId,TurmaId);
  memAgenda.Text:=EmptyStr;
  fAllowCloseForm:=True;
  Close;

  if Assigned(frmAgendaEscolaView) then
    frmAgendaEscolaView.FillListBoxAgenda;

end;



end.
