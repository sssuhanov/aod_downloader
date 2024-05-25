select
    (jsonb_array_elements(i.transformationweapon)->>'@uniquename') as uniquename,
    (jsonb_array_elements(i.transformationweapon)->>'@transformation') as transformation,
    (jsonb_array_elements(i.transformationweapon)->>'@mesh') as mesh,
    (jsonb_array_elements(i.transformationweapon)->>'@uisprite') as uisprite,
    (jsonb_array_elements(i.transformationweapon)->>'@maxqualitylevel') as maxqualitylevel,
    (jsonb_array_elements(i.transformationweapon)->>'@abilitypower') as abilitypower,
    (jsonb_array_elements(i.transformationweapon)->>'@physicalspelldamagebonus') as physicalspelldamagebonus,
    (jsonb_array_elements(i.transformationweapon)->>'@magicspelldamagebonus') as magicspelldamagebonus,
    (jsonb_array_elements(i.transformationweapon)->>'@slottype') as slottype,
    (jsonb_array_elements(i.transformationweapon)->>'@shopcategory') as shopcategory,
    (jsonb_array_elements(i.transformationweapon)->>'@shopsubcategory1') as shopsubcategory1,
    (jsonb_array_elements(i.transformationweapon)->>'@attacktype') as attacktype,
    (jsonb_array_elements(i.transformationweapon)->>'@mainhandanimationtype') as mainhandanimationtype,
    (jsonb_array_elements(i.transformationweapon)->>'@attackdamage') as attackdamage,
    (jsonb_array_elements(i.transformationweapon)->>'@attackspeed') as attackspeed,
    (jsonb_array_elements(i.transformationweapon)->>'@attackrange') as attackrange,
    (jsonb_array_elements(i.transformationweapon)->>'@twohanded') as twohanded,
    (jsonb_array_elements(i.transformationweapon)->>'@tier') as tier,
    (jsonb_array_elements(i.transformationweapon)->>'@weight') as weight,
    (jsonb_array_elements(i.transformationweapon)->>'@activespellslots') as activespellslots,
    (jsonb_array_elements(i.transformationweapon)->>'@passivespellslots') as passivespellslots,
    (jsonb_array_elements(i.transformationweapon)->>'@durability') as durability,
    (jsonb_array_elements(i.transformationweapon)->>'@durabilityloss_attack') as durabilityloss_attack,
    (jsonb_array_elements(i.transformationweapon)->>'@durabilityloss_spelluse') as durabilityloss_spelluse,
    (jsonb_array_elements(i.transformationweapon)->>'@durabilityloss_receivedattack') as durabilityloss_receivedattack,
    (jsonb_array_elements(i.transformationweapon)->>'@durabilityloss_receivedspell') as durabilityloss_receivedspell,
    (jsonb_array_elements(i.transformationweapon)->>'@fxbonename') as fxbonename,
    (jsonb_array_elements(i.transformationweapon)->>'@fxboneoffset') as fxboneoffset,
    (jsonb_array_elements(i.transformationweapon)->>'@unlockedtocraft') as unlockedtocraft,
    (jsonb_array_elements(i.transformationweapon)->>'@unlockedtoequip') as unlockedtoequip,
    (jsonb_array_elements(i.transformationweapon)->>'@hitpointsmax') as hitpointsmax,
    (jsonb_array_elements(i.transformationweapon)->>'@itempower') as itempower,
    (jsonb_array_elements(i.transformationweapon)->>'@hitpointsregenerationbonus') as hitpointsregenerationbonus,
    (jsonb_array_elements(i.transformationweapon)->>'@itempowerprogressiontype') as itempowerprogressiontype,
    (jsonb_array_elements(i.transformationweapon)->>'@focusfireprotectionpenetration') as focusfireprotectionpenetration,
    (jsonb_array_elements(i.transformationweapon)->>'@uicraftsoundstart') as uicraftsoundstart,
    (jsonb_array_elements(i.transformationweapon)->>'@uicraftsoundfinish') as uicraftsoundfinish,
    (jsonb_array_elements(i.transformationweapon)->>'@craftingcategory') as craftingcategory,
    (jsonb_array_elements(i.transformationweapon)->>'@healmodifier') as healmodifier,
    (jsonb_array_elements(i.transformationweapon)->>'@canbeovercharged') as canbeovercharged,
    (jsonb_array_elements(i.transformationweapon)->>'@masterymodifier') as masterymodifier,
    (jsonb_array_elements(i.transformationweapon)->>'@physicalattackdamagebonus') as physicalattackdamagebonus,
    (jsonb_array_elements(i.transformationweapon)->>'@magicattackdamagebonus') as magicattackdamagebonus,
    (jsonb_array_elements(i.transformationweapon)->>'@descriptionlocatag') as descriptionlocatag,
    (jsonb_array_elements(i.transformationweapon)->'attackvariations') as attackvariations,
    (jsonb_array_elements(i.transformationweapon)->'projectile') as projectile,
    (jsonb_array_elements(i.transformationweapon)->'SocketPreset') as socketpreset,
    (jsonb_array_elements(i.transformationweapon)->'craftingrequirements') as craftingrequirements,
    (jsonb_array_elements(i.transformationweapon)->'craftingspelllist') as craftingspelllist,
    (jsonb_array_elements(i.transformationweapon)->'AudioInfo') as audioinfo
from {{ ref("stg_aod__items_details") }} i