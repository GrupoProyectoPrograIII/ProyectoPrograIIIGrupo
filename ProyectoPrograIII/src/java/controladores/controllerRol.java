package controladores;

import dao.daoRol;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
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
    String eliminar = "";
    String modificar = "";

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
        //processRequest(request, response);
        
        String acceso = "";
        String action = request.getParameter("accion");

        switch (action) {
            case "read":
                daoRol daoRol = new daoRol();
                List<Rol> lstRol= daoRol.listar();
                Iterator<Rol> iteratorRol= lstRol.iterator();
                Rol rol = new Rol();
                while(iteratorRol.hasNext()){
                    rol=iteratorRol.next();
                    request.setAttribute("rol", rol);
                }
                acceso = listar;
                break;
            case "nuevo":
                String nuevo = "";
                acceso=nuevo;
                break;
            case "agregar":
                acceso=listar;
                break;
            case "editar":
                break;
            case "modificar":
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
