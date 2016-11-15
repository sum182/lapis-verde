-- Agenda sem dt de insert no server
select * from agenda 
where data_insert_server is null




-- Log Erros
SELECT data, data_insert_server, agendadb.log_error .* 
FROM agendadb.log_error 
--  where msg_error like '% Cannot perform the action, %'
--  where msg_error like '%Cannot begin edit row%'
order by data desc;
