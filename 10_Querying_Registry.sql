-- Consultandp registros
	select funcionario_nome
               from funcionarios
              where funcionario_nome like 'VINICIUS%';

		select funcionario_nome
               from funcionarios
              where funcionario_nome like '%SOUZA%';

		select funcionario_nome
               from funcionarios
              where funcionario_nome = 'VINICIUS%';

		select funcionario_nome
               from funcionarios
              where funcionario_nome = 'VINICIUS SOUZA';			  

