with cte as (
select *,
 first_value(CustomerID)
 over(partition by CompanyName, ContactName
 order by CompanyName
 rows between unbounded preceding and unbounded following) as result
 from {{source('sources','cliente')}}
), deleted as (
    select distinct result from cte
), final as (
    select * from {{source('sources','cliente')}} where CustomerID in (select result from deleted)
)

select * from final