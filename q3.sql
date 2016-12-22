select distinct p.peid as PERSON#, p.firstname ||' '|| p.lastname as NAME
from person p, owner o, property pr
where lower(pr.type) = 'commercial'
and lower(pr.suburb) = 'randwick'
and p.peid = o.peid
and p.peid = pr.peid
order by p.peid;
