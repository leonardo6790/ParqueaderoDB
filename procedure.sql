USE `parqueadero`;
DROP procedure IF EXISTS `InsertarVehiculo`;

DELIMITER $$
USE `parqueadero`$$
CREATE PROCEDURE InsertarVehiculo (
	IN placa varchar(12),
    IN marca tinyint,
    IN modelo smallint,
    IN color tinyint,
    IN TP tinyint
)
BEGIN
INSERT INTO Vehiculo(ID_Placa,ID_Marca,ID_Modelo,ID_Color,ID_TipoVehiculo) VALUES (placa,marca,modelo,color,TP);
END$$

DELIMITER ;
USE `parqueadero`;
DROP function IF EXISTS `minutos`;

DELIMITER $$
USE `parqueadero`$$
CREATE FUNCTION minutos (hora_entrada timestamp)
RETURNS INTEGER(11)
BEGIN
declare min int(11);
set min = TIMESTAMPDIFF(MINUTE,hora_entrada,now());
RETURN min;
END$$

DELIMITER ;

DELIMITER $$
CREATE TRIGGER Elcaclculador3000
AFTER INSERT 
ON pago
FOR EACH ROW
BEGIN

END;
DELIMITER ;

#procedure para pago
USE `parqueadero`;
DROP function IF EXISTS `Pagos`;

USE `parqueadero`;
DROP function IF EXISTS `parqueadero`.`Pagos`;
;

DELIMITER $$
USE `parqueadero`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `Pagos`(placa varchar(12),
    salida timestamp 
) RETURNS int(11)
BEGIN
declare valor int;
declare llegada timestamp;
select FechaLlegada into llegada from Parqueo
where ID_Placa = placa and Costo is null;
set valor = (TIMESTAMPDIFF(MINUTE,llegada,salida))*75;
RETURN valor;
END$$

DELIMITER ;
;

DROP TRIGGER IF EXISTS `parqueadero`.`parqueo_BEFORE_INSERT`;

DELIMITER $$
USE `parqueadero`$$
CREATE DEFINER = CURRENT_USER TRIGGER `parqueadero`.`parqueo_BEFORE_INSERT` BEFORE INSERT ON `parqueo` FOR EACH ROW
BEGIN
	DECLARE cost int;
    select Costo into cost from Parqueo
	WHERE ID_Placa = NEW.ID_Placa
    LIMIT 1;
    
    IF Costo is null then 
    signal sqlstate '45000' SET message_text ='no se puede ingresar el mismo vehiculo si este no a pagado chichipato';
    end if; 
END$$
DELIMITER ;

