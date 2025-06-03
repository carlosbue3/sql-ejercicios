CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_con_zonas`(
in ZonaID INT
)
BEGIN

    SELECT ZONA_DISPONIBLE(ZonaID) AS "disponibilidad",IdZonPa 
	FROM zonparq
    WHERE idesta = 1
    order by IdZonPa desc;
   
END