-- ==========================================================
-- SCRIPT: TRIGGERS DE AUDITORÍA (PL/SQL)
-- ==========================================================

-- 1. Trigger para KLS_ALIMENTOS
CREATE OR REPLACE TRIGGER TRG_AUDIT_ALIMENTOS
AFTER INSERT OR UPDATE OR DELETE ON KLS_ALIMENTOS
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
    v_datos_ant VARCHAR2(4000);
    v_datos_nue VARCHAR2(4000);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        v_datos_nue := 'ID: ' || :NEW.id_alimento || ', Nombre: ' || :NEW.nombre || ', Tipo: ' || :NEW.tipo;
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        v_datos_ant := 'ID: ' || :OLD.id_alimento || ', Nombre: ' || :OLD.nombre || ', Tipo: ' || :OLD.tipo;
        v_datos_nue := 'ID: ' || :NEW.id_alimento || ', Nombre: ' || :NEW.nombre || ', Tipo: ' || :NEW.tipo;
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        v_datos_ant := 'ID: ' || :OLD.id_alimento || ', Nombre: ' || :OLD.nombre || ', Tipo: ' || :OLD.tipo;
    END IF;

    INSERT INTO KLS_AUDITORIA (tabla_afectada, operacion, usuario_bd, datos_anteriores, datos_nuevos)
    VALUES ('KLS_ALIMENTOS', v_operacion, USER, v_datos_ant, v_datos_nue);
END;
/

-- 2. Trigger para KLS_USUARIOS
CREATE OR REPLACE TRIGGER TRG_AUDIT_USUARIOS
AFTER INSERT OR UPDATE OR DELETE ON KLS_USUARIOS
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
    v_datos_ant VARCHAR2(4000);
    v_datos_nue VARCHAR2(4000);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        v_datos_nue := 'ID: ' || :NEW.id_usuario || ', Nombre: ' || :NEW.nombre || ', Rol: ' || :NEW.rol;
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        v_datos_ant := 'ID: ' || :OLD.id_usuario || ', Nombre: ' || :OLD.nombre || ', Rol: ' || :OLD.rol;
        v_datos_nue := 'ID: ' || :NEW.id_usuario || ', Nombre: ' || :NEW.nombre || ', Rol: ' || :NEW.rol;
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        v_datos_ant := 'ID: ' || :OLD.id_usuario || ', Nombre: ' || :OLD.nombre || ', Rol: ' || :OLD.rol;
    END IF;

    INSERT INTO KLS_AUDITORIA (tabla_afectada, operacion, usuario_bd, datos_anteriores, datos_nuevos)
    VALUES ('KLS_USUARIOS', v_operacion, USER, v_datos_ant, v_datos_nue);
END;
/

-- 3. Trigger para KLS_RECETAS
CREATE OR REPLACE TRIGGER TRG_AUDIT_RECETAS
AFTER INSERT OR UPDATE OR DELETE ON KLS_RECETAS
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
    v_datos_ant VARCHAR2(4000);
    v_datos_nue VARCHAR2(4000);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        v_datos_nue := 'ID: ' || :NEW.id_receta || ', Titulo: ' || :NEW.titulo || ', Usuario_ID: ' || :NEW.id_usuario;
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        v_datos_ant := 'ID: ' || :OLD.id_receta || ', Titulo: ' || :OLD.titulo || ', Usuario_ID: ' || :OLD.id_usuario;
        v_datos_nue := 'ID: ' || :NEW.id_receta || ', Titulo: ' || :NEW.titulo || ', Usuario_ID: ' || :NEW.id_usuario;
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        v_datos_ant := 'ID: ' || :OLD.id_receta || ', Titulo: ' || :OLD.titulo || ', Usuario_ID: ' || :OLD.id_usuario;
    END IF;

    INSERT INTO KLS_AUDITORIA (tabla_afectada, operacion, usuario_bd, datos_anteriores, datos_nuevos)
    VALUES ('KLS_RECETAS', v_operacion, USER, v_datos_ant, v_datos_nue);
END;
/
