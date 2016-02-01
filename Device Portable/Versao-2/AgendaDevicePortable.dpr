program AgendaDevicePortable;

uses
  System.StartUpCopy,
  FMX.Forms,
  untTestes in 'untTestes.pas' {Form1},
  Proxy in 'Proxy.pas',
  untModuloCliente in 'untModuloCliente.pas' {ModuloCliente: TDataModule},
  smGeralFMX in 'C:\Componentes\sum182\D15\Units\FMX\smGeralFMX.pas',
  untDM in 'untDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTestes, frmTestes);
  Application.CreateForm(TModuloCliente, ModuloCliente);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
