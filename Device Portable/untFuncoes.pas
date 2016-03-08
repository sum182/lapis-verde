unit untFuncoes;

interface

Uses  FMX.Forms;

  procedure SetStyle(Formulario:TForm);
  function GetEscolaId:Integer;
  function GetFuncionarioId:Integer;
  function GetResponsavelId:Integer;
  function UsuarioLogadoIsResponsavel:boolean;
  function UsuarioLogadoIsFuncionario:boolean;


implementation

uses untDM, untDMStyles, System.SysUtils;


procedure SetStyle(Formulario:TForm);
begin
   {$IFDEF ANDROID}
    Formulario.StyleBook := DMStyles.styleAndroid;
  {$ENDIF}

  {$IFDEF IOS}
    Formulario.StyleBook := DMStyles.styleIOS;
  {$ENDIF}

  {$IFDEF MSWINDOWS}
    Formulario.StyleBook := DMStyles.styleWindows;
  {$ENDIF}
end;

function GetEscolaId:Integer;
begin
  Result:= DM.fEscolaId;
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



end.
