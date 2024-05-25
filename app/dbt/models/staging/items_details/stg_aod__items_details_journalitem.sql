select
    (jsonb_array_elements(i.journalitem)->>'@salvageable') as salvageable,
    (jsonb_array_elements(i.journalitem)->>'@uniquename') as uniquename,
    (jsonb_array_elements(i.journalitem)->>'@tier') as tier,
    (jsonb_array_elements(i.journalitem)->>'@maxfame') as maxfame,
    (jsonb_array_elements(i.journalitem)->>'@baselootamount') as baselootamount,
    (jsonb_array_elements(i.journalitem)->>'@shopcategory') as shopcategory,
    (jsonb_array_elements(i.journalitem)->>'@shopsubcategory1') as shopsubcategory1,
    (jsonb_array_elements(i.journalitem)->>'@weight') as weight,
    (jsonb_array_elements(i.journalitem)->>'@unlockedtocraft') as unlockedtocraft,
    (jsonb_array_elements(i.journalitem)->>'@fasttravelfactor') as fasttravelfactor,
    (jsonb_array_elements(i.journalitem)->'craftingrequirements') as craftingrequirements,
    (jsonb_array_elements(i.journalitem)->'famefillingmissions') as famefillingmissions,
    (jsonb_array_elements(i.journalitem)->'lootlist') as lootlist
from {{ ref("stg_aod__items_details") }} i