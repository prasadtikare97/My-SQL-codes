create or replace function get_rental_rate(rate numeric)
	returns varchar(20)
	language plpgsql as 
	$$
	begin
		if rate < 2 then
			return 'cheap';
		 elseif rate > 2 and rate < 4  then
			return 'not so cheap';
		 else
			return 'rather expensive';
		end if;
	end
	$$;
	
select rental_rate,get_rental_rate(rental_rate) from film;	

create or replace function get_rental_rate_with_case(rate numeric)
	returns varchar(20)
	language plpgsql as 
	$$
	begin
		case 
			when rate < 2 then
				return 'cheap';
			when rate > 2 and rate < 4  then
				return 'not so cheap';
			else
				return 'rather expensive';
		end case;
	end
	$$;
	
select rental_rate,get_rental_rate_with_case(rental_rate) from film;