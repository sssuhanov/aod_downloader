with shopcategory as (
	select
		jsonb_array_elements(i.shopcategory)->'@id'::text as id,
		jsonb_array_elements(i.shopcategory)->'@value'::text as value,
		jsonb_array_elements(i.shopcategory)->'shopsubcategory' as shopsubcategory
	from {{ ref('stg_aod__items_details') }} i
)
select
	i.id shopcategory_id,
	i.value shopcategory_value,
	jsonb_array_elements(i.shopsubcategory)->'@id'::text as shopsubcategory_id,
	jsonb_array_elements(i.shopsubcategory)->'@value'::text as shopsubcategory_value
FROM shopcategory i