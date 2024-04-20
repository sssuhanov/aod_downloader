select
	mv.item_id,
	mv."location" ,
	min(mv."timestamp") min_date,
	sum(mv.volume) as volume
from {{ ref("market_volume")}} mv
group by 
	mv.item_id,
	mv."location"
order by
    volume desc