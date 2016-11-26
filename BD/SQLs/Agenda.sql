SELECT * FROM aluno;

select * from agenda 

select * from agenda_aluno 

select  *from agenda_turma 

select * from turma
where funcionario_id = 16


select * from funcionario
where funcionario_id = 16

select * from turma_aluno ta
where ta.aluno_id = 19


and ag.escola_id = :escola_id
and ag.data_insert_server between :dt_ini and :dt_fim



--agenda x aluno
select 
  ag.*
from agenda ag
inner join agenda_aluno al on (ag.agenda_id = al.agenda_id) 
where 1=1
and ag.escola_id = 1
and al.aluno_id = 
order by ag.data_insert_local 






inner join turma_aluno ta on (ta.aluno_id = al.aluno_id) 
inner join agenda_aluno al on (ag.agenda_id = al.agenda_id) 



--agenda x turma
select 
  at.*
from agenda ag
inner join agenda_turma at on (ag.agenda_id = at.agenda_id) 
inner join turma t on (t.turma_id = at.turma_id)
inner join funcionario f on (f.funcionario_id = t.funcionario_id)
where t.funcionario_id = 16
and ag.escola_id = 1
and ag.data_insert_server between :






select * from agenda_aluno 
where agenda_id = :agenda_id

select * from agenda_turma 
where agenda_id = :agenda_id

--query agenda do aluno - ok
select 
  ag.*
from agenda ag
inner join agenda_aluno al on (ag.agenda_id = al.agenda_id) 
where 1=1
and  ag.agenda_id >= :agenda_id
and  ag.escola_id = :escola_id
and  al.aluno_id = :aluno_id




--query agenda da turma - ok
select 
  ag.*
from agenda ag
inner join agenda_turma at on (ag.agenda_id = at.agenda_id) 
where 1=1
and  ag.agenda_id >= :agenda_id
and  ag.escola_id = :escola_id
and  at.turma_id = :turma_id




--Agendas por funcionario
select 
  ag.*
from agenda ag
inner join agenda_aluno al on (ag.agenda_id = al.agenda_id) 
where 1=1
and  ag.agenda_id >= :agenda_id
and  ag.escola_id = :escola_id
and  al.aluno_id = :aluno_id




select 
  ag.*
from agenda ag
inner join turma t on (t.turma_id = at.turma_id)
inner join turma_aluno ta on (ta.turma_id = t.turma_id) 

inner join funcionario f on (f.funcionario_id = t.funcionario_id)
inner join agenda_aluno al on (ag.agenda_id = al.agenda_id and al.aluno_id = ta.aluno_id) 


where 1=1
and f.funcionario_id = 16



--inner join agenda_turma at on (ag.agenda_id = at.agenda_id)




and  ag.agenda_id >= :agenda_id
and  ag.escola_id = :escola_id
and  al.aluno_id = :aluno_id



--Agendas por aluno
select 
  ag.*
from agenda ag
inner join agenda_aluno al on (ag.agenda_id = al.agenda_id) 
where 1=1
and  ag.agenda_id >= :agenda_id
and  ag.escola_id = :escola_id
and  al.aluno_id = :aluno_id




--Agendas por turma
select 
  ag.*
from agenda ag
inner join agenda_turma at on (ag.agenda_id = at.agenda_id) 
where 1=1
and  ag.agenda_id >= :agenda_id
and  ag.escola_id = :escola_id
and  at.turma_id = :turma_id





select 
  ag.*
from agenda ag
inner join agenda_turma at on (ag.agenda_id = at.agenda_id) 
where 1=1
and  ag.agenda_id >=1
and  ag.escola_id = 1
and  at.turma_id = 1

