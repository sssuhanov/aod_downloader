{{
    config(
        materialized = 'incremental',
		unique_key = ['item_id', 'item_name', 'quality', 'location', 'timestamp']
    )
}}

WITH history AS (
    SELECT *
    FROM {{ ref("int_aod__history")}} sah
	{% if is_incremental() %}

	WHERE sah.created_at >= (select coalesce(max(created_at), '1900-01-01') from {{ this }} )

	{% endif %}
)
select
	h.item_id,
	h.created_at,
	h.item_name,
	h.item_tier,
	h.item_enchantment,
	h.quality,
	h."location",
	h.avg_price,
	h."timestamp",
	h.item_count,
	h.shopcategory,
	h.shopsubcategory1
FROM history as h