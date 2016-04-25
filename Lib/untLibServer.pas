unit untLibServer;

interface

Uses  FMX.Forms, Data.DB;

  Type
    TLogServerRequest = class
    public
      Aplicacao:String;
      UnitNome:String;
      Classe:String;
      Metodo:String;
      EscolaId:Integer;
      ResponsavelId:Integer;
      FuncionarioId:Integer;
      DataIni:TDateTime;
      DataFim:TDateTime;
      MsgError:String;
      DataError:TDateTime;

      constructor Create;
      procedure SetLogServerRequest( UnitNome,Classe,Metodo:String;
                                     EscolaId:Integer = 0;
                                     ResponsavelId:Integer=0;
                                     FuncionarioId:Integer=0
                                    );
      procedure SetDataFim;
      procedure SetError(MsgError:String);
    end;



implementation

uses System.SysUtils, smGeralFMX, smMensagensFMX, System.Variants, Vcl.Forms;

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
  Metodo: String; EscolaId, ResponsavelId,
  FuncionarioId: Integer);
begin
  self.Aplicacao:=ExtractFileName(Application.Exename);
  self.UnitNome:=UnitNome;
  self.Classe:=Classe;
  self.Metodo:=Metodo;
  self.EscolaId:=EscolaId;
  self.ResponsavelId:=ResponsavelId;
  self.FuncionarioId:=FuncionarioId;
end;

end.
