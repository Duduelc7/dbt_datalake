{{config(schema='anl')}}

SELECT
    FORMAT_TIMESTAMP('%Y-%m', data_compra) AS mes_ano,
    FORMAT("%'.2f",CAST(COUNT(id_pedido)AS float64)) AS num_pedidos,
    FORMAT("%'.2f",SUM(preco)) AS total_vendas,
    FORMAT("%'.2f",AVG(preco)) AS media_valor_pedido
FROM
    {{ref('process_order')}}
GROUP BY
    mes_ano
ORDER BY
    mes_ano
