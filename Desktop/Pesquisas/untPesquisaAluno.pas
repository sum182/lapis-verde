unit untPesquisaAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLabel, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxGroupBox,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPesquisaAluno = class(TForm)
    grbxDados: TcxGroupBox;
    grbxFiltro: TcxGroupBox;
    edtConteudo: TcxTextEdit;
    lblCampo: TcxLabel;
    lblConteudo: TcxLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    grbxRodape: TcxGroupBox;
    btnOK: TcxButton;
    btnCancelar: TcxButton;
    cmbCampo: TcxComboBox;
    fdqPesquisa: TFDQuery;
    dsPesquisa: TDataSource;
    cxGrid1DBTableView1nome: TcxGridDBColumn;
    cxGrid1DBTableView1sobrenome: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure fdqPesquisaBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure edtConteudoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cmbCampoPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fId:Integer;
    procedure OpenQuerys;
  public
    function Open:Integer;
  end;

var
  frmPesquisaAluno: TfrmPesquisaAluno;

implementation

{$R *.dfm}

uses untFuncoes, untDM;

procedure TfrmPesquisaAluno.btnCancelarClick(Sender: TObject);
begin
  fId:=0;
  Close;
end;

procedure TfrmPesquisaAluno.btnOKClick(Sender: TObject);
begin
  fId:= fdqPesquisa.FieldByName('aluno_id').AsInteger;
  Close;
end;

procedure TfrmPesquisaAluno.cmbCampoPropertiesChange(Sender: TObject);
begin
  case cmbCampo.ItemIndex of
    0: fdqPesquisa.IndexFieldNames := 'nome';
    1: fdqPesquisa.IndexFieldNames:= 'sobrenome';
  end;
end;

procedure TfrmPesquisaAluno.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btnOK.Click;
end;

procedure TfrmPesquisaAluno.edtConteudoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  fdqPesquisa.FindNearest([edtConteudo.Text]);
end;

procedure TfrmPesquisaAluno.fdqPesquisaBeforeOpen(DataSet: TDataSet);
begin
  SetIdEscolaParamBusca(fdqPesquisa);
end;

procedure TfrmPesquisaAluno.FormShow(Sender: TObject);
begin
  edtConteudo.SetFocus;
end;

function TfrmPesquisaAluno.Open: Integer;
begin
  with TfrmPesquisaAluno.Create(Application)do
  try
    OpenQuerys;
    fId:=0;
    ShowModal;
    Result:=fId;
  finally
    Free;
  end;
end;

procedure TfrmPesquisaAluno.OpenQuerys;
begin
  fdqPesquisa.Close;
  fdqPesquisa.Open;

end;

end.
