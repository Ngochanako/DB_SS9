-- 2
delimiter //
create procedure GetLargeCitiesByCountry(in country_code char(3) )
begin
   select id,name,population 
   from city
   where Population>1000000 
   order by Population desc;
end //
delimiter ;
-- 3
call GetLargeCitiesByCountry('USA');
-- 4
drop procedure if exists GetLargeCitiesByCountry;