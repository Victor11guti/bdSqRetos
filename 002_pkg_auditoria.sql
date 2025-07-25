-- 002_pkg_auditoria.sql
-- -------------------------------------------------------
-- Reto 02: Secuencias y Paquete PKG_AUDITORIA
-- -------------------------------------------------------

-- 1) CREACIÓN DE SECUENCIAS PARA ASIGNAR IDs
CREATE SEQUENCE seq_usuario
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
  
CREATE SEQUENCE seq_comerciante
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE seq_establecimiento
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- 2) PAQUETE DE AUDITORÍA
CREATE OR REPLACE PACKAGE pkg_auditoria AS
  -- Generación de nuevos IDs
  FUNCTION get_id_usuario RETURN usuario.id_usuario%TYPE;
  FUNCTION get_id_comerciante RETURN comerciante.id_comerciante%TYPE;
  FUNCTION get_id_establecimiento RETURN establecimiento.id_establecimiento%TYPE;
  
  -- Asigna usuario y fecha de actualización
  PROCEDURE set_audit(
    p_usuario   OUT VARCHAR2,
    p_fecha     OUT DATE
  );
END pkg_auditoria;
/

CREATE OR REPLACE PACKAGE BODY pkg_auditoria AS

  FUNCTION get_id_usuario RETURN usuario.id_usuario%TYPE IS
  BEGIN
    RETURN seq_usuario.NEXTVAL;
  END get_id_usuario;

  FUNCTION get_id_comerciante RETURN comerciante.id_comerciante%TYPE IS
  BEGIN
    RETURN seq_comerciante.NEXTVAL;
  END get_id_comerciante;

  FUNCTION get_id_establecimiento RETURN establecimiento.id_establecimiento%TYPE IS
  BEGIN
    RETURN seq_establecimiento.NEXTVAL;
  END get_id_establecimiento;

  PROCEDURE set_audit(
    p_usuario   OUT VARCHAR2,
    p_fecha     OUT DATE
  ) IS
  BEGIN
    p_fecha   := SYSDATE;
    -- Captura el usuario de sesión de Oracle
    p_usuario := SYS_CONTEXT('USERENV','SESSION_USER');
  END set_audit;

END pkg_auditoria;
/
