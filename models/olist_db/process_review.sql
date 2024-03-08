select
    review_id as id_review,
    order_id as id_pedido,
    cast(review_score as float64) as score_review, 
    review_comment_title as titulo_review,
    review_comment_message as mensagem_review,
    CAST(PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', review_creation_date) AS DATE) data_criacao_review,
    CAST(PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', review_answer_timestamp) AS DATE) data_resposta_review
from {{ source("olist", "review_dataset") }}


