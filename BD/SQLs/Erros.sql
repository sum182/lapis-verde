-- Agenda sem dt de insert no server
select * from agenda 
where data_insert_server is null




-- Log Erros
SELECT data, data_insert_server, log_error .* 
FROM log_error 
--  where msg_error like '% Cannot perform the action, %'
--  where msg_error like '%Cannot begin edit row%'
order by data desc;


-- Erros no processo atualizacao
-- somente as tabelas de tipos podem ser listadas abaixo
SELECT * FROM dbdev.processo_atualizacao
where coalesce(escola_id,0) = 0
  and coalesce(responsavel_id,0) = 0
  and coalesce(funcionario_id,0) = 0