create or replace procedure search(x real, FID1 integer, FID2 integer) is
	p deal.pno%type;
	CURSOR p_pnos is
		select pno
		from deal d
		where d.price < x
		and pno in(
			(select pno
			from featured
			where fid = FID1)
			INTERSECT
			(select pno
			from featured
			where fid = FID2)
		)
		group by pno;
	sold_suburb char(20);
    BEGIN
	OPEN p_pnos;
	LOOP
		FETCH p_pnos into p;
		EXIT WHEN p_pnos%NOTFOUND;
		select suburb into sold_suburb from property where pno = p;		
		dbms_output.put_line('******************');
		dbms_output.put_line(sold_suburb);
		dbms_output.put_line('******************');
		dbms_output.put_line('Property ID');
		dbms_output.put_line('---');
		dbms_output.put_line(p);
	END LOOP;
	CLOSE p_pnos;
    END;
/
