use master;
use Restaurante;
create database Restaurante;
/*Primero inicio creando las tablas que no tienen ninguna llave foranea*/
/* Tabla CategoriaEmpleado, CategoriaPlatillo, CategoriaBebida y Mesa */

create table CategoriaEmpleado(
idCategoriaEmpleado int not null  primary key,
Puesto varchar(20));

insert into CategoriaEmpleado values(1, 'Gerente');
insert into CategoriaEmpleado values(2, 'Chef');
insert into CategoriaEmpleado values(3, 'Host');
insert into CategoriaEmpleado values(4, 'Mesero');
insert into CategoriaEmpleado values(5, 'Jefe de Meseros');
insert into CategoriaEmpleado values(6, 'Ayudante Chef');
insert into CategoriaEmpleado values(7, 'Bartender');
insert into CategoriaEmpleado values(8, 'Limpieza');

select*from CategoriaEmpleado;

create table CategoriaPlatillo(
idCategoriaPlatillo int not null  primary key,
Tipo varchar(50));
insert into CategoriaPlatillo values(1, 'Caldo');
insert into CategoriaPlatillo values(2, 'Panes');
insert into CategoriaPlatillo values(3, 'Vegetariano');
insert into CategoriaPlatillo values(4, 'Vegano');
insert into CategoriaPlatillo values(5, 'Carnes');
insert into CategoriaPlatillo values(6, 'Pastas');
insert into CategoriaPlatillo values(7, 'Ensaladas');
insert into CategoriaPlatillo values(8, 'Marscos');

select * from CategoriaPlatillo;


Create table CategoriaBebidas(
idCategoriaBebida int not null  primary key,
Tipo varchar(50));

insert into CategoriaBebidas values(1, 'Frias');
insert into CategoriaBebidas values(2, 'Calientes');
insert into CategoriaBebidas values(3, 'Alcoholicas');
insert into CategoriaBebidas values(4, 'Natural');
insert into CategoriaBebidas values(5, 'Refrescos');
insert into CategoriaBebidas values(6, 'Jugos');

select * from CategoriaBebidas;

Create table Mesas(
#Mesa int not null  primary key,
Mesero int foreign key references Empleados(idEmpleado));

insert into Mesas values(1, 1);
insert into Mesas values(2, 2);
insert into Mesas values(3, 3);
insert into Mesas values(4, 4);
select * from Mesas;


/* Ahora que ya no tenemos tablas sin llaves foraneas, procedemos a crear las demas tablas*/

Create table Empleados (
idEmpleado int not null  primary key,
NombreCompleto varchar (150),
Direccion varchar (200),
Edad char (3),
Sexo char (2),
NivelEstudios varchar (100),
turno char(2),
Puesto int foreign key references CategoriaEmpleado(idCategoriaEmpleado));

insert into Empleados values (1, 'Joaquin Lopez Dorigan', 'Orillita de Oyameles Teziu, pue.', 33, 'M','Lic. Gatronomia', 'M', 1);
insert into Empleados values (2, 'Jose Martin Mendez', 'Ahuateno Teziu, pue.',39, 'M','Bachillerato', 'V',8);
insert into Empleados values (3, 'Guadalupe Lujan', 'Calle Luisiano, Perote .',24,'F', 'Carrera Tecnica', 'M', 7);
insert into Empleados values (4, 'Moira Perez', 'Chowis Teziu, pue.', 28, 'F', 'Lic. Gatronomia', 'M', 1);

select * from Empleados;


create table Platillo(
idPlatillo int not null  primary key,
Nombre varchar (150),
Porcion char (3),
Precio  dec (5,2),
Descripcion text,
Tipo int foreign key references CategoriaPlatillo(idCategoriaPlatillo));

insert into Platillo values(1, 'Mole de olla', 100, 250.99, 'Mole de olla con varios trozos de carne y con tortillas', 1);
insert into Platillo values(2, 'Mole', 100, 260.99, 'Mole con una pieza de pollo y con tortillas', 1);
insert into Platillo values(3, 'Lasaña', 250, 350.99, 'Lasaña clasica con ensalada', 6);
insert into Platillo values(4, 'Corte New York', 200, 450.99, 'El clasico corte New York acompañado de un pure de papas', 5);
insert into Platillo values(5, 'Coctel de Camaron', 100, 150.99, 'Coctel de camaraon con galletas', 8);

select * from Platillo;


create table Bebida(
idBebida int not null  primary key,
Nombre varchar (150),
tamaño char (3),
Precio  dec (5,2),
Descripcion text,
Tipo int foreign key references CategoriaBebidas(idCategoriaBebida));

insert into Bebida values(2, 'Cafe Americano', 'G', 50.99, 'Cafe Americano delicioso', 2);
insert into Bebida values(1, 'Té helado', 'M', 30.99, 'Té helado de canela', 1);
insert into Bebida values(3, 'Ron', 'C', 99.99, 'Ron original', 3);
insert into Bebida values(4, 'Cerveza', 'G', 50.99, 'Cerveza Indio oscura', 3);
insert into Bebida values(5, 'Capuchino', 'G', 80.99, 'Cafe Capuchino espumoso y delicioso', 2);

Select * from Bebida;


Create table Cliente(
idCliente int not null  primary key,
Nombre varchar (100),
Mesa int foreign key references Mesas(#Mesa),
Fecha date,
Hora time);

insert into Cliente values(1, 'Pepe Aguilar', 3, '2022-02-01', '15:17');
insert into Cliente values(102, 'Angela Aguilar', 4, '2022-02-01', '15:17');
insert into Cliente values(11, 'Antonio Mendez', 2, '2022-02-01', '12:17');
insert into Cliente values(2, 'Pablo Alboran', 2, '2022-02-01', '18:17');


Create table Pedidos(
idPedidos int not null primary key,
Bebida int foreign key references Bebida(idBebida),
Platillo int foreign key references Platillo(idPlatillo),
Modalidad char (2),
Fecha date,
Hora time);

insert into Pedidos values(1, 4, 5, 'R', '2022-02-01', '18:17');
insert into Pedidos values(2, 2, 2, 'R', '2022-02-01', '18:17');
insert into Pedidos values(3, 5, 1, 'C', '2022-02-01', '18:17');

create table Venta (
idVenta int not null primary key,
Cliente int foreign key references Cliente(idCliente),
CostosProductos char (6),
iva char(5) not null,
Total char(8) not null);

insert into Venta values(22, 102, 400.99, 16.8, 500);
insert into Venta values(23, 1, 400.99, 16.8, 500);
insert into Venta values(25, 11, 400.99, 16.8, 500);
