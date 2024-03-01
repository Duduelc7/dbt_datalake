with
    cte_cast as (
        select
            orderid as id_pedido,
            dp.productid as id_produto,
            cast(dp.unitprice as float64) as preco_unitario,
            cast(dp.quantity as int) as qtd,
            cast(dp.discount as float64) as desconto
        from {{ source("sources", "detalhamento_pedidos") }} dp
    ),
    cte_calculo as (
        select *, round((preco_unitario * qtd) - desconto, 2) as vlr_total from cte_cast
    )
select *
from cte_calculo
