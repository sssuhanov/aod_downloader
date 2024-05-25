select
    (jsonb_array_elements(i.consumableitem)->>'@uniquename') as uniquename,
    (jsonb_array_elements(i.consumableitem)->>'@itemvalue') as itemvalue,
    (jsonb_array_elements(i.consumableitem)->>'@fishingfame') as fishingfame,
    (jsonb_array_elements(i.consumableitem)->>'@fishingminigamesetting') as fishingminigamesetting,
    (jsonb_array_elements(i.consumableitem)->>'@descriptionlocatag') as descriptionlocatag,
    (jsonb_array_elements(i.consumableitem)->>'@uisprite') as uisprite,
    (jsonb_array_elements(i.consumableitem)->>'@nutrition') as nutrition,
    (jsonb_array_elements(i.consumableitem)->>'@abilitypower') as abilitypower,
    (jsonb_array_elements(i.consumableitem)->>'@slottype') as slottype,
    (jsonb_array_elements(i.consumableitem)->>'@consumespell') as consumespell,
    (jsonb_array_elements(i.consumableitem)->>'@shopcategory') as shopcategory,
    (jsonb_array_elements(i.consumableitem)->>'@shopsubcategory1') as shopsubcategory1,
    (jsonb_array_elements(i.consumableitem)->>'@resourcetype') as resourcetype,
    (jsonb_array_elements(i.consumableitem)->>'@tier') as tier,
    (jsonb_array_elements(i.consumableitem)->>'@weight') as weight,
    (jsonb_array_elements(i.consumableitem)->>'@dummyitempower') as dummyitempower,
    (jsonb_array_elements(i.consumableitem)->>'@maxstacksize') as maxstacksize,
    (jsonb_array_elements(i.consumableitem)->>'@unlockedtocraft') as unlockedtocraft,
    (jsonb_array_elements(i.consumableitem)->>'@unlockedtoequip') as unlockedtoequip,
    (jsonb_array_elements(i.consumableitem)->>'@uicraftsoundstart') as uicraftsoundstart,
    (jsonb_array_elements(i.consumableitem)->>'@uicraftsoundfinish') as uicraftsoundfinish
from {{ ref("stg_aod__items_details") }} i