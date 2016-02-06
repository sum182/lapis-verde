unit fPrincipal;

{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNIT_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Gauges, ComCtrls, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, IniFiles,
  Jpeg, WinInet, FileCtrl, Buttons, SqlExpr, FMTBcd, DB,
  DBClient, Provider, WideStrings;

const
  gsArqRemoto = 'Atualizacoes.xyz';
  gsArqLocal = 'Versoes.xyz';

type
  InfItem = record
    IniceMenu: integer;
    Modulo: string;
    VersaoRemota: string;
  end;

type
  TfAtualiza = class(TForm)
    idFtpAtualiza: TIdFTP;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    pnlNomeModulo: TPanel;
    lstModulos: TListView;
    lblListandoAtalizacoes: TLabel;
    Timer1: TTimer;
    lblStatus: TLabel;
    lblContador: TLabel;
    Bevel1: TBevel;
    btnAtualizar: TBitBtn;
    btnFechar: TBitBtn;
    lblNomeModulo: TLabel;
    lblTotalBytes: TLabel;
    Gauge1: TGauge;
    lblServidor: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtHost: TEdit;
    edtUser: TEdit;
    Label3: TLabel;
    edtSenha: TEdit;
    procedure Timer1Timer(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure idFtpAtualizaWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure idFtpAtualizaWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
  private
    lstArquivosDisponiveis: TStrings;
    gsPastaRemota : string;
    Tamanho_Arquivo: LongWord;
    ModuloEmAtualizacao: string;
    gsPastaLocal: string;

    sArqLocal: string;
    sArqRemota: string;
    Modulo: string;
    IniLocal: TIniFile;
    IniRemota: TIniFile;
    VersaoLocal: string;
    VersaoRemota: string;
    kbTotalDown: LongWord;

    item: InfItem;
    ModulosAbertos: TStringList;

    STime: TDateTime;
    Tempo_Medio: Double;
    Bytes_Transf: Double;
    Titulo: string;

    function Conectar: Boolean;
    procedure IncluiDownloads(AModulo, AVersaoAtual, AVersaoRemota: string; ATamanho: LongWord);
    procedure FecharModulosAbertos;
    procedure PreencherModulosAbertos;
    procedure AtualizarINIVersoes(ASecao, ANomeVersao, AVersao: string);
    procedure getInfoItem(aValue: string);
    function Explode(str, separador: string): TStringList;
  public

  end;

var
  fAtualiza: TfAtualiza;

implementation

{$R *.dfm}

procedure TfAtualiza.btnAtualizarClick(Sender: TObject);
var
  I: Integer;
  iContaAtualizacao: Integer;
  IxMod: Integer;
  sAux: string;
  iVersaoLoc: integer;
  iVersaoBas: integer;
  sql: string;
begin
  try
    Screen.Cursor := crHourGlass;
    if Conectar then
    begin
      with idFtpAtualiza do
      begin
        IniLocal := TIniFile.Create(ExtractFilePath(Application.ExeName) + gsArqLocal);
        IniRemota := TIniFile.Create(ExtractFilePath(Application.ExeName) + gsArqRemoto);
        {Re-ativa os eventos do TidFtp}
        OnWorkBegin := idFtpAtualizaWorkBegin;
        OnWork := idFtpAtualizaWork;
        try
          PreencherModulosAbertos;
          if ModulosAbertos.Count > 0 then
            if MessageBox(Handle, 'Um ou mais módulos encontram-se em execução.' + #13 +
              'Deseja fechá-los e continuar a atualização do sistema?', 'Alerta', MB_ICONQUESTION + MB_YESNO) = ID_YES then              FecharModulosAbertos
            else
            begin
              btnAtualizar.Enabled := True;
              btnFechar.Enabled := True;
              Tamanho_Arquivo := 1;
              Exit;
            end;

          IniLocal := TIniFile.Create(ExtractFilePath(Application.ExeName) + gsArqLocal);
          IniRemota := TIniFile.Create(ExtractFilePath(Application.ExeName) + gsArqRemoto);

          {Aqui verifica se há atualizações e baixa o módulo}
          iContaAtualizacao := 0;

          for I := 0 to lstModulos.Items.Count - 1 do
          begin
            if lstModulos.Items[I].Checked then
            begin
              getInfoItem(lstArquivosDisponiveis[I]);

              ModuloEmAtualizacao := item.Modulo;
              Tamanho_Arquivo := Size(gsPastaRemota + '/' + item.Modulo);

              sArqRemota := gsPastaRemota + '/' + item.Modulo;
              sArqLocal := gsPastaLocal + '\' + item.Modulo;
              Tamanho_Arquivo := Size(sArqRemota);

              Get(sArqRemota, sArqLocal, True);

              sAux := StringReplace(lstModulos.Items[i].SubItems[1], ',', '', [rfReplaceAll]);
              iVersaoLoc := StrToInt(StringReplace(sAux, '.', '', [rfReplaceAll]));

              AtualizarINIVersoes('Atualizacoes', 'Versao' + IntToStr(item.IniceMenu), item.VersaoRemota);
              lstModulos.Items[i].Caption := lstModulos.Items[i].Caption + ' ...OK  ';
              Application.ProcessMessages;
            end;
          end;

          Disconnect;

          IniLocal.Free;
          IniRemota.Free;

          DeleteFile(gsPastaLocal + gsArqRemoto);

          lblListandoAtalizacoes.Caption := 'Todos os módulos listados foram atualizados com sucesso';
          lblListandoAtalizacoes.Font.Color := clBlue;
          btnAtualizar.Enabled := False;
          btnFechar.Enabled := True;
        except on E: Exception do
          begin
            MessageDlg('Ocorreu um erro durante o processo.' + #13#13 +
              E.Message, mtError, [mbOK], 0);
            Halt;
          end;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfAtualiza.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfAtualiza.IncluiDownloads(AModulo, AVersaoAtual, AVersaoRemota: string; ATamanho: LongWord);
var
  Item: TListItem;
begin
  with lstModulos do
  begin
    Item := Items.Add;
    Item.Caption := AModulo;
    Item.SubItems.Add(AVersaoAtual);
    Item.SubItems.Add(AVersaoRemota);
    Item.SubItems.Add(FormatFloat('#,##', ATamanho) + ' Kb');
    Item.Checked := True;
  end;
end;

procedure TfAtualiza.Timer1Timer(Sender: TObject);
var
  I: Integer;
begin
  try
    lstArquivosDisponiveis := TStringList.Create;
    Screen.Cursor := crHourGlass;
    kbTotalDown := 0;
    lblListandoAtalizacoes.Caption := 'Verificando se há atualizações disponíveis';
    lblListandoAtalizacoes.Font.Color := clBlue;
    Update;

    with idFtpAtualiza do
    begin
      {Tenta conectar-se ao servidor FTP da América}
      if Conectar then
      begin
        try
          IniLocal := TIniFile.Create(ExtractFilePath(Application.ExeName) + gsArqLocal);
          IniRemota := TIniFile.Create(ExtractFilePath(Application.ExeName) + gsArqRemoto);
          lstModulos.Items.Clear;
          {Faz o download do arquivo Remoto.ini pra comparar as versões}
          Get(sArqRemota, sArqLocal, True);

          {Faz as comparações necessárias e atualiza a lista de atualizações pendentes}
          for I := 1 to 50 do
          begin
            {Verifica se a chave existe, ou seja, se o "I" atual corresponde à algum módulo no arquivo. local.ini}
            if not IniRemota.ValueExists('Atualizacoes', 'Modulo' + IntToStr(I)) then
              Continue;

            {Nome e tamanho do Módulo}
            Modulo := IniRemota.ReadString('Atualizacoes', 'Modulo' + IntToStr(I), Modulo);
            ModuloEmAtualizacao := Modulo;
            Tamanho_Arquivo := Size(gsPastaRemota + '/' + Modulo);

            VersaoLocal := IniLocal.ReadString('Atualizacoes', 'Versao' + IntToStr(I), VersaoLocal);
            VersaoRemota := IniRemota.ReadString('Atualizacoes', 'Versao' + IntToStr(I), VersaoRemota);

            {Verifica se há atualizações e então atualiza a lista de downloads}
            if ((VersaoLocal <> VersaoRemota) and (VersaoRemota > VersaoLocal)) or not
              (IniLocal.ValueExists('Atualizacoes', 'Modulo' + IntToStr(I))) then
            begin
              lstArquivosDisponiveis.Add(IntToStr(I) + ';' + Modulo + ';' + VersaoRemota + ';');
              IncluiDownloads(ModuloEmAtualizacao, VersaoLocal, VersaoRemota, Tamanho_Arquivo);
              kbTotalDown := kbTotalDown + Tamanho_Arquivo;
            end;
          end;
          idFtpAtualiza.Disconnect;

          IniLocal.Free;
          IniRemota.Free;

          if lstModulos.Items.Count > 0 then
          begin
            lstModulos.Visible := True;
            btnAtualizar.Enabled := True;
            lblTotalBytes.Caption := 'Total de bytes à baixar: ' + FormatFloat('#,##', kbTotalDown) + ' Mb';
          end
          else
          begin
            lstModulos.Visible := False;
            lblListandoAtalizacoes.Caption := 'Não há atualizações disponíveis';
            lblListandoAtalizacoes.Font.Color := clRed;
            DeleteFile(gsPastaLocal + gsArqRemoto);
          end;
        except on E: Exception do
          begin
            MessageDlg('Ocorreu um erro durante o processo.' + #13#13 + 'Mensagem original: ' + #13 +
              E.Message + #13#13 + 'O aplicativo será fechado.', mtError, [mbOK], 0);
            Halt;
          end;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    Timer1.Enabled := False;
  end;


end;


function TfAtualiza.Conectar: Boolean;
begin
  try
    with idFtpAtualiza do
    begin
      gsPastaRemota := '/modulos';
      gsPastaLocal := ExtractFilePath(Application.ExeName);
      sArqRemota := gsPastaRemota + '/' + gsArqRemoto;
      sArqLocal := gsPastaLocal + gsArqRemoto;
      Host := edtHost.Text;
      Username := edtUser.Text;
      Password := edtSenha.Text;
      Passive := True;

      if not Connected then
        Connect;

      {Desativa temporariamente os eventos do idFTP pra não mostrar o download do arquivo texto}
      OnWorkBegin := nil;
      OnWork := nil;

      try
        ChangeDir(gsPastaRemota);
      except
        Timer1.Enabled := False;
        Halt;
      end;

      List(nil);
      Result := True;
      lblServidor.Caption := 'Servidor: XYZ';
    end;
  except
    Result := False;
  end;
end;




procedure TfAtualiza.idFtpAtualizaWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  Contador, kbTotal, kbTransmitidos, kbFaltantes: Integer;
  Status_transf: string;
  TotalTempo: TDateTime;
  H, M, Sec, MS: Word;
  DLTime, Media: Double;
begin
  btnAtualizar.Enabled := False;
  btnFechar.Enabled := False;
  kbTotal := Tamanho_Arquivo div 1024;
  TotalTempo := Now - STime;
  DecodeTime(TotalTempo, H, M, Sec, MS);
  Sec := Sec + M * 60 + H * 3600;
  DLTime := Sec + MS / 1000;
  KbTransmitidos := AWorkCount div 1024;
  kbFaltantes := kbTotal - kbTransmitidos;
  lblContador.Caption := 'Transmitidos: ' + FormatFloat('##,##', kbTransmitidos) +
    ' Kb de ' + FormatFloat('##,##', kbTotal) + ' Kb' + '; Restam: ' + FormatFloat('##,##', kbFaltantes) + ' Kb';
  Media := (100 / Tamanho_Arquivo) * AWorkCount;

  if DLTime > 0 then
  begin
    Tempo_Medio := (AWorkCount / 1024) / DLTime;
    Status_Transf := Format('%2d:%2d:%2d:', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);
    Status_Transf := 'Tempo de download ' + Status_Transf;
  end;

  Status_Transf := 'Taxa de tranferência: ' +
    FormatFloat('0.00 Kb/s', Tempo_Medio) + '; ' + Status_Transf;
  lblStatus.Caption := Status_Transf;
  lblNomeModulo.Caption := ModuloEmAtualizacao;
  Application.ProcessMessages;
  Contador := Trunc(Media);
  Gauge1.Progress := (contador);
end;

procedure TfAtualiza.idFtpAtualizaWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  STime := Now;
  Tempo_Medio := 0;
  pnlNomeModulo.Visible := True;
  Update;
end;

procedure TfAtualiza.PreencherModulosAbertos;
var
  I: Integer;
begin
  IniRemota := TIniFile.Create(ExtractFilePath(Application.ExeName) + gsArqRemoto);
  ModulosAbertos.Clear;
  for I := 1 to 20 do
  begin
    {Verifica se a chave existe, ou seja, se o "I" atual corresponde à algum módulo no arquivo. local.ini}
    if not IniRemota.ValueExists('Atualizacoes', 'Modulo' + IntToStr(I)) then
      Continue;
    {Nome e tamanho do Módulo}
    Titulo := IniRemota.ReadString('Atualizacoes', 'Titulo' + IntToStr(I), Titulo);
    if FindWindow(nil, PChar(Titulo)) > 0 then
      ModulosAbertos.Add(Titulo);
  end;
  IniRemota.Free;
end;

procedure TfAtualiza.FecharModulosAbertos;
var
  I: Integer;
begin
  IniRemota := TIniFile.Create(ExtractFilePath(Application.ExeName) + gsArqRemoto);
  for I := 0 to ModulosAbertos.Count - 1 do
  begin
    if FindWindow(nil, PChar(ModulosAbertos[I])) > 0 then
      PostMessage(FindWindow(nil, PChar(ModulosAbertos[I])), WM_CLOSE, 0, 0)
    else
      continue;
  end;
  IniRemota.Free;
end;

procedure TfAtualiza.FormCreate(Sender: TObject);
begin
  ModulosAbertos := TStringList.Create;
end;

procedure TfAtualiza.AtualizarINIVersoes(ASecao, ANomeVersao, AVersao: string);
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + gsArqLocal);
  Ini.WriteString(ASecao, ANomeVersao, AVersao);
  Ini.Free;
end;

procedure TfAtualiza.getInfoItem(aValue: string);
var
  sLista: TStrings;
begin
  sLista := TStringList.Create;
  sLista := Explode(aValue, ';');

  item.IniceMenu := StrToInt(sLista[0]);
  item.Modulo := sLista[1];
  item.VersaoRemota := sLista[2];
end;

function TfAtualiza.Explode(str, separador: string): TStringList;
var
  p                 : integer;
begin
  Result := TStringList.Create;

  p := Pos(separador, str);
  while (p > 0) do
  begin
    Result.Add(Copy(str, 1, p - 1));
    Delete(str, 1, p + Length(separador) - 1);
    p := Pos(separador, str);
  end;

  if (str <> '') then
    Result.Add(str);
end;
end.

