unit uFrmCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt;

type
  TForm2 = class(TForm)
    EdtNome: TLabeledEdit;
    EdtEmail: TLabeledEdit;
    EdtTelefone: TLabeledEdit;
    BtnNome: TButton;
    BtnExcluir: TButton;
    BtnAlterar: TButton;
    BtnConsultar: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Memo1: TMemo;
    EdtCodigo: TLabeledEdit;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    procedure BtnNomeClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ResetRESTConnection;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

const
  BASE_URL: String = 'http://localhost:8080/datasnap/rest/TContatoController';

implementation

{$R *.dfm}

uses Model.Contato, Data.DBXJSONReflect, System.JSON, REST.Types;

procedure TForm2.BtnNomeClick(Sender: TObject);
var
  Contato: TContato;
  jObj: TJSONValue;
begin
  Contato := TContato.Create;
  Contato.Nome := EdtNome.Text;
  Contato.Email := EdtEmail.Text;
  Contato.Telefone := EdtTelefone.Text;

  jObj := TJSONMarshal.Create.Marshal(Contato);

  ResetRESTConnection;
  RESTRequest1.Resource := '/Contato';
  RESTRequest1.Method := TRESTRequestMethod.rmPUT;
  RESTRequest1.Body.Add(jObj.ToString,ContentTypeFromString('application/json'));
  RESTRequest1.Execute;
end;

procedure TForm2.BtnConsultarClick(Sender: TObject);
begin
  ResetRESTConnection;
  RESTRequest1.Resource := '/Contato/{ObjectID}';
  RESTRequest1.Method := TRESTRequestMethod.rmGET;
  RESTRequest1.Params.AddUrlSegment('ObjectID',EdtCodigo.Text);
  RESTRequest1.Execute;
end;

procedure TForm2.BtnExcluirClick(Sender: TObject);
begin
  ResetRESTConnection;
  RESTRequest1.Resource := '/Contato/{ObjectID}';
  RESTRequest1.Method := TRESTRequestMethod.rmDELETE;
  RESTRequest1.Params.AddUrlSegment('ObjectID',EdtCodigo.Text);
  RESTRequest1.Execute;
end;

procedure TForm2.BtnAlterarClick(Sender: TObject);
var
  Contato: TContato;
  jObj: TJSONValue;
begin
  Contato := TContato.Create;
  Contato.Nome := EdtNome.Text;
  Contato.Email := EdtEmail.Text;
  Contato.Telefone := EdtTelefone.Text;

  jObj := TJSONMarshal.Create.Marshal(Contato);

  ResetRESTConnection;
  RESTRequest1.Resource := '/Contato';
  RESTRequest1.Method := TRESTRequestMethod.rmPOST;
  RESTRequest1.Body.Add(jObj.ToString, ContentTypeFromString('application/json'));
  RESTRequest1.Execute;
end;

procedure TForm2.ResetRESTConnection;
begin
  RESTClient1.ResetToDefaults;
  RESTRequest1.ResetToDefaults;
  RESTResponse1.ResetToDefaults;
  RESTClient1.BaseURL := BASE_URL;
  Memo1.Clear;
end;

end.
