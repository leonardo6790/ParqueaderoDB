DROP DATABASE IF EXISTS Parqueadero;
CREATE DATABASE Parqueadero;
USE Parqueadero;

CREATE TABLE  Marca(
	ID_Marca tinyint primary key auto_increment,
    Marca varchar(20)
);
CREATE TABLE Modelo(
	ID_Modelo smallint primary key auto_increment,
    Modelo smallint
);
CREATE TABLE Color(
	ID_Color tinyint primary key auto_increment,
    Color varchar(12)
);
CREATE TABLE TipoVehiculo(
	ID_TipoVehiculo tinyint primary key auto_increment,
    TipoVehiculo varchar(15)
);
CREATE TABLE Vehiculo(
	ID_Placa varchar(12) primary key,
    ID_Marca tinyint,
    ID_Modelo smallint,
    ID_Color tinyint,
    ID_TipoVehiculo tinyint
);
CREATE TABLE Parqueo(
	ID_Parqueo mediumint primary key auto_increment,
    FechaLlegada timestamp default current_timestamp,
    FechaSalida datetime,
    Costo mediumint,
    Tiempo time,
    ID_Puestos tinyint,
    ID_Placa varchar (12)
);
CREATE TABLE Puestos(
	ID_Puestos tinyint primary key auto_increment,
    NumPuesto tinyint,
    Estado BOOLEAN DEFAULT FALSE,
    ID_Sotano tinyint
);
CREATE TABLE Sotano (
	ID_Sotano tinyint primary key auto_increment,
	Nivel Varchar(5)
);

CREATE TABLE Pagos(
	ID_Pagos mediumint primary key auto_increment,
    ValorPago mediumint,
    ID_MetodoPago tinyint,
    ID_Parqueo mediumint
);
CREATE TABLE MetodosPago(
	ID_MetodoPago tinyint primary key auto_increment,
    MetodoPago varchar(15)
);

/*Llaves foraneas de tabla Vehiculos*/
ALTER TABLE Vehiculo
ADD CONSTRAINT FK_Vehiculos_Marca
FOREIGN KEY (ID_Marca) REFERENCES Marca(ID_Marca);
ALTER TABLE Vehiculo
ADD CONSTRAINT FK_Vehiculos_Modelo
FOREIGN KEY (ID_Modelo) REFERENCES Modelo(ID_Modelo);
ALTER TABLE Vehiculo
ADD CONSTRAINT FK_Vehiculos_Color
FOREIGN KEY (ID_Color) REFERENCES Color(ID_Color);
ALTER TABLE Vehiculo
ADD CONSTRAINT FK_Vehiculos_TipoVehiculo
FOREIGN KEY (ID_TipoVehiculo) REFERENCES TipoVehiculo(ID_TipoVehiculo);

/*Llaves foraneas de tabla Parqueo*/
ALTER TABLE Parqueo
ADD CONSTRAINT FK_Parqueo_Puestos
FOREIGN KEY (ID_Puestos) REFERENCES Puestos (ID_Puestos);
ALTER TABLE Parqueo
ADD CONSTRAINT FK_Parqueo_Placa
FOREIGN KEY (ID_Placa) REFERENCES Vehiculo (ID_Placa);

/*Llaves foraneas de tabla pagos*/
ALTER TABLE Pagos
ADD CONSTRAINT FK_Pagos_Metodo
FOREIGN KEY (ID_MetodoPago) REFERENCES MetodosPago (ID_MetodoPago);

/*Llaves foraneas de tabla Puestos*/
ALTER TABLE Puestos
ADD CONSTRAINT FK_Puesto_Sotano
FOREIGN KEY (ID_Sotano) REFERENCES Sotano (ID_Sotano);

#inner join
SELECT vih.ID_Placa, ma.Marca,mo.Modelo,co.Color
FROM Vehiculo as vih
JOIN Marca as ma
ON vih.ID_Marca = ma.ID_Marca
JOIN Modelo as Mo
On vih.ID_Modelo = mo.ID_Modelo
JOIN Color as co
ON vih.ID_Color = co.ID_Color