unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ExtCtrls, FGX.FlipView;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    CalloutPanel1: TCalloutPanel;
    Expander1: TExpander;
    PlotGrid1: TPlotGrid;
    fgFlipView1: TfgFlipView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses untDMStyles;

end.
