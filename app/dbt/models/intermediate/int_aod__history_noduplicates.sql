WITH RankedData AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY sah.item_id, sah.item_name, sah.quality, sah."location", sah."timestamp"
           ORDER BY sah.created_at DESC) AS rn
    FROM {{ ref("int_aod__history")}} sah
)
select
	rd.item_id,
	rd.created_at,
	rd.item_name,
	rd.item_tier,
	rd.item_enchantment,
	rd.quality,
	rd."location",
	rd.avg_price,
	rd."timestamp",
	rd.item_count,
	rd.shopcategory,
	rd.shopsubcategory1
FROM RankedData rd
WHERE rn = 1
order by
	rd.item_id,
	rd.item_tier,
	rd.item_enchantment,
	rd.quality,
	rd."location",
	rd."timestamp"