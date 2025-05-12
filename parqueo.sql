DROP DATABASE IF EXISTS Parqueadero;
CREATE DATABASE Parqueadero;
USE Parqueadero;

CREATE TABLE  Marca(
	ID_Marca tinyint,
    Marca varchar(20)
);
CREATE TABLE Modelo(
	ID_Modelo smallint,
    Modelo smallint
);
CREATE TABLE Color(
	ID_Color tinyint,
    Color varchar(12)
);
CREATE TABLE TipoVehiculo(
	ID_TipoVehiculo tinyint,
    TipoVehiculo varchar(12)
);
CREATE TABLE Vehiculo(
	ID_Placa varchar(12),
    ID_Marca tinyint,
    ID_Modelo smallint,
    ID_Color tinyint,
    ID_TipoVehiculo tinyint
);
CREATE TABLE Parqueo(
	ID_Parqueo mediumint,
    FechaLlegada datetime,
    FechaSalida datetime
);