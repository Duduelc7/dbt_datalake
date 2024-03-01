with inscritos as (
    select * from {{ref('inscritos')}}
)

select *,
Age > 30 maioridade 

from inscritos