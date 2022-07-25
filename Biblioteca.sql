create database Biblioteca;
use Biblioteca;

create table Libro(
idLibro int not null  primary key,
Nombre varchar (50),
Autor varchar(100),
Descripcion Text,
#Paginas char(5),
Editorial varchar (150),
AñoPublicacion char (4));
select * from Libro;
insert into Libro values(1, 'Pedro y el Lobo', 'Mario Velazquez', 
'Las aventuras que Pedro tiene cuando conoce a un lobo y ambos se necesitan en momentos dificiles de sus vidas', 500, 'LaravelEdit', 2022);
insert into Libro values(2, 'Barney', 'Mario Velazquez', 
'Las aventuras que puedes tener con Barney', 100, 'KidEdit', 2020);
insert into Libro values(3, 'Tragedia en Octubre', 'Arturo de la Rosa', 
'La tragica historia que vive un empleado de un hotel cuando su familia muere', 1000, 'VivMX', 2010);

create table Empleado(
idEmpleado int not null primary key, 
Nombre varchar (100),
ApellidosP varchar (50),
ApellidosM varchar (50),
Sexo char (2),
Edad char(3),
Estudios varchar(200),
Turno char(2));

select*from Empleado;

insert into Empleado values(1, 'Angel', 'Zavala', 'Martinez', 'M',  38, 'Bachillerato', 'AM');
insert into Empleado values(2, 'Pedro', 'Fabian', 'Mendes', 'M',  22, 'Bachillerato', 'PM');
insert into Empleado values(3, 'Maria', 'Aburto', 'Lopez', 'M',  20, 'Estudiante', 'AM');

create table Usuario (
idUsuario int not null primary key,
Nombre varchar (100),
ApellidosP varchar (50),
ApellidosM varchar (50),
Sexo char (2),
Edad char(3),
Domicilio varchar(159),
Fecha date);

select * from Usuario;

insert into Usuario values('1','Victor', 'Mendez','Perez', 'M',19, 'Clemente Viveros 4 Teziutlan, Puebla', '2022-07-21');
insert into Usuario values('2','Silvia', 'Hernandez','Casiano', 'M',22, 'Calle Hidalgo #45 Puebla', '2022-08-20');
insert into Usuario values('3','Abraham', 'Castro','Miramontes', 'M',17, 'Colonia Centro calle Miguel Hidalgo Puebla', '2022-06-21');


create table Prestamo(
idPrestamo int not null primary key,
Usuario int foreign key references Usuario(idUsuario),
Libro int foreign key references Libro(idLibro),
Fecha date,
Hora time,
Empleado int foreign key references Empleado(idEmpleado));

select * from Prestamo;

insert into Prestamo values('1', '1', '1', '2022-07-22', '12:51:02', '1');
insert into Prestamo values('2', '2', '2', '2022-07-22', '14:55:02', '2');
insert into Prestamo values('3', '3', '3', '2022-07-22', '15:44:02', '3');
insert into Prestamo values('4', '3', '3', '2022-07-22', '15:44:02', '1');
insert into Prestamo values('5', '2', '2', '2022-07-22', '15:49:02', '1');
insert into Prestamo values('6', '2', '2', '2022-08-29', '15:49:02', '1');


Create table Devolucion (
idDevolucion int not null primary key,
Usuario int foreign key references Usuario(idUsuario),
Libro int foreign key references Libro(idLibro),
FechaPrestamo date,
FechaDevolucion date,
HoraDevolucion time,
Empleado int foreign key references Empleado(idEmpleado));

insert into Devolucion values('1', '1', '1', '2022-07-22', '2022-07-29', '12:51:02', '1');


/*********************************************ALGEBRA RELACIONAL***************************************************************/
/*SELECCION*/
select*from Prestamo where Empleado= 1;

/*PROYECCIÓN*/
select Usuario, Libro, FechaDevolucion, Empleado from Devolucion;


/*UNION*/
select * from Prestamo where Empleado =1 union select*from Prestamo where Fecha = '2022-07-21' 
union select*from Prestamo where Fecha = '2022-07-21';

/*DIFERENCIA*/
select distinct Usuario, Empleado from Prestamo where Fecha ='2022-07-22' 
except
select distinct Usuario, Empleado from Prestamo where Fecha ='2022-08-29' 


/*INTERSECCION*/
select distinct Nombre, apellidoPat from Cliente where Nombre ='Gabriela' and apellidoPat = 'Hernandez'
intersect select distinct Nombre, apellidoPat from Cliente where Nombre ='Pepe' and apellidoPat = 'Peres';


/*PRODUCTO CARTESIANO*/
select * from Prestamo, Devolucion;

select nombre, Libro from Libro, Devolucion;

/*JOIN*/
select Nombre, Autor, FechaPrestamo from Libro
inner join Devolucion on idDevolucion = idDevolucion;
 

/*FUNCIONES DE AGREGACION*/
select Libro, count() as #Productos from Venta group by IdVenta;

/*********************************************ALGEBRA RELACIONAL***************************************************************/
