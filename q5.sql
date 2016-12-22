select count(suburb) as NUMBER#, lower(suburb) as NAME
from property p, deal d
where p.pno = d.pno
and d.price < 500000
group by lower(suburb)
order by lower(suburb);

