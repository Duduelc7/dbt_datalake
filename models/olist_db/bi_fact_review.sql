{{ config(schema='bi') }}


select * from {{ref('process_review')}}