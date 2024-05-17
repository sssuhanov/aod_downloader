select
	(h.item_id)::text item_id,
	h.created_at::text::timestamp created_at,
	i."en_us"::text as item_name,
	i."tier"::text as item_tier,
	i."enchantment"::text as item_enchantment,
	(h.quality)::numeric quality,
	(h."location")::text "location",
	(jsonb_array_elements(h."data")->'avg_price')::numeric avg_price,
	(jsonb_array_elements(h."data")->'timestamp')::text::timestamp "timestamp",
	(jsonb_array_elements(h."data")->'item_count')::numeric item_count
from {{ ref("stg_aod__history")}} h
left join {{ ref("stg_aod__items_names_plus")}} i on h.item_id = i."unique_name"
order by
	(h.item_id)::text,
	(h.quality)::numeric,
	(h."location")::text,
	h.created_at::text::timestamp