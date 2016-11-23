
-- cloud log
select * from log_cloud_messaging
order by data_insert_server desc;

-- Devices
select * from device_usuario
where responsavel_id = 10
where device_token = 'APA91bENEwdZ28PMYXisPk3eHx6W0UMkgemRajTXZ7TKJhxJDX4lEx6dOZbh2phYi10NklVmFSs6gmN5zisXZ9wNFXdgLvfWhvcMMz6t40R_zixkNdtN30Fc'


select * from device_usuario
where funcionario_id = 18



select * from device_usuario
where responsavel_id = 75


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


select aa.*,a.nome from agenda_aluno aa
inner join aluno a on (aa.aluno_id = a.aluno_id)
where aa.agenda_id = '03BE1138-0460-4DE8-8891-3E81DE179653'


select du.device_token 
from responsavel_aluno ra
inner join device_usuario du on (du.responsavel_id = ra.responsavel_id)
inner join responsavel r on (r.responsavel_id = ra.responsavel_id)
where ra.aluno_id = 38
and r.ativo = 'S'

and ra.responsavel_id <> :responsavel_id





select du.device_token,du.* 
from funcionario f
inner join device_usuario du on (du.funcionario_id = f.funcionario_id)
inner join turma t on (t.funcionario_id = f.funcionario_id)
where f.ativo = 'S'

and t.turma_id in ( select ta.turma_id
					from turma_aluno ta
					where ta.aluno_id = 19
                  )
                  
and f.funcionario_id <> :funcionario_id                  




