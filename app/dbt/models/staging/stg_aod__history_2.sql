select
	(h.item_id)::text item_id,
	(h.quality)::numeric quality,
	(h."location")::text "location",
	(jsonb_array_elements(h."data")->'avg_price')::numeric avg_price,
	(jsonb_array_elements(h."data")->'timestamp')::text::timestamp "timestamp",
	(jsonb_array_elements(h."data")->'item_count')::numeric item_count
from {{ ref("stg_aod__history")}} h