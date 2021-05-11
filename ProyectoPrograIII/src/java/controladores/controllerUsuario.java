package controladores;

import dao.daoRol;
import dao.daoUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Rol;
import modelos.Usuario;

@WebServlet(name = "controllerUsuario", urlPatterns = {"/controllerUsuario"})
public class controllerUsuario extends HttpServlet {

    String listar = "Seguridad/Usuario/consultaUsuarios.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controllerUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controllerUsuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        String acceso = "";
        String action = request.getParameter("accion");
        String usuario, nombre, apellido, codigo, password, activo, rol;
        daoUsuario daoUsuario = new daoUsuario();
        List<Usuario> lstUsuario = null;
        daoRol daoRol = new daoRol();
        List<Rol> lstRol = null;

        switch (action) {
            case "read":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar;
                break;
            case "agregar":

                usuario = request.getParameter("user");
                nombre = request.getParameter("name");
                apellido = request.getParameter("apellido");
                password = request.getParameter("password");
                rol = request.getParameter("rol");
                activo = request.getParameter("activo");
                codigo = request.getParameter("codigo");
                System.out.println("User:" + usuario + "nombre:" + nombre + "Apellido:" + apellido + " Password:" + password + " Rol:" + rol + " Activo:" + activo + " Codigo:" + codigo);

                lstUsuario = daoUsuario.listar();
                request.setAttribute("user", lstUsuario);

                acceso = listar;

                break;
            case "editar":
                usuario = request.getParameter("Euser");
                nombre = request.getParameter("Ename");
                apellido = request.getParameter("Eapellido");
                password = request.getParameter("Epassword");
                rol = request.getParameter("Erol");
                activo = request.getParameter("Eactivo");
                codigo = request.getParameter("Ecodigo");
                System.out.println("User:" + usuario + "nombre:" + nombre + "Apellido:" + apellido + " Password:" + password + " Rol:" + rol + " Activo:" + activo + " Codigo:" + codigo);

                lstUsuario = daoUsuario.listar();
                request.setAttribute("user", lstUsuario);

                acceso = listar;
                break;
            case "eliminar":
                usuario = request.getParameter("user");
                nombre = request.getParameter("name");
                apellido = request.getParameter("apellido");
                password = request.getParameter("password");
                rol = request.getParameter("rol");
                activo = request.getParameter("activo");
                codigo = request.getParameter("codigo");
                System.out.println("User:" + usuario + "nombre:" + nombre + "Apellido:" + apellido + " Password:" + password + " Rol:" + rol + " Activo:" + activo + " Codigo:" + codigo);

                lstUsuario = daoUsuario.listar();
                request.setAttribute("user", lstUsuario);

                acceso = listar;
                break;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso); //invoca de modo directo un recurso web
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
