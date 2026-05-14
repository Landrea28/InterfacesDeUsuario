package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AlimentoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    // Listar todos los alimentos por tipo (Ej: 'Verdura' o 'Fruta')
    public List<Alimento> listarPorTipo(String tipo) {
        List<Alimento> lista = new ArrayList<>();
        String sql = "SELECT * FROM KLS_ALIMENTOS WHERE tipo = ? ORDER BY nombre";
        try {
            con = cn.getConnection();
            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, tipo);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Alimento a = new Alimento();
                    a.setIdAlimento(rs.getInt("id_alimento"));
                    a.setNombre(rs.getString("nombre"));
                    a.setTipo(rs.getString("tipo"));
                    a.setCalorias(rs.getInt("calorias"));
                    a.setTemporada(rs.getString("temporada"));
                    lista.add(a);
                }
            }
        } catch (Exception e) {
            System.err.println("Error en AlimentoDAO.listarPorTipo: " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return lista;
    }

    // Listar todos los alimentos
    public List<Alimento> listarTodos() {
        List<Alimento> lista = new ArrayList<>();
        String sql = "SELECT * FROM KLS_ALIMENTOS ORDER BY tipo, nombre";
        try {
            con = cn.getConnection();
            if (con != null) {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Alimento a = new Alimento();
                    a.setIdAlimento(rs.getInt("id_alimento"));
                    a.setNombre(rs.getString("nombre"));
                    a.setTipo(rs.getString("tipo"));
                    a.setCalorias(rs.getInt("calorias"));
                    a.setTemporada(rs.getString("temporada"));
                    lista.add(a);
                }
            }
        } catch (Exception e) {
            System.err.println("Error en AlimentoDAO.listarTodos: " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return lista;
    }

    private void cerrarConexiones() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
