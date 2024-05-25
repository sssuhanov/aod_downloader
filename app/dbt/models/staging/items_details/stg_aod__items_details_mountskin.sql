select
    (jsonb_array_elements(i.mountskin)->>'@uniquename') as uniquename,
    (jsonb_array_elements(i.mountskin)->>'@prefabname') as prefabname,
    (jsonb_array_elements(i.mountskin)->>'@prefabscaling') as prefabscaling,
    (jsonb_array_elements(i.mountskin)->>'@despawneffect') as despawneffect,
    (jsonb_array_elements(i.mountskin)->>'@despawneffectscaling') as despawneffectscaling,
    (jsonb_array_elements(i.mountskin)->>'@vfxAddonKeyword') as vfxAddonKeyword,
    (jsonb_array_elements(i.mountskin)->'SocketPreset') as socketpreset,
    (jsonb_array_elements(i.mountskin)->'AssetVfxPreset') as assetvfxpreset,
    (jsonb_array_elements(i.mountskin)->'AudioInfo') as audioinfo,
    (jsonb_array_elements(i.mountskin)->'FootStepVfxPreset') as footstepvfxpreset
from {{ ref("stg_aod__items_details") }} i