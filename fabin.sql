
CREATE TABLE proveedor (
                id_proveedor INT AUTO_INCREMENT NOT NULL,
                Nombre_proveedor VARCHAR(50) NOT NULL,
                Empresa VARCHAR(50) NOT NULL,
                direccion VARCHAR(50) NOT NULL,
                email VARCHAR(50) NOT NULL,
                telefono VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_proveedor)
);


CREATE TABLE unidad_medida (
                id_unidad_medida INT AUTO_INCREMENT NOT NULL,
                descripcion VARCHAR(30) NOT NULL,
                descripcion_larga VARCHAR(30) NOT NULL,
                activo TINYINT DEFAULT 1 NOT NULL,
                PRIMARY KEY (id_unidad_medida)
);


CREATE TABLE tipos_de_precio (
                id_tipo_precio INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                descripcion_larga VARCHAR(30) NOT NULL,
                activo TINYINT DEFAULT 1 NOT NULL,
                PRIMARY KEY (id_tipo_precio)
);


CREATE TABLE tipo_forma_de_pago (
                id_tipo_forma_de_pago INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                PRIMARY KEY (id_tipo_forma_de_pago)
);


CREATE TABLE porcentaje_impuesto (
                id_impiuesto INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                porcentaje DECIMAL(8,5) NOT NULL,
                activo TINYINT DEFAULT 1 NOT NULL,
                PRIMARY KEY (id_impiuesto)
);


CREATE TABLE nivel_usuario (
                id_usuario_tipo_usuario INT AUTO_INCREMENT NOT NULL,
                descripcion VARCHAR(30) NOT NULL,
                PRIMARY KEY (id_usuario_tipo_usuario)
);


CREATE TABLE usuarios (
                id_usuario INT AUTO_INCREMENT NOT NULL,
                id_usuario_tipo_usuario INT NOT NULL,
                email VARCHAR(30) NOT NULL,
                contrasenha VARCHAR(30) NOT NULL,
                activo TINYINT DEFAULT 1 NOT NULL,
                fecha_creacion VARCHAR(30) NOT NULL,
                fecha_actualizacion VARCHAR(30) NOT NULL,
                PRIMARY KEY (id_usuario)
);


CREATE INDEX nivel_usuario_usuarios_fk USING BTREE
 ON usuarios
 ( id_usuario_tipo_usuario ASC );

CREATE UNIQUE INDEX usuarios_idx
 ON usuarios
 ( email );

CREATE TABLE formas_de_pago (
                id_forma_de_pago INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                id_tipo_forma_de_pago INT NOT NULL,
                descripcion_larga VARCHAR(30) NOT NULL,
                activo TINYINT DEFAULT 1 NOT NULL,
                PRIMARY KEY (id_forma_de_pago)
);


CREATE INDEX tipo_forma_de_pago_formas_de_pago_fk USING BTREE
 ON formas_de_pago
 ( id_tipo_forma_de_pago ASC );

CREATE TABLE estatus (
                id_estatus INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                PRIMARY KEY (id_estatus)
);


CREATE TABLE cliente (
                Id_cliente INT AUTO_INCREMENT NOT NULL,
                id_usuario INT NOT NULL,
                razon_social VARCHAR(30) NOT NULL,
                Nombre VARCHAR(30) NOT NULL,
                telefon VARCHAR(30) NOT NULL,
                direccion_fiscal VARCHAR(30) NOT NULL,
                PRIMARY KEY (Id_cliente)
);


CREATE INDEX usuarios_cliente_fk USING BTREE
 ON cliente
 ( id_usuario ASC );

CREATE TABLE ventas (
                id_venta INT AUTO_INCREMENT NOT NULL,
                Id_cliente INT NOT NULL,
                id_estatus INT NOT NULL,
                id_forma_de_pago INT NOT NULL,
                fecha_venta DATETIME NOT NULL,
                PRIMARY KEY (id_venta)
);


CREATE INDEX formas_de_pago_ventas_fk USING BTREE
 ON ventas
 ( id_forma_de_pago ASC );

CREATE INDEX estatus_ventas_fk USING BTREE
 ON ventas
 ( id_estatus ASC );

CREATE INDEX cliente_ventas_fk USING BTREE
 ON ventas
 ( Id_cliente ASC );

CREATE TABLE categoria_articulo (
                Id_categoria INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                descripcion_larga VARCHAR(30) NOT NULL,
                activo TINYINT DEFAULT 1 NOT NULL,
                PRIMARY KEY (Id_categoria)
);


CREATE TABLE articulos (
                id_articulo INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                activo TINYINT DEFAULT 1 NOT NULL,
                PRIMARY KEY (id_articulo)
);


CREATE UNIQUE INDEX articulos_idx USING BTREE
 ON articulos
 ( nombre ASC );

CREATE TABLE proveedor_articulos (
                id_articulo_proveedor INT AUTO_INCREMENT NOT NULL,
                id_articulo INT NOT NULL,
                id_proveedor INT NOT NULL,
                id_impiuesto INT NOT NULL,
                id_unidad_medida INT NOT NULL,
                Id_categoria INT NOT NULL,
                PRIMARY KEY (id_articulo_proveedor)
);


