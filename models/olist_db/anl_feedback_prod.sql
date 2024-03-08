{{config(schema='anl')}}


SELECT
    po.categoria_produto,
    FORMAT("%'.1f",AVG(score_review)) AS nota_media,
    FORMAT("%'.2f",CAST(COUNT(pr.id_pedido)AS float64)) AS num_pedidos,
FROM
    {{ref('process_review')}} pr
join {{ref('process_order')}} po on pr.id_pedido = po.id_pedido
GROUP BY
    categoria_produto
ORDER BY
    nota_media DESC