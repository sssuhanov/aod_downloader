select
	(h.id)::text as id,
	(h.created_at)::timestamp as created_at,
	(jsonb_array_elements(h."data")->'item_id')::text as item_id,
	(jsonb_array_elements(h."data")->'quality')::text as quality,
	(jsonb_array_elements(h."data")->'location')::text as location,
	(jsonb_array_elements(h."data")->'data')::jsonb as data
from {{ source('aod', 'history') }} h