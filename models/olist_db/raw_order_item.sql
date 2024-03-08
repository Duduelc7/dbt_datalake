select
    order_id as id_pedido,
    order_item_id as id_item_ped ,
    product_id  as id_produto,
    seller_id  as id_vendedor,
    cast(shipping_limit_date as date) as data_entrega_estimada,
    cast(price as float64) as preco,
   cast(freight_value as float64) as vlr_frete
from {{ source("olist", "order_items_dataset") }}
