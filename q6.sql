select lower(b.suburb) as SUBURB, to_char(max(d.price), '$9,999,999.99') as MAXPRICE
from branch b, property p, deal d 
where lower(b.suburb) = lower(p.suburb)
and p.pno = d.pno
group by lower(b.suburb)
order by lower(b.suburb);
