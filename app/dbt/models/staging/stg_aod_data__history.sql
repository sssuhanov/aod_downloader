select
	h.id as id,
	jsonb_array_elements(h."data")->'item_id' as item_id,
	jsonb_array_elements(h."data")->'quality' as quality,
	jsonb_array_elements(h."data")->'location' as location,
	jsonb_array_elements(h."data")->'data' as data
from {{ source('aod', 'history') }} h