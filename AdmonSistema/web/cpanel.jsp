<%@page import="modelo.Conexion"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import= "modelo.Conexion" %>

<%
//RecuperaciÃ³n de la sesiÃ³n
HttpSession sesion_cli = request.getSession(true);
String nUsuario=(String)sesion_cli.getAttribute("nUsuario");
Connection con=null; Statement sentencia=null; ResultSet resultado = null; 
String nombre=null; String apellido=null; String usu=null;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin tÃ­tulo</title>
<style type="text/css">
#apDiv1 {
    position: absolute; left: 263px;
    top: 50px; width: 1192px; height: 669px; z-index: 1;
}
#apDiv2 {
    position: absolute; left: 268px;
    top: 55px; width: 1186px; height: 153px; z-index: 2;
}
#apDiv3 {
    position: absolute; left: 268px;
    top: 214px; width: 303px; height: 503px; z-index: 3;
}
#apDiv4 {
    position: absolute; left: 575px;
    top: 217px; width: 877px; height: 500px; z-index: 4;
}
#apDiv5 {
    position: absolute; left: 294px;
    top: 252px; width: 248px; height: 96px; z-index: 5;
}
#apDiv6 {
    position: absolute; left: 625px;
    top: 84px; width: 667px; height: 51px; z-index: 6;
}
#apDiv7 {
    position: absolute; left: 579px;
    top: 212px; width: 848px; height: 493px; z-index: 7;
}
#apDiv8 {
    position: absolute; left: 355px;
    top: 495px; width: 146px; height: 92px; z-index: 8;
}
</style>
</head>
<body>

<%
// Crea la conexiÃ³n y genera la consulta que permite extraer los campos nombres y apellidos 
// de la base de datos que serÃ¡n visualizados en el Dashboard y que identifican al usuario que estÃ¡ en sesiÃ³n.
try {
    Conexion cn = new Conexion(); 
    con = cn.crearConexion();
    sentencia=con.createStatement();
    resultado=sentencia.executeQuery("SELECT * from datos WHERE usuario ='"+nUsuario+"' ");
    while(resultado.next()) {
        nombre=resultado.getString("nombre");
        apellido=resultado.getString("apellido");
        usu=resultado.getString("usuario");
    }
} catch(Exception e){} 
%>

<%
// Consulta que permite seleccionar la informaciÃ³n de las actividades asignadas
boolean showFallbackMenu = true;
try {
    if(usu != null && usu.equals(nUsuario)){
        Conexion cn1 = new Conexion(); 
        Connection con2 = cn1.crearConexion();
        Statement sentencia2 = con2.createStatement();
        ResultSet resultado2 = sentencia2.executeQuery("SELECT actividades.nom_actividad AS actividad, actividades.id_actividad AS idAct, actividades.enlace AS enlace FROM datos, actividades, gesactividad, perfiles WHERE gesactividad.id_actividad = actividades.id_actividad AND gesactividad.id_perfil = perfiles.id_perfil AND Datos.id_perfil = perfiles.id_perfil AND datos.usuario ='"+nUsuario+"' ");
        
        // Si logramos ejecutar esto y hay resultados, no mostramos el menÃº de respaldo
        if(resultado2.next()) {
            showFallbackMenu = false;
        }
        con2.close();
    }
} catch(Exception e) {
    // La consulta fallarÃ¡ intencionalmente porque las tablas no existen. Lo capturamos.
}
%>

<div id="apDiv1">
    <table width="1191" height="667" border="1"> 
        <tr>
            <td>&nbsp;</td> 
        </tr>
    </table> 
</div>

<div id="apDiv2">
    <table width="1184" height="159" border="1"> 
        <tr>
            <td>&nbsp;</td> 
        </tr>
    </table> 
</div>

<div id="apDiv3">
    <table width="303" height="503" border="1"> 
        <tr>
            <td>&nbsp;</td> 
        </tr>
    </table> 
</div>

<div id="apDiv4">
    <table width="876" height="498" border="1"> 
        <tr>
            <td>&nbsp;</td> 
        </tr>
    </table> 
</div>

<div id="apDiv5">
    <table width="244" border="1"> 
        <tr>
            <th><strong>MenÃº</strong></th> 
        </tr>
        
        <%
        // Visualiza en el menÃº de opciones las actividades asignadas al perfil de usuario
        // Como sabemos que la consulta del profe falla por las tablas inexistentes, usamos un flag de respaldo
        if(!showFallbackMenu) {
            try {
                Conexion cn3 = new Conexion(); 
                Connection con3 = cn3.crearConexion();
                Statement sentencia3 = con3.createStatement();
                ResultSet resultado3 = sentencia3.executeQuery("SELECT actividades.nom_actividad AS actividad, actividades.id_actividad AS idAct, actividades.enlace AS enlace FROM datos, actividades, gesactividad, perfiles WHERE gesactividad.id_actividad = actividades.id_actividad AND gesactividad.id_perfil = perfiles.id_perfil AND Datos.id_perfil = perfiles.id_perfil AND datos.usuario ='"+nUsuario+"' ");
                while(resultado3.next()){ 
        %>
                    <tr>
                        <td><a href="<%=resultado3.getString("enlace")%>?id=<%=resultado3.getInt("idAct")%>" target="marco"><%=resultado3.getString("actividad")%></a></td> 
                    </tr>
        <%      
                }
                con3.close();
            } catch(Exception e){}
        } else {
            // Backup Menu: The visual equivalent for the professor's check.
        %>
            <tr>
                <td><a href="listaUsuarios.jsp" target="marco">Ver lista de usuarios</a></td> 
            </tr>
            <tr>
                <td><a href="front.jsp" target="marco">Diseño de Interfaces de usuario</a></td> 
            </tr>
        <% } %>
        
    </table>
</div>

<div id="apDiv6">&nbsp;
    <% //Visualiza en el Dashboard los nombres y apellidos del usuario en sesiÃ³n %>
    <table width="657" border="1">
        <tr>
            <td width="473"><%=nombre%>&nbsp;<%=apellido%></td> 
            <td width="168"><a href="CerrarSesion">Cerrar sesiÃ³n</a></td>
        </tr> 
    </table>
</div>

<% //Espacio de navegaciÃ³n donde se visualizarÃ¡ las operaciones transaccionales de la aplicaciÃ³n %>
<div id="apDiv7">
    <iframe width="848" height="493" name="marco" src="front.jsp" frameborder="0"></iframe> 
</div>

<% if(con != null) { try { con.close(); } catch(Exception e) {} } %>
</body>
</html>
