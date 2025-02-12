-- 2
delimiter //
create procedure UpdateCityPopulation(inout city_id int,in new_population int)
begin 
     update city
     set population=new_population
     where id=city_id;
     
     select id,name,population
     from city where id=city_id;
end //
delimiter ;
-- 3
set @city_id=3;
set @new=750000;
call UpdateCityPopulation(@city_id,@new);
-- 4
drop procedure if exists UpdateCityPopulation;

