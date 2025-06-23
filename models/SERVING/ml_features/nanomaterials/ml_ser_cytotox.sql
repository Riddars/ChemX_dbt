-- models/SERVING/ml_features/nanomaterials/ml_ser_cytotox.sql

{{ config(
    materialized = 'table',
    schema = 'serving'
) }}

select
    "viability_%",
    material,
    size_in_medium_nm,
    hydrodynamic_nm,
    zeta_in_medium_mv,
    potential_mv,
    surface_charge,
    is_surface_positive,
    core_nm,
    concentration,
    coat_functional_group,
    shape,
    synthesis_method,
    test,
    test_indicator,
    no_of_cells_cells_well,
    time_hr,
    cell_type,
    cell_age,
    cell_morphology,
    cell_tissue,
    cell_source,
    human_animal,
    is_human,
    year,
    access,
    is_oa,
    oa_status,
    journal_name,
    publisher,
    doi,
    dbt_loaded_at,
    source_table

from {{ ref('cur_cytotox') }}
where "viability_%" is not null