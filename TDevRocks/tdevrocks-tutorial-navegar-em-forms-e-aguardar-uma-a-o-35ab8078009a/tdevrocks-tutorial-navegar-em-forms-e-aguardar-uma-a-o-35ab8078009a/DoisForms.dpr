program DoisForms;

uses
  System.StartUpCopy,
  FMX.Forms,
  UntPrincipal in 'UntPrincipal.pas' {frmPrincipal},
  UntDialogo1 in 'UntDialogo1.pas' {frmDialogo1},
  UntCadastro in 'UntCadastro.pas' {frmCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
