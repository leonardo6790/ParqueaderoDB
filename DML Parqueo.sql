INSERT INTO Color (Color) VALUES ("Azul"), ("Rojo"), ("Verde"), ("Amarillo"), ("Negro"), ("Blanco"), ("Gris"), ("Naranja"), ("Morado"), ("Rosado"), ("Café"), ("Turquesa"), ("Violeta"), ("Fucsia"), ("Celeste");
/*SELECT * FROM parqueadero.color;*/

INSERT INTO Marca (Marca) VALUES ("Toyota"), ("Chevrolet"), ("Ford"), ("Nissan"), ("Honda"), ("Hyundai"), ("Kia"), ("Mazda"), ("Volkswagen"), ("Renault"), ("BMW"), ("Mercedes-Benz"), ("Audi"), ("Peugeot"), ("Suzuki");
/*SELECT * FROM parqueadero.marca*/

INSERT INTO MetodosPago (MetodoPago) VALUES ("Efectivo"), ("Tarjeta Débito"), ("Tarjeta Crédito"), ("Nequi"), ("Daviplata");
/*SELECT * FROM parqueadero.metodospago*/

INSERT INTO Modelo (Modelo) VALUES (1985), (1986), (1987), (1988), (1989), (1990), (1991), (1992), (1993), (1994), (1995), (1996), (1997), (1998), (1999), (2000), (2001), (2002), (2003), (2004), (2005), (2006), (2007), (2008), (2009), (2010), (2011), (2012), (2013), (2014), (2015), (2016), (2017), (2018), (2019), (2020), (2021), (2022), (2023), (2024), (2025), (2026);

DELETE FROM Modelo where ID_Modelo IN (43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84);

INSERT INTO Sotano (Nivel) VALUES ("A1"), ("A2"), ("A3"), ("A4"), ("A5");
/*SELECT * FROM parqueadero.sotano;*/  
DELETE FROM Sotano where ID_Sotano IN (6, 7, 8, 9, 10);

INSERT INTO TipoVehiculo (TipoVehiculo) VALUES ("Automovil"), ("Motocicleta"), ("Bicicleta");
/*SELECT * FROM parqueadero.tipovehiculo*/

INSERT INTO Vehiculo (ID_Placa, ID_Marca, ID_Modelo, ID_Color, ID_TipoVehiculo) VALUES ("KFC 123", 5, 40, 3, 1);
/*SELECT * FROM parqueadero.vehiculo*/

CALL InsertarVehiculo ("IKT 879", 10, 32,11,1);
CALL InsertarVehiculo ("IKT 879", 10, 32,11,1);
INSERT INTO Puestos (NumPuesto)
VALUES
(1), (2), (3), (4), (5),
(6), (7), (8), (9), (10),
(11), (12), (13), (14), (15),
(16), (17), (18), (19), (20),
(21), (22), (23), (24), (25),
(26), (27), (28), (29), (30),
(31), (32), (33), (34), (35),
(36), (37), (38), (39), (40),
(41), (42), (43), (44), (45),
(46), (47), (48), (49), (50);



/*CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarVehiculo`(
IN Placa varchar(12),
IN Modelo smallint,
IN Marca tinyint,
IN Color tinyint,
IN TipoVehiculo tinyint
)
BEGIN
 INSERT INTO Vehiculo (ID_Placa,ID_Marca,ID_Modelo,ID_Color,ID_TipoVehiculo) VALUES (Placa, Marca, Modelo, Color, TipoVehiculo);
END--*/ 