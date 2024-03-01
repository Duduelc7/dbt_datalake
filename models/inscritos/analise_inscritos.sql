with staging_inscritos as (
    select * from {{ref('staging_inscritos')}}

)

select maioridade,
count(maioridade) count_maioridade
from staging_inscritos
group by maioridade