unit untMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, cxPC, dxRibbonSkins, dxSkinsdxRibbonPainter,
  dxSkinsdxBarPainter, dxBar, cxClasses, dxRibbon, Vcl.ImgList,
  dxStatusBar, dxRibbonStatusBar, IniFiles, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxBarBuiltInMenu, dxRibbonCustomizationForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls, cxCheckGroup,
  cxBarEditItem, dxBarExtItems;

type
  TfrmMenuPrincipal = class(TForm)
    pmAbas: TPopupMenu;
    FecharAba1: TMenuItem;
    FecharTodasAbas1: TMenuItem;
    pgPrinc: TcxPageControl;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    cxImageList1: TcxImageList;
    dxRibbon1: TdxRibbon;
    dxRibbon1TabCadastros: TdxRibbonTab;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar2: TdxBar;
    dxBarManager1Bar3: TdxBar;
    dxBarManager1Bar5: TdxBar;
    dxBarManager1Bar6: TdxBar;
    dxBarManager1Bar7: TdxBar;
    dxBarManager1Bar10: TdxBar;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarButton5: TdxBarButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarButton8: TdxBarButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    dxBarGroup1: TdxBarGroup;
    dxBarGroup2: TdxBarGroup;
    dxBarGroup3: TdxBarGroup;
    dxBarButton9: TdxBarButton;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarLargeButton20: TdxBarLargeButton;
    dxBarLargeButton21: TdxBarLargeButton;
    dxBarLargeButton22: TdxBarLargeButton;
    dxBarButton10: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    mnCadTelefoneTipo: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarLargeButton23: TdxBarLargeButton;
    dxBarLargeButton24: TdxBarLargeButton;
    dxBarStatic1: TdxBarStatic;
    dxBarStatic2: TdxBarStatic;
    cxBarEditItem1: TcxBarEditItem;
    dxBarLargeButton25: TdxBarLargeButton;
    dxBarStatic3: TdxBarStatic;
    dxBarLargeButton26: TdxBarLargeButton;
    dxBarLargeButton27: TdxBarLargeButton;
    dxBarLargeButton28: TdxBarLargeButton;
    dxBarManager1Bar8: TdxBar;
    dxBarLargeButton29: TdxBarLargeButton;
    dxBarLargeButton30: TdxBarLargeButton;
    dxBarLargeButton31: TdxBarLargeButton;
    dxBarLargeButton32: TdxBarLargeButton;
    dxRibbon1TabAdministrador: TdxRibbonTab;
    dxBarManager1Bar4: TdxBar;
    dxBarLargeButton33: TdxBarLargeButton;
    dxRibbon1TabAgenda: TdxRibbonTab;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton34: TdxBarLargeButton;
    dxBarLargeButton35: TdxBarLargeButton;
    dxBarLargeButton36: TdxBarLargeButton;
    dxBarLargeButton37: TdxBarLargeButton;
    procedure pgPrincCanClose(Sender: TObject; var ACanClose: Boolean);
    procedure FecharAba1Click(Sender: TObject);
    procedure FecharTodasAbas1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarLargeButton23Click(Sender: TObject);
    procedure dxBarLargeButton30Click(Sender: TObject);
    procedure dxBarLargeButton33Click(Sender: TObject);
    procedure dxBarLargeButton34Click(Sender: TObject);
    procedure dxBarLargeButton35Click(Sender: TObject);
    procedure dxBarLargeButton36Click(Sender: TObject);
    procedure dxBarLargeButton37Click(Sender: TObject);
  private
    procedure ActivePg(Classe: TFormClass);
    procedure OpenForm(Classe: TFormClass; var Form;
      sConstruct: Boolean = False);
    procedure CloseForm;
    procedure SetStatusBar;
  public
    { Public declarations }
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.dfm}

uses
  smGeral, smMensagens,untDM, untCadastroTelefoneTipo, untCadastroEscola, untCadastroAluno, untCadastroFuncionario,
  untCadastroFuncionarioTipo, untCadastroResponsavel, untCadastroResponsavelTipo, untFuncoes;

procedure TfrmMenuPrincipal.ActivePg(Classe: TFormClass);
var
  i: Integer;
  Form: String;
begin
  Form := Classe.ClassName;

  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TcxTabSheet) then
      if (Components[i]).Name = 'TS' + Form then
        pgPrinc.ActivePageIndex := (Components[i] as TcxTabSheet).TabIndex;

end;

