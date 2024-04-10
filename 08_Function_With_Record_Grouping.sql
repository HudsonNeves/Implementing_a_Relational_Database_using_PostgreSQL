	create or replace function 
            retorna_nome_produto(prod_id int) 
            returns text as 
            $$              
            declare 
            nome     text;   
            begin
              select produto_nome                     
                into nome
                from produtos
               where id = prod_id;                
                 return nome;
            end
            $$ 
            language plpgsql;

	select retorna_nome_produto(produto_id) PRODUTO, 
                  sum(item_total) VL_TOTAL_PRODUTO
             from itens_vendas
            group by produto_id
            order by vl_total_produto, produto;

	select retorna_nome_produto(produto_id) PRODUTO, 
                  sum(item_total) VL_TOTAL_PRODUTO
             from itens_vendas
            group by produto_id
            order by vl_total_produto desc, produto;

	select retorna_nome_produto(produto_id), 
                    count(id) QTDE
               from itens_vendas
              group by produto_id;

	select retorna_nome_produto(produto_id) produto, 
                    count(id) qtde
               from itens_vendas
              group by produto_id
             having count(produto_id) >= 2
              order by qtde;
