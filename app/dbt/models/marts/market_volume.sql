with last_history as (
	select *
	from {{ ref("int_aod__history_noduplicates") }}
	where "timestamp" >= current_date - interval '14 days'
)
select 
	q.item_id item_id,
	q.item_name item_name,
	q.item_tier item_tier,
	q.item_enchantment item_enchantment,
	q.quality quality,
	q."location",
	q.shopcategory,
	q.shopsubcategory1,
    max(q."timestamp") as "timestamp",
	avg(q.avg_price)::numeric(20,2) as avg_price,
	avg(q.item_count)::numeric(20,2) as avg_count,
	(avg(q.avg_price)::numeric(20,2) * avg(q.item_count)::numeric(20,2))::numeric(20,2) as volume,
	min(q.avg_price)::numeric(20,2) as min_avg_price,
	max(q.avg_price)::numeric(20,2) as max_avg_price,
	max(q.avg_price)::numeric(20,2) / min(q.avg_price)::numeric(20,2) as avg_price_diff,
	min(q.item_count)::numeric(20,2) as min_item_count,
	max(q.item_count)::numeric(20,2) as max_item_count,
	max(q.item_count)::numeric(20,2) / min(q.item_count)::numeric(20,2) as avg_count_diff
from last_history q
group by
	q.item_id,
	q.item_name,
	q.item_tier,
	q.item_enchantment,
	q.quality,
	q."location",
	q.shopcategory,
	q.shopsubcategory1
order by volume DESC