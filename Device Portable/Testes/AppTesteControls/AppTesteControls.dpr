program AppTesteControls;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  untDMStyles in '..\..\DM\untDMStyles.pas' {DMStyles: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDMStyles, DMStyles);
  Application.Run;
end.
