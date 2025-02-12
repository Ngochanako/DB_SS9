-- 2
delimiter //
create procedure getCountry(in language_in varchar(255))
begin
    select language,countrycode,Percentage 
    from countrylanguage;
end //
delimiter ;
-- 3
call getCountry('USA');
-- 4
drop procedure if exists getCountry;