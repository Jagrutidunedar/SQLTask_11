select * from users

--1) chek users gender and giving them Phrase

create or replace function chekusergender(u_gender varchar)
Returns varchar as $$
Declare
   output varchar ;
Begin
 if u_gender ='female' Then output :='sugar,spice,and everything nice';
  Else output := 'Bold,fearless,and full of life';
  End if;
  Return output;
End
$$ language plpgsql

select *, chekusergender (gender) from users

--2) checking users id for placement Drive

create or replace function chekuserid(u_id int)
Returns varchar as $$
Declare
   output varchar ;
Begin
 if u_id <10 Then output :='eligibal for drive';
  Else output := 'not eligibal for drive';
  End if;
  Return output;
End
$$ language plpgsql

select *, chekuserid (user_id) from users