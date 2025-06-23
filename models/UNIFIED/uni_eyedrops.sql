-- models/UNIFIED/uni_eyedrops.sql
{{ config(
    materialized='table',
    schema='unified'
) }}

SELECT
    -- Все исходные поля без изменений
    smiles,
    name,
    "perm_(cm/s)" AS perm_original,
    logp AS logp_original,
    doi,
    CAST(pmid AS BIGINT) AS pmid, -- Преобразуем в BIGINT
    title,
    publisher,
    year,
    access,
    page,
    origin,

    -- Добавляем метаданные
    current_timestamp AS dbt_loaded_at,
    'eyedrops' AS source_table
FROM
    {{ source('raw', 'eyedrops') }}