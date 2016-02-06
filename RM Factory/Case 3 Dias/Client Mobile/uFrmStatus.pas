unit uFrmStatus;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBaseFull, FMX.Layouts, FMX.Effects, FMX.Controls.Presentation, FMX.Objects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TFrmBaseFull1 = class(TFrmBaseFull)
    ltwStatus: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBaseFull1: TFrmBaseFull1;

implementation

{$R *.fmx}

end.
