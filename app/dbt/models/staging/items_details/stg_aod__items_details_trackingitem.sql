select
    (jsonb_array_elements(i.trackingitem)->>'@uniquename') as uniquename,
    (jsonb_array_elements(i.trackingitem)->>'@uisprite') as uisprite,
    (jsonb_array_elements(i.trackingitem)->>'@findtrackspell') as findtrackspell,
    (jsonb_array_elements(i.trackingitem)->>'@trackingtimereduction') as trackingtimereduction,
    (jsonb_array_elements(i.trackingitem)->>'@trackingfamebonus') as trackingfamebonus,
    (jsonb_array_elements(i.trackingitem)->>'@durability') as durability,
    (jsonb_array_elements(i.trackingitem)->>'@itempower') as itempower,
    (jsonb_array_elements(i.trackingitem)->>'@durabilityloss_inspecttrack') as durabilityloss_inspecttrack,
    (jsonb_array_elements(i.trackingitem)->>'@durabilityloss_findtrack') as durabilityloss_findtrack,
    (jsonb_array_elements(i.trackingitem)->>'@tier') as tier,
    (jsonb_array_elements(i.trackingitem)->>'@craftingcategory') as craftingcategory,
    (jsonb_array_elements(i.trackingitem)->>'@maxstacksize') as maxstacksize,
    (jsonb_array_elements(i.trackingitem)->>'@weight') as weight,
    (jsonb_array_elements(i.trackingitem)->>'@shopcategory') as shopcategory,
    (jsonb_array_elements(i.trackingitem)->>'@shopsubcategory1') as shopsubcategory1,
    (jsonb_array_elements(i.trackingitem)->>'@uicraftsoundstart') as uicraftsoundstart,
    (jsonb_array_elements(i.trackingitem)->>'@uicraftsoundfinish') as uicraftsoundfinish,
    (jsonb_array_elements(i.trackingitem)->>'@slottype') as slottype,
    (jsonb_array_elements(i.trackingitem)->>'@passivespellslots') as passivespellslots,
    (jsonb_array_elements(i.trackingitem)->>'@activespellslots') as activespellslots,
    (jsonb_array_elements(i.trackingitem)->>'@descriptionlocatag') as descriptionlocatag,
    (jsonb_array_elements(i.trackingitem)->>'@durabilityloss_attack') as durabilityloss_attack,
    (jsonb_array_elements(i.trackingitem)->>'@durabilityloss_spelluse') as durabilityloss_spelluse,
    (jsonb_array_elements(i.trackingitem)->>'@durabilityloss_receivedattack') as durabilityloss_receivedattack,
    (jsonb_array_elements(i.trackingitem)->>'@durabilityloss_receivedspell') as durabilityloss_receivedspell,
    (jsonb_array_elements(i.trackingitem)->>'@unlockedtocraft') as unlockedtocraft,
    (jsonb_array_elements(i.trackingitem)->>'@unlockedtoequip') as unlockedtoequip,
    (jsonb_array_elements(i.trackingitem)->>'@abilitypower') as abilitypower,
    (jsonb_array_elements(i.trackingitem)->>'@canbeovercharged') as canbeovercharged,
    (jsonb_array_elements(i.trackingitem)->'craftingrequirements') as craftingrequirements
from {{ ref('stg_aod__items_details') }} i