-- models/SERVING/ml_features/small_molecules/ml_ser_complexes.sql

{{ config(
    materialized = 'table',
    schema = 'serving'
) }}

select
    compound_id,
    compound_name,
    smiles,
    smiles_type,
    metal,
    target_cleaned,
    access,
    supplementary_bool,
    publisher,
    year,
    doi,
    source_table,
    dbt_loaded_at

from {{ ref('cur_complexes') }}
where smiles is not null
  and metal is not null