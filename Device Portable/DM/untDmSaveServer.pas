unit untDmSaveServer;

interface

uses
  System.SysUtils, System.Classes;

type
  TDmSaveServer = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmSaveServer: TDmSaveServer;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untDM;

{$R *.dfm}

end.
