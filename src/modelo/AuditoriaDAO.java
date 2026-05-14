package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AuditoriaDAO {
    Conexion cn = new Conexion();

    public void registrarActividad(String tabla, String operacion, String usuario, String detallesNuevos) {
        String sql = "INSERT INTO KLS_AUDITORIA (tabla_afectada, operacion, usuario_bd, datos_nuevos) VALUES (?, ?, ?, ?)";
        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, tabla);
            ps.setString(2, operacion);
            ps.setString(3, usuario);
            ps.setString(4, detallesNuevos);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error al registrar auditoria: " + e.getMessage());
        }
    }

    public List<Auditoria> listarRecientes() {
        List<Auditoria> lista = new ArrayList<>();
        // FETCH FIRST 5 ROWS ONLY (Disponible en Oracle 12c o superior, tu 21c lo soporta perfectamente)
        String sql = "SELECT * FROM KLS_AUDITORIA ORDER BY fecha DESC FETCH FIRST 5 ROWS ONLY";
        
        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Auditoria au = new Auditoria();
                au.setIdAuditoria(rs.getInt("id_auditoria"));
                au.setTablaAfectada(rs.getString("tabla_afectada"));
                au.setOperacion(rs.getString("operacion"));
                au.setUsuarioBd(rs.getString("usuario_bd"));
                au.setFecha(rs.getTimestamp("fecha"));
                au.setDatosNuevos(rs.getString("datos_nuevos"));
                lista.add(au);
            }
        } catch (Exception e) {
            System.err.println("Error al listar auditoria: " + e.getMessage());
        }
        return lista;
    }

    public List<Auditoria> listarTodos() {
        List<Auditoria> lista = new ArrayList<>();
        String sql = "SELECT * FROM KLS_AUDITORIA ORDER BY fecha DESC";
        
        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Auditoria au = new Auditoria();
                au.setIdAuditoria(rs.getInt("id_auditoria"));
                au.setTablaAfectada(rs.getString("tabla_afectada"));
                au.setOperacion(rs.getString("operacion"));
                au.setUsuarioBd(rs.getString("usuario_bd"));
                au.setFecha(rs.getTimestamp("fecha"));
                au.setDatosNuevos(rs.getString("datos_nuevos"));
                lista.add(au);
            }
        } catch (Exception e) {
            System.err.println("Error al listar todas las auditorias: " + e.getMessage());
        }
        return lista;
    }

    public List<Auditoria> listarPorFecha(String fechaInicio, String fechaFin) {
        List<Auditoria> lista = new ArrayList<>();
        String sql = "SELECT * FROM KLS_AUDITORIA WHERE TRUNC(fecha) BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD') ORDER BY fecha DESC";
        
        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, fechaInicio);
            ps.setString(2, fechaFin);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Auditoria au = new Auditoria();
                    au.setIdAuditoria(rs.getInt("id_auditoria"));
                    au.setTablaAfectada(rs.getString("tabla_afectada"));
                    au.setOperacion(rs.getString("operacion"));
                    au.setUsuarioBd(rs.getString("usuario_bd"));
                    au.setFecha(rs.getTimestamp("fecha"));
                    au.setDatosNuevos(rs.getString("datos_nuevos"));
                    lista.add(au);
                }
            }
        } catch (Exception e) {
            System.err.println("Error al listar auditoria por fecha: " + e.getMessage());
        }
        return lista;
    }
}
