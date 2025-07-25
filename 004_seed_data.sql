-- 005_seed_data.sql
-- ---------------------------------------------------
-- Reto 03: Datos semilla para Usuario, Comerciante y Establecimiento
-- ---------------------------------------------------

-- 1) USUARIOS (2 registros, uno por cada rol)
INSERT INTO usuario (
  id_usuario, nombre, correo_electronico, contrasena, rol
) VALUES (
  NULL,
  'María Gómez',
  'maria.gomez@bussines.com',
  'G0mez$ecure!',
  'ADMINISTRADOR'
);

INSERT INTO usuario (
  id_usuario, nombre, correo_electronico, contrasena, rol
) VALUES (
  NULL,
  'Juan Pérez',
  'juan.perez@bussines.com',
  'Perez12345!',
  'AUXILIAR_REGISTRO'
);

-- 2) COMERCIANTES (5 registros)
INSERT INTO comerciante (
  id_comerciante, nombre_razon_social, municipio, telefono, correo_electronico, estado
) VALUES (
  NULL,
  'Comercial Sol Naciente',
  'Medellín',
  '3101234567',
  'csl@comercio.com',
  'ACTIVO'
);

INSERT INTO comerciante (id_comerciante, nombre_razon_social, municipio, telefono, correo_electronico, estado)
VALUES (NULL, 'Distribuciones La Luna', 'Bogotá', '3007654321', 'laluna@distrib.com', 'ACTIVO');

INSERT INTO comerciante (id_comerciante, nombre_razon_social, municipio, telefono, correo_electronico, estado)
VALUES (NULL, 'Importadora El Río', 'Cali', '3125557788', 'elrio@import.com', 'ACTIVO');

INSERT INTO comerciante (id_comerciante, nombre_razon_social, municipio, telefono, correo_electronico, estado)
VALUES (NULL, 'Supermercado Central', 'Barranquilla', '3159876543', 'central@super.com', 'ACTIVO');

INSERT INTO comerciante (id_comerciante, nombre_razon_social, municipio, telefono, correo_electronico, estado)
VALUES (NULL, 'Ferretería Monterrey', 'Bucaramanga', '3142223344', 'monterrey@ferre.com', 'ACTIVO');

-- 3) ESTABLECIMIENTOS (10 registros, asignados aleatoriamente)

INSERT INTO establecimiento (
  id_establecimiento, nombre_establecimiento, ingresos, num_empleados, id_comerciante
) VALUES (NULL, 'Tienda La Esquina',    12500.75,  5, 1);

INSERT INTO establecimiento VALUES (NULL, 'Bazar Horizonte',    9800.00,   3, 1);

INSERT INTO establecimiento VALUES (NULL, 'Distribuciones 24/7',15000.20,  6, 2);

INSERT INTO establecimiento VALUES (NULL, 'Punto La Luna',       8700.50,   2, 2);

INSERT INTO establecimiento VALUES (NULL, 'Ramal El Río',        13200.00,  4, 3);

INSERT INTO establecimiento VALUES (NULL, 'Outlet Río Vivo',     7650.30,   3, 3);

INSERT INTO establecimiento VALUES (NULL, 'Central MiniMarket', 21000.00,  8, 4);

INSERT INTO establecimiento VALUES (NULL, 'Central Express',     15900.90,  5, 4);

INSERT INTO establecimiento VALUES (NULL, 'FerrePunto',          4600.00,   2, 5);

INSERT INTO establecimiento VALUES (NULL, 'Monterrey Tools',     11200.45,  4, 5);

COMMIT;
