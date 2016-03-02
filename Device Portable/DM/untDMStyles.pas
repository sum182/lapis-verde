unit untDMStyles;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls;

type
  TDMStyles = class(TDataModule)
    styleAndroidTDevRocks: TStyleBook;
    styleWindows: TStyleBook;
    styleIOS: TStyleBook;
    styleAndroid: TStyleBook;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMStyles: TDMStyles;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
