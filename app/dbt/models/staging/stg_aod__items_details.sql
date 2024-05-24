select
	i.id as id,
	i.created_at as created_at,
	i.data->'items'->'shopcategories'->'shopcategory' as shopcategory,
	i.data->'items'->'hideoutitem' as hideoutitem,
	i.data->'items'->'trackingitem' as trackingitem,
	i.data->'items'->'farmableitem' as farmableitem,
	i.data->'items'->'simpleitem' as simpleitem,
	i.data->'items'->'consumableitem' as consumableitem,
	i.data->'items'->'consumablefrominventoryitem' as consumablefrominventoryitem,
	i.data->'items'->'equipmentitem' as equipmentitem,
	i.data->'items'->'weapon' as weapon,
	i.data->'items'->'mount' as mount,
	i.data->'items'->'furnitureitem' as furnitureitem,
	i.data->'items'->'mountskin' as mountskin,
	i.data->'items'->'journalitem' as journalitem,
	i.data->'items'->'labourercontract' as labourercontract,
	i.data->'items'->'transformationweapon' as transformationweapon,
	i.data->'items'->'crystalleagueitem' as crystalleagueitem,
	i.data->'items'->'siegebanner' as siegebanner,
	i.data->'items'->'killtrophy' as killtrophy
FROM {{ source('aod', 'items_details') }} i
where
	i.id = (select max(i.id) from {{ source('aod', 'items_details') }} i)