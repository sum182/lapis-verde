unit UntMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.ListBox,
  FMX.Ani, FMX.Objects, FMX.MultiView,
  Data.FireDACJSONReflect,

  FMX.VirtualKeyboard,
  FMX.Platform,
  {$IFDEF ANDROID}
  FMX.Helpers.Android,
  FMX.Platform.Android,
  {$ENDIF}

  {Forms do Projeeto}
  UntTitulos,
  UntUsuarios,
  ULib,
  UntPreferencias,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Edit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmMain = class(TForm)
    lytMain: TLayout;
    lstMnuMain: TListBox;
    lstgrpListas: TListBoxGroupHeader;
    lstgrpConfig: TListBoxGroupHeader;
    lstitTitulos: TListBoxItem;
    lstitUsuarios: TListBoxItem;
    lstitTitulosAlugados: TListBoxItem;
    lstitLogin: TListBoxItem;
    MultiView1: TMultiView;
    recBackground: TRectangle;
    styleAndroid: TStyleBook;
    lstPreferencias: TListBoxItem;
    ListBoxItem1: TListBoxItem;
    spbSincronizar: TSpeedButton;
    memTemporario: TFDMemTable;
    styleWindows: TStyleBook;
    styleIOS: TStyleBook;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lstitTitulosClick(Sender: TObject);
    procedure lstitUsuariosClick(Sender: TObject);
    procedure lstitLoginClick(Sender: TObject);
    procedure lstPreferenciasClick(Sender: TObject);
    procedure spbSincronizarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    procedure AtualizarTitulos(AMemoryTable: TFDMemTable);
    { Private declarations }
  public
    { Public declarations }
    FTitulos  : TfrmTitulos;
    FUsuarios : TfrmUsuarios;
    FPreferencias : TfrmPreferencias;
    FLib      : TLib;
    {$IFDEF ANDROID}
    //FLibLogin : TLogin;
    //FLogin    : TfrmLogin;
    {$ENDIF}

    procedure ShowForm(AObject: TFmxObject);
    procedure ShowBackground(AParent: TFmxObject; AOnClick: TNotifyEvent = nil);
    procedure HideBackground;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}
{$R *.iPhone4in.fmx IOS}

uses UntDM, UntModuloCliente;

{$R *.iPhone4in.fmx IOS}
{$R *.NmXhdpiPh.fmx ANDROID}

{ TfrmMain }

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {Libera total de memóriA os formulários criados}
  if Assigned(FTitulos) then
    FTitulos.DisposeOf;

  if Assigned(FLib) then
    FLib.DisposeOf;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FLib := TLib.Create;
  FLib.ReadConfig;
  {Layout Escuro Global}
  recBackground.Visible := False;
  recBackground.Align   := TAlignLayout.Contents;

  {Modifica a largura do ListBox para a mesma do formulário, pois o mesmo está como Align = None}
  lstMnuMain.Width      :=  Self.ClientWidth;
  lstMnuMain.Position.X := -Self.ClientWidth;

  //Traz para frente o layout principal evitando sobreposição de listas
  lytMain.BringToFront;

  lstitTitulosClick(Sender);
  {$IFDEF ANDROID}
    Self.StyleBook := styleAndroid;
  {$ENDIF}

  {$IFDEF IOS}
    Self.StyleBook := styleIOS;
  {$ENDIF}

  {$IFDEF MSWINDOWS}
    Self.StyleBook := styleWindows;
  {$ENDIF}
end;


procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
var
  FService : IFMXVirtualKeyboardService;

