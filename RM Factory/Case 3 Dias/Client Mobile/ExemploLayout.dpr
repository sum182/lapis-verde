program ExemploLayout;





uses
  System.StartUpCopy,
  FMX.Forms,
  uFraButton in 'uFraButton.pas' {FraButton: TFrame},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFrmBase in 'uFrmBase.pas' {FrmBase},
  uFrmBaseFull in 'uFrmBaseFull.pas' {FrmBaseFull},
  uFrmLogins in 'uFrmLogins.pas' {FrmLogin},
  uFrmHoteis in 'uFrmHoteis.pas' {FrmHoteis},
  uFrmMenus in 'uFrmMenus.pas' {FrmMenu},
  uFrmDays in 'uFrmDays.pas' {FrmDays},
  uFrmReservas in 'uFrmReservas.pas' {FrmReservas},
  uFrmStatus in 'uFrmStatus.pas' {FrmBaseFull1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmHoteis, FrmHoteis);
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TFrmDays, FrmDays);
  Application.CreateForm(TFrmReservas, FrmReservas);
  Application.CreateForm(TFrmBaseFull1, FrmBaseFull1);
  Application.Run;
end.
