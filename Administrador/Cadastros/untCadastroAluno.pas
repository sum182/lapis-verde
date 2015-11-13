unit untCadastroAluno;

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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxMemo, cxDBEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit,
  cxSpinEdit, Vcl.ExtCtrls, Vcl.DBCtrls, Datasnap.DBClient, Datasnap.Provider;

type
  TfrmCadastroAluno = class(TfrmCadFD)
    fdqCadaluno_id: TFDAutoIncField;
    fdqCadnome: TStringField;
    fdqCadsobrenome: TStringField;
    fdqCaddata_nascimento: TDateField;
    fdqCadsexo: TStringField;
    fdqCadrg: TStringField;
    fdqCadcpf: TLargeintField;
    fdqCadativo: TStringField;
    fdqCadinformacoes_gerais: TMemoField;
    fdqCadescola_id: TIntegerField;
    Label2: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label5: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label6: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label7: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label8: TLabel;
    cxDBSpinEdit2: TcxDBSpinEdit;
    Label9: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label10: TLabel;
    cxDBMemo1: TcxDBMemo;
    Label11: TLabel;
    cxDBSpinEdit3: TcxDBSpinEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dsFoto: TDataSource;
    fdqFoto: TFDQuery;
    dspCad: TDataSetProvider;
    cdsCad: TClientDataSet;
    cdsCadaluno_id: TAutoIncField;
    cdsCadnome: TStringField;
    cdsCadsobrenome: TStringField;
    cdsCaddata_nascimento: TDateField;
    cdsCadsexo: TStringField;
    cdsCadrg: TStringField;
    cdsCadcpf: TLargeintField;
    cdsCadativo: TStringField;
    cdsCadinformacoes_gerais: TMemoField;
    cdsCadescola_id: TIntegerField;
    dspFoto: TDataSetProvider;
    cdsFoto: TClientDataSet;
    cdsFotoaluno_foto_id: TAutoIncField;
    cdsFotoaluno_id: TIntegerField;
    cdsFotofoto: TBlobField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure AcApplyUpdateExecute(Sender: TObject);
  private
    procedure OpenQuerys;
  public
    { Public declarations }
  end;

var
  frmCadastroAluno: TfrmCadastroAluno;

implementation

{$R *.dfm}

uses untDM, smGeral;

procedure TfrmCadastroAluno.AcApplyUpdateExecute(Sender: TObject);
begin
  inherited;
  ApplyUpdates(cdsFoto);
end;

procedure TfrmCadastroAluno.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  frmCadastroAluno:= nil;
end;

procedure TfrmCadastroAluno.FormShow(Sender: TObject);
begin
  inherited;
  OpenQuerys;
end;

procedure TfrmCadastroAluno.OpenQuerys;
begin
  cdsFoto.Close;
  cdsFoto.CreateDataSet;
end;

end.
