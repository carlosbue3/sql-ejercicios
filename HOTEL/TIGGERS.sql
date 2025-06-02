CREATE DEFINER=`root`@`localhost` TRIGGER liberar_habitacion
AFTER UPDATE ON reservas
FOR EACH ROW
BEGIN
    IF NEW.FechaSalida < CURDATE() THEN
        UPDATE habitaciones
        SET Disponible = 1
        WHERE IdHabitacion = NEW.IdHabitacion;
    END IF;
END