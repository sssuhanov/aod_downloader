SELECT
	sah.item_id,
	sah.created_at,
	sah.item_name,
	sah.quality,
	sah.location,
	sah."timestamp",
	COUNT(*)
FROM {{ ref("stg_aod__history_noduplicates") }} sah
GROUP BY
	sah.item_id,
	sah.created_at,
	sah.item_name,
	sah.quality,
	sah.location,
	sah."timestamp"
HAVING COUNT(*) > 1