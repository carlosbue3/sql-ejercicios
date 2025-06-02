DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_costo_por_id`(IdReserva INT) 
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE ingreso DATE;
    DECLARE salida DATE;
    DECLARE reserva DATE;
    DECLARE precio INT;
    DECLARE dias INT;
    DECLARE total DECIMAL(10,2);

    -- Obtener fechas y precio base
    SELECT r.FechaIngreso, r.FechaSalida, r.FechaReserva, h.PrecioBase
    INTO ingreso, salida, reserva, precio
    FROM reservas AS r
    JOIN habitaciones AS h ON r.IdHabitacion = h.IdHabitacion
    WHERE r.IdReserva = IdReserva;

    -- Calcular duración y costo
    SET dias = DATEDIFF(salida, ingreso);
    SET total = dias * precio;

    -- Aplicar descuento si la reserva fue hecha con 15 días o más de anticipación
    IF DATEDIFF(ingreso, reserva) >= 15 THEN
        SET total = total * 0.9;
    END IF;

    RETURN total;
END$$

DELIMITER ;
