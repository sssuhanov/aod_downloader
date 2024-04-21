select
	mv.item_id,
	mv.item_name item_name,
	mv."location" ,
	min(mv."timestamp") min_date,
	sum(mv.volume) as volume
from {{ ref("market_volume")}} mv
group by 
	mv.item_id,
	mv.item_name,
	mv."location"
order by
    volume desc