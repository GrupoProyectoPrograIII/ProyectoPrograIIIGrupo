package controladores;

import dao.DaoRol;
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

@WebServlet(name = "controllerRol", urlPatterns = {"/controllerRol"})
public class controllerRol extends HttpServlet {
    
    String listar = "Seguridad/Roles/consultaRol.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controllerRol</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controllerRol at " + request.getContextPath() + "</h1>");
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
        
        DaoRol daor = new DaoRol();
        List<Rol> lstRol = null;
        Rol rol = new Rol();

        switch (action) {
            case "read":
                lstRol = daor.listar();
                request.setAttribute("rol", lstRol);
                acceso = listar;
                break;             
            case "agregar":
                rol = new Rol();
                rol.setNombre(request.getParameter("Anombre"));
                rol.setDescripcion(request.getParameter("Adescripcion"));
                rol.setIsActivo(Integer.parseInt(request.getParameter("Aactivo")));
                daor.insertar(rol);
                
                lstRol = daor.listar();
                request.setAttribute("rol", lstRol);                
                acceso=listar;
                break;
            case "editar":
                rol = new Rol();
                rol.setIdRol(Integer.parseInt(request.getParameter("Eidrol")));
                rol.setNombre(request.getParameter("Enombre"));
                rol.setDescripcion(request.getParameter("Edescripcion"));
                rol.setIsActivo(Integer.parseInt(request.getParameter("Eactivo")));
                daor.modificar(rol);
                
                lstRol = daor.listar();
                request.setAttribute("rol", lstRol);                
                acceso=listar;
                break;
            case "eliminar":
                rol.setIdRol(Integer.parseInt(request.getParameter("Didrol")));
                daor.eliminar(rol);
                
                lstRol = daor.listar();
                request.setAttribute("rol", lstRol);                
                acceso=listar;
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
