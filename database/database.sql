CREATE DATABASE IF NOT EXISTS laurizos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE laurizos;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS pagos;
DROP TABLE IF EXISTS detalle_pedidos;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS favoritos;
DROP TABLE IF EXISTS imagenes_productos;
DROP TABLE IF EXISTS variaciones_productos;
DROP TABLE IF EXISTS inventario;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS direcciones;
DROP TABLE IF EXISTS subcategorias;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS proveedores;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS carrito_items;
DROP TABLE IF EXISTS carritos;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE roles (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150) NULL,
    permisos JSON NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE usuarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    rol_id INT UNSIGNED NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(30) NULL,
    password_hash VARCHAR(255) NOT NULL,
    estado ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_usuarios_rol (rol_id),
    CONSTRAINT fk_usuarios_roles FOREIGN KEY (rol_id) REFERENCES roles(id)
) ENGINE=InnoDB;

CREATE TABLE categorias (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(120) NOT NULL UNIQUE,
    descripcion VARCHAR(255) NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE subcategorias (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT UNSIGNED NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    slug VARCHAR(120) NOT NULL UNIQUE,
    descripcion VARCHAR(255) NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_subcategorias_categoria (categoria_id),
    CONSTRAINT fk_subcategorias_categorias FOREIGN KEY (categoria_id) REFERENCES categorias(id)
) ENGINE=InnoDB;

CREATE TABLE proveedores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    email VARCHAR(150) NULL,
    telefono VARCHAR(30) NULL,
    direccion VARCHAR(255) NULL,
    estado ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE productos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT UNSIGNED NOT NULL,
    subcategoria_id INT UNSIGNED NOT NULL,
    proveedor_id INT UNSIGNED NULL,
    sku VARCHAR(60) NOT NULL UNIQUE,
    nombre VARCHAR(150) NOT NULL,
    slug VARCHAR(170) NOT NULL UNIQUE,
    descripcion TEXT NOT NULL,
    precio_compra DECIMAL(12,2) NOT NULL DEFAULT 0,
    precio_venta DECIMAL(12,2) NOT NULL DEFAULT 0,
    stock_minimo INT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('activo','agotado','inactivo') NOT NULL DEFAULT 'activo',
    marca VARCHAR(120) NULL,
    etiquetas VARCHAR(255) NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_productos_categoria (categoria_id),
    INDEX idx_productos_subcategoria (subcategoria_id),
    INDEX idx_productos_proveedor (proveedor_id),
    CONSTRAINT fk_productos_categorias FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    CONSTRAINT fk_productos_subcategorias FOREIGN KEY (subcategoria_id) REFERENCES subcategorias(id),
    CONSTRAINT fk_productos_proveedores FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
) ENGINE=InnoDB;

