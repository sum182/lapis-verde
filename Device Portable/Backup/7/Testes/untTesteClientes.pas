unit untTesteClientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, smFrmBase, FMX.Layouts,smFrmBaseToolBar,
  FMX.Controls.Presentation;

type
  TfrmTesteClientes = class(TfrmBaseToolBar)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesteClientes: TfrmTesteClientes;

implementation

{$R *.fmx}

uses untDMStyles;

end.
