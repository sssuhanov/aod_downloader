select
	(i.hideoutitem->>'@uniquename')::text as uniquename,
	(i.hideoutitem->>'@itemvalue')::numeric as itemvalue,
	(i.hideoutitem->>'@tier')::numeric as tier,
	i.hideoutitem->>'@mindistance' as mindistance,
	i.hideoutitem->>'@mindistanceintunnel' as mindistanceintunnel,
	i.hideoutitem->>'@placementduration' as placementduration,
	i.hideoutitem->>'@primetimedurationminutes' as primetimedurationminutes,
	i.hideoutitem->>'@maxstacksize' as maxstacksize,
	i.hideoutitem->>'@weight' as weight,
	i.hideoutitem->>'@unlockedtocraft' as unlockedtocraft,
	(i.hideoutitem->>'@shopcategory')::text as shopcategory,
	(i.hideoutitem->>'@shopsubcategory1')::text as shopsubcategory1,
	i.hideoutitem->>'@uicraftsoundstart' as uicraftsoundstart,
	i.hideoutitem->>'@uicraftsoundfinish' as uicraftsoundfinish,
	i.hideoutitem->>'craftingrequirements' as craftingrequirements
from {{ ref('stg_aod__items_details') }} i