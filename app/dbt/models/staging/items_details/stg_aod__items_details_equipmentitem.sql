select
    (jsonb_array_elements(i.equipmentitem)->>'@uniquename') as uniquename,
    (jsonb_array_elements(i.equipmentitem)->>'@uisprite') as uisprite,
    (jsonb_array_elements(i.equipmentitem)->>'@maxqualitylevel') as maxqualitylevel,
    (jsonb_array_elements(i.equipmentitem)->>'@abilitypower') as abilitypower,
    (jsonb_array_elements(i.equipmentitem)->>'@slottype') as slottype,
    (jsonb_array_elements(i.equipmentitem)->>'@itempowerprogressiontype') as itempowerprogressiontype,
    (jsonb_array_elements(i.equipmentitem)->>'@shopcategory') as shopcategory,
    (jsonb_array_elements(i.equipmentitem)->>'@shopsubcategory1') as shopsubcategory1,
    (jsonb_array_elements(i.equipmentitem)->>'@uicraftsoundstart') as uicraftsoundstart,
    (jsonb_array_elements(i.equipmentitem)->>'@uicraftsoundfinish') as uicraftsoundfinish,
    (jsonb_array_elements(i.equipmentitem)->>'@skincount') as skincount,
    (jsonb_array_elements(i.equipmentitem)->>'@tier') as tier,
    (jsonb_array_elements(i.equipmentitem)->>'@weight') as weight,
    (jsonb_array_elements(i.equipmentitem)->>'@activespellslots') as activespellslots,
    (jsonb_array_elements(i.equipmentitem)->>'@passivespellslots') as passivespellslots,
    (jsonb_array_elements(i.equipmentitem)->>'@physicalarmor') as physicalarmor,
    (jsonb_array_elements(i.equipmentitem)->>'@magicresistance') as magicresistance,
    (jsonb_array_elements(i.equipmentitem)->>'@durability') as durability,
    (jsonb_array_elements(i.equipmentitem)->>'@durabilityloss') as durabilityloss,
    (jsonb_array_elements(i.equipmentitem)->>'@offhandanimationtype') as offhandanimationtype,
    (jsonb_array_elements(i.equipmentitem)->>'@unlockedtocraft') as unlockedtocraft,
    (jsonb_array_elements(i.equipmentitem)->>'@unlockedtoequip') as unlockedtoequip,
    (jsonb_array_elements(i.equipmentitem)->>'@hitpointsmax') as hitpointsmax,
    (jsonb_array_elements(i.equipmentitem)->>'@hitpointsregenerationbonus') as hitpointsregenerationbonus,
    (jsonb_array_elements(i.equipmentitem)->>'@energymax') as energymax,
    (jsonb_array_elements(i.equipmentitem)->>'@energyregenerationbonus') as energyregenerationbonus,
    (jsonb_array_elements(i.equipmentitem)->>'@crowdcontrolresistance') as crowdcontrolresistance,
    (jsonb_array_elements(i.equipmentitem)->>'@itempower') as itempower,
    (jsonb_array_elements(i.equipmentitem)->>'@physicalattackdamagebonus') as physicalattackdamagebonus,
    (jsonb_array_elements(i.equipmentitem)->>'@magicattackdamagebonus') as magicattackdamagebonus,
    (jsonb_array_elements(i.equipmentitem)->>'@physicalspelldamagebonus') as physicalspelldamagebonus,
    (jsonb_array_elements(i.equipmentitem)->>'@magicspelldamagebonus') as magicspelldamagebonus,
    (jsonb_array_elements(i.equipmentitem)->>'@healbonus') as healbonus,
    (jsonb_array_elements(i.equipmentitem)->>'@bonusccdurationvsplayers') as bonusccdurationvsplayers,
    (jsonb_array_elements(i.equipmentitem)->>'@bonusccdurationvsmobs') as bonusccdurationvsmobs,
    (jsonb_array_elements(i.equipmentitem)->>'@threatbonus') as threatbonus,
    (jsonb_array_elements(i.equipmentitem)->>'@magiccooldownreduction') as magiccooldownreduction,
    (jsonb_array_elements(i.equipmentitem)->>'@bonusdefensevsplayers') as bonusdefensevsplayers,
    (jsonb_array_elements(i.equipmentitem)->>'@bonusdefensevsmobs') as bonusdefensevsmobs,
    (jsonb_array_elements(i.equipmentitem)->>'@magiccasttimereduction') as magiccasttimereduction,
    (jsonb_array_elements(i.equipmentitem)->>'@attackspeedbonus') as attackspeedbonus,
    (jsonb_array_elements(i.equipmentitem)->>'@movespeedbonus') as movespeedbonus,
    (jsonb_array_elements(i.equipmentitem)->>'@healmodifier') as healmodifier,
    (jsonb_array_elements(i.equipmentitem)->>'@canbeovercharged') as canbeovercharged,
    (jsonb_array_elements(i.equipmentitem)->>'@showinmarketplace') as showinmarketplace,
    (jsonb_array_elements(i.equipmentitem)->>'@energycostreduction') as energycostreduction,
    (jsonb_array_elements(i.equipmentitem)->>'@masterymodifier') as masterymodifier,
    (jsonb_array_elements(i.equipmentitem)->'craftingrequirements') as craftingrequirements
from {{ ref("stg_aod__items_details") }} i