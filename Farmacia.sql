create database farmacia;
use farmacia;

/*agregar la columna tipoMedicamento osea si es generico o de patente*/
alter table Medicamento add tipoMedicamento varchar(2);

/*Eliminar la columna descuento*/
ALTER TABLE Medicamento DROP COLUMN descuento;

create table medicamento(
idCodigo int not null  primary key,
nombre varchar (45) not null,
precio dec (5,2) not null,
caducidad date,
descuento dec (5,2) not null,
tipoConsumo varchar (45),
descripcion text);

select * from medicamento;

insert into medicamento values (101, 'Naproxeno', 60.50, '2022-11-02', 35.20, 'ingerible', 'Tomar una tableta cada 8 hrs por 1 mes');
insert into medicamento values (102, 'Naproxeno', 60.50, '2025-11-02', 35.20, 'ingerible', 'Tomar una tableta cada 8 hrs por 1 mes');
insert into medicamento values (103, 'Paracetamol', 45.90, '2021-10-03', 26.80, 'ingerible', 'Tomar una tableta cada 12 hrs por 15 dias');
insert into medicamento values (104, 'Ambroxol', 150.55, '2022-12-24', 30.86, 'bebible', 'Tomar una 10 ml cada 8 hrs por 1 semana');

/*Elimina solo los registros de la tabla medicamento que digan 'Naproxeno'*/
delete from medicamento where nombre = 'Naproxeno';

/*Agregar 2 registros a la tabla Medicamento con las nuevas columnas*/
insert into medicamento values (105, 'Ibuprofeno', 79.99, '2025-11-19', 'Ingerible', 'Tomar una tableta cada 12 hrs por 15 dias', 'Pa');

/*Agregar la columna TipoEnvase osea si es caja, frasco, etc*/
alter table Categoria add TipoEnvase varchar(55);

create table Categoria(
idCat int not null  primary key,
nombre varchar (45) not null,
descripcion text);

select * from Categoria;

insert into Categoria values (01, 'Tableta', 'caja');
/*Agregar 3 registros en la tabla Catergoria con las nuevas columnas*/
insert into Categoria values (02, 'Jarabe', 'Jarabe para la tos de alta demanda, tomar cada 8h', 'caja');
insert into Categoria values (03, 'Tableta', 'Tomar cada 18 horas en ayunas', 'Frasco');
insert into Categoria values (04, 'Ampolleta', 'Aplicar en la zona afectada', 'Caja');


/*agregar las columnas apellidopaterno, apellidomaterno, fechaNacimiento, telefono, tipoPuesto, TiempoContratado*/
alter table Empleado add apellidopaterno varchar(55);
alter table Empleado add apellidomaterno varchar(55);
alter table Empleado add fechaNacimiento date;
alter table Empleado add telefono char(10);
alter table Empleado add tipoPuesto varchar(55);
alter table Empleado add TiempoContratado char(2);


create table Empleado(
idEmp int not null primary key,
nombre varchar (45) not null,
edad char (2),
sexo char (2),
salario dec (5,2) not null);

/*Se Cambio la columna salario a decimas de (10,2)*/
alter table Empleado alter column salario dec (10,2) not null;

select * from Empleado;
insert Empleado values (1, 'Jose Luis', 36, 'M', 1200.50);
insert Empleado values (2, 'Tania', 29, 'F', 1300.90);

/*Agregar 5 registros a la tabla Empleado con los nuevos atributos*/
insert Empleado values (3, 'Jose Luis', 36, 'M', 1200.50, 'Hernandez', 'Mendez', '1998-08-12',2311101453,'Gerente', 10);
insert Empleado values (4, 'Jose Arturo', 29, 'M', 1100.50, 'Hernandez', 'Casiano', '1970-05-15',2281101453,'Asistente', 5);
insert Empleado values (5, 'John Mike', 30, 'M', 1000.50, 'Perez', 'Pablo', '1989-09-12',2311501455,'Trabajador', 2);
insert Empleado values (6, 'Pepe Luis', 39, 'M', 1100.50, 'De la Cruz', 'Martinez', '1990-02-01',2221101453,'Veelador', 8);
insert Empleado values (7, 'Lois', 27, 'F', 1150.50, 'Kent', 'Lane', '1995-07-12',2311404453,'Cajera', 2);


