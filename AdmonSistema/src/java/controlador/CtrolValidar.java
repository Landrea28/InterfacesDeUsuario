package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.*;

@WebServlet(name = "CtrolValidar", urlPatterns = {"/CtrolValidar"})
public class CtrolValidar extends HttpServlet {
LoginDAO logindao = new LoginDAO();
Usuario datos = new Usuario();
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");
}
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
processRequest(request, response);
}
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
HttpSession ses = request.getSession(true);
String accion = request.getParameter("accion");
if("Ingresar".equalsIgnoreCase(accion)){
String usu = request.getParameter("cusuario");
String cla = request.getParameter("cclave");
datos = logindao.Login_datos(usu, cla);
if(datos != null && datos.getUsuario() != null){
request.setAttribute("datos", datos);
HttpSession sesion_cli = request.getSession(true);
sesion_cli.setAttribute("nUsuario", request.getParameter("cusuario"));
request.getRequestDispatcher("cpanel.jsp").forward(request, response);
}
else {
request.getRequestDispatcher("index.jsp").forward(request, response);
}
}else{
request.getRequestDispatcher("index.jsp").forward(request, response);
}
}
@Override
public String getServletInfo() {
return "Short description";
}// </editor-fold>
}