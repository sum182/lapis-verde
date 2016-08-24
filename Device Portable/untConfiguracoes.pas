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

uses {untFuncoes,} untDMStyles, untDM, smGeralFMX, Data.DB;


{ TfrmConfiguracoes }

procedure TfrmConfiguracoes.FormCreate(Sender: TObject);
begin
  inherited;

  Dm.OpenConfiguracoes;
  LerConfig;

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
  {exit;
  try
    if not Assigned(Configuracoes.FIniFile) then
      Configuracoes.FIniFile := TIniFile.Create(Configuracoes.GetDiretorio + 'config.ini');

    //ShowMessage(Configuracoes.GetDiretorio + 'config.ini');

    sValor := Configuracoes.FIniFile.ReadString(Configuracoes.SectionData, 'DesconectarAoSair', 'False');
    //ShowMessage( Configuracoes.FIniFile.ReadString(Configuracoes.SectionData, 'DesconectarAoSair', 'False'));

    swDesconectar.IsChecked :=  (sValor = 'True');
  finally
    Configuracoes.FIniFile.DisposeOf;
  end; }

  if (Dm.fdqConfiguracoes.State in [dsInactive])Then
   Dm.OpenConfiguracoes;


  swDesconectar.IsChecked:=False;
  if dm.fdqConfiguracoes.IsEmpty then
    Exit;

  swDesconectar.IsChecked := (Dm.fdqConfiguracoes.FieldByName('seg_desc_sair').AsString = 'S');

end;

procedure TfrmConfiguracoes.SalvarConfig;
var
  sValor: string;
  FieldUsuario:String;
begin
  {exit;
  if (swDesconectar.IsChecked) then
    sValor := 'True'
  else
    sValor := 'False';

  if not Assigned(Configuracoes.FIniFile) then
    Configuracoes.FIniFile := TIniFile.Create(Configuracoes.GetDiretorio + 'config.ini');

  Configuracoes.FIniFile.WriteString(Configuracoes.SectionData, 'DesconectarAoSair', sValor);
  FreeAndNil(Configuracoes.FIniFile);}

  if (Dm.fdqConfiguracoes.State in [dsInactive])Then
   Dm.OpenConfiguracoes;

  if (swDesconectar.IsChecked) then
    sValor := 'S'
  else
    sValor := 'N';

  if Dm.fdqConfiguracoes.IsEmpty then
  begin
    Dm.fdqConfiguracoes.Append;
    Dm.fdqConfiguracoes.FieldByName('configuracoes_id').AsString:=GetGUID;
  end
  else
    Dm.fdqConfiguracoes.Edit;

  Dm.fdqConfiguracoes.FieldByName(Usuario.FieldName).AsInteger:=Usuario.Id;
  Dm.fdqConfiguracoes.FieldByName('seg_desc_sair').AsString:=sValor;
  Dm.fdqConfiguracoes.FieldByName('data_insert_server').Clear;
  Dm.fdqConfiguracoes.FieldByName('enviado_server').Clear;
  Dm.fdqConfiguracoes.FieldByName('data_atualizacao').AsDateTime:=Now;

  Dm.fdqConfiguracoes.Post;
end;

end.
