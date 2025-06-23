-- models/SERVING/ml_features/small_molecules/ml_ser_benzimidazoles.sql

{{ config(
    materialized = 'table',
    schema = 'serving'
) }}

select
    compound_id,
    smiles,
    target_value_parsed,
    target_value_error,
    target_relation,
    target_type,
    target_units,
    bacteria_unified,
    year,
    access,
    doi,
    source_table,
    dbt_loaded_at

from {{ ref('cur_benzimidazoles') }}
where target_value_parsed IS NOT NULL
  and smiles IS NOT NULL
  and replace(target_relation, '''', '') in ('=', '<', '>')