package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;
import modelo.UsuarioDAO;

@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConf = request.getParameter("passwordConf");

        // Validaciones bsicas
        if (nombre == null || email == null || password == null || !password.equals(passwordConf)) {
            request.setAttribute("errorRegistro", "Las contraseñas no coinciden o faltan datos.");
            request.getRequestDispatcher("login.jsp?tab=registro").forward(request, response);
            return;
        }

        Usuario nuevoUsuario = new Usuario();
        nuevoUsuario.setNombre(nombre);
        nuevoUsuario.setEmail(email);
        nuevoUsuario.setPassword(password);
        nuevoUsuario.setRol("usuario"); // Rol por defecto

        boolean registrado = dao.registrar(nuevoUsuario);

        if (registrado) {
            request.setAttribute("exitoRegistro", "¡Cuenta creada con éxito! Ahora puedes iniciar sesión.");
            // En lugar de hacer forward, redirigimos limpiando la URL
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("errorRegistro", "Error al crear la cuenta. Verifica que la BD esté activa y el correo no esté repetido.");
            request.getRequestDispatcher("login.jsp?tab=registro").forward(request, response);
        }
    }
}
