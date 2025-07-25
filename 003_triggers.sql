-- 003_triggers.sql
-- ---------------------------------------------------
-- Reto 03: Triggers de auditoría y generación de IDs

-- ---------------------------------------------------

-- TRIGGER para USUARIO
CREATE OR REPLACE TRIGGER trg_usuario_biu
  BEFORE INSERT OR UPDATE
  ON usuario
  FOR EACH ROW
BEGIN
  -- Generar ID si es INSERT y no se proporcionó
  IF INSERTING THEN
    IF :NEW.id_usuario IS NULL THEN
      :NEW.id_usuario := pkg_auditoria.get_id_usuario;
    END IF;
  END IF;

  -- Actualizar auditoría en ambos casos
  pkg_auditoria.set_audit(
    p_usuario => :NEW.usuario_actualizacion,
    p_fecha   => :NEW.fecha_actualizacion
  );
END trg_usuario_biu;
/

-- TRIGGER para COMERCIANTE
CREATE OR REPLACE TRIGGER trg_comerciante_biu
  BEFORE INSERT OR UPDATE
  ON comerciante
  FOR EACH ROW
BEGIN
  IF INSERTING THEN
    IF :NEW.id_comerciante IS NULL THEN
      :NEW.id_comerciante := pkg_auditoria.get_id_comerciante;
    END IF;
  END IF;

  pkg_auditoria.set_audit(
    p_usuario => :NEW.usuario_actualizacion,
    p_fecha   => :NEW.fecha_actualizacion
  );
END trg_comerciante_biu;
/

-- TRIGGER para ESTABLECIMIENTO
CREATE OR REPLACE TRIGGER trg_establecimiento_biu
  BEFORE INSERT OR UPDATE
  ON establecimiento
  FOR EACH ROW
BEGIN
  IF INSERTING THEN
    IF :NEW.id_establecimiento IS NULL THEN
      :NEW.id_establecimiento := pkg_auditoria.get_id_establecimiento;
    END IF;
  END IF;

  pkg_auditoria.set_audit(
    p_usuario => :NEW.usuario_actualizacion,
    p_fecha   => :NEW.fecha_actualizacion
  );
END trg_establecimiento_biu;
/

    