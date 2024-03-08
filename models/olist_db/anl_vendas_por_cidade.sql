{{config(schema='anl')}}

SELECT
    cidade_cliente,
    FORMAT("%'.2f",CAST(COUNT(id_pedido)AS float64)) AS num_pedidos,
    FORMAT("%'.2f",SUM(preco + vlr_frete)) AS valor_total_vendas
FROM
    {{ref('process_order')}}
GROUP BY
    cidade_cliente
ORDER BY
    valor_total_vendas DESC