{% macro parse_decimal_comma_to_float(column_name) %}
  CASE
    -- Обработка NULL и пустых значений после удаления пробелов
    WHEN {{ column_name }} IS NULL OR TRIM({{ column_name }}) = '' THEN NULL

    -- Оставляем только строки, похожие на числа: -1,23 или 3,14, 42, -10 и т.д.
    WHEN regexp_replace(TRIM({{ column_name }}), ',', '.', 'g') ~ '^[-+]?[0-9]*\.?[0-9]+$' THEN
      CAST(
        regexp_replace(TRIM({{ column_name }}), ',', '.', 'g')
        AS DOUBLE PRECISION
      )

    ELSE NULL -- все, что не проходит проверку, явно превращаем в NULL
  END
{% endmacro %}