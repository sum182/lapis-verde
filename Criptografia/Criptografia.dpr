program Criptografia;

uses
  Vcl.Forms,
  untCriptografia in 'untCriptografia.pas' {Form1},
  smCrypt in 'C:\Componentes\sum182\D15\Units\smCrypt.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
