unit Controller.Contato;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  System.JSON, Model.Contato, Data.DBXJSONReflect;

type
{$METHODINFO ON}
  TContatoController = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Contato(ObjectID: Integer): TJsonArray;
    function updateContato(Contato: TContato): TJSONValue;
    function acceptContato(Contato: TContato): TJSONValue;
    function cancelContato(ObjectID: Integer): TJSONValue;
  end;
{$METHODINFO OFF}

implementation


uses System.StrUtils, Rtti;

function TContatoController.acceptContato(Contato: TContato): TJSONValue;
var
  Obj: TJSONObject;
  Ctx: TRttiContext;
  &Type: TRttiType;
  Prop: TRttiProperty;
begin
  Obj := TJSONObject.Create(TJSONPair.Create('OP','INLCUIR'));
  Ctx := TRttiContext.Create;
  &Type := Ctx.GetType(Contato.ClassType);

  for Prop in &Type.GetProperties do
  begin
    Obj.AddPair(Prop.Name,Prop.GetValue(Contato).AsString);
  end;
  Result := Obj;
end;

function TContatoController.cancelContato(ObjectID: Integer): TJSONValue;
var
  Obj: TJsonArray;
begin
  Obj := TJsonArray.Create('OP','EXCLUIR');
  Obj.AddElement(TJSONString.Create('Excluindo o contato de ID = ' +IntToStr(ObjectID)));
  Result := Obj;
end;

function TContatoController.Contato(ObjectID: Integer): TJsonArray;
begin
  if ObjectID = 0 then
    Result := TJsonArray.Create(TJSONString.Create('Retornando todos os contatos do banco de dados'))
  else
    Result := TJsonArray.Create(TJSONString.Create('Retornando o contato de ID = ' +IntToStr(ObjectID)));
end;

function TContatoController.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TContatoController.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TContatoController.updateContato(Contato: TContato): TJSONValue;
var
  Obj: TJSONObject;
  Ctx: TRttiContext;
  &Type: TRttiType;
  Prop: TRttiProperty;
begin
  Obj := TJSONObject.Create(TJSONPair.Create('OP','ALTERAR'));
  Ctx := TRttiContext.Create;
  &Type := Ctx.GetType(Contato.ClassType);

  for Prop in &Type.GetProperties do
  begin
    Obj.AddPair(Prop.Name,Prop.GetValue(Contato).AsString);
  end;
  Result := Obj;
end;

end.
