

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
            <input type="text" id="identificacion" name="identificacion" required><br><br>
            
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required><br><br>
            
            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" required><br><br>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="telefono">Teléfono:</label>
            <input type="tel" id="telefono" name="telefono" required><br><br>
            
            <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="usuario" required><br><br>
            
            <label for="clave">Clave:</label>
            <input type="password" id="clave" name="clave" required><br><br>
            
            <label for="perfil">Perfil:</label>
            <input type="text" id="perfil" name="perfil" required><br><br>
            
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
