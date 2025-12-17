use base; 


# faturamento total 
Select 
	p.ID_Produto,pr.Nome_Produto, sum(p.Receita_venda)
from
	pedidos as p
join
	produtos as pr
ON 
	pr.ID_Produto =  p.ID_Produto
group by 
	pr.Nome_Produto, p.ID_Produto;


# faturamento por loja
select 
	p.ID_Loja, l.Loja, sum( Receita_venda)
from
	pedidos as p
join 
	lojas as l
ON 
	p.ID_Loja = l.ID_Loja
GROUP BY l.Loja,p.ID_Loja;


# faturamento por categoria 
SELECT 
	c.Categoria,
    SUM(p.Receita_venda) AS faturamento_total
FROM pedidos p
JOIN produtos pr 
    ON p.ID_Produto = pr.ID_Produto
JOIN categorias c 
    ON pr.ID_Categoria = c.ID_Categoria
GROUP BY 
	c.Categoria;



# ticket medio
SELECT 
    AVG(Receita_venda) AS ticket_medio
FROM pedidos;



# vendas ao longo do tempo por datas 
SELECT 
    DATE(Data_Venda) AS data,
    SUM(Receita_Venda) AS faturamento
FROM pedidos
GROUP BY DATE(Data_Venda)
ORDER BY data;

# YEAR(), MONTH() e DATE_FORMAT() são funções de data muito usadas para análise temporal em SQL.

# vendas por mes e ano 
SELECT 
    YEAR(Data_Venda) AS ano,
    MONTH(Data_Venda) AS mes,
    SUM(Receita_Venda) AS faturamento
FROM pedidos
GROUP BY 
    YEAR(Data_Venda),
    MONTH(Data_Venda)
ORDER BY 
    ano, mes;


# volume de pedidos por loja
SELECT 
    l.Loja,
    COUNT(p.id_pedido) AS total_pedidos
FROM pedidos p
JOIN lojas l ON p.id_loja = l.id_loja
GROUP BY l.Loja;







































































