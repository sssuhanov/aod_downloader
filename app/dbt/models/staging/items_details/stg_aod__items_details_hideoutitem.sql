select
	i.hideoutitem->'@uniquename' as uniquename,
	i.hideoutitem->'@itemvalue' as itemvalue,
	i.hideoutitem->'@tier' as tier,
	i.hideoutitem->'@mindistance' as mindistance,
	i.hideoutitem->'@mindistanceintunnel' as mindistanceintunnel,
	i.hideoutitem->'@placementduration' as placementduration,
	i.hideoutitem->'@primetimedurationminutes' as primetimedurationminutes,
	i.hideoutitem->'@maxstacksize' as maxstacksize,
	i.hideoutitem->'@weight' as weight,
	i.hideoutitem->'@unlockedtocraft' as unlockedtocraft,
	i.hideoutitem->'@shopcategory' as shopcategory,
	i.hideoutitem->'@shopsubcategory1' as shopsubcategory1,
	i.hideoutitem->'@uicraftsoundstart' as uicraftsoundstart,
	i.hideoutitem->'@uicraftsoundfinish' as uicraftsoundfinish,
	i.hideoutitem->'craftingrequirements' as craftingrequirements
from {{ ref('stg_aod__items_details') }} i