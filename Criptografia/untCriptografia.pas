unit untCriptografia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edtValor: TEdit;
    edtValorEncrypt: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnCriptografar: TButton;
    btnDescriptografar: TButton;
    procedure btnDescriptografarClick(Sender: TObject);
    procedure btnCriptografarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses smMensagens,smCrypt;

{$R *.dfm}

procedure TForm1.btnCriptografarClick(Sender: TObject);
begin
  edtValorEncrypt.Clear;
  edtValorEncrypt.Text := Encrypt(edtValor.Text);
end;

procedure TForm1.btnDescriptografarClick(Sender: TObject);
begin
  edtValor.Clear;
  edtValor.Text := Decrypt(edtValorEncrypt.Text);
end;

end.
