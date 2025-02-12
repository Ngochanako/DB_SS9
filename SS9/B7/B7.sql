DELIMITER //

CREATE PROCEDURE GetEnglishSpeakingCountriesWithCities(
    IN language VARCHAR(50)
)
BEGIN
    SELECT 
        c.Name,
        SUM(ci.Population) AS TotalPopulation
    FROM 
        Country c
    JOIN 
        City ci ON c.Code = ci.CountryCode
    JOIN 
        CountryLanguage cl ON c.Code = cl.CountryCode
    WHERE 
        cl.Language = language
        AND cl.IsOfficial = 'T'
        AND ci.Population > 5000000
    GROUP BY 
        c.Name
    ORDER BY 
        TotalPopulation DESC
    LIMIT 10;
END //

DELIMITER ;
-- 3
call GetEnglishSpeakingCountriesWithCities('English');
-- 4
drop procedure if exists GetEnglishSpeakingCountriesWithCities;
