select lower(suburb) as SUBURB, count(suburb) as NUMBER#
from property p, property_for_rent r
where p.pno = r.pno
group by lower(suburb)
order by lower(suburb);
