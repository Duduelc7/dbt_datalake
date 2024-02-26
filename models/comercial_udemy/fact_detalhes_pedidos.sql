with
    cte as (
        select
            dp.id_pedido,
            dim.nome_produto,
            dim.categoria,
            dim.fornecedor,
            dp.preco_unitario,
            dp.qtd,
            dp.desconto,
            dp.vlr_total

        from {{ ref("detalhamento_pedidos") }} dp
        left join {{ ref("dim_produtos") }} dim on dp.id_produto = dp.id_produto

    )

select * from cte