CREATE TABLE stock (
                id_stock INT AUTO_INCREMENT NOT NULL,
                cantidad VARCHAR(30) NOT NULL,
                activo TINYINT DEFAULT 1 NOT NULL,
                fecha_agregado DATETIME NOT NULL,
                id_articulo_proveedor INT NOT NULL,
                PRIMARY KEY (id_stock)
);


CREATE TABLE precios (
                id_precio INT AUTO_INCREMENT NOT NULL,
                id_tipo_precio INT NOT NULL,
                id_stock INT NOT NULL,
                precio DECIMAL(24,5) NOT NULL,
                PRIMARY KEY (id_precio)
);


CREATE UNIQUE INDEX precios_idx USING BTREE
 ON precios
 ( id_stock ASC, precio ASC );

CREATE TABLE ventas_detalles (
                id_stock INT AUTO_INCREMENT NOT NULL,
                id_precio INT NOT NULL,
                id_venta INT NOT NULL,
                cantidad INT NOT NULL,
                precio_unitario DECIMAL(21,2) NOT NULL,
                precio_unitario_con_impuesto DECIMAL(21,2) NOT NULL,
                PRIMARY KEY (id_stock)
);


CREATE INDEX ventas_ventas_detalles_fk USING BTREE
 ON ventas_detalles
 ( id_venta ASC );

CREATE TABLE acciones (
                id_accion INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                descrjipcion VARCHAR(30) NOT NULL,
                PRIMARY KEY (id_accion)
);


CREATE TABLE auditorias (
                id_auditoria INT AUTO_INCREMENT NOT NULL,
                fecha_acceso VARCHAR(30) NOT NULL,
                id_accion INT NOT NULL,
                id_usuario INT NOT NULL,
                PRIMARY KEY (id_auditoria)
);


CREATE UNIQUE INDEX auditorias_idx USING BTREE
 ON auditorias
 ( fecha_acceso ASC );

CREATE INDEX acciones_auditorias_fk USING BTREE
 ON auditorias
 ( id_accion ASC );

CREATE INDEX usuarios_auditorias_fk USING BTREE
 ON auditorias
 ( id_usuario ASC );

ALTER TABLE proveedor_articulos ADD CONSTRAINT proveedor_proveedor_articulos_fk
FOREIGN KEY (id_proveedor)
REFERENCES proveedor (id_proveedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE proveedor_articulos ADD CONSTRAINT unidad_medida_proveedor_articulos_fk
FOREIGN KEY (id_unidad_medida)
REFERENCES unidad_medida (id_unidad_medida)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE precios ADD CONSTRAINT tipos_de_precio_precios_fk
FOREIGN KEY (id_tipo_precio)
REFERENCES tipos_de_precio (id_tipo_precio)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE formas_de_pago ADD CONSTRAINT tipo_forma_de_pago_formas_de_pago_fk
FOREIGN KEY (id_tipo_forma_de_pago)
REFERENCES tipo_forma_de_pago (id_tipo_forma_de_pago)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE proveedor_articulos ADD CONSTRAINT porcentaje_impuesto_proveedor_articulos_fk
FOREIGN KEY (id_impiuesto)
REFERENCES porcentaje_impuesto (id_impiuesto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE usuarios ADD CONSTRAINT nivel_usuario_usuarios_fk
FOREIGN KEY (id_usuario_tipo_usuario)
REFERENCES nivel_usuario (id_usuario_tipo_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE auditorias ADD CONSTRAINT usuarios_auditorias_fk
FOREIGN KEY (id_usuario)
REFERENCES usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cliente ADD CONSTRAINT usuarios_cliente_fk
FOREIGN KEY (id_usuario)
REFERENCES usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ventas ADD CONSTRAINT formas_de_pago_ventas_fk
FOREIGN KEY (id_forma_de_pago)
REFERENCES formas_de_pago (id_forma_de_pago)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ventas ADD CONSTRAINT estatus_ventas_fk
FOREIGN KEY (id_estatus)
REFERENCES estatus (id_estatus)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ventas ADD CONSTRAINT cliente_ventas_fk
FOREIGN KEY (Id_cliente)
REFERENCES cliente (Id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ventas_detalles ADD CONSTRAINT ventas_ventas_detalles_fk
FOREIGN KEY (id_venta)
REFERENCES ventas (id_venta)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE proveedor_articulos ADD CONSTRAINT categoria_articulo_proveedor_articulos_fk
FOREIGN KEY (Id_categoria)
REFERENCES categoria_articulo (Id_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE proveedor_articulos ADD CONSTRAINT articulos_proveedor_articulos_fk
FOREIGN KEY (id_articulo)
REFERENCES articulos (id_articulo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE stock ADD CONSTRAINT proveedor_articulos_stock_fk
FOREIGN KEY (id_articulo_proveedor)
REFERENCES proveedor_articulos (id_articulo_proveedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE precios ADD CONSTRAINT stock_precios_fk
FOREIGN KEY (id_stock)
REFERENCES stock (id_stock)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ventas_detalles ADD CONSTRAINT precios_ventas_detalles_fk
FOREIGN KEY (id_precio)
REFERENCES precios (id_precio)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE auditorias ADD CONSTRAINT acciones_auditorias_fk
FOREIGN KEY (id_accion)
REFERENCES acciones (id_accion)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
