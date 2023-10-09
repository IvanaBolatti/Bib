CREATE SCHEMA biblioteca;
USE biblioteca;

CREATE TABLE editorial(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    contacto VARCHAR(50)
);

CREATE TABLE nacionalidad(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(40) NOT NULL
);

CREATE TABLE serie(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL
);

CREATE TABLE tematica(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL
);

CREATE TABLE estado_libro(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL
);

CREATE TABLE autor(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    id_nacionalidad INT NOT NULL,
    FOREIGN KEY (id_nacionalidad) REFERENCES nacionalidad (id)
);

CREATE TABLE ilustrador(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    id_nacionalidad INT NOT NULL,
    FOREIGN KEY (id_nacionalidad) REFERENCES nacionalidad (id)
);

CREATE TABLE lector(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(40) NOT NULL, 
    apellido VARCHAR(40)NOT NULL,
    contacto VARCHAR(50)
);

CREATE TABLE libro(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(40) NOT NULL,
    id_autor INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autor (id),
    id_ilustrador INT NOT NULL,
    FOREIGN KEY (id_ilustrador) REFERENCES ilustrador (id),
    id_editorial INT NOT NULL,
    FOREIGN KEY (id_editorial) REFERENCES editorial (id),
    id_tematica INT NOT NULL,
    FOREIGN KEY (id_tematica) REFERENCES tematica (id),
    id_estado INT NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado_libro (id),
    id_serie INT NOT NULL,
    FOREIGN KEY (id_serie) REFERENCES serie (id),
    detalle VARCHAR(50),
    edad INT
);

CREATE TABLE prestamo (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_libro INT NOT NULL,
FOREIGN KEY (id_libro) REFERENCES libro (id),
id_lector INT NOT NULL,
FOREIGN KEY (id_lector) REFERENCES lector (id),
f_pedido DATE,
f_devolucion DATE,
detalle VARCHAR(60)
);
