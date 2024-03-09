create or replace procedure film_list() 
LANGUAGE plpgsql as
$$ 
declare 
	temp_v film % ROWTYPE;
begin
	for temp_v in select * from film where length > 150
	loop
		if temp_v.length > 180 then
			RAISE EXCEPTION 'Film ID % with duration % minutes is too long',temp_v.film_id,temp_v.length;
		else
			RAISE NOTICE 'Film ID % with duration % minutes', temp_v.film_id, temp_v.length;
		end if;
	end loop;
end;
$$ ;


call film_list();