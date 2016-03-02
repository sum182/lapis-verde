unit untTesteString2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit,REST.Types;

type
  TfrmTesteString2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesteString2: TfrmTesteString2;

implementation

{$R *.fmx}

uses untDM;

procedure TfrmTesteString2.Button1Click(Sender: TObject);
begin
  DM.ResetRESTConnection;
  DM.RESTRequest1.Resource := '/GetAlunos';
  DM.RESTRequest1.Method := TRESTRequestMethod.rmGET;
  //DM.RESTRequest1.Params.AddUrlSegment('ObjectID',Edit1.Text);
  DM.RESTRequest1.Execute;
  Edit2.Text:= dm.RESTResponse1.Content;

exit;

  DM.ResetRESTConnection;
  DM.RESTRequest1.Resource := '/ReverseString/{ObjectID}';
  DM.RESTRequest1.Method := TRESTRequestMethod.rmGET;
  DM.RESTRequest1.Params.AddUrlSegment('ObjectID',Edit1.Text);
  DM.RESTRequest1.Execute;
  Edit2.Text:= dm.RESTResponse1.Content;
end;

end.
