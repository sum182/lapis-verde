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


  rs_SQLAluno =  'SELECT a.*, coalesce(a.nome,'') ||' + ' ' + '|| coalesce(a.sobrenome,'') as nome_completo'+ #13 +
                 'FROM aluno a'+ #13 +
                 'where 1=1' + #13 +
                 'and ativo = ''S'' ';



  rs_SQLTurma = 'SELECT * FROM turma t' + #13 +
                'where 1=1';

  rs_SQLTurmaAluno = 'select'+ #13 +
                     'ta.*'+ #13 +
                     'from turma_aluno ta'+ #13 +
                     'inner join turma t on (t.turma_id = ta.turma_id )'+ #13 +
                     ' where 1=1';


  rs_SQLFuncionario = 'select * from funcionario f' + #13 +
                      'where ativo = ''S'' ';





implementation
begin
end.
