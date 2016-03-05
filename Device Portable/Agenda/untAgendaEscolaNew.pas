unit untAgendaEscolaNew;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ScrollBox, FMX.Memo;

type
  TfrmAgendaEscolaNew = class(TfrmBaseToolBar)
    Memo1: TMemo;
    ToolBar2: TToolBar;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendaEscolaNew: TfrmAgendaEscolaNew;

implementation

{$R *.fmx}

uses smGeralFMX, untDM, untDmEscola, untDMStyles, untFuncoes;

procedure TfrmAgendaEscolaNew.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
end;

procedure TfrmAgendaEscolaNew.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DmEscola.CriarAgenda(Memo1.Text);
  DmEscola.AgendaApplyChanges;
end;

end.
