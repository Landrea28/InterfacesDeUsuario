<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Usuario</title>
    </head>
    <body>
        <h2>Registro de Nuevo Usuario</h2>
        <div id="apDiv1">
            <form id="form1" name="form1" method="post" action="controladorUsuario">
                <table width="665" border="1">
                    <tr>
                        <td>IdentificaciÃ³n</td>
                        <td><label for="cidentificacion"></label>
                            <input type="text" name="cidentificacion" id="cidentificacion" required /></td>
                    </tr>
                    <tr>
                        <td>Nombres</td>
                        <td><label for="cnombre"></label>
                            <input name="cnombre" type="text" id="cnombre" size="40" required /></td>
                    </tr>
                    <tr>
                        <td>Apellidos</td>
                        <td><label for="capellido"></label>
                            <input name="capellido" type="text" id="capellido" size="40" required /></td>
                    </tr>
                    <tr>
                        <td>E-mail</td>
                        <td><label for="cmail"></label>
                            <input name="cmail" type="email" id="cmail" size="60" required /></td>
                    </tr>
                    <tr>
                        <td>Usuario</td>
                        <td><label for="cusuario"></label>
                            <input type="text" name="cusuario" id="cusuario" required /></td>
                    </tr>
                    <tr>
                        <td>Clave</td>
                        <td><label for="cclave"></label>
                            <input type="password" name="cclave" id="cclave" required /></td>
                    </tr>
                    <tr>
                        <td>Perfil (ID)</td>
                        <td><label for="cidperfil"></label>
                            <input type="number" name="cidperfil" id="cidperfil" required /></td>
                    </tr>
                </table>
                <p>
                    <input type="submit" name="button" id="button" value="Registrar" />
                </p>
            </form>
            <div style="margin-top: 15px;">
                <a href="index.jsp">Volver al Login</a>
            </div>
        </div>
    </body>
</html>

