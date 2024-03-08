{{ config(schema='bi') }}

select
    id_pedido,
    id_produto,
    id_cliente,
    id_vendedor,
    status_pedido,
    data_compra,
    preco,
    vlr_frete
from {{ ref("process_order") }}
where status_pedido in ('CANCELADO','INDISPONIVEL')