unit untConfiguracoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ListBox, FMX.Edit, FMX.EditBox, FMX.SpinBox, System.IOUtils,
  firedac.comp.client, FMX.Overbyte.IniFiles;

type
  TfrmConfiguracoes = class(TfrmBaseToolBar)
    lbPrincipal: TListBox;
    lbghSeguranca: TListBoxGroupHeader;
    lbiSeguranca: TListBoxItem;
    swDesconectar: TSwitch;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure swDesconectarClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure layBasePaint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
  private
    { Private declarations }
    FIniFile: TIniFile;
  public
    { Public declarations }
    procedure SalvarConfig;
    procedure LerConfig;
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.fmx}

uses untFuncoes, untDMStyles, untDM;

const
    SectionData = 'CONFIGURACOES';
    KeyEdit     = 'DesconectarAoSair';

{ TfrmConfiguracoes }

procedure TfrmConfiguracoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  SalvarConfig;
end;

procedure TfrmConfiguracoes.FormDeactivate(Sender: TObject);
begin
  SalvarConfig;
  inherited;
end;

procedure TfrmConfiguracoes.FormShow(Sender: TObject);
begin
  LerConfig;
  inherited;
end;

procedure TfrmConfiguracoes.layBasePaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  inherited;
  LerConfig;
end;

procedure TfrmConfiguracoes.swDesconectarClick(Sender: TObject);
begin
  inherited;

  SalvarConfig;
end;

procedure TfrmConfiguracoes.LerConfig;
var sValor: string;
begin
  if not Assigned(FIniFile) then
    FIniFile := TIniFile.Create('Config.ini');
  sValor := FIniFile.ReadString(SectionData, KeyEdit, 'False');
  FreeAndNil(FIniFile);

  if (sValor = 'True') then
    swDesconectar.IsChecked := True;
end;

procedure TfrmConfiguracoes.SalvarConfig;
var sValor: string;
begin

  if (swDesconectar.IsChecked) then
    sValor := 'True'
  else
    sValor := 'False';

  if not Assigned(FIniFile) then
    FIniFile := TIniFile.Create('Config.ini');
  FIniFile.WriteString(SectionData, KeyEdit, sValor);
  FreeAndNil(FIniFile);
end;

end.
