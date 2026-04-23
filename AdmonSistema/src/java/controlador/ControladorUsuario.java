package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;

public class ControladorUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String identificacion;
        String nombre;
        String apellido;
        String email;
        String usuario;
        String clave;
        int idperfil;

        identificacion = new String(request.getParameter("cidentificacion").getBytes("ISO-8859-1"), "UTF-8");
        nombre = new String(request.getParameter("cnombre").getBytes("ISO-8859-1"), "UTF-8");
        apellido = new String(request.getParameter("capellido").getBytes("ISO-8859-1"), "UTF-8");
        email = new String(request.getParameter("cmail").getBytes("ISO-8859-1"), "UTF-8");
        usuario = new String(request.getParameter("cusuario").getBytes("ISO-8859-1"), "UTF-8");
        clave = new String(request.getParameter("cclave").getBytes("ISO-8859-1"), "UTF-8");
        idperfil = Integer.parseInt(request.getParameter("cidperfil"));

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
