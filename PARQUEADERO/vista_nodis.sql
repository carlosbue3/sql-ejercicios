CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `nodis` AS
    SELECT 
        `zonparq`.`IdZonPa` AS `IdZonPa`
    FROM
        `zonparq`
    WHERE
        `zonparq`.`IdEsta` = 2