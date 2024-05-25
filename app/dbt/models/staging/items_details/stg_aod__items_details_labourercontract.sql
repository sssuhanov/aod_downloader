select
    (jsonb_array_elements(i.labourercontract)->>'@uniquename') as uniquename,
    (jsonb_array_elements(i.labourercontract)->>'@tier') as tier,
    (jsonb_array_elements(i.labourercontract)->>'@shopcategory') as shopcategory,
    (jsonb_array_elements(i.labourercontract)->>'@shopsubcategory1') as shopsubcategory1,
    (jsonb_array_elements(i.labourercontract)->>'@unlockedtocraft') as unlockedtocraft,
    (jsonb_array_elements(i.labourercontract)->>'@weight') as weight
from {{ ref("stg_aod__items_details") }} i