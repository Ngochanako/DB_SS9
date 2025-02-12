use world;
-- 2
DELIMITER //

CREATE PROCEDURE GetCitiesByCountry(IN country_code VARCHAR(10))
BEGIN
    SELECT ID, Name, Population
    FROM city
    WHERE CountryCode = country_code;
END //

DELIMITER ;
-- 3
call GetCitiesByCountry('USA');
-- 4
drop procedure if exists GetCitiesByCountry;
