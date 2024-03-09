
 create or replace FUNCTION rental_costs(rental_cost numeric, film_duration numeric)
 RETURNS numeric
 Language plpgsql
 as $$
  declare rental_cost_per_minute numeric;
 begin
 rental_cost_per_minute := rental_cost / film_duration;
 return rental_cost_per_minute;
 end
 $$;
 
  select rental_costs(4.99,117);


 create or replace procedure information(identifier numeric)
 Language plpgsql
 as $$
 declare film_length numeric;
 begin
 	select length into film_length
 	from film
	where film_id = information.identifier;
  	raise info 'Film length for film_id %: % minutes.',identifier,film_length;
 end
 $$;
 
 call information(133);