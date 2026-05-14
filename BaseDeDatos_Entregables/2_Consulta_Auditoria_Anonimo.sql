-- ==========================================================
-- SCRIPT: BLOQUE ANÓNIMO PARA CONSULTAR LA AUDITORÍA
-- ==========================================================

SET SERVEROUTPUT ON;

DECLARE
    -- Cursor para obtener los registros de auditoría ordenados por fecha
    CURSOR c_auditoria IS
        SELECT id_auditoria, tabla_afectada, operacion, usuario_bd, fecha, datos_anteriores, datos_nuevos
        FROM KLS_AUDITORIA
        ORDER BY fecha DESC;
        
    v_total NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('======================================================');
    DBMS_OUTPUT.PUT_LINE('           REPORTE DE AUDITORÍA DEL SISTEMA           ');
    DBMS_OUTPUT.PUT_LINE('======================================================');
    
    FOR r_audit IN c_auditoria LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r_audit.id_auditoria);
        DBMS_OUTPUT.PUT_LINE('Tabla: ' || r_audit.tabla_afectada);
        DBMS_OUTPUT.PUT_LINE('Operación: ' || r_audit.operacion);
        DBMS_OUTPUT.PUT_LINE('Usuario BD: ' || r_audit.usuario_bd);
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(r_audit.fecha, 'DD/MM/YYYY HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE('Datos Ant: ' || NVL(r_audit.datos_anteriores, 'N/A'));
        DBMS_OUTPUT.PUT_LINE('Datos Nue: ' || NVL(r_audit.datos_nuevos, 'N/A'));
        DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
        v_total := v_total + 1;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Total de registros auditados: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('======================================================');
END;
/
