
select * from customer	

-- 1) get cutsomer age who's age >18 which is able to vote else not

create or replace function getcustomerage(cust_age int)
Returns varchar as $$
Declare 
	output varchar;
Begin
	if cust_age <35 Then output := 'able to vote';
	Else output := 'not able to vote';
	end if;
	Return output;	
End
$$ language plpgsql

select *, getcustomerage(age) from customer limit 50

--2)check segment based messaging

create or replace function getcustsegment(cust_seg varchar)
Returns varchar as $$
Declare 
	output varchar;
Begin
	if cust_seg ='consumer' Then output := 'Thankyou for your hard work';
	Else output := 'segment not specified';
	end if;
	Return output;	
End
$$ language plpgsql;


select *, getcustsegment(segment) from customer


--3) chek city size category big else small

create or replace function getcitysize(city varchar)
Returns varchar as $$
Declare 
	output varchar;
Begin
	if city ='New York City ,Houston,Seattle' Then output := 'Big city';
	Else output := 'small city';
	end if;
	Return output;	
End
$$ language plpgsql

select *, getcitysize(city) from customer

--4) check user 1st letter
	
create or replace function getfirstwordofusers(cust_firstletter varchar)
Returns varchar as $$
Declare 
	output varchar;
Begin
	if cust_firstletter ='A' Then output := 'IN zone';
	Else output := 'not in zone';
	end if;
	Return output;	
End
$$ language plpgsql

select *, getfirstwordofusers(first_name)from customer

--5) postal code validation
	
create or replace function pcode(cust_pos_code int)
Returns varchar as $$
Declare 
	output varchar;
Begin
	if cust_pos_code BETWEEN 10000 AND 99999  Then output := 'valid postal code';
	Else output := 'invalid postal code';
	end if;
	Return output;	
End
$$ language plpgsql

select pcode (10000)
select pcode (2334)

select *,pcode('postal_code') from customer




