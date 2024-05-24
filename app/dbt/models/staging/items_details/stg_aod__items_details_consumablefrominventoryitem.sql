select
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@uniquename') as uniquename,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@tradable') as tradable,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@uisprite') as uisprite,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@abilitypower') as abilitypower,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@consumespell') as consumespell,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@shopcategory') as shopcategory,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@shopsubcategory1') as shopsubcategory1,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@tier') as tier,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@weight') as weight,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@dummyitempower') as dummyitempower,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@maxstacksize') as maxstacksize,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@unlockedtocraft') as unlockedtocraft,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@unlockedtouse') as unlockedtouse,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@uicraftsoundstart') as uicraftsoundstart,
    (jsonb_array_elements(i.consumablefrominventoryitem)->>'@uicraftsoundfinish') as uicraftsoundfinish
from {{ ref("stg_aod__items_details") }} i