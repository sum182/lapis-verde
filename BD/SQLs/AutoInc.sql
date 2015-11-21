
Querys AutoInc
SELECT last_insert_id() from escola limit 1

ALTER TABLE escola AUTO_INCREMENT=1

ALTER TABLE escola AUTO_INCREMENT = 40;

select LAST_INSERT_ID()

SHOW TABLE STATUS LIKE 'escola'
 
SELECT Auto_increment FROM information_schema.tables WHERE table_name='escola';

ALTER TABLE escola AUTO_INCREMENT = ( SELECT Auto_increment FROM information_schema.tables WHERE table_name='escola') 