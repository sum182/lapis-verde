unit untFuncoes;

interface

Uses  FMX.Forms;

  procedure SetStyle(Formulario:TForm);

implementation

uses untDM, untDMStyles;


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


end.
