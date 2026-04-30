-- ==========================================================
-- SCRIPT: AUDITORÍA PL/SQL (TRIGGERS Y CONSULTA)
-- MOTOR: ORACLE DATABASE (PL/SQL)
-- PREFIJO ESTUDIANTES: KLS_
-- ==========================================================

-- ==========================================================
-- 1. TRIGGERS DE AUDITORÍA (SOLUCIÓN PL/SQL)
-- ==========================================================

-- A) Trigger para la tabla KLS_USUARIOS
CREATE OR REPLACE TRIGGER TRG_AUD_KLS_USUARIOS
AFTER INSERT OR UPDATE OR DELETE ON KLS_USUARIOS
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
    v_old_data VARCHAR2(4000);
    v_new_data VARCHAR2(4000);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        v_new_data := 'ID: ' || :NEW.id_usuario || ', Nombre: ' || :NEW.nombre || ', Rol: ' || :NEW.rol;
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        v_old_data := 'ID: ' || :OLD.id_usuario || ', Nombre: ' || :OLD.nombre || ', Rol: ' || :OLD.rol;
        v_new_data := 'ID: ' || :NEW.id_usuario || ', Nombre: ' || :NEW.nombre || ', Rol: ' || :NEW.rol;
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        v_old_data := 'ID: ' || :OLD.id_usuario || ', Nombre: ' || :OLD.nombre || ', Rol: ' || :OLD.rol;
    END IF;

    INSERT INTO KLS_AUDITORIA (tabla_afectada, operacion, usuario_bd, datos_anteriores, datos_nuevos)
    VALUES ('KLS_USUARIOS', v_operacion, USER, v_old_data, v_new_data);
END;
/

-- B) Trigger para la tabla KLS_ALIMENTOS
CREATE OR REPLACE TRIGGER TRG_AUD_KLS_ALIMENTOS
AFTER INSERT OR UPDATE OR DELETE ON KLS_ALIMENTOS
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
    v_old_data VARCHAR2(4000);
    v_new_data VARCHAR2(4000);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        v_new_data := 'ID: ' || :NEW.id_alimento || ', Nombre: ' || :NEW.nombre || ', Tipo: ' || :NEW.tipo;
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        v_old_data := 'ID: ' || :OLD.id_alimento || ', Nombre: ' || :OLD.nombre || ', Tipo: ' || :OLD.tipo;
        v_new_data := 'ID: ' || :NEW.id_alimento || ', Nombre: ' || :NEW.nombre || ', Tipo: ' || :NEW.tipo;
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        v_old_data := 'ID: ' || :OLD.id_alimento || ', Nombre: ' || :OLD.nombre || ', Tipo: ' || :OLD.tipo;
    END IF;

    INSERT INTO KLS_AUDITORIA (tabla_afectada, operacion, usuario_bd, datos_anteriores, datos_nuevos)
    VALUES ('KLS_ALIMENTOS', v_operacion, USER, v_old_data, v_new_data);
END;
/

-- C) Trigger para la tabla KLS_RECETAS
CREATE OR REPLACE TRIGGER TRG_AUD_KLS_RECETAS
AFTER INSERT OR UPDATE OR DELETE ON KLS_RECETAS
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
    v_old_data VARCHAR2(4000);
    v_new_data VARCHAR2(4000);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        v_new_data := 'ID: ' || :NEW.id_receta || ', Título: ' || :NEW.titulo;
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        v_old_data := 'ID: ' || :OLD.id_receta || ', Título: ' || :OLD.titulo;
        v_new_data := 'ID: ' || :NEW.id_receta || ', Título: ' || :NEW.titulo;
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        v_old_data := 'ID: ' || :OLD.id_receta || ', Título: ' || :OLD.titulo;
    END IF;

    INSERT INTO KLS_AUDITORIA (tabla_afectada, operacion, usuario_bd, datos_anteriores, datos_nuevos)
    VALUES ('KLS_RECETAS', v_operacion, USER, v_old_data, v_new_data);
END;
/

-- D) Trigger para la tabla KLS_RECETA_ALIMENTO (Nueva)
CREATE OR REPLACE TRIGGER TRG_AUD_KLS_RECETA_ALIMENTO
AFTER INSERT OR UPDATE OR DELETE ON KLS_RECETA_ALIMENTO
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
    v_old_data VARCHAR2(4000);
    v_new_data VARCHAR2(4000);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        v_new_data := 'ID_Relación: ' || :NEW.id_receta_alimento || ', ID_Receta: ' || :NEW.id_receta || ', ID_Alim: ' || :NEW.id_alimento;
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        v_old_data := 'ID_Relación: ' || :OLD.id_receta_alimento || ', ID_Receta: ' || :OLD.id_receta || ', ID_Alim: ' || :OLD.id_alimento;
        v_new_data := 'ID_Relación: ' || :NEW.id_receta_alimento || ', ID_Receta: ' || :NEW.id_receta || ', ID_Alim: ' || :NEW.id_alimento;
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        v_old_data := 'ID_Relación: ' || :OLD.id_receta_alimento || ', ID_Receta: ' || :OLD.id_receta || ', ID_Alim: ' || :OLD.id_alimento;
    END IF;

    INSERT INTO KLS_AUDITORIA (tabla_afectada, operacion, usuario_bd, datos_anteriores, datos_nuevos)
    VALUES ('KLS_RECETA_ALIMENTO', v_operacion, USER, v_old_data, v_new_data);
END;
/


-- ==========================================================
-- 2. BLOQUE ANÓNIMO DE CONSULTA A LA AUDITORÍA (REPORTE)
-- ==========================================================

SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_auditoria IS
        SELECT tabla_afectada, operacion, usuario_bd, fecha
        FROM KLS_AUDITORIA
        ORDER BY fecha DESC;
    
    v_contador NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('====================================================');
    DBMS_OUTPUT.PUT_LINE('          REPORTE DE AUDITORIA DE SISTEMA           ');
    DBMS_OUTPUT.PUT_LINE('====================================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('TABLA', 25) || RPAD('OPERACIÓN', 12) || RPAD('USUARIO_BD', 15) || 'FECHA');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');

    FOR r IN c_auditoria LOOP
        DBMS_OUTPUT.PUT_LINE(
            RPAD(r.tabla_afectada, 25) || 
            RPAD(r.operacion, 12) || 
            RPAD(r.usuario_bd, 15) || 
            TO_CHAR(r.fecha, 'DD/MM/YYYY HH24:MI:SS')
        );
        v_contador := v_contador + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total de registros encontrados: ' || v_contador);
    DBMS_OUTPUT.PUT_LINE('====================================================');
END;
/