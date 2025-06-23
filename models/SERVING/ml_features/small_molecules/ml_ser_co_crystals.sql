-- models/SERVING/ml_features/small_molecules/ml_ser_co_crystals.sql

{{ config(
    materialized = 'table',
    schema = 'serving'
) }}

select
    -- Основные признаки API + коформер
    name_drug,
    name_coformer,
    smiles_drug,
    smiles_coformer,

    -- Структура кристалла
    name_cocrystal,
    ratio_cocrystal,
    ratio_component_1,
    ratio_component_2,
    photostability_change,

    -- Общие признаки
    year,
    journal,
    access,
    supplementary,
    doi,

    -- Справка/аудит
    source_table,
    dbt_loaded_at

from {{ ref('cur_co_crystals') }}
where smiles_drug is not null
  and smiles_coformer is not null