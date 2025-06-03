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

USE `parqueadero`;
DROP procedure IF EXISTS `InsertarParqueo`;

DELIMITER $$
USE `parqueadero`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarParqueo`(
in puesto tinyint(4),
in placa varchar(12)
)
BEGIN
INSERT INTO Parqueo(ID_Puestos,ID_Placa) VALUES (puesto,placa);
END$$

#No dejar insertar un parqueo nuevo si el puesto que se introduce su estado es ocupado(True)
DELIMITER ;
DELIMITER $$
CREATE FUNCTION PuestoDisponible (p_id_puesto TINYINT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE v_estado BOOLEAN;
    SELECT Estado INTO v_estado FROM Puestos WHERE ID_Puestos = p_id_puesto;
    IF v_estado = 1 THEN
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_VerificarPuesto
BEFORE INSERT ON Parqueo
FOR EACH ROW
BEGIN
    IF PuestoDisponible(NEW.ID_Puestos) = FALSE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El puesto ya está ocupado.';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_OcuparPuesto
AFTER INSERT ON Parqueo
FOR EACH ROW
BEGIN
    UPDATE Puestos SET Estado = 1 WHERE ID_Puestos = NEW.ID_Puestos;
END$$
DELIMITER ;