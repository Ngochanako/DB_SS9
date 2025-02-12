-- 2
CREATE VIEW CountryLanguageView AS
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
select * from CountryLanguageView;

-- 4
DELIMITER $$

CREATE PROCEDURE GetLargeCitiesWithEnglish()
BEGIN
    SELECT 
        ci.Name,
        c.Name,
        ci.Population
    FROM 
        City ci
    JOIN 
        Country c ON ci.CountryCode = c.Code
    JOIN 
        CountryLanguage cl ON c.Code = cl.CountryCode
    WHERE 
        ci.Population > 1000000  
        AND cl.Language = 'English' 
        AND cl.IsOfficial = 'T'  
    ORDER BY 
        ci.Population DESC  
    LIMIT 20;  
END $$

DELIMITER ;
-- 5
call GetLargeCitiesWithEnglish();
-- 6
drop procedure if exists GetLargeCitiesWithEnglish;
