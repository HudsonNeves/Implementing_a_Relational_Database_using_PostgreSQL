-- capitulo 5

   select venda_id,
          funcionario_id,
          venda_total
    from  vendas
   where data_criacao >= 'data_ini'
     and data_criacao <= 'data_fim'
     and produto_situacao = 'A'
	 
insert into produtos (produto_codigo,
                                 produto_nome,
                                 produto_valor,
                                 produto_situacao,
                                 data_criacao,
                                 data_atualizacao)
                          values ('2832',
                                  'SUCO DE LIMÃO',
                                   15,
                                  'C',
                                  '02/02/2016',
                                  '02/02/2016');

	select * 
             from produtos
            where produto_situacao = 'A'
              and produto_situacao = 'C';

	select * 
             from produtos
            where produto_situacao = 'A'
               or produto_situacao = 'C';

	select * 
             from produtos
            where not produto_nome = 'SUCO DE LIMÃO';

	select * 
             from produtos
            where produto_situacao = 'A' 
               or (produto_situacao = 'C' 
                   and data_criacao = '02/02/2016');

	select id,
		   funcionario_id,
		   venda_total
	  from vendas
	 where data_criacao >= 'data_ini'
	   and data_criacao <= 'data_fim'
	   and venda_situacao = 'A';

	select id,
		   funcionario_id,
		   venda_total
	  from vendas
	 where data_criacao >= '01/01/2016'
	   and data_criacao < '02/02/2016'
	   and venda_situacao = 'A';


	select funcionario_codigo || funcionario_nome 
               from funcionarios
              where id = 1;

	select (funcionario_codigo ||' '|| funcionario_nome)
	  from funcionarios
	  where id = 1;

	select (funcionario_codigo ||8|| funcionario_nome)
	  from funcionarios
	  where id = 1;


	select char_length(funcionario_nome)
               from funcionarios
              where id = 2;

	select upper(funcionario_nome)
               from funcionarios;

	select upper('livro postgresql');

	select initcap('livro postgresql');

	select lower(funcionario_nome)
              from funcionarios;

	select overlay(funcionario_nome placing '000000' 
                           from 3 for 5) 
               from funcionarios 
              where id = 1;

	select substring(funcionario_nome from 3 for 5)
               from funcionarios
              where id = 1;

	select position('CIUS' in funcionario_nome) 
               from funcionarios
              where id = 1; 		

	select age(timestamp '04/11/1988');

	select age(timestamp '07/05/2016', 
                       timestamp '12/05/2007');

	select count(*)
             from funcionarios;

	select sum(venda_total)
             from vendas;

	select avg(produto_valor)
             from produtos;

	select max(produto_valor), min(produto_valor)
             from produtos;