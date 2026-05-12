<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<!DOCTYPE html>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>JSP Page</title>
     <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f0f2f5; display: flex; align-items: center; justify-content: center; min-height: 100vh; margin: 0; flex-direction: column; }
        #apDiv1 { background: #ffffff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
        table { border-collapse: collapse; width: 100%; }
        td { padding: 10px 5px; border: none !important; }
        input[type="text"], input[type="password"] { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        input[type="submit"] { margin-top: 15px; padding: 10px 15px; background-color: #ffc107; color: #333; border: none; border-radius: 4px; cursor: pointer; width: 100%; font-weight: bold; font-size: 16px; }
        input[type="submit"]:hover { background-color: #e0a800; }
        table[border="1"] { border: none; }
    </style>
</head>
 <body>

 <%
 UsuarioDAO udao = new UsuarioDAO();
 int id = Integer.parseInt(request.getParameter("id"));
 Usuario a = udao.listarUsuarios_Id(id);
 %>

 <div id="apDiv1">
 <form id="form1" name="form1" method="post" action="EditarUsuario">
 <table width="665" border="1">
 <tr>
 <td>Identificación</td>
 <td><label for="cid"></label>
 <input type="hidden" name="cidd" value="<%=id%>"/>
 <input type="text" name="cid" id="cid" value="<%=a.getIdentificacion()%>"/></td>
 </tr>
 <tr>
 <td>Nombres</td>
 <td><label for="cnombre"></label>
 <input name="cnombre" type="text" id="cnombre" size="40" value="<%=a.getNombre()%>"
/></td>
 
<tr>
 <td>Apellidos</td>
 <td><label for="capellido"></label>
 <input name="capellido" type="text" id="capellido" size="40"
value="<%=a.getApellido()%>"/></td>
 </tr>
 <tr>
 <td>E-mail</td>
 <td><label for="cmail"></label>
 <input name="cmail" type="text" id="cmail" size="60" value="<%=a.getEmail()%>"/></td>
 </tr>
 <tr>
 <td>Usuario</td>
 <td><label for="cusuario"></label>
 <input type="text" name="cusuario" id="cusuario" value="<%=a.getUsuario()%>"/></td>
 </tr>
 <tr>
 <td>Clave</td>
 <td><label for="cclave"></label>
 <input type="password" name="cclave" id="cclave" value="<%=a.getClave()%>"/></td>
 </tr>

 <tr>
 <td>Perfil</td>
 <td><label for="cperfil"></label>
 <input type="text" name="cperfil" id="cperfil" value="<%=a.getIdperfil()%>"/></td>
 </tr>
 </table>
 <p>
 <input type="submit" name="button" id="button" value="Actualizar" />
 </p>
 </form>
</div>
 </body>
</html>
