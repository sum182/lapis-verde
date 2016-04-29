unit untLibServer;

interface

Uses  FMX.Forms, Data.DB, untLibGeral;

  Type
    TLogServerRequest = class
    public
      Aplicacao:String;
      UnitNome:String;
      Classe:String;
      Metodo:String;
      EscolaId:Integer;
      Usuario:TUsuario;
      DataIni:TDateTime;
      DataFim:TDateTime;
      MsgError:String;
      DataError:TDateTime;

      constructor Create;
      procedure SetLogServerRequest( UnitNome,Classe,Metodo:String;
                                     EscolaId:Integer = 0;
                                     Usuario:TUsuario = nil
                                    );
      procedure SetDataFim;
      procedure SetError(MsgError:String);
    end;



implementation

uses System.SysUtils, smGeralFMX, smMensagensFMX, System.Variants

     {$IF DEFINED(MSWINDOWS)}
     , Vcl.Forms
     {$ENDIF}

     ;

{ TLogServer }

constructor TLogServerRequest.Create;
begin
  inherited Create;
  self.DataIni:=Now;
  self.DataError:= 0;
end;

procedure TLogServerRequest.SetDataFim;
begin
  self.DataFim:=Now;
end;

procedure TLogServerRequest.SetError(MsgError: String);
begin
  self.MsgError:= MsgError;
  DataError:= Now;
end;


procedure TLogServerRequest.SetLogServerRequest(UnitNome, Classe,
  Metodo: String; EscolaId: Integer; Usuario: TUsuario);
begin
  {$IF DEFINED(MSWINDOWS)}
  self.Aplicacao:=ExtractFileName(Application.Exename);
  {$ENDIF}

  self.UnitNome:=UnitNome;
  self.Classe:=Classe;
  self.Metodo:=Metodo;
  self.EscolaId:=EscolaId;

  if not Assigned(Usuario)then
    Usuario:= TUsuario.Create;

  self.Usuario:=Usuario;
end;

end.
