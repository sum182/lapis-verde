unit ULib;

interface

uses
  IniFiles, System.IOUtils;

type
  TLib = class
    private
      FDesconectarAoSair: Boolean;
    function GetDesconectarAoSair: Boolean;
    procedure SetDesconectarAoSair(const Value: Boolean);

    public
      procedure SaveConfig;
      procedure ReadConfig;
    published
      property DesconectarAoSair: Boolean read GetDesconectarAoSair write SetDesconectarAoSair;
  end;

implementation

{ Lib }

function TLib.GetDesconectarAoSair: Boolean;
begin
  Result := FDesconectarAoSair;
end;

procedure TLib.ReadConfig;
var
  Ini : TIniFile;
begin
  try
    Ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'Config.ini'));
    FDesconectarAoSair := Ini.ReadBool('SEGURANCA', 'DesconectarAoSair', FDesconectarAoSair);
  finally
    Ini.DisposeOf;
  end;
end;

procedure TLib.SaveConfig;
var
  Ini : TIniFile;
begin
  try
    Ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'Config.ini'));
    Ini.WriteBool('SEGURANCA', 'DesconectarAoSair', FDesconectarAoSair);
  finally
    Ini.DisposeOf;
  end;

end;

procedure TLib.SetDesconectarAoSair(const Value: Boolean);
begin
  FDesconectarAoSair := Value;
end;

end.
