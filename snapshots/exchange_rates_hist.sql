{% snapshot exchange_rates_hist %}

{{
    config(
      target_schema='snapshots',
      unique_key='currency',
      strategy='check',
      check_cols=['rate']
    )
}}

SELECT * FROM {{ ref('current_exchange_rates') }}

{% endsnapshot %}
