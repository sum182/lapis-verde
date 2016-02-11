unit untFuncoes;

interface

Uses  FMX.Forms;

  procedure SetStyle(Formulario:TForm);

implementation

uses untDM;


procedure SetStyle(Formulario:TForm);
begin
   {$IFDEF ANDROID}
    Formulario.StyleBook := DM.styleAndroid;
  {$ENDIF}

  {$IFDEF IOS}
    Formulario.StyleBook := DM.styleIOS;
  {$ENDIF}

  {$IFDEF MSWINDOWS}
    Formulario.StyleBook := DM.styleWindows;
  {$ENDIF}
end;


end.
