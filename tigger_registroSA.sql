CREATE DEFINER=`root`@`localhost` TRIGGER `parqueaderodb`.`factura_AFTER_UPDATE` AFTER UPDATE ON `factura` FOR EACH ROW
BEGIN
  IF NEW.FecEgre IS NOT NULL THEN
        UPDATE zonparq  SET IdEsta = 1
        WHERE IdZonPa = (SELECT IdZonPa FROM ticket WHERE IdTick = NEW.IdTick);
    END IF;
END