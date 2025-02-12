-- 2
CREATE VIEW OfficialLanguageView AS
SELECT 
    c.Code,  
    c.Name,  
    cl.Language,   
    cl.IsOfficial   
FROM 
    Country c
JOIN 
    CountryLanguage cl ON c.Code = cl.CountryCode
WHERE 
    cl.IsOfficial = 'T'; 
-- 3
select * from OfficialLanguageView;
-- 4
create index idx_name on city(name);
-- 5
DELIMITER $$

CREATE PROCEDURE GetSpecialCountriesAndCities(IN language_name CHAR(255))
BEGIN
    SELECT 
        c.Name,        
        ci.Name,          
        ci.Population AS CityPopulation, 
        SUM(ci.Population) OVER (PARTITION BY c.Code) AS TotalPopulation 
    FROM 
        City ci
    JOIN 
        Country c ON ci.CountryCode = c.Code
    JOIN 
        CountryLanguage cl ON c.Code = cl.CountryCode
    WHERE 
        ci.Population > 5000000  
        AND cl.Language like language_name  
        AND cl.IsOfficial = 'T'  
        AND ci.Name LIKE 'New%' 
    GROUP BY 
        c.Name, ci.Name, ci.Population, c.Code 
    ORDER BY 
        TotalPopulation DESC  
    LIMIT 10; 
END $$

DELIMITER ;
-- 5
call GetSpecialCountriesAndCities('English');
