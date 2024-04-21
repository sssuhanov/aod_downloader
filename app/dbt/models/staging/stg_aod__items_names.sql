select
	jsonb_array_elements(i."data")->'Index' as "Index",
	jsonb_array_elements(i."data")->'UniqueName' as "UniqueName",
	jsonb_array_elements(i."data")->'LocalizationNameVariable' as "LocalizationNameVariable",
	jsonb_array_elements(i."data")->'LocalizationDescriptionVariable' as "LocalizationDescriptionVariable",
	jsonb_array_elements(i."data")->'LocalizedNames' as "LocalizedNames",
	jsonb_array_elements(i."data")->'LocalizedDescriptions' as "LocalizedDescriptions",
	jsonb_array_elements(i."data")->'LocalizedNames'->'EN-US' as "EN-US"
from {{ source('aod', 'items_names')}} i 
where 
	created_at = (select max(created_at) from {{ source('aod', 'items_names')}})