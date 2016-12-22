select distinct b.peid, f.pno, p.suburb, p.type
from buyer b, featured f, property_for_private_sale s, property p
where b.peid = 57
and p.pno = s.pno
and f.pno = s.pno
and s.asking_price <= b.max_price
and NOT EXISTS (
	(select fid
	from required
	where peid = 57)
	MINUS
	(select f.fid
	from featured f
	where f.pno = s.pno)
);
