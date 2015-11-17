unit untCadastroResponsavel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smCadFD, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Vcl.ImgList, Vcl.DBActns, System.Actions, Vcl.ActnList, smCadPadrao, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  smDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxMemo, cxDBEdit, cxImageComboBox, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox, cxMaskEdit, cxTextEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ExtCtrls, Vcl.DBCtrls, cxGroupBox;

type
  TfrmCadastroResponsavel = class(TfrmCadFD)
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label7: TLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxDBMaskEdit2: TcxDBMaskEdit;
    Label8: TLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label5: TLabel;
    cxDBImageComboBox1: TcxDBImageComboBox;
    Label6: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label2: TLabel;
    cxDBMemo1: TcxDBMemo;
    Label9: TLabel;
    fdqResponsavelTipo: TFDQuery;
    dsResponsavelTipo: TDataSource;
    fdqCadresponsavel_id: TFDAutoIncField;
    fdqCadnome: TStringField;
    fdqCadsobrenome: TStringField;
    fdqCadsexo: TStringField;
    fdqCadrg: TStringField;
    fdqCadcpf: TLargeintField;
    fdqCadativo: TStringField;
    fdqCademail: TStringField;
    fdqCadinformacoes_gerais: TMemoField;
    fdqCadescola_id: TIntegerField;
    fdqCadresponsavel_tipo_id: TSmallintField;
    fdqTelefoneTipo: TFDQuery;
    dsTelefoneTipo: TDataSource;
    dsTelefone: TDataSource;
    fdqTelefone: TFDQuery;
    cxGroupBox1: TcxGroupBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBNavigator1: TDBNavigator;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1escola_telefone_id: TcxGridDBColumn;
    cxGrid1DBTableView1escola_id: TcxGridDBColumn;
    cxGrid1DBTableView1telefone_tipo_id: TcxGridDBColumn;
    cxGrid1DBTableView1numero: TcxGridDBColumn;
    cxGrid1DBTableView1TelefoneTipo: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure AcNovoExecute(Sender: TObject);
    procedure fdqCadNewRecord(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure OpenQuerys;
  public
    { Public declarations }
  end;

var
  frmCadastroResponsavel: TfrmCadastroResponsavel;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmCadastroResponsavel.AcNovoExecute(Sender: TObject);
begin
  inherited;
  fdqCadnome.FocusControl;
end;

procedure TfrmCadastroResponsavel.fdqCadNewRecord(DataSet: TDataSet);
begin
  inherited;
  fdqCadativo.AsString:= 'S';
end;

procedure TfrmCadastroResponsavel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmCadastroResponsavel:=nil;
end;

procedure TfrmCadastroResponsavel.FormShow(Sender: TObject);
begin
  inherited;
  OpenQuerys;
end;

procedure TfrmCadastroResponsavel.OpenQuerys;
begin
  fdqResponsavelTipo.Close;
  fdqResponsavelTipo.Open;

  fdqTelefone.Close;
  fdqTelefone.Open;

  fdqTelefoneTipo.Close;
  fdqTelefoneTipo.Open;
end;

end.
