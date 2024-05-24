select
	(jsonb_array_elements(i."data")->'Index')::text as id,
	(jsonb_array_elements(i."data")->'UniqueName')::text as unique_name,
	(jsonb_array_elements(i."data")->'LocalizationNameVariable')::text as local_name_var,
	(jsonb_array_elements(i."data")->'LocalizationDescriptionVariable')::text as local_desc_var,
	(jsonb_array_elements(i."data")->'LocalizedNames')::jsonb as local_names,
	(jsonb_array_elements(i."data")->'LocalizedDescriptions')::jsonb as local_desc,
	(jsonb_array_elements(i."data")->'LocalizedNames'->'EN-US')::text as en_us
from {{ source('aod', 'items_names')}} i 
where 
	created_at = (select max(created_at) from {{ source('aod', 'items_names')}})