procedure TfrmMenuPrincipal.CloseForm;
var
  TbSheet: TcxTabSheet;
  sForm: String;
  frmClass: TFormClass;
  Form: TForm;
  i: Byte;
begin
  try
    TbSheet := pgPrinc.ActivePage;
    if Assigned(TbSheet) Then
    begin
      sForm := Copy(TbSheet.Name, 3, length(TbSheet.Name));
      frmClass := TFormClass(FindClass(sForm));

      for i := 0 to Screen.FormCount - 1 do
        if Screen.Forms[i] is frmClass then
        begin
          Form := Screen.Forms[i];

          if not(Form.CloseQuery) then
            Exit;

          Form.Close;
          Form.Free;
          Break;
        end;

      UnRegisterClass(frmClass);
      TbSheet.Free;

    end;
  except
    on EAbort do
      Exit
    else
      Msg('Erro ao fechar tela.');
  end;
end;

procedure TfrmMenuPrincipal.SetStatusBar;
begin
  dxRibbonStatusBar1.Panels[2].Text := 'Conexão: ' + GetPahConexao;
  dxRibbonStatusBar1.Panels[1].Text := 'Versão: ' + smGeral.GetVersion(Application.Exename);
  dxRibbonStatusBar1.Panels[0].Text := 'Usuário: ' + GetNomeUsuario;
end;



procedure TfrmMenuPrincipal.dxBarLargeButton23Click(Sender: TObject);
begin
  OpenForm(TfrmCadastroEscola,frmCadastroEscola);
end;

procedure TfrmMenuPrincipal.dxBarLargeButton30Click(Sender: TObject);
begin
  OpenForm(TfrmCadastroAluno,frmCadastroAluno);
end;

procedure TfrmMenuPrincipal.dxBarLargeButton33Click(Sender: TObject);
begin
  OpenForm(TfrmCadastroTelefoneTipo,frmCadastroTelefoneTipo);
end;

procedure TfrmMenuPrincipal.dxBarLargeButton34Click(Sender: TObject);
begin
  OpenForm(TfrmCadastroFuncionario,frmCadastroFuncionario);
end;

procedure TfrmMenuPrincipal.dxBarLargeButton35Click(Sender: TObject);
begin
  OpenForm(TfrmCadastroResponsavel,frmCadastroResponsavel);
end;

procedure TfrmMenuPrincipal.dxBarLargeButton36Click(Sender: TObject);
begin
  OpenForm(TfrmCadastroFuncionarioTipo,frmCadastroFuncionarioTipo);
end;

procedure TfrmMenuPrincipal.dxBarLargeButton37Click(Sender: TObject);
begin
  OpenForm(TfrmCadastroResponsavelTipo,frmCadastroResponsavelTipo);
end;

procedure TfrmMenuPrincipal.FecharAba1Click(Sender: TObject);
begin
  CloseForm;
end;

procedure TfrmMenuPrincipal.FecharTodasAbas1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := pgPrinc.PageCount - 1 downto 0 do
  begin
    pgPrinc.ActivePageIndex := i;
    CloseForm;
  end;
end;

procedure TfrmMenuPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FecharTodasAbas1Click(self);
end;

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
begin
  SetStatusBar;
end;

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
begin
  dxRibbon1.ActiveTab:= dxRibbon1TabAgenda;
end;

procedure TfrmMenuPrincipal.OpenForm(Classe: TFormClass; var Form;
  sConstruct: Boolean);
var
  TbSheet: TcxTabSheet;
begin
  try
    if (TForm(Form) = nil) or (sConstruct) then
    begin
      RegisterClass(Classe);

      TbSheet := TcxTabSheet.Create(self);
      TbSheet.Parent := pgPrinc;

      if not sConstruct then
        TForm(Form) := Classe.Create(self);

      with TForm(Form) do
        try
          Parent := TbSheet;
          borderStyle := bsNone;
          align := alClient;
          Show;
          SetFocus;
        except
        end;

      SetLabelsTransparent(TForm(Form));
      TbSheet.Name := 'TS' + TForm(Form).ClassName;
      TbSheet.Caption := TForm(Form).Caption;
      pgPrinc.ActivePage := TbSheet;
    end
    else
      ActivePg(Classe);

  except
    Msg('Erro ao abrir tela');
  end;

end;

procedure TfrmMenuPrincipal.pgPrincCanClose(Sender: TObject;
  var ACanClose: Boolean);
begin
  ACanClose := False;
  CloseForm;
end;

end.
