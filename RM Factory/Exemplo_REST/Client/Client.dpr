program Client;

uses
  Vcl.Forms,
  uFrmCliente in 'uFrmCliente.pas' {Form2},
  Model.Contato in '..\Model.Contato.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
