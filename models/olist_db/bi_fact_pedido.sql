{{ config(schema='bi') }}
select
    id_pedido,
    id_produto,
    id_cliente,
    id_vendedor,
    status_pedido,
    data_compra,
    data_entrega_estimada,
    preco,
    vlr_frete
from {{ ref("process_order") }}
where status_pedido in ('EM PROCESSAMENTO')
