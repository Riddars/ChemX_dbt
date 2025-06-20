-- models/UNIFIED/uni_seltox.sql
{{ config(
    materialized='view',
    schema='unified'
) }}

SELECT
    *,
    -- Добавляем метаданные
    current_timestamp AS dbt_loaded_at,
    'seltox' AS source_table
FROM
    {{ source('raw', 'seltox') }}