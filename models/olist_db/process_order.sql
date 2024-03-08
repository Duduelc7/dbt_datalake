select 
ro.id_pedido,
dc.id_cliente,
ra.id_item_ped,
dp.id_produto,
dv.id_vendedor,
status_pedido,
data_compra,
data_aprovado,
data_enviado,
data_entrega,
ro.data_entrega_estimada,
cep_cliente,
cidade_cliente,
estado_cliente,
dc.latitude as latitude_cliente,
dc.longitude as longitude_cliente,
preco,
vlr_frete,
categoria_produto,
peso_produto_g,
comprimento_produto_cm,
altura_produto_cm,
largura_produto_cm,
cep_vendedor,
cidade_vendedor,
estado_vendedor,
dv.latitude as latitude_vendedor,
dv.longitude as longitude_vendedor
from {{ref('raw_order')}}  ro
left join {{ref('process_cliente')}} dc on ro.id_cliente = dc.id_cliente
left join {{ref('raw_order_item')}}  ra on ra.id_pedido = ro.id_pedido
left join {{ref('process_produto')}} dp on ra.id_produto = dp.id_produto
left join {{ref('process_vendedor')}} dv on ra.id_vendedor = dv.id_vendedor
