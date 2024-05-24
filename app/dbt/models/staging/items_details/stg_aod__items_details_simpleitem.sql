select
    (jsonb_array_elements(i.simpleitem)->>'@uniquename') as uniquename,
    (jsonb_array_elements(i.simpleitem)->>'@tier') as tier,
    (jsonb_array_elements(i.simpleitem)->>'@weight') as weight,
    (jsonb_array_elements(i.simpleitem)->>'@maxstacksize') as maxstacksize,
    (jsonb_array_elements(i.simpleitem)->>'@uisprite') as uisprite,
    (jsonb_array_elements(i.simpleitem)->>'@shopcategory') as shopcategory,
    (jsonb_array_elements(i.simpleitem)->>'@shopsubcategory1') as shopsubcategory1,
    (jsonb_array_elements(i.simpleitem)->>'@unlockedtocraft') as unlockedtocraft
from {{ ref("stg_aod__items_details") }} i