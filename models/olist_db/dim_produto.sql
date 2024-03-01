select
    distinct product_id as id_produto,
    product_category_name as categoria_produto,
    coalesce(cast(product_weight_g as int),0) peso_produto_g,
    coalesce(cast(product_length_cm as int),0)  comprimento_produto_cm,
    coalesce(cast(product_height_cm as int),0)  altura_produto_cm,
    coalesce(cast(product_width_cm as int),0)  largura_produto_cm
from {{ source("olist", "products_dataset") }}
where product_category_name is not null




