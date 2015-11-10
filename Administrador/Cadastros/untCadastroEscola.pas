unit untCadastroEscola;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smCadFD, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ImgList, Vcl.DBActns, System.Actions, Vcl.ActnList, smCadPadrao, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  smDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxMemo, cxDBEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit,
  cxSpinEdit, dxSkinscxPCPainter, dxBarBuiltInMenu, cxCheckBox, cxPC, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, Vcl.ExtCtrls, Vcl.DBCtrls, cxGroupBox, cxDBLookupComboBox;

type
  TfrmCadastroEscola = class(TfrmCadFD)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxDBTextEdit4: TcxDBTextEdit;
    Label8: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label7: TLabel;
    Label5: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    cxDBMemo1: TcxDBMemo;
    Label9: TLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    fdqEndereco: TFDQuery;
    dsEndereco: TDataSource;
    fdqTelefone: TFDQuery;
    dsTelefone: TDataSource;
    cxGroupBox1: TcxGroupBox;
    DBNavigator1: TDBNavigator;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1escola_telefone_id: TcxGridDBColumn;
    cxGrid1DBTableView1escola_id: TcxGridDBColumn;
    cxGrid1DBTableView1telefone_tipo_id: TcxGridDBColumn;
    cxGrid1DBTableView1numero: TcxGridDBColumn;
    fdqEnderecoescola_endereco_id: TFDAutoIncField;
    fdqEnderecocep: TStringField;
    fdqEnderecologradouro: TStringField;
    fdqEndereconumero: TSmallintField;
    fdqEnderecocomplemento: TStringField;
    fdqEnderecocidade: TStringField;
    fdqEnderecobairro: TStringField;
    fdqEnderecouf: TStringField;
    fdqEnderecoescola_id: TIntegerField;
    Label2: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label6: TLabel;
    Label10: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label11: TLabel;
    Label12: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label13: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    Label14: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    Label15: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    Label16: TLabel;
    cxDBSpinEdit3: TcxDBSpinEdit;
    fdqTelefoneTipo: TFDQuery;
    dsTelefoneTipo: TDataSource;
    cxGrid1DBTableView1TelefoneTipo: TcxGridDBColumn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBNavigator2: TDBNavigator;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxDBSpinEdit2: TcxDBSpinEdit;
    cxDBMaskEdit2: TcxDBMaskEdit;
    cxDBComboBox1: TcxDBComboBox;
    procedure FormShow(Sender: TObject);
    procedure grPesquisaDblClick(Sender: TObject);
    procedure grPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
   procedure OpenQuerys;
   procedure SetPgtCtrlDefaut;
   procedure OpenFdqEndereco;
  public
    { Public declarations }
  end;

var
  frmCadastroEscola: TfrmCadastroEscola;

implementation

{$R *.dfm}

uses untDM;

{ TfrmCadastroEscola }

procedure TfrmCadastroEscola.FormShow(Sender: TObject);
begin
  inherited;
  OpenQuerys;
  SetPgtCtrlDefaut;
end;

procedure TfrmCadastroEscola.grPesquisaDblClick(Sender: TObject);
begin
  inherited;
  SetPgtCtrlDefaut;
end;

procedure TfrmCadastroEscola.grPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  SetPgtCtrlDefaut;
end;

procedure TfrmCadastroEscola.OpenFdqEndereco;
begin
  fdqEndereco.Close;
  fdqEndereco.Open;

  if fdqEndereco.RecordCount >= 1 then
    fdqEndereco.Edit
  else
    fdqEndereco.Append;
end;

procedure TfrmCadastroEscola.OpenQuerys;
begin
  OpenFdqEndereco;

  fdqTelefone.Close;
  fdqTelefone.Open;

  fdqTelefoneTipo.Close;
  fdqTelefoneTipo.Open;
end;

procedure TfrmCadastroEscola.SetPgtCtrlDefaut;
begin
  cxPageControl1.ActivePageIndex:=0;
end;

end.
