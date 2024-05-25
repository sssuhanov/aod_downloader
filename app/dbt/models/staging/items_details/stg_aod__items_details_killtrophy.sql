select
    i.killtrophy->>'@uniquename' as uniquename,
    i.killtrophy->>'@shopcategory' as shopcategory,
    i.killtrophy->>'@shopsubcategory1' as shopsubcategory1,
    i.killtrophy->>'@tier' as tier,
    i.killtrophy->>'@weight' as weight,
    i.killtrophy->>'@durability' as durability,
    i.killtrophy->>'@unlockedtocraft' as unlockedtocraft,
    i.killtrophy->>'@placeableindoors' as placeableindoors,
    i.killtrophy->>'@placeableoutdoors' as placeableoutdoors,
    i.killtrophy->>'@placeableindungeons' as placeableindungeons,
    i.killtrophy->>'@placeableinexpeditions' as placeableinexpeditions,
    i.killtrophy->>'@placeableonlyonislands' as placeableonlyonislands,
    i.killtrophy->>'@uisprite' as uisprite,
    i.killtrophy->>'@descriptionlocatag' as descriptionlocatag,
    i.killtrophy->>'@showinmarketplace' as showinmarketplace,
    i.killtrophy->>'@hidefromplayeroncontext' as hidefromplayeroncontext,
    i.killtrophy->'craftingrequirements' as craftingrequirements
from {{ ref('stg_aod__items_details') }} i