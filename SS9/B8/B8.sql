-- 2
DELIMITER //

CREATE PROCEDURE GetCountriesByCityNames()
BEGIN
    SELECT 
        c.Name,
        cl.Language AS OfficialLanguage,
        SUM(ci.Population) AS TotalPopulation
    FROM 
        Country c
    JOIN 
        City ci ON c.Code = ci.CountryCode
    JOIN 
        CountryLanguage cl ON c.Code = cl.CountryCode
    WHERE 
        ci.Name LIKE 'A%'  
        AND cl.IsOfficial = 'T'  
    GROUP BY 
        c.Name, cl.Language
    HAVING 
        SUM(ci.Population) > 2000000  
    ORDER BY 
        c.Name ASC;  
END //

DELIMITER ;
-- 3
call GetCountriesByCityNames();
-- 4
drop procedure if exists GetCountriesByCityNames;
