unit untFuncoes;

interface

Uses  FMX.Forms, Data.DB, untLibGeral;

  procedure SetStyle(Formulario:TForm);
  function GetUsuario:TUsuario;
  function GetEscolaId:Integer;
  function GetFuncionarioId:Integer;
  function GetResponsavelId:Integer;
  function IsModoTeste:Boolean;
  function UsuarioLogadoIsResponsavel:boolean;
  function UsuarioLogadoIsFuncionario:boolean;
  function GetApplicationName:string;
  procedure SetFlagEnviado(DataSet:TDataset;Campo:String ='enviado_server');
  procedure MsgPoupUpTeste(Mensagem:String);


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

function GetEscolaId:Integer;
begin
  Result:= DM.fEscolaId;
end;

function GetUsuario:TUsuario;
var
  UserNew:TUsuario;
begin
  UserNew:=TUsuario.Create;
  UserNew.Tipo:=Dm.Usuario.Tipo;
  UserNew.Id:=Dm.Usuario.Id;
  Result:= UserNew;
end;

function GetFuncionarioId:Integer;
begin
  Result:= DM.fFuncionarioId;
end;

function GetResponsavelId:Integer;
begin
  Result:= DM.fResponsavelId;
end;

function UsuarioLogadoIsResponsavel:boolean;
begin
  Result:= DM.fUsuarioLogadoIsResponsavel;
end;

function UsuarioLogadoIsFuncionario:boolean;
begin
  Result:= DM.fUsuarioLogadoIsFuncionario;
end;

function GetApplicationName:string;
begin
  Result:= 'Agenda Bee';
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

procedure MsgPoupUpTeste(Mensagem:String);
begin
  if not IsModoTeste then
    Exit;

  if IsSysOSWindows then
    Exit;

  smMensagensFMX.MsgPoupUp(Mensagem);
end;
end.
