select 
    order_id as id_pedido,
    customer_id as id_cliente,
    CASE 
        WHEN order_status = 'created' THEN 'CRIADO'
        WHEN order_status = 'shipped' THEN 'ENVIADO'
        WHEN order_status = 'approved' THEN 'APROVADO'
        WHEN order_status = 'canceled' THEN 'CANCELADO'
        WHEN order_status = 'invoiced' THEN 'FATURADO'
        WHEN order_status = 'delivered' THEN 'ENTREGUE'
        WHEN order_status = 'processing' THEN 'EM PROCESSAMENTO'
        WHEN order_status = 'unavailable' THEN 'INDISPONIVEL'
        ELSE order_status
        end as status_pedido,
    cast(order_purchase_timestamp as date) data_compra,
    cast(order_approved_at as date) data_aprovado,
    cast(order_delivered_carrier_date as date) data_enviado,
    cast(order_delivered_customer_date as date) data_entrega,
    cast(order_estimated_delivery_date as date) data_entrega_estimada
from {{source('olist','orders_dataset')}}



