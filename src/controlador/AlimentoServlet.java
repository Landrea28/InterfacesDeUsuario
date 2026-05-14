package controlador;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Conexion;
import modelo.Usuario;

@WebServlet(name = "AlimentoServlet", urlPatterns = {"/AlimentoServlet"})
public class AlimentoServlet extends HttpServlet {

    Conexion cn = new Conexion();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // Verificacin de seguridad: Solo admin puede modificar
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioValido");
        if (usuario == null || !"admin".equalsIgnoreCase(usuario.getRol())) {
            response.sendRedirect("dashboard.jsp");
            return;
        }

        String accion = request.getParameter("accion");
        
        try (Connection con = cn.getConnection()) {
            if ("Agregar".equalsIgnoreCase(accion)) {
                String nombre = request.getParameter("nombre");
                String tipo = request.getParameter("tipo");
                int calorias = Integer.parseInt(request.getParameter("calorias"));
                String temporada = request.getParameter("temporada");
                
                String sql = "INSERT INTO KLS_ALIMENTOS (nombre, tipo, calorias, temporada) VALUES (?, ?, ?, ?)";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, nombre);
                    ps.setString(2, tipo);
                    ps.setInt(3, calorias);
                    ps.setString(4, temporada);
                    ps.executeUpdate();
                }
                
            } else if ("Editar".equalsIgnoreCase(accion)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("nombre");
                String tipo = request.getParameter("tipo");
                int calorias = Integer.parseInt(request.getParameter("calorias"));
                String temporada = request.getParameter("temporada");
                
                String sql = "UPDATE KLS_ALIMENTOS SET nombre=?, tipo=?, calorias=?, temporada=? WHERE id_alimento=?";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, nombre);
                    ps.setString(2, tipo);
                    ps.setInt(3, calorias);
                    ps.setString(4, temporada);
                    ps.setInt(5, id);
                    ps.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("dashboard.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Verificacin de seguridad
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioValido");
        if (usuario == null || !"admin".equalsIgnoreCase(usuario.getRol())) {
            response.sendRedirect("dashboard.jsp");
            return;
        }

        String accion = request.getParameter("accion");
        
        try (Connection con = cn.getConnection()) {
            if ("Eliminar".equalsIgnoreCase(accion)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String sql = "DELETE FROM KLS_ALIMENTOS WHERE id_alimento=?";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setInt(1, id);
                    ps.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("dashboard.jsp");
    }
}
