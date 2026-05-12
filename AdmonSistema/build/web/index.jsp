<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="form1" name="form1" method="post" action="ctrolValidar">
            <table width="421" height="102" border="1">
                <tr>
                    <td width="157">Usuario</td>
                    <td width="248"><label for="cusuario"></label>
                        <input type="text" name="cusuario" id="cusuario" /></td>
                </tr>
                <tr>
                    <td>ContraseÃ±a</td>
                    <td><label for="cclave"></label>
                        <input type="password" name="cclave" id="cclave" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><input name="accion" value="Ingresar" type="submit" id="button" /></td>
                </tr>
            </table>
            <div style="margin-top: 15px; text-align: left; width: 421px;">
                <a href="RegistrarUsuario.jsp">¿No tienes cuenta? Regístrate aquí</a>
            </div>
        </form>
    </body>
</html>

