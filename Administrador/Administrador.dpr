program Administrador;

uses
  Vcl.Forms,
  untMenuPrincipal in 'untMenuPrincipal.pas' {frmMenuPrincipal},
  smCad in 'C:\Componentes\Sum182\D15\Forms\smCad.pas' {frmCad},
  smCadFD in 'C:\Componentes\Sum182\D15\Forms\smCadFD.pas' {frmCadFD},
  smGeral in 'C:\Componentes\Sum182\D15\Units\smGeral.pas',
  smDB in 'C:\Componentes\Sum182\D15\Units\smDB.pas',
  untDM in 'untDM.pas' {DM: TDataModule},
  untSobre in 'untSobre.pas' {FrmSobre},
  untCadastroTelefoneTipo in 'Cadastros\untCadastroTelefoneTipo.pas' {frmCadastroTelefoneTipo},
  untCadastroEscola in 'Cadastros\untCadastroEscola.pas' {frmCadastroEscola},
  smMensagens in 'C:\Componentes\sum182\D15\Units\smMensagens.pas',
  untCadastroAluno in 'Cadastros\untCadastroAluno.pas' {frmCadastroAluno},
  f_principal in 'Testes\f_principal.pas' {frm_principal},
  untTeste in 'Testes\untTeste.pas' {frmTeste};

{$R *.res}

begin
 { Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;  }


  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := DM.GetNomeAplicacao;
  Application.CreateForm(TDM, DM);
  frmMenuPrincipal.Caption:= Dm.GetNomeAplicacao;

  {Application.CreateForm(TfrmLogin, frmLogin);
  if frmLogin.ShowModal = mrOk then
  begin
    FreeAndNil(frmLogin); // Libera o form de Login da memória
    Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
    Application.Run;
  end
  else
  begin
    FreeAndNil(frmLogin);
    Application.Terminate;
  end;}

  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;

end.