begin
  {Recebe o estado do teclado virtual}
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  {Se o botão back pressionado e o teclado virtual ativo, não faz nada}
  if Key = vkHardwareBack then
  begin
    if (FService <> nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyBoardState) then
    begin
      //Reservado, não faz nada
    end
    else
    begin
      {Verifica qual formulário está ativo e então chama o método Voltar}
      {Se NÃO estiver com a listagem de pedidos aberta}
      {$Region 'Menu'}
      if MultiView1.IsShowed then
      begin
        MultiView1.HideMaster;
        Key := 0;
      end
      {$EndRegion}

      {$Region 'Titulos'}
      else if (FTitulos.lytTitulos.Visible) and not (FTitulos.tabctrlTitulos.ActiveTab = FTitulos.tbitemLisTitulos) then
        FTitulos.PressionouVoltar
      else if (FTitulos.lytTitulos.Visible) and (FTitulos.tabctrlTitulos.ActiveTab = FTitulos.tbitemLisTitulos) then
      begin
        MessageDlg('Deseja sair do aplicativo?', TMsgDlgType.mtConfirmation,
            [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0,
            procedure (const AResult: TModalResult)
            begin
              if AResult = mrYes then
              begin
                {$IFDEF ANDROID}
                MainActivity.finish;
                {$ELSE}
                exit;
                {$ENDIF}
              end;
            end
          );
      end
      {$EndRegion}

      {$Region 'Preferências'}
      else if (Assigned(FPreferencias)) then
      begin
        MessageDlg('Deseja sair do aplicativo?', TMsgDlgType.mtConfirmation,
            [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0,
            procedure (const AResult: TModalResult)
            begin
              if AResult = mrYes then
              begin
                {$IFDEF ANDROID}
                MainActivity.finish;
                {$ELSE}
                exit;
                {$ENDIF}
              end;
            end
          );
      end;
      {$EndRegion}

      Key := 0;
    end;
  end
  {Botão Menu do Android}
  else if Key = vkMenu then
  begin
    if (FService <> nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyBoardState) then
    begin
      //Reservado, não faz nada
    end
    {O menu está sendo mostrado, apenas fecha o menu}
    else
    begin
      if MultiView1.IsShowed then
        HideBackground
      {Verifica se o Pedidos está sendo mostrado e não está na lista de pedidos, para então abrir o menu}
      else if (FTitulos.lytTitulos.Visible) then
        FTitulos.PressionouMenu;

      Key := 0;
    end;
  end;

end;

procedure TfrmMain.lstitLoginClick(Sender: TObject);
begin
  {$IFDEF ANDROID}
//  if not Assigned(FLogin) then
//    FLogin := TfrmLogin.Create(Self);
//
//  MultiView1.MasterButton := FLogin.spbBack;
//  {Forçamos o fechamento do menu no clique do item}
//  MultiView1.HideMaster;
//
//  {Adiciona o Layout de Pedidos ao Layout Principal que controla tudo}
//  lytMain.AddObject(FLogin.lytLogin);
//
//  {Deixa todos os layouts invisíveis e deixa o layout alvo visível}
//  ShowForm(FLogin.lytLogin);
  {$ENDIF}
end;

procedure TfrmMain.lstitTitulosClick(Sender: TObject);
begin
  if not Assigned(FTitulos) then
    FTitulos := TfrmTitulos.Create(Self);

  MultiView1.MasterButton := FTitulos.spbBack;
  MultiView1.HideMaster;

  {Adiciona o Layout de Pedidos ao Layout Principal que controla tudo}
  lytMain.AddObject(FTitulos.lytTitulos);

  try
    DM.qryTitulos.Active := False;
    DM.qryTitulos.Active := True;
  except on E:Exception do
    ShowMessage('Click em Títulos: ' + E.Message);
  end;
  {Deixa todos os layouts invisíveis e deixa o layout alvo visível}
  ShowForm(FTitulos.lytTitulos);
end;

procedure TfrmMain.lstitUsuariosClick(Sender: TObject);
begin
  if not Assigned(FUsuarios) then
    FUsuarios := TfrmUsuarios.Create(Self);

  MultiView1.MasterButton := FUsuarios.spbBack;
  {Forçamos o fechamento do menu no clique do item}
  MultiView1.HideMaster;

  {Adiciona o Layout de Pedidos ao Layout Principal que controla tudo}
  lytMain.AddObject(FUsuarios.lytUsuarios);

  {Deixa todos os layouts invisíveis e deixa o layout alvo visível}
  ShowForm(FUsuarios.lytUsuarios);
end;
procedure TfrmMain.lstPreferenciasClick(Sender: TObject);
begin
  if not Assigned(FPreferencias) then
    FPreferencias := TfrmPreferencias.Create(Self);

  MultiView1.MasterButton := FPreferencias.spbBack;
  MultiView1.HideMaster;

  {Adiciona o Layout de Pedidos ao Layout Principal que controla tudo}
  lytMain.AddObject(FPreferencias.lytPreferencias);

  try
    DM.qryTitulos.Active := False;
    DM.qryTitulos.Active := True;
  except on E:Exception do
    ShowMessage('Click em Títulos: ' + E.Message);
  end;
  {Deixa todos os layouts invisíveis e deixa o layout alvo visível}
  ShowForm(FPreferencias.lytPreferencias);
end;

procedure TfrmMain.HideBackground;
begin
  recBackground.AnimateFloat('opacity', 0, 0.1);
  recBackground.Visible := False;
end;

procedure TfrmMain.ShowBackground(AParent: TFmxObject; AOnClick: TNotifyEvent);
begin
  recBackground.OnClick := AOnClick;
  recBackground.Parent  := AParent;
  recBackground.BringToFront;
  recBackground.Opacity := 0;
  recBackground.Visible := True;
  recBackground.AnimateFloat('opacity', 0.5, 0.1);
end;

procedure TfrmMain.ShowForm(AObject: TFmxObject);
var
  I           : Integer;
  strFRM      : String;
  FListaForms : TStringList;
begin
  FListaForms := TStringList.Create;

  for I := 0 to Pred(Self.lytMain.Children.Count) do
  begin
    TControl(Self.lytMain.Children[I]).Visible :=
      TControl(Self.lytMain.Children[I]) = TControl(AObject);

    strFRM := UpperCase(TControl(Self.lytMain.Children[I]).Owner.Name);
    if ((strFRM <> UpperCase(frmMain.Name)) and (strFRM <> UpperCase(FTitulos.Name))) and
      not (TControl(Self.lytMain.Children[I]).Visible) then
      {Adiciona na Lista de Destruição dos Forms}
      FListaForms.Add(strFRM);
  end;

  for I := Pred(FListaForms.Count) downto 0 do
  begin
    if (Assigned(FUsuarios)) and (FListaForms[I] = UpperCase(FUsuarios.Name)) then
    begin
      FUsuarios.DisposeOf;
      FUsuarios := nil;
      FListaForms.Delete(I);
    end;
  end;

  FListaForms.DisposeOf;
end;

procedure TfrmMain.spbSincronizarClick(Sender: TObject);
var
  LDataSetList  : TFDJSONDataSets;
begin
  MessageDlg('Confirma sincronismo de dados?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0,
    procedure (const AResult: TModalResult)
    begin
      //Efetua o download da tabela TITULOS vinda do Servidor DataSnap
      LDataSetList := ModuloCliente.SrvServerMetodosClient.GetTitulos;

      //Prepara o MemoryTable temporário
      memTemporario.Active := False;

      //Fazemos um teste para verifica se realmente há DataSet no retorno da função
      Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);

      //Adicionamos o conteúdo do DataSet "baixado" ao Memory Table
      memTemporario.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));

      //Chamamos a rotina para incluir os dados recebidos na tabela Temporária, dentro da tabela no SQLite.
      AtualizarTitulos(memTemporario);

    end
  );
