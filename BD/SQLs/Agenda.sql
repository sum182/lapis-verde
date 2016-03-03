SELECT * FROM agendadb.aluno;


select 
  ag.*
from agenda ag
inner join agenda_aluno al on (ag.agenda_id = al.agenda_id) 
where 1=1
and agenda_id >= :agenda_id
and escola_id = :escola_id
and aluno_id = :aluno_idagenda_turma