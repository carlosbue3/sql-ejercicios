CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `new_view` AS
    SELECT 
        `zonparq`.`IdZonPa` AS `IdZonPa`
    FROM
        `zonparq`
    WHERE
        `zonparq`.`IdEsta` = 1