CREATE TABLE variaciones_productos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    producto_id INT UNSIGNED NOT NULL,
    codigo_variacion VARCHAR(80) NOT NULL UNIQUE,
    color VARCHAR(60) NULL,
    talla VARCHAR(60) NULL,
    modelo VARCHAR(80) NULL,
    valor_extra DECIMAL(12,2) NOT NULL DEFAULT 0,
    stock INT UNSIGNED NOT NULL DEFAULT 0,
    activo TINYINT(1) NOT NULL DEFAULT 1,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_variaciones_producto (producto_id),
    CONSTRAINT fk_variaciones_productos FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE imagenes_productos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    producto_id INT UNSIGNED NOT NULL,
    ruta VARCHAR(255) NOT NULL,
    titulo VARCHAR(120) NULL,
    alt_text VARCHAR(160) NULL,
    es_principal TINYINT(1) NOT NULL DEFAULT 0,
    orden INT UNSIGNED NOT NULL DEFAULT 0,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_imagenes_producto (producto_id),
    CONSTRAINT fk_imagenes_productos FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE inventario (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    producto_id INT UNSIGNED NOT NULL UNIQUE,
    cantidad_disponible INT UNSIGNED NOT NULL DEFAULT 0,
    reservado INT UNSIGNED NOT NULL DEFAULT 0,
    punto_reorden INT UNSIGNED NOT NULL DEFAULT 0,
    ultima_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_inventario_productos FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE direcciones (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED NOT NULL,
    alias VARCHAR(80) NOT NULL,
    destinatario VARCHAR(140) NOT NULL,
    telefono VARCHAR(30) NULL,
    pais VARCHAR(80) NOT NULL,
    estado_region VARCHAR(80) NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    municipio VARCHAR(80) NULL,
    direccion1 VARCHAR(200) NOT NULL,
    direccion2 VARCHAR(200) NULL,
    codigo_postal VARCHAR(20) NULL,
    es_principal TINYINT(1) NOT NULL DEFAULT 0,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_direcciones_usuario (usuario_id),
    CONSTRAINT fk_direcciones_usuarios FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE carritos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED NOT NULL,
    estado ENUM('activo','convertido','abandonado') NOT NULL DEFAULT 'activo',
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_carritos_usuario (usuario_id),
    CONSTRAINT fk_carritos_usuarios FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE carrito_items (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    carrito_id INT UNSIGNED NOT NULL,
    producto_id INT UNSIGNED NOT NULL,
    variacion_id INT UNSIGNED NULL,
    cantidad INT UNSIGNED NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(12,2) NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_carrito_items_carrito (carrito_id),
    INDEX idx_carrito_items_producto (producto_id),
    CONSTRAINT fk_carrito_items_carritos FOREIGN KEY (carrito_id) REFERENCES carritos(id) ON DELETE CASCADE,
    CONSTRAINT fk_carrito_items_productos FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    CONSTRAINT fk_carrito_items_variaciones FOREIGN KEY (variacion_id) REFERENCES variaciones_productos(id) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE pedidos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED NOT NULL,
    direccion_id INT UNSIGNED NOT NULL,
    numero_pedido VARCHAR(40) NOT NULL UNIQUE,
    estado ENUM('pendiente','pagado','enviado','completado','cancelado') NOT NULL DEFAULT 'pendiente',
    subtotal DECIMAL(12,2) NOT NULL DEFAULT 0,
    impuestos DECIMAL(12,2) NOT NULL DEFAULT 0,
    costo_envio DECIMAL(12,2) NOT NULL DEFAULT 0,
    total DECIMAL(12,2) NOT NULL DEFAULT 0,
    metodo_pago VARCHAR(50) NOT NULL,
    notas TEXT NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_pedidos_usuario (usuario_id),
    INDEX idx_pedidos_direccion (direccion_id),
    CONSTRAINT fk_pedidos_usuarios FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    CONSTRAINT fk_pedidos_direcciones FOREIGN KEY (direccion_id) REFERENCES direcciones(id)
) ENGINE=InnoDB;

CREATE TABLE detalle_pedidos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT UNSIGNED NOT NULL,
    producto_id INT UNSIGNED NOT NULL,
    variacion_id INT UNSIGNED NULL,
    sku_snapshot VARCHAR(60) NOT NULL,
    nombre_snapshot VARCHAR(150) NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    precio_unitario DECIMAL(12,2) NOT NULL,
    total_linea DECIMAL(12,2) NOT NULL,
    INDEX idx_detalle_pedido (pedido_id),
    CONSTRAINT fk_detalle_pedidos_pedidos FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    CONSTRAINT fk_detalle_pedidos_productos FOREIGN KEY (producto_id) REFERENCES productos(id),
    CONSTRAINT fk_detalle_pedidos_variaciones FOREIGN KEY (variacion_id) REFERENCES variaciones_productos(id) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE favoritos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED NOT NULL,
    producto_id INT UNSIGNED NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_favoritos_usuario_producto (usuario_id, producto_id),
    CONSTRAINT fk_favoritos_usuarios FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_favoritos_productos FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE pagos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT UNSIGNED NOT NULL UNIQUE,
    referencia VARCHAR(80) NOT NULL,
    metodo VARCHAR(50) NOT NULL,
    monto DECIMAL(12,2) NOT NULL,
    moneda CHAR(3) NOT NULL DEFAULT 'COP',
    estado ENUM('pendiente','aprobado','rechazado','reembolsado') NOT NULL DEFAULT 'pendiente',
    transaccion VARCHAR(120) NULL,
    fecha_pago DATETIME NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_pagos_pedidos FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE
) ENGINE=InnoDB;