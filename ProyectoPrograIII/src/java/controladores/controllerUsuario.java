package controladores;

import dao.DaoRol;
import dao.DaoUsuario;
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
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String acceso = "";
        String action = request.getParameter("accion");
        DaoUsuario daoUsuario = new DaoUsuario();
        List<Usuario> lstUsuario = null;
        DaoRol daoRol = new DaoRol();
        List<Rol> lstRol = null;
        Usuario user = new Usuario();

        switch (action) {
            case "read":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar;
                break;
            case "agregar":
                user = new Usuario();
                user.setUser(request.getParameter("Auser"));
                user.setNombre(request.getParameter("Anombre"));
                user.setApellido(request.getParameter("Aapellido"));
                user.setPass(request.getParameter("Apassword"));
                user.setIdRol(Integer.parseInt(request.getParameter("Arole")));
                user.setIsActivo(Integer.parseInt(request.getParameter("Aactivo")));
                
                daoUsuario.insertar(user);
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar;
                break;
            case "editar":
                user = new Usuario();
                user.setIdUser(Integer.parseInt(request.getParameter("Eiduser")));
                user.setUser(request.getParameter("Euser"));
                user.setNombre(request.getParameter("Enombre"));
                user.setApellido(request.getParameter("Eapellido"));
                user.setPass(request.getParameter("Epassword"));
                user.setIdRol(Integer.parseInt(request.getParameter("Erole")));
                user.setIsActivo(Integer.parseInt(request.getParameter("Eactivo")));
                
                daoUsuario.modificar(user);
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar;
                break;
            case "eliminar":
                user = new Usuario();
                user.setIdUser(Integer.parseInt(request.getParameter("Diduser")));
                
                daoUsuario.eliminar(user);
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar;
                break;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso); //invoca de modo directo un recurso web
        vista.forward(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
