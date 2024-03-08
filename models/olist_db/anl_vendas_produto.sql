{{config(schema='anl')}}


SELECT
    categoria_produto,
    FORMAT("%'.2f",CAST(COUNT(id_pedido)AS float64)) AS num_pedidos,
    FORMAT("%'.2f",SUM(preco)) AS total_vendas,
    FORMAT("%'.2f",AVG(preco)) AS media_valor_pedido
FROM
    {{ref('process_order')}}
GROUP BY
    categoria_produto
ORDER BY
    total_vendas DESC