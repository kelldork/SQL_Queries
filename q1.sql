select distinct p.peid as PERSON#, p.firstname ||' '|| p.lastname as NAME
from person p, buyer b, deal d
where d.peid = b.peid and p.peid = d.peid
order by p.peid;
