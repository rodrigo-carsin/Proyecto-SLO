create database slo;

use slo;

create table proveedores(
    id int not null primary key auto_increment,
    cid text not null,
    nombre_compania text not null,
    direccion text not null,
    telefono varchar(15) not null,
    UNIQUE KEY uk_proveedores_cid (cid(255))
);
INSERT INTO `slo`.`proveedores`
(`id`,
`cid`,
`nombre_compania`,
`direccion`,
`telefono`)
VALUES
(1,
"company1",
"company_new",
"calle1",
"1111111");

create table depositos(
    id int not null primary key auto_increment,
    direccion text  not null,
    codigo text not  null,
    capacidad_minima int not null,
    secciones_minimas int not null,
    UNIQUE KEY uk_depositos_codigo (codigo(255))
);
INSERT INTO `slo`.`depositos`
(`id`,
`direccion`,
`codigo`,
`capacidad_minima`,
`secciones_minimas`)
VALUES
(1,
"calle1",
"warehouse1",
10,
1);

CREATE TABLE productos (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	descripcion TEXT NOT NULL,
    codigo TEXT NOT NULL,
	altura DECIMAL(19,2) NOT NULL,
	largo DECIMAL(19,2) NOT NULL,
	peso DECIMAL(19,2) NOT NULL,
	ancho DECIMAL(19,2) NOT NULL,
	id_tipo_producto INT NOT NULL,
	id_proveedor INT NOT NULL,
    UNIQUE KEY uk_productos_codigo (codigo(255)),
	KEY `fk_producto_proveedor` (`id_proveedor`),
	CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`)  ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `slo`.`productos`
(`id`,
`descripcion`,
`codigo`,
`altura`,
`largo`,
`peso`,
`ancho`,
`id_tipo_producto`,
`id_proveedor`)
VALUES
(1,
"producto_nuevo",
"product1",
2.0,
2.0,
2.0,
2.0,
1,
1);

create table secciones(
    id int not null primary key auto_increment,
    numero_seccion INT not null,
    capacidad_minima int not null,
    capacidad_maxima int not null,
    capacidad_actual int not null,
    id_tipo_producto int not null,
    id_deposito INT NOT NULL,
    UNIQUE KEY uk_secciones_numero_seccion (numero_seccion),
    KEY `fk_secciones_deposito`(id_deposito),
    CONSTRAINT `fk_secciones_deposito` FOREIGN KEY (id_deposito) REFERENCES depositos(id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `slo`.`secciones`
(`id`,
`numero_seccion`,
`capacidad_minima`,
`capacidad_maxima`,
`capacidad_actual`,
`id_tipo_producto`,
`id_deposito`)
VALUES
(1,
1,
2,
2,
2,
1,
1);

create table empleados(
    id int not null primary key auto_increment,
    documento text not null,
    nombre text not null,
    apellido text not null,
    id_deposito int not null,
    UNIQUE KEY uk_empleados_documento (documento(255)),
	KEY `fk_empleados_deposito` (`id_deposito`),
	CONSTRAINT `fk_empleados_deposito` FOREIGN KEY (`id_deposito`) REFERENCES `depositos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `slo`.`empleados`
(`id`,
`documento`,
`nombre`,
`apellido`,
`id_deposito`)
VALUES
(1,
"48881110",
"Juan",
"Perez",
1);

create table consumidores(
    id int not null primary key auto_increment,
    documento text not null,
    nombre text not null,
    apellido text not null,
	UNIQUE KEY uk_consumidores_documento (documento(255))
);
INSERT INTO `slo`.`consumidores`
(`id`,
`documento`,
`nombre`,
`apellido`)
VALUES
(1,
1,
"Pedro",
"Gomez");

create table Roles (
idRol int primary key not null,
tipo text not null
);
 insert into Roles (idRol,tipo) values (2,'Basico');

CREATE TABLE usuarios (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre text NOT NULL,
contrasenia TEXT NOT NULL,
  idRol int NOT NULL,
	KEY `fk_usuarios_roles` (`idRol`), 
    CONSTRAINT `fk_usuarios_roles` FOREIGN KEY (`idRol`) REFERENCES `Roles` (`idRol`)  ON DELETE CASCADE ON UPDATE CASCADE
);