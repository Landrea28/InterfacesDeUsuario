<%@page import="modelo.Conexion"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import= "modelo.Conexion" %>
<%
//recuperar la sesión
    HttpSession sesion_cli = request.getSession(true);
    String nUsuario = (String) sesion_cli.getAttribute("nUsuario");
    Connection con = null;
    Statement sentencia = null;
    ResultSet resultado = null;
    String nombre = null;
    String apellido = null;
    String usu = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Login</title>
    </head>
    <body>
        <%
            try {
                Conexion cn = new Conexion();
                con = cn.crearConexion();
                sentencia = con.createStatement();
                resultado = sentencia.executeQuery("SELECT * from datos WHERE usuario ='" + nUsuario + "' ");
                while (resultado.next()) {
                    nombre = resultado.getString("nombre");
                    apellido = resultado.getString("apellido");
                    usu = resultado.getString("usuario");
                }
            } catch (Exception e) {
            } finally {
                if (con != null) con.close();
            }
        %>
        <h1>Bienvenido <%= nombre != null ? nombre : "Usuario" %> <%= apellido != null ? apellido : "" %></h1>
        <p>Su nombre de usuario es: <%= usu != null ? usu : nUsuario %></p>
        <a href="listaUsuarios.jsp">Ver lista de usuarios</a>
    </body>
</html>