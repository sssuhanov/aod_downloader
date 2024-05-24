select
	h.item_id item_id,
	h.created_at created_at,
	i."en_us" as item_name,
	i."tier" as item_tier,
	i."enchantment" as item_enchantment,
	(h.quality) quality,
	(h."location") "location",
	(jsonb_array_elements(h."data")->>'avg_price')::numeric avg_price,
	(jsonb_array_elements(h."data")->>'timestamp')::text::timestamp "timestamp",
	(jsonb_array_elements(h."data")->>'item_count')::numeric item_count
from {{ ref("stg_aod__history")}} h
left join {{ ref("stg_aod__items_names_plus")}} i on h.item_id = i."unique_name"
order by
	h.item_id,
	h.quality,
	h."location",
	h.created_at