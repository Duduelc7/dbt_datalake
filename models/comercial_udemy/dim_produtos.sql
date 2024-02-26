with
    cte as (
        select
            productid as id_produto,
            productname as nome_produto,
            ctg.categoryname as categoria,
            quantityperunit as qtd_unidade,
            discontinued as ativo,
            fn.companyname as fornecedor

        from {{ source("sources", "produtos") }} p
        left join
            {{ source("sources", "fornecedores") }} fn on p.supplierid = fn.supplierid
        left join
            {{ source("sources", "categorias") }} ctg on p.categoryid = ctg.categoryid
    )

select * from cte
