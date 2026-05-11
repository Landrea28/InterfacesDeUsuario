package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;

@WebServlet(name = "ControladorUsuario", urlPatterns = {"/controladorUsuario"})
public class ControladorUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Obtener los parámetros de forma segura (evita NullPointerException)
        String paramIdentificacion = request.getParameter("cidentificacion");
        String paramNombre = request.getParameter("cnombre");
        String paramApellido = request.getParameter("capellido");
        String paramEmail = request.getParameter("cmail");
        String paramUsuario = request.getParameter("cusuario");
        String paramClave = request.getParameter("cclave");
        String paramPerfil = request.getParameter("cidperfil");

        String identificacion = paramIdentificacion != null ? new String(paramIdentificacion.getBytes("ISO-8859-1"), "UTF-8") : "";
        String nombre = paramNombre != null ? new String(paramNombre.getBytes("ISO-8859-1"), "UTF-8") : "";
        String apellido = paramApellido != null ? new String(paramApellido.getBytes("ISO-8859-1"), "UTF-8") : "";
        String email = paramEmail != null ? new String(paramEmail.getBytes("ISO-8859-1"), "UTF-8") : "";
        String usuario = paramUsuario != null ? new String(paramUsuario.getBytes("ISO-8859-1"), "UTF-8") : "";
        String clave = paramClave != null ? new String(paramClave.getBytes("ISO-8859-1"), "UTF-8") : "";
        
        int idperfil = 0;
        try {
            if (paramPerfil != null && !paramPerfil.isEmpty()) {
                idperfil = Integer.parseInt(paramPerfil);
            }
        } catch (NumberFormatException e) {
            System.out.println("Error al parsear el id de perfil: " + e.getMessage());
        }

        Usuario u = new Usuario();
        UsuarioDAO udao = new UsuarioDAO();

        u.setIdentificacion(identificacion);
        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setEmail(email);
        u.setUsuario(usuario);
        u.setClave(clave);
        u.setIdperfil(idperfil);

        int status = udao.agregarUsuario(u);

        if (status > 0) {
            response.sendRedirect("mensaje.jsp");
        } else {
            response.getWriter().print("Error al guardar el usuario en la base de datos.");
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
