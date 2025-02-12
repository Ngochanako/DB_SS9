-- 2
DELIMITER //

create procedure CalculatePopulation(in p_countryCode varchar(10),out total_population INT)
begin 
    select sum(population) into total_population
    from city 
    where CountryCode = p_countryCode;
end//


DELIMITER ;
-- 3
SET @TOTAL_POPULATION=0;
CALL CalculatePopulation('usa', @TOTAL_POPULATION);
SELECT  @TOTAL_POPULATION AS TOTAL_POPULATION;
-- 4
DROP procedure IF exists CalculatePopulation;
