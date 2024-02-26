with
    cte as (
        select
            concat(firstname, ' ', lastname) as nome,
            format_date('%Y-%m-%d', cast(hiredate as date)) as data_contratacao,
            format_date('%Y-%m-%d', cast(birthdate as date)) as data_nascimento,
            date_diff(current_date, cast(birthdate as date), year) as idade,
            date_diff(current_date, cast(hiredate as date), day) as dias_na_empresa,
            date_diff(current_date, cast(hiredate as date), month) as meses_na_empresa,
            date_diff(current_date, cast(hiredate as date), year) as anos_na_empresa
        from {{ source("sources", "funcionarios") }}
    )

select * from cte
