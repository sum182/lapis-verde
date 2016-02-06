program LocadoraDelphi;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  UntMain in 'UntMain.pas' {frmMain},
  UntTitulos in 'UntTitulos.pas' {frmTitulos},
  UntUsuarios in 'UntUsuarios.pas' {frmUsuarios},
  UntDM in 'UntDM.pas' {DM: TDataModule},
  UntPreferencias in 'UntPreferencias.pas' {frmPreferencias},
  ULib in 'LIB\ULib.pas',
  Proxy in 'Proxy.pas',
  UntModuloCliente in 'UntModuloCliente.pas' {ModuloCliente: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TModuloCliente, ModuloCliente);
  Application.Run;
end.
