unit Model.Contato;

interface

type
  TContato = class
  private
    FEmail: String;
    FNome: String;
    FTelefone: String;
    procedure SetEmail(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetTelefone(const Value: String);
  published
    property Nome: String read FNome write SetNome;
    property Email: String read FEmail write SetEmail;
    property Telefone: String read FTelefone write SetTelefone;
  end;

implementation

{ TContato }
procedure TContato.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TContato.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TContato.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
