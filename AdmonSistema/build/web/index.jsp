

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="form1" name="form1" method="post" action="controladorUsuario">
            <label for="identificacion">Identificación:</label>
            <input type="text" id="identificacion" name="cidentificacion" required><br><br>
            
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="cnombre" required><br><br>
            
            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="capellido" required><br><br>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="cmail" required><br><br>
            
            <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="cusuario" required><br><br>
            
            <label for="clave">Clave:</label>
            <input type="password" id="clave" name="cclave" required><br><br>
            
            <label for="perfil">Perfil:</label>
            <input type="number" id="perfil" name="cidperfil" required><br><br>
            
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
