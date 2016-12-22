create table audit_log (
	PNO number(38),
	user_name varchar2(8),
	date_changed date,
	old_price float(63),
	new_price float(63)
);
--create the trigger such that whenever there is an update to
--reserve price, log that information
create or replace trigger update_AuctionProperty
after update of reserve_price on property_for_auction
for each row
	BEGIN
	 insert into audit_log
	  values (:old.pno, user, sysdate, :old.reserve_price, :new.reserve_price);
	END;
/

update property_for_auction
set reserve_price = reserve_price - (reserve_price * .10)
where pno IN ( 
	(select pno 
	from property_for_auction) 
	MINUS 
	(select pno 
	from deal)
);

select * from audit_log;

drop table audit_log;
