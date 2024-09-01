{{
    config(
        materialized='incremental'
    )
}}

select
	h.id drop_id,
	h.item_id item_id,
	h.created_at created_at,
	i."en_us" as item_name,
	i."tier" as item_tier,
	i."enchantment" as item_enchantment,
	(h.quality) quality,
	(h."location") "location",
	(jsonb_array_elements(h."data")->>'avg_price')::numeric avg_price,
	(jsonb_array_elements(h."data")->>'timestamp')::text::timestamp "timestamp",
	(jsonb_array_elements(h."data")->>'item_count')::numeric item_count,
	i.shopcategory as shopcategory,
	i.shopsubcategory1 as shopsubcategory1
from {{ ref("stg_aod__history")}} h
left join {{ ref("int_aod__items")}} i on h.item_id = i."unique_name"

{% if is_incremental() %}

where h.id > (select coalesce(max(drop_id), 0) from {{ this }} )

{% endif %}