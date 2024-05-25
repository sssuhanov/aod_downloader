select
    i.*,
    c.*
from {{ ref("stg_aod__items_names_plus")}} i
left join {{ref("int_aod__items_details_shopcategory")}} c
on i.unique_name LIKE (c.uniquename || '%')