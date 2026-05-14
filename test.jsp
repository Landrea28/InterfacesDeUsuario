<%@ page import="java.sql.*, modelo.Conexion" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Prueba de Conexión a Oracle</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .success { color: green; font-weight: bold; }
        .error { color: red; font-weight: bold; }
        .log { background: #f4f4f4; padding: 10px; border-radius: 5px; font-family: monospace; white-space: pre-wrap; }
    </style>
</head>
<body>
    <h2>Diagnóstico de Base de Datos</h2>
    <%
        out.println("<h3>1. Probando conexión a Oracle...</h3>");
        Connection con = null;
        try {
            Conexion cn = new Conexion();
            con = cn.getConnection();
            if (con != null) {
                out.println("<p class='success'>✅ Conexión EXITOSA a la base de datos.</p>");
                
                // 2. Probar si la tabla KLS_USUARIOS existe
                out.println("<h3>2. Verificando tabla KLS_USUARIOS...</h3>");
                try {
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT COUNT(*) AS total FROM KLS_USUARIOS");
                    if (rs.next()) {
                        out.println("<p class='success'>✅ La tabla KLS_USUARIOS existe. Usuarios actuales: " + rs.getInt("total") + "</p>");
                    }
                    rs.close();
                    stmt.close();
                } catch (SQLException e) {
                    out.println("<p class='error'>❌ ERROR: La tabla KLS_USUARIOS no existe o no se puede acceder.</p>");
                    out.println("<div class='log'>Detalle SQL: " + e.getMessage() + "</div>");
                }
                
                con.close();
            } else {
                out.println("<p class='error'>❌ Falló la conexión. getConnection() devolvió null.</p>");
                out.println("<p>Revisa la pestaña 'Output - Apache Tomcat' en NetBeans para ver el error exacto (ej. credenciales inválidas o driver no encontrado).</p>");
            }
        } catch (Exception e) {
            out.println("<p class='error'>❌ Excepción inesperada:</p>");
            out.println("<div class='log'>" + e.getMessage() + "</div>");
        }
    %>
</body>
</html>