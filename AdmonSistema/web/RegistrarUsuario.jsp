<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Usuario</title>
        <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f0f2f5; display: flex; align-items: center; justify-content: center; min-height: 100vh; margin: 0; flex-direction: column; }
        h2 { color: #333; margin-bottom: 20px; }
        #apDiv1 { background: #ffffff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
        table { border-collapse: collapse; width: 100%; }
        td { padding: 10px 5px; border: none !important; }
        input[type="text"], input[type="password"], input[type="email"], input[type="number"] { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        input[type="submit"] { margin-top: 15px; padding: 10px 15px; background-color: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; width: 100%; font-weight: bold; font-size: 16px; }
        input[type="submit"]:hover { background-color: #218838; }
        a { color: #0056b3; text-decoration: none; font-size: 14px; }
        a:hover { text-decoration: underline; }
        table[border="1"] { border: none; }
    </style>
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


