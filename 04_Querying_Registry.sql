-- Consultando Registros

select * from mesas;

select mesa_codigo, data_criacao from mesas;

select * from mesas where mesa_codigo = '00002';

update produtos set produto_valor = 4 where id = 2;

update produtos set data_criacao = '31/12/2016';

select data_criacao from produtos;

delete from mesas where id = 2;