-- models/SERVING/ml_features/small_molecules/ml_ser_eyedrops.sql

{{ config(
    materialized = 'view',
    schema = 'serving'
) }}

select
    smiles,
    name,
    perm_cleaned,
    logp_cleaned,
    doi,
    pmid,
    publisher,
    year,
    access,
    origin,
    page,
    dbt_loaded_at,
    source_table

from {{ ref('cur_eyedrops') }}
where perm_cleaned is not null or logp_cleaned is not null