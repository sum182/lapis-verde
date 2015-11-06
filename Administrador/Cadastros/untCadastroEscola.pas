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
  cxSpinEdit;

type
  TfrmCadastroEscola = class(TfrmCadFD)
    Label2: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label5: TLabel;
    cxDBSpinEdit2: TcxDBSpinEdit;
    Label6: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label7: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label8: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label9: TLabel;
    cxDBMemo1: TcxDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroEscola: TfrmCadastroEscola;

implementation

{$R *.dfm}

uses untDM;

end.