end;

procedure TfrmMain.AtualizarTitulos(AMemoryTable: TFDMemTable);
const
  _INSERT =
    'INSERT INTO TITULOS ' +
    '(                   ' +
    '   ID_TITULO  ,     ' +
    '   TITULO     ,     ' +
    '   SUBTITULO  ,     ' +
    '   FOTO       ,     ' +
    '   MINIATURA        ' +
    ')                   ' +
    'VALUES              ' +
    '(                   ' +
    '   :ID_TITULO ,     ' +
    '   :TITULO    ,     ' +
    '   :SUBTITULO ,     ' +
    '   :FOTO      ,     ' +
    '   :MINIATURA       ' +
    ');                  ';
var
  intNumInserts : Integer;

begin
  {Número de registros recebidos do servidor}
  intNumInserts := AMemoryTable.RecordCount;

  DM.qryAuxiliar1.Active   := False;
  DM.qryAuxiliar1.SQL.Text := _INSERT;

  {Informamos a Query Auxliar qual o número de Inserts será efetuado}
  DM.qryAuxiliar1.Params.ArraySize := intNumInserts;
  AMemoryTable.First;
  while not AMemoryTable.Eof do
  begin
    DM.qryAuxiliar1.ParamByName('ID_TITULO').AsIntegers[AMemoryTable.RecNo-1] := AMemoryTable.FieldByName('ID_TITULO').AsInteger;
    DM.qryAuxiliar1.ParamByName('TITULO')   .AsStrings [AMemoryTable.RecNo-1] := AMemoryTable.FieldByName('TITULO')   .AsString;
    DM.qryAuxiliar1.ParamByName('SUBTITULO').AsStrings [AMemoryTable.RecNo-1] := AMemoryTable.FieldByName('SUBTITULO').AsString;
    DM.qryAuxiliar1.ParamByName('FOTO')     .AsBlobs   [AMemoryTable.RecNo-1] := AMemoryTable.FieldByName('FOTO')     .AsVariant;
    DM.qryAuxiliar1.ParamByName('MINIATURA').AsBlobs   [AMemoryTable.RecNo-1] := AMemoryTable.FieldByName('MINIATURA').AsVariant;

    AMemoryTable.Next;
  end;

  {Se houver mais de um registro a ser aplicado, então chama o Execute da Quuery Auxiliar}
  if intNumInserts > 0 then
    DM.qryAuxiliar1.Execute(intNumInserts, 0);

  DM.qryAuxiliar1.Active := False;
end;

end.

