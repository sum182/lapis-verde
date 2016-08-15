unit untSQLs;

interface

uses
  System.SysUtils;

resourcestring
  rs_SQLResposavel = 'select * from responsavel r' + #13 +
                     'inner join responsavel_escola re on (r.responsavel_id = re.responsavel_id)' + #13 +
                     'where re.ativo = ''S'' ';

  rs_SQLResposavelEscola =  'select re.*' + #13 +
                            'from responsavel_escola re'+ #13 +
                            'where re.ativo = ''S'' ';


  rs_SQLResposavelAluno =   'select ra.*' + #13 +
                            'from responsavel_aluno ra' + #13 +
                            'inner join responsavel_escola re on (ra.responsavel_id = re.responsavel_id)'+ #13 +
                            'where re.ativo = ''S'' ';


  rs_SQLResposavelTelefone =  'select rt.*' + #13 +
                              'from responsavel_telefone rt' + #13 +
                              'inner join responsavel_escola re on (rt.responsavel_id = re.responsavel_id)' + #13 +
                                                     'where re.ativo = ''S'' ';





implementation
begin
end.
