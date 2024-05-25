select
	coalesce((substring(i.unique_name FROM '^T(\d)_'))::numeric,0) AS tier,
	coalesce((substring(i.unique_name FROM '@(\d)$'))::numeric,0) AS enchantment,
	i.*
FROM {{ ref("stg_aod__items_names") }} i