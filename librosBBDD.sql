CREATE TABLE IF NOT EXISTS Socios(
	DNI character varying(9) NOT NULL,
	DNI_Avalista character varying(9) NOT NULL,
	id_poblacion int NOT NULL,
	nombre character varying(40) NOT NULL,
	apellido character varying(40) NOT NULL,
	telefono character varying(9) NOT NULL,
	CONSTRAINT PK_socio PRIMARY KEY(DNI),
	
);

CREATE SEQUENCE cont_id_pedido;
CREATE TABLE IF NOT EXISTS Pedidos(
	id_pedido int DEFAULT nextval('cont_id_pedido') NOT NULL,
	DNI character varying(9) NOT NULL,
	envio character varying(20) NOT NULL,
	pago character varying(20) NOT NULL,
	CONSTRAINT PK_pedido PRIMARY KEY(id_pedido,DNI)
);

CREATE SEQUENCE cont_detallePedido_id;
CREATE TABLE IF NOT EXISTS detallesPedido(
	id_detalle int DEFAULT nextval('cont_detallePedido_id') NOT NULL,
	id_pedido int NOT NULL,
	DNI character varying(9) NOT NULL,
	isbn character varying(13) NOT NULL,
	cantidad int NOT NULL,
    CONSTRAINT PK_detalle PRIMARY KEY(id_detalle),
);

CREATE SEQUENCE cont_id_coleccion;
CREATE TABLE IF NOT EXISTS Colecciones(
	id_coleccion int NOT NULL DEFAULT nextval('cont_id_coleccion;') ,
	volumenes int NOT NULL,
    -- Crear clave primaria
	CONSTRAINT PK_coleccion PRIMARY KEY(id_coleccion)
);

CREATE TABLE IF NOT EXISTS Libros(
	ISBN character(13) NOT NULL,
	id_coleccion int NOT NULL,
	editorial character varying(30) NOT NULL,
	autor character varying(30) NOT NULL,
    -- Crear clave primaria
	CONSTRAINT PK_libro PRIMARY KEY(ISBN),
    -- Crear clave foránea
	CONSTRAINT FK_libro_coleccion FOREIGN KEY(id_coleccion)
	REFERENCES Colecciones(id_coleccion)
);

CREATE SEQUENCE cont_almacen_id;
CREATE TABLE IF NOT EXISTS Almacenes(
	id_almacen int NOT NULL DEFAULT nextval('cont_almacen_id'),
	id_provincia int NOT NULL,
	fecha date NOT NULL,
	direccion character varying(40) NOT NULL,
    -- Crear clave primaria
	CONSTRAINT PK_almacen PRIMARY KEY(id_almacen),
    -- Crear clave foránea
	CONSTRAINT FK_almacen_provincia FOREIGN KEY(id_provincia)
	REFERENCES Provincias(id_provincia)
);


CREATE TABLE IF NOT EXISTS Almacen_libros(
	id_almacen int NOT NULL,
	isbn character varying(13) NOT NULL,
	cantidad int NOT NULL,
	CONSTRAINT FK_almacen_libro_almacen FOREIGN KEY(id_almacen)
	REFERENCES Almacenes(id_almacen),
	CONSTRAINT FK_almacen_libro_libro FOREIGN KEY(ISBN)
	REFERENCES Libros(ISBN),
	CONSTRAINT PK_almacen_libros PRIMARY KEY(id_almacen,ISBN)
);


CREATE SEQUENCE cont_poblacion_id;
CREATE TABLE IF NOT EXISTS Poblaciones(
	id_poblacion int NOT NULL DEFAULT nextval('cont_poblacion_id') ,
	id_provincia int NOT NULL,
	habitantes int NOT NULL,
	CONSTRAINT PK_poblacion PRIMARY KEY(id_poblacion),
	CONSTRAINT FK_poblacion_provincia FOREIGN KEY(id_provincia)
	REFERENCES Provincias(id_provincia)
);

UPDATE TABLE IF EXISTS Socios
    ADD CONSTRAINT FK_socio_poblacion FOREIGN KEY(id_poblacion)
	REFERENCES Poblaciones(id_poblacion),
	CONSTRAINT FK_socio_socio FOREIGN KEY(DNI_socio)
	REFERENCES Socios(DNI);
UPDATE TABLE IF EXISTS Pedidos
    CONSTRAINT FK_detalle_pedido FOREIGN KEY(id_pedido, DNI)
	REFERENCES Pedidos(id_pedido,DNI),
	CONSTRAINT FK_detalleCONSTRAINT pk_pedido PRIMARY KEY(id_pedido,dni)_libro FOREIGN KEY(ISBN)
	REFERENCES Libros(ISBN)
UPDATE TABLE IF EXISTS detallesPedido
    ADD CONSTRAINT FK_detalle_pedido FOREIGN KEY(id_pedido)
    REFERENCES Pedidos(id_pedido);
UPDATE TABLE IF EXISTS detallesPedido
    ADD CONSTRAINT FK_detalle_libro FOREIGN KEY(ISBN)
    REFERENCES Libros(ISBN);
UPDATE TABLE IF EXISTS Libros
    ADD CONSTRAINT FK_libro_coleccion FOREIGN KEY(id_coleccion)
    REFERENCES Colecciones(id_coleccion);
UPDATE TABLE IF EXISTS Almacenes
    ADD CONSTRAINT FK_almacen_provincia FOREIGN KEY(id_provincia)
    REFERENCES Provincias(id_provincia);
UPDATE TABLE IF EXISTS Almacen_libros
    ADD CONSTRAINT FK_almacen_libro_almacen FOREIGN KEY(id_almacen