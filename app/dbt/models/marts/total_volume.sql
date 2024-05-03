select
	mv.item_id,
	mv.item_name item_name,
	mv."location",
	min(mv."timestamp") min_date,
	sum(mv.volume) as volume,
	mv.avg_price_diff::numeric(20,2) as avg_price_diff,
	mv.avg_count_diff::numeric(20,2) as avg_count_diff
from {{ ref("market_volume")}} mv
group by 
	mv.item_id,
	mv.item_name,
	mv."location",
	mv.avg_price_diff,
	mv.avg_count_diff
order by
    volume desc