/*Agregar las columnas direccion, RFC*/
alter table Cliente add direccion varchar(200);
alter table Cliente add RFC varchar(13);

create table Cliente(
idCli int not null primary key,
nombre varchar (45) not null,
apellidoPat varchar (45) not null,
apellidoMat varchar (45) not null,
email varchar (40)not null,
telefono numeric (12) not null);

select * from Cliente;
insert Cliente values (1002, 'Gabriel', 'Hernan', 'Gomez', 'GabH25@gmail.com', 2313684422);
/*Agregar 3 registros a la tabla Cliente con los nuevos atributos*/
insert Cliente values (1003, 'Gabriela', 'Hernandez', 'Gomeza', 'GabaassH25@gmail.com', 2223684422, 'Enrique Segoviano', 'VECJ8');
insert Cliente values (1004, 'Pepe', 'Luis', 'Peres', 'AlosassH25@gmail.com', 2263684422, 'Xiutetelco Puebla', 'KikECJ008');
insert Cliente values (1005, 'Alondra', 'Martinez', 'Kiko', 'KikirrinassH25@gmail.com', 2263684422, 'Teziutlan Puebla', 'PECJ80202');

/*Crear una tabla Venta donde se relaciones con medicamento, cliente, empleado, agregando las columnas  fecha, hora,cantidad, precio unitario,  monto subtotal, iva, total, */
create table Venta(
IdVenta int not null primary key,
Producto int foreign key references medicamento(Idcodigo),
NombreCliente int foreign key references Cliente(idCli),
NombreEmpleado int foreign key references Empleado(idEmp),
Fecha date,
Hora time,
PrecioUnitario dec (5,2),
Cantidad dec (5,2),
MontoSubtotal dec(5,2),
iva dec(5,2) not null,
Total dec(5,3) not null);

select*from Venta;

/*Agregar 3 registros en la tabla Venta*/
insert Venta values(1,103,1005,6,'2022-02-01', '15:17:88', 100, 40.60, 20.00, 15, 60.60); 
insert Venta values(2,104,1004,5,'2022-03-04', '12:10:33', 100, 40.60, 20.00, 15, 60.60); 
insert Venta values(3,104,1003,4,'2022-11-15', '17:18:22', 100, 40.60, 20.00, 15, 60.60); 

/*crear una tabla llamada "Existencia" donde este relacionada con medicamento, categoria y que lleve los atributos fecha, hora, cantidad, precioCompra, PrecioVenta, tipoPago y descripcion*/
create table Existencia(
IdExistencia int not null primary key,
Medicamento int foreign key references medicamento(Idcodigo),
Categoria int foreign key references Categoria(idcat),
Fecha date,
Hora time,
Cantidad char (5),
PrecioCompra dec (5,2),
PrecioVenta dec (5,2),
tipoPago varchar(50),
Descripcion text);

select*from Existencia;
/*Agregar 5 registros en la tabla Existencia*/
insert Existencia values(1,104,02,'2022-11-15', '17:18', 120, 80.90, 110.0, 'Efectivo', 'Producto en buen estado');
insert Existencia values(2,104,02,'2022-12-12', '13:13', 140, 90.90, 110.0, 'Efectivo', 'Producto en buen estado');
insert Existencia values(3,103,02,'2022-08-13', '12:16', 180, 50.90, 180.0, 'Efectivo', 'Producto en buen estado');


/*Crear Diagrama de base de datos y convertirla en PDF, posteriormente subir el script y diagrama a plataforma*/