-- Criando Funções/Conjuntos de Procedimentos

create or replace function 
            retorna_nome_funcionario(func_id int) 
            returns text as 
            $$              
            declare 
            nome     text;   
            situacao text;
            begin
			
              select funcionario_nome,
                     funcionario_situacao
                into nome, situacao
                from funcionarios
               where id = func_id;	
	           
               if situacao = 'A' then
                 return nome || ' Usuário Ativo';                 
               else                  
                 return nome || ' Usuário Inativo';                 
               end if;  
			   
            end
            $$ 
            language plpgsql;
			
select retorna_nome_funcionario(1);



create or replace function 
            rt_valor_comissao(func_id int)
            returns real as 
            $$
            declare             
              valor_comissao real;
             
            begin              
              select funcionario_comissao
                into valor_comissao
                from funcionarios
               where id = func_id;               
               return valor_comissao;
            end
            $$
            LANGUAGE plpgsql;

select rt_valor_comissao(1);


create or replace function 
             calc_comissao(data_ini timestamp,
                           data_fim timestamp)
             returns void as $$
             declare 
            
            -- declaração das variáveis que iremos
            -- utilizar. Já na declaração elas
            -- recebem o valor zero. Pois assim
            -- garanto que elas estarão zeradas
            -- quando for utiliza-las.
            
               total_comissao  real := 0;
               porc_comissao   real := 0;
			   
			-- declarando uma variavel para armazenar 
			-- os registros dos loop
			   reg             record;
               
            --cursor para buscar a % de comissão do funcionario
            
              cr_porce CURSOR (func_id int) IS 
                  select rt_valor_comissao(func_id);

             begin
            
            -- realiza um loop e busca todas as vendas
            --  no pereíodo informado
            
                for reg in( 
                  select vendas.id id,
                         funcionario_id,
                         venda_total
                    from vendas
                   where data_criacao >= data_ini
                     and data_criacao <= data_fim 
                     and venda_situacao = 'A')loop         
            
            -- abertura, utilização e fechamento do cursor
            
                  open cr_porce(reg.funcionario_id);
                  fetch cr_porce into porc_comissao;
                  close cr_porce;
                  
                             
                  total_comissao := (reg.venda_total * 
                                    porc_comissao)/100;
                 
            -- insere na tabela de comissoes o valor 
            -- que o funcionario ira receber de comissao
            -- daquela venda
            
                  insert into comissoes(
                                        funcionario_id,
                                        comissao_valor,
                                        comissao_situacao,
                                        data_criacao,
                                        data_atualizacao) 
                  values(reg.funcionario_id,
                         total_comissao,
                         'A',
                         now(),
                         now());
            
            -- update na situacao da venda 
            -- para que ela não seja mais comissionada
            
                  update vendas set venda_situacao = 'C'
                   where id = reg.id;
            
            -- devemos zerar as variáveis para reutiliza-las
            
                   total_comissao := 0;
                   porc_comissao  := 0;
                  
            -- termino do loop
            
                end loop;                                    
             
             end
             $$ language plpgsql;

select calc_comissao('01/01/2016 00:00:00','01/01/2016 00:00:00');

select comissao_valor,
                    data_criacao
               from comissoes;

postgresql=> drop function calc_comissoes();    
