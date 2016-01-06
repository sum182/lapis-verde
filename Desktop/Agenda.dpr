program Agenda;

uses
  Vcl.Forms,
  untMenuPrincipal in 'untMenuPrincipal.pas' {frmMenuPrincipal},
  smCad in 'C:\Componentes\Sum182\D15\Forms\smCad.pas' {frmCad},
  smCadFD in 'C:\Componentes\Sum182\D15\Forms\smCadFD.pas' {frmCadFD},
  smGeral in 'C:\Componentes\Sum182\D15\Units\smGeral.pas',
  smDB in 'C:\Componentes\Sum182\D15\Units\smDB.pas',
  untDM in 'untDM.pas' {DM: TDataModule},
  smMensagens in 'C:\Componentes\sum182\D15\Units\smMensagens.pas',
  untCadastroAluno in 'Cadastros\untCadastroAluno.pas' {frmCadastroAluno},
  untCadastroEscola in 'Cadastros\untCadastroEscola.pas' {frmCadastroEscola},
  untCadastroFuncionario in 'Cadastros\untCadastroFuncionario.pas' {frmCadastroFuncionario},
  untCadastroFuncionarioTipo in 'Cadastros\untCadastroFuncionarioTipo.pas' {frmCadastroFuncionarioTipo},
  untCadastroResponsavel in 'Cadastros\untCadastroResponsavel.pas' {frmCadastroResponsavel},
  untCadastroResponsavelTipo in 'Cadastros\untCadastroResponsavelTipo.pas' {frmCadastroResponsavelTipo},
  untCadastroTelefoneTipo in 'Cadastros\untCadastroTelefoneTipo.pas' {frmCadastroTelefoneTipo},
  smDBFireDac in 'C:\Componentes\sum182\D15\Units\smDBFireDac.pas',
  untFuncoes in 'untFuncoes.pas',
  untPesquisaAluno in 'Pesquisas\untPesquisaAluno.pas' {frmPesquisaAluno},
  untPesquisaResponsavel in 'Pesquisas\untPesquisaResponsavel.pas' {frmPesquisaResponsavel},
  untCadastroPeriodoTipo in 'Cadastros\untCadastroPeriodoTipo.pas' {frmCadastroPeriodoTipo},
  untCadastroTurma in 'Cadastros\untCadastroTurma.pas' {frmCadastroTurma},
  untAgendaEnvio in 'untAgendaEnvio.pas' {frmAgendaEnvio},
  smCrypt in 'C:\Componentes\sum182\D15\Units\smCrypt.pas',
  RC6Enc in 'C:\Componentes\sum182\D15\Units\RC6Enc.pas';

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
