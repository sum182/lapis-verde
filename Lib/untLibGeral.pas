unit untLibGeral;

interface

Uses Data.DB;


  Type
    TUsuarioTipo = (Funcionario,Responsavel);

    TUsuario = class
    public
      Id:Integer;
      Tipo:TUsuarioTipo;
    end;


implementation

uses System.SysUtils, smGeralFMX, System.Variants;

{ TUsuario }


end.
