-- 2
delimiter //
create procedure GetCountriesWithLargeCities()
begin
    SELECT 
        c.Name,
        SUM(ci.Population) AS TotalPopulation
    FROM 
        Country c
    JOIN 
        City ci ON c.Code = ci.CountryCode
    WHERE 
        ci.Population > 1000000
        AND c.Continent = 'Asia'
    GROUP BY 
        c.Name
    HAVING 
        SUM(ci.Population) > 10000000
    ORDER BY 
        TotalPopulation DESC;
end //
delimiter ;
-- 3
call GetCountriesWithLargeCities();
-- 4
drop procedure if exists GetCountriesWithLargeCities;