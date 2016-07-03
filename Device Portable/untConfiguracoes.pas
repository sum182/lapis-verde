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
    procedure swDesconectarClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SalvarConfig;
    procedure LerConfig;
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.fmx}

uses {untFuncoes,} untDMStyles, untDM, smGeralFMX;


{ TfrmConfiguracoes }

procedure TfrmConfiguracoes.FormCreate(Sender: TObject);
begin
  inherited;

  LerConfig;
end;

procedure TfrmConfiguracoes.imgVoltarClick(Sender: TObject);
begin
  inherited;

  SalvarConfig;
end;

procedure TfrmConfiguracoes.swDesconectarClick(Sender: TObject);
begin
  inherited;

  SalvarConfig;
end;

procedure TfrmConfiguracoes.LerConfig;
var
  sValor: string;
  Diretorio: string;
begin
  exit;
  try
    if not Assigned(Configuracoes.FIniFile) then
      Configuracoes.FIniFile := TIniFile.Create(Configuracoes.GetDiretorio + 'config.ini');

    //ShowMessage(Configuracoes.GetDiretorio + 'config.ini');

    sValor := Configuracoes.FIniFile.ReadString(Configuracoes.SectionData, 'DesconectarAoSair', 'False');
    //ShowMessage( Configuracoes.FIniFile.ReadString(Configuracoes.SectionData, 'DesconectarAoSair', 'False'));

    swDesconectar.IsChecked :=  (sValor = 'True');
  finally
    Configuracoes.FIniFile.DisposeOf;
  end;

end;

procedure TfrmConfiguracoes.SalvarConfig;
var
  sValor: string;
begin
  exit;
  if (swDesconectar.IsChecked) then
    sValor := 'True'
  else
    sValor := 'False';

  if not Assigned(Configuracoes.FIniFile) then
    Configuracoes.FIniFile := TIniFile.Create(Configuracoes.GetDiretorio + 'config.ini');

  Configuracoes.FIniFile.WriteString(Configuracoes.SectionData, 'DesconectarAoSair', sValor);
  FreeAndNil(Configuracoes.FIniFile);
end;

end.
