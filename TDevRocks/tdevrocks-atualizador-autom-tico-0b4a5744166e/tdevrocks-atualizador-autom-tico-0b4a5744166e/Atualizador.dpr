program Atualizador;

uses
  Forms,
  fPrincipal in 'fPrincipal.pas' {fAtualiza};
  

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Atualizador automático de módulos';
  Application.CreateForm(TfAtualiza, fAtualiza);
  Application.Run;
end.
