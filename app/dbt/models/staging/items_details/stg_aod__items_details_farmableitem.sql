select
    (jsonb_array_elements(i.farmableitem)->>'@uniquename') as uniquename,
    (jsonb_array_elements(i.farmableitem)->>'@tier') as tier,
    (jsonb_array_elements(i.farmableitem)->>'@placefame') as placefame,
    (jsonb_array_elements(i.farmableitem)->>'@pickupable') as pickupable,
    (jsonb_array_elements(i.farmableitem)->>'@destroyable') as destroyable,
    (jsonb_array_elements(i.farmableitem)->>'@unlockedtoplace') as unlockedtoplace,
    (jsonb_array_elements(i.farmableitem)->>'@maxstacksize') as maxstacksize,
    (jsonb_array_elements(i.farmableitem)->>'@shopcategory') as shopcategory,
    (jsonb_array_elements(i.farmableitem)->>'@shopsubcategory1') as shopsubcategory1,
    (jsonb_array_elements(i.farmableitem)->>'@kind') as kind,
    (jsonb_array_elements(i.farmableitem)->>'@weight') as weight,
    (jsonb_array_elements(i.farmableitem)->>'@unlockedtocraft') as unlockedtocraft,
    (jsonb_array_elements(i.farmableitem)->>'@animationid') as animationid,
    (jsonb_array_elements(i.farmableitem)->>'@activefarmfocuscost') as activefarmfocuscost,
    (jsonb_array_elements(i.farmableitem)->>'@activefarmmaxcycles') as activefarmmaxcycles,
    (jsonb_array_elements(i.farmableitem)->>'@activefarmactiondurationseconds') as activefarmactiondurationseconds,
    (jsonb_array_elements(i.farmableitem)->>'@activefarmcyclelengthseconds') as activefarmcyclelengthseconds,
    (jsonb_array_elements(i.farmableitem)->>'@activefarmbonus') as activefarmbonus,
    (jsonb_array_elements(i.farmableitem)->>'@itemvalue') as itemvalue,
    (jsonb_array_elements(i.farmableitem)->'craftingrequirements') as craftingrequirements,
    (jsonb_array_elements(i.farmableitem)->'AudioInfo') as audioinfo,
    (jsonb_array_elements(i.farmableitem)->'harvest') as harvest
from {{ ref("stg_aod__items_details") }} i