select 
    sd.seller_id as id_vendedor,
    sd.seller_zip_code_prefix as cep_vendedor,
    upper(sd.seller_city) as cidade_vendedor,
    sd.seller_state as estado_vendedor,
    gd.geolocation_lat as latitude,
    gd.geolocation_lng as longitude
 from {{source('olist','sellers_dataset')}} sd
 left join {{source('olist','geolocation_dataset')}} gd on gd.geolocation_zip_code_prefix = sd.seller_zip_code_prefix
 