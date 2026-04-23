<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<!DOCTYPE html>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Listado</title>
 </head>
 <body>
 <h2>Listado de Datos de usuarios (Actualizado)</h2>
 <table>
 <tr>
 <th>Identificaci�n</th>
 <th>Nombres</th>
 <th>Apellidos</th>
 <th>E-mail</th>
 <th>Usuario</th>
 <th>Contrase�a</th>
 <th>Perfil</th>
 <th>Acci�n</th>
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