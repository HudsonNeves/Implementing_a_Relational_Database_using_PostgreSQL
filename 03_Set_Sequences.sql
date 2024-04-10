-- Vinculando Sequencias as Tabelas
alter table mesas 
alter column id set default nextval('mesa_id_seq');
alter table vendas 
alter column id set default nextval('vendas_id_seq');
alter table itens_vendas 
alter column id set default nextval('itens_vendas_id_seq');
alter table produtos 
alter column id set default nextval('produtos_id_seq');
alter table funcionarios 
alter column id set default nextval('funcionario_id_seq');
alter table comissoes 
alter column id set default nextval('comissoes_id_seq'); 