
package modelo;

import Interfaces.CRUD;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import modelo.Conexion;
import modelo.Usuario;

public class LoginDAO {

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs;

    public LoginDAO() {
    }

    public Usuario Login_datos(String usuario, String clave) {
        Usuario datos = null;
        try {
            Conexion cn = new Conexion();
            conn = cn.crearConexion();
            stmt = conn.prepareStatement("SELECT * FROM datos WHERE usuario = ? AND clave = ?");
            stmt.setString(1, usuario);
            stmt.setString(2, clave);
            rs = stmt.executeQuery();
            if (rs.next()) {
                datos = new Usuario();
                datos.setUsuario(rs.getString("usuario"));
                datos.setClave(rs.getString("clave"));
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return datos;
    }
}
