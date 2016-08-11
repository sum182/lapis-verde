unit untLibDevicePortable;

interface

Uses  FMX.Forms, Data.DB, untLibGeral,smNetworkState, untResourceString,
  untTypes, System.IOUtils,FMX.Overbyte.IniFiles;

  Type
    TConfiguracoes = class
      public
        FIniFile: TIniFile;
        DesconectarAoSair:Boolean;
        procedure GetConfiguracoes;
        function GetDiretorio:String;

        const
          SectionData = 'CONFIGURACOES';

  end;

  procedure SetStyle(Formulario:TForm);
  function GetEscolaId(AlunoId:Integer=0):Integer;
  function GetSQLEscolaId(Condicao:String = 'and'):String;
  function IsModoTeste:Boolean;
  function IsTesteApp:Boolean;

  function UsuarioLogadoIsResponsavel:boolean;
  function UsuarioLogadoIsFuncionario:boolean;
  function GetApplicationName:string;
  procedure SetFlagEnviado(DataSet:TDataset;Campo:String ='enviado_server');
  procedure MsgPoupUpTeste(Mensagem:String);

  function ValidacoesRestClientBeforeExecute(ExceptionCreate:Boolean = False):Boolean;


implementation

uses untDM, untDMStyles, System.SysUtils, smGeralFMX, smMensagensFMX;


procedure SetStyle(Formulario:TForm);
begin
   if IsSysOSAndroid then
     Formulario.StyleBook := DMStyles.styleAndroid;

   if IsSysOSiOS then
     Formulario.StyleBook := DMStyles.styleIOS;

   if IsSysOSWindows then
     Formulario.StyleBook := DMStyles.styleWindows;

end;

function GetEscolaId(AlunoId:Integer=0):Integer;
begin
  if Usuario.Tipo = Funcionario then
  begin
    Result:= DM.fEscolaId;
    Exit;
  end;

  if AlunoId > 0 then
  begin
    if DM.fdqAluno.State in [dsInactive] then
      DM.fdqAluno.Open;

    DM.fdqAluno.IndexFieldNames := 'aluno_id';
    if not DM.fdqAluno.FindKey([AlunoId]) Then
      Exit;

    Result:= DM.fdqAluno.FieldByName('escola_id').AsInteger;
  end;

end;

function GetSQLEscolaId(Condicao:String = 'and'):String;
begin
 if Usuario.Tipo = Responsavel then
    Result:=  Condicao + ' escola_id in ('+
                              ' select re.escola_id from responsavel_escola re'+
                              ' where re.responsavel_id = '+ IntToStr(Usuario.Id)+
                              ' group by re.escola_id'+
                               ')';

  if Usuario.Tipo = Funcionario then
    Result:= Condicao + ' escola_id = ' + IntToStr(GetEscolaId());
end;

function UsuarioLogadoIsResponsavel:boolean;
begin
  Result:= (Usuario.Tipo = Responsavel);
end;

function UsuarioLogadoIsFuncionario:boolean;
begin
  Result:= (Usuario.Tipo = Funcionario);
end;

function GetApplicationName:string;
begin
  Result:= 'Lápis Verde';
end;

procedure SetFlagEnviado(DataSet:TDataset;Campo:String ='enviado_server');
begin
  if DataSet.State in [dsInactive] then
    DataSet.Active := True;

  DataSet.First;
  while not(DataSet.Eof) do
  begin
    DataSet.Edit;
    DataSet.FieldByName(Campo).AsString:= 'S';
    DataSet.Post;
    DataSet.Next;
  end;
end;

function IsModoTeste:Boolean;
begin
  Result:=Dm.IsModoTeste;
end;

function IsTesteApp:Boolean;
begin
  Result:=Dm.IsTesteApp;
end;


procedure MsgPoupUpTeste(Mensagem:String);
begin
  if not IsModoTeste then
    Exit;

  if IsSysOSWindows then
    Exit;

  //Exit;
  smMensagensFMX.MsgPoupUp(Mensagem);
end;

function ValidacoesRestClientBeforeExecute(ExceptionCreate:Boolean = False):Boolean;
begin
  Result:= True;

  if not smNetworkState.IsConnected then
  begin
    Result:= False;

    if ExceptionCreate then
      raise Exception.Create(rs_erro_conexao_internet);
  end;
end;
{ TConfiguracoes }

procedure TConfiguracoes.GetConfiguracoes;
var
  sValor: string;
  Diretorio: string;
begin
  DesconectarAoSair:=True;
  exit;

  try
    if not Assigned(FIniFile) then
      FIniFile := TIniFile.Create(GetDiretorio + 'config.ini');

    sValor := FIniFile.ReadString(SectionData, 'DesconectarAoSair', 'False');
    DesconectarAoSair:= (sValor = 'True');
  finally
    FIniFile.DisposeOf;
  end;

end;


function TConfiguracoes.GetDiretorio: String;
begin
  if smGeralFMX.IsSysOSAndroid or (smGeralFMX.IsSysOSiOS) then
    Result := TPath.GetDocumentsPath + PathDelim;

  if smGeralFMX.IsSysOSWindows then
    Result := Dm.AppPath + 'Arquivos\';
end;

end.
