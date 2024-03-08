select 
    cd.customer_id as id_cliente,
    cd.customer_zip_code_prefix as cep_cliente,
    upper(cd.customer_city) as cidade_cliente,
    cd.customer_state as estado_cliente,
    gd.geolocation_lat as latitude,
    gd.geolocation_lng as longitude
 from {{source('olist','costumer_dataset')}} cd
 left join {{source('olist','geolocation_dataset')}} gd on cd.customer_zip_code_prefix = gd.geolocation_zip_code_prefix