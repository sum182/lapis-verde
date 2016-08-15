unit untSQLs;

interface

uses
  System.SysUtils;

resourcestring
  rs_SQLResposavel = 'select * from responsavel r' + #13 +
                     'inner join responsavel_escola re on (r.responsavel_id = re.responsavel_id)' + #13 +
                     'where re.ativo = ' + QuoTedStr('S') + '';

implementation
begin
end.
