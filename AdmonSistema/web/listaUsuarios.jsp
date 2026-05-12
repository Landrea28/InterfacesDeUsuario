<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<!DOCTYPE html>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Listado</title>
     <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f8f9fa; margin: 20px; color: #333; }
        h2 { color: #0056b3; border-bottom: 2px solid #0056b3; padding-bottom: 10px; }
        table { border-collapse: collapse; width: 100%; background: #fff; box-shadow: 0 2px 8px rgba(0,0,0,0.1); border-radius: 8px; overflow: hidden; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #0056b3; color: white; }
        tr:hover { background-color: #f1f1f1; }
        a { color: #007bff; text-decoration: none; padding: 4px 8px; border: 1px solid #007bff; border-radius: 4px; font-size: 13px; margin-right: 5px; }
        a:hover { background-color: #007bff; color: white; }
        .volver { display: inline-block; margin-top: 20px; padding: 10px 15px; background: #6c757d; color: white; border: none; }
        .volver:hover { background: #5a6268; }
    </style>
</head>
 <body>
 <h2>Listado de Datos de usuarios (Actualizado)</h2>
 <table>
 <tr>
 <th>Identificación</th>
 <th>Nombres</th>
 <th>Apellidos</th>
 <th>E-mail</th>
 <th>Usuario</th>
 <th>Contraseña</th>
 <th>Perfil</th>
 <th>Acción</th>
 </tr>
 <%
 UsuarioDAO udao = new UsuarioDAO();
 List<Usuario> lista = udao.listadoUsuarios();
 for(Usuario a : lista){

 %>
 <tr>
 <td><%=a.getIdentificacion()%></td>
 <td><%=a.getNombre()%></td>
 <td><%=a.getApellido()%></td>
 <td><%=a.getEmail()%></td>
 <td><%=a.getUsuario()%></td>
 <td><%=a.getClave()%></td>
 <td><%=a.getIdperfil()%></td>
 <td>
 <a href="EditarUsuario.jsp?id=<%=a.getIddato()%>">Editar</a>
 <a href="EliminarUsuario?id=<%=a.getIddato()%>">Eliminar</a>
 </td>
 </tr>
 <%
 }
 %>
 </table>
 </body>
</html>
