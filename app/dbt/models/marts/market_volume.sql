select 
	q.item_id item_id,
	q.item_name item_name,
	q.quality quality,
	q."location",
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
from {{ ref("stg_aod__history_2") }} q
group by
	q.item_id,
	q.item_name,
	q.quality,
	q."location"
order by volume DESC