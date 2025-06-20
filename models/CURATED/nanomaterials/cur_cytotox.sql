{{ config(
    materialized='view',
    schema='curated',
    unique_key='sn'
) }}

with base as (

    {{ deduplicate_model('uni_cytotox') }}

)

select
    base.*,

    -- Булево: positive → true
    {{ bool_from_text_equals('surface_charge', 'Positive') }} as is_surface_positive,

    -- Булево: human (H) → true
    {{ bool_from_text_equals('human_animal', 'H') }} as is_human,

    -- Булево: access 1 → true
    {{ bool_from_int('access') }} as access_bool

from base