<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f0f2f5; display: flex; align-items: center; justify-content: center; height: 100vh; margin: 0; flex-direction: column; }
        form { background: #ffffff; padding: 25px 35px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
        table { border-collapse: collapse; }
        td { padding: 10px 5px; border: none !important; }
        input[type="text"], input[type="password"] { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        input[type="submit"] { margin-top: 10px; padding: 10px 15px; background-color: #0056b3; color: white; border: none; border-radius: 4px; cursor: pointer; width: 100%; font-weight: bold; }
        input[type="submit"]:hover { background-color: #004494; }
        a { color: #0056b3; text-decoration: none; font-size: 14px; }
        a:hover { text-decoration: underline; }
        table[border="1"] { border: none; }
    </style>
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
                    <td>Contraseña</td>
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






