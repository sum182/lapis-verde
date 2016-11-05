
-- cloud log
select * from log_cloud_messaging
order by data_insert_server desc;

-- Devices
select * from device_usuario




-- Responsaveis de um aluno
-- select ra.*, du.* from responsavel_aluno ra
select du.device_token 
from responsavel_aluno ra
inner join device_usuario du on (du.responsavel_id = ra.responsavel_id)
inner join responsavel r on (r.responsavel_id = ra.responsavel_id)
where ra.aluno_id = 19
and r.ativo = 'S'
and ra.responsavel_id <> 75

select * from responsavel_aluno ra

select * from agenda 
order by agenda.data_insert_server desc


select * from agenda_aluno aa
where aa.agenda_id = '03BE1138-0460-4DE8-8891-3E81DE179653'



select du.device_token 


from responsavel_aluno ra


inner join device_usuario du on (du.responsavel_id = ra.responsavel_id)


inner join responsavel r on (r.responsavel_id = ra.responsavel_id)


where ra.aluno_id = :aluno_id


and r.ativo = 'S'

