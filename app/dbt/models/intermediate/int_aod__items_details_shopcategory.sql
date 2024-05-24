select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_consumablefrominventoryitem") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_consumableitem") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_crystalleagueitem") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_equipmentitem") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_farmableitem") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_furnitureitem") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_hideoutitem") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_journalitem") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_killtrophy") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_labourercontract") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_mount") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_siegebanner") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_simpleitem") }}
union all
select
    uniquename::text::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_trackingitem") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_transformationweapon") }}
union all
select
    uniquename::text,
    shopcategory::text,
    shopsubcategory1::text
from {{ ref("stg_aod__items_details_weapon") }}