select distinct p.pno, p.suburb, p.type
from property p, property_for_rent r, property_for_private_sale s, property_for_auction a
where r.pno = s.pno 
and s.pno = p.pno 
order by p.pno;
