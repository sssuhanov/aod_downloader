select
    (jsonb_array_elements(i.siegebanner)->>'@uniquename') as uniquename,
    (jsonb_array_elements(i.siegebanner)->>'@referencespell') as referencespell,
    (jsonb_array_elements(i.siegebanner)->>'@tradable') as tradable,
    (jsonb_array_elements(i.siegebanner)->>'@shopcategory') as shopcategory,
    (jsonb_array_elements(i.siegebanner)->>'@shopsubcategory1') as shopsubcategory1,
    (jsonb_array_elements(i.siegebanner)->>'@tier') as tier,
    (jsonb_array_elements(i.siegebanner)->>'@weight') as weight,
    (jsonb_array_elements(i.siegebanner)->>'@maxstacksize') as maxstacksize,
    (jsonb_array_elements(i.siegebanner)->>'@unlockedtocraft') as unlockedtocraft,
    (jsonb_array_elements(i.siegebanner)->>'@uicraftsoundstart') as uicraftsoundstart,
    (jsonb_array_elements(i.siegebanner)->>'@uicraftsoundfinish') as uicraftsoundfinish,
    (jsonb_array_elements(i.siegebanner)->>'@canbeovercharged') as canbeovercharged,
    (jsonb_array_elements(i.siegebanner)->'craftingrequirements') as craftingrequirements
from {{ ref("stg_aod__items_details") }} i