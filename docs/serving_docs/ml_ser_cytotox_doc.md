{% docs ml_ser_cytotox_doc %}

## ML-витрина: ml_ser_cytotox

Универсальная витрина на основе данных цитотоксичности наночастиц.  
Используется в задачах регрессии (`viability_%`) или классификации (пороговая жизнеспособность).

### Включены признаки:

- Физические: `size_in_medium_nm`, `hydrodynamic_nm`, `surface_charge`, `shape`, `coating`, `concentration`
- Биологические: `cell_type`, `cell_age`, `cell_morphology`, `cell_tissue`, `human_animal`
- Экспериментальные условия: `test`, `test_indicator`, `time_hr`
- Мета: `publisher`, `journal_name`, `doi`, `access`

---

## Исключённые столбцы и причины

| Столбец              | Причина исключения                         |
|----------------------|--------------------------------------------|
| core_nm              | 100% NULL                                  |
| article_list         | Техническое поле индекса                   |
| sn                   | Внутренний индекс, не нужен для ML         |
| title                | Описание статьи, текстовое                 |
| pdf                  | Имя PDF-файла, не влияет на модель         |
| dbt_curated_at       | Дата обновления CURATED — техническая инфа |

{% enddocs %}