package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public Usuario validar(String email, String password) {
        Usuario user = null;
        String sql = "SELECT * FROM KLS_USUARIOS WHERE email = ? AND password = ?";
        try {
            con = cn.getConnection();
            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, email);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    user = new Usuario();
                    user.setIdUsuario(rs.getInt("id_usuario"));
                    user.setNombre(rs.getString("nombre"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setRol(rs.getString("rol"));
                }
            }
        } catch (Exception e) {
            System.err.println("Error en UsuarioDAO.validar: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return user;
    }

    public boolean registrar(Usuario user) {
        String sql = "INSERT INTO KLS_USUARIOS (nombre, email, password, rol) VALUES (?, ?, ?, ?)";
        try {
            con = cn.getConnection();
            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, user.getNombre());
                ps.setString(2, user.getEmail());
                ps.setString(3, user.getPassword());
                ps.setString(4, user.getRol() != null ? user.getRol() : "usuario");
                int filasAfectadas = ps.executeUpdate();
                return filasAfectadas > 0;
            } else {
                System.err.println("Error en UsuarioDAO.registrar: La conexión es nula.");
                return false;
            }
        } catch (Exception e) {
            System.err.println("Error en UsuarioDAO.registrar: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
