{{config(schema='anl')}}


SELECT
    score_review as nota_review,
    FORMAT("%'.2f",CAST(COUNT(id_pedido)AS float64)) AS num_pedidos,
FROM
    {{ref('process_review')}} 
GROUP BY
    nota_review
ORDER BY
    nota_review