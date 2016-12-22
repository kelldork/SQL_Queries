select p.pno, p.suburb, p.type
from (advertisement a inner join property p on a.pno = p.pno)
group by p.pno, p.suburb, p.type
having count(distinct a.newspaper) > 1;
