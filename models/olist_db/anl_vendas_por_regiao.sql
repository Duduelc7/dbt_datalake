{{config(schema='anl')}}

SELECT
    estado_cliente,
    FORMAT("%'.2f",CAST(COUNT(id_pedido)AS float64)) AS num_pedidos,
     FORMAT("%'.2f",SUM(preco + vlr_frete)) AS valor_total_vendas,
     FORMAT("%'.2f",AVG(preco + vlr_frete)) AS valor_medio_pedido
FROM
    {{ref('process_order')}}
GROUP BY
    estado_cliente
ORDER BY
    valor_total_vendas DESC