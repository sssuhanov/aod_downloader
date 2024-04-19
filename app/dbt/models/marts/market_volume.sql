select 
	q.item_id,
	q.quality,
	q."location",
    max(q."timestamp") as "timestamp",
	avg(q.avg_price)::numeric(20,2) as avg_price,
	avg(q.item_count)::numeric(20,2) as avg_count,
	(avg(q.avg_price)::numeric(20,2) * avg(q.item_count)::numeric(20,2))::numeric(20,2) as volume
from {{ ref("stg_aod__history_2") }} q
group by
	q.item_id,
	q.quality,
	q."location"
order by volume DESC