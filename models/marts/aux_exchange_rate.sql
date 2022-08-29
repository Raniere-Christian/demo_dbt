{{
    config(
        materialized='incremental',
        unique_key='rate_id',
        on_schema_change='fail'
    )
}}

SELECT
    rate_id
    , currency
    , rate
    , ref_date

FROM {{ ref('daily_exchange_rates') }}

{% if is_incremental() %}

WHERE ref_date > (SELECT max(ref_date) FROM {{ this }})

{% endif %}