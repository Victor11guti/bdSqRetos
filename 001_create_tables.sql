-- 001_create_tables.sql
-- ---------------------------------------------------
-- ---------------------------------------------------

-- 1) CREACIÓN DE TABLAS
CREATE TABLE usuario (
  id_usuario            NUMBER           NOT NULL,
  nombre                VARCHAR2(100)    NOT NULL,
  correo_electronico    VARCHAR2(150)    NOT NULL UNIQUE,
  contrasena            VARCHAR2(200)    NOT NULL,
  rol                   VARCHAR2(20)     NOT NULL
    CONSTRAINT chk_usuario_rol CHECK (rol IN ('ADMINISTRADOR','AUXILIAR_REGISTRO')),
  fecha_actualizacion   DATE,
  usuario_actualizacion VARCHAR2(100),
  CONSTRAINT pk_usuario PRIMARY KEY (id_usuario)
);

CREATE TABLE comerciante (
  id_comerciante        NUMBER           NOT NULL,
  nombre_razon_social   VARCHAR2(150)    NOT NULL,
  municipio             VARCHAR2(100)    NOT NULL,
  telefono              VARCHAR2(20),
  correo_electronico    VARCHAR2(150),
  fecha_registro        DATE             DEFAULT SYSDATE NOT NULL,
  estado                VARCHAR2(10)     NOT NULL
    CONSTRAINT ck_comerciante_estado CHECK (estado IN ('ACTIVO','INACTIVO')),
  fecha_actualizacion   DATE,
  usuario_actualizacion VARCHAR2(100),
  CONSTRAINT pk_comerciante PRIMARY KEY (id_comerciante)
);

CREATE TABLE establecimiento (
  id_establecimiento     NUMBER           NOT NULL,
  nombre_establecimiento VARCHAR2(150)    NOT NULL,
  ingresos               NUMBER(15,2)     NOT NULL,
  num_empleados          NUMBER           NOT NULL,
  id_comerciante         NUMBER           NOT NULL,
  fecha_actualizacion    DATE,
  usuario_actualizacion  VARCHAR2(100),
  CONSTRAINT pk_establecimiento PRIMARY KEY (id_establecimiento),
  CONSTRAINT fk_estab_comerciante 
    FOREIGN KEY (id_comerciante)
    REFERENCES comerciante (id_comerciante)
);

-- 2) ÍNDICES ADICIONALES
-- Por FK para acelerar joins en establecimiento
CREATE INDEX idx_estab_on_comerciante 
  ON establecimiento (id_comerciante);
-- Por fecha de registro para reportes frecuentes
CREATE INDEX idx_comerciante_fecha_reg 
  ON comerciante (fecha_registro);
-- Por número de empleados si hacemos filtros por tamaño
CREATE INDEX idx_estab_num_empleados 
  ON establecimiento (num_empleados);
-- Por estado para consultas de activos/inactivos
CREATE INDEX idx_comerciante_estado 
  ON comerciante (estado);

