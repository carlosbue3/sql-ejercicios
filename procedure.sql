USE `parqueaderodb`;
DROP procedure IF EXISTS `parqueaderodb`.`ProCli`;
;

DELIMITER $$
USE `parqueaderodb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProCli`(
in ICli INT,
in Nom varchar(30),
in Apel1 varchar(30),
in Apel2 varchar(30),
in TaPro bigint,
in NumCe bigint,
in ITiDoc int

)
BEGIN
insert into Clientes(IdCli,Nomb,Apell1,Apell2,TarPro,NumCel,IdTiDoc)
values (ICli,Nom,Apel1,Apel2,TaPro,NumCe,ITiDoc);
END$$

DELIMITER ;
;




USE `parqueaderodb`;
DROP procedure IF EXISTS `Proveh`;

DELIMITER $$
USE `parqueaderodb`$$
CREATE DEFINER=root@localhost PROCEDURE Proveh(
in IPlaca varchar(30),
in Nvedad varchar(100),
in ICli int,
in ICol INT,
in TiVeh varchar(30)

)
BEGIN
insert into Vehiculos(IdPlaca,Novedad,IdCli,IdCol,TipVeh)
values (IPlaca,Nvedad,ICli,ICol,TiVeh);
END$$

DELIMITER ;


USE `parqueaderodb`;
DROP procedure IF EXISTS `ProTicket`;

USE `parqueaderodb`;
DROP procedure IF EXISTS `parqueaderodb`.`ProTicket`;
;

DELIMITER $$
USE `parqueaderodb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProTicket`(
in FecIngre TIMESTAMP,
in IPlaca varchar(30),
in IMePago INT,
in IZonPa INT

)
BEGIN
insert into Ticket(FecIngre,IdPlaca,IdMePago,IdZonPa)
values (FecIngre,IPlaca,IMePago,IZonPa);
END$$

DELIMITER ;
;




