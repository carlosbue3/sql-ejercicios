DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_RESERVA`(
    IN p_IdReserva INT
)
BEGIN
    DECLARE costoFinal DECIMAL(10,2);
    DECLARE idHab INT;

    SET costoFinal = calcular_costo_por_id(p_IdReserva);

    UPDATE reservas
    SET CostoTotal = costoFinal
    WHERE IdReserva = p_IdReserva;

    SELECT IdHabitacion INTO idHab 
    FROM reservas 
    WHERE IdReserva = p_IdReserva;

    UPDATE habitaciones
    SET Disponible = 0
    WHERE IdHabitacion = idHab;
END$$

DELIMITER ;



DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Habi`(
IN Acomodacio INT,
IN PrecioBase INT,
IN Disponible tinyint
)
BEGIN
INSERT INTO HABITACIONES (Acomodacion,PrecioBase,Disponible)
VALUES (Acomodacio,PrecioBase,Disponible);
END$$

DELIMITER ;



USE `hotel_reservas`;
DROP procedure IF EXISTS `hotel_reservas`.`NUEVA_R`;
;

DELIMITER $$
USE `hotel_reservas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `NUEVA_R`(
IN IdClient INT,
IN IdHabitacio INT,
IN FechaReserv DATE,
IN FechaIngres DATE,
IN FechaSalid DATE
)
BEGIN
INSERT INTO RESERVAS (IdCliente,IdHabitacion,FechaReserva,FechaIngreso,FechaSalida) 
VALUES (IdClient,IdHabitacio,FechaReserv,FechaIngres,FechaSalid);
END$$

DELIMITER ;
;


USE `hotel_reservas`;
DROP procedure IF EXISTS `hotel_reservas`.`Registro_N`;
;

DELIMITER $$
USE `hotel_reservas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registro_N`(
IN Cliente int,
IN Nom VARCHAR (100),
IN Doc varchar (100),
IN Tel INT
)
BEGIN
 INSERT INTO CLIENTES (IdCliente,Nombre,Documento,Telefono)
 VALUES (Cliente,Nom,Doc,Tel);
END$$

DELIMITER ;
;

