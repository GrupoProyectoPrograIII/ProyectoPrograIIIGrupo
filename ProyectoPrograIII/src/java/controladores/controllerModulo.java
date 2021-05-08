package controladores;

import dao.daoModulo;
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
import modelos.Modulo;

@WebServlet(name = "controllerModulo", urlPatterns = {"/controllerModulo"})
public class controllerModulo extends HttpServlet {
    
    String listar = "Paginas/Modulos/consultaModulos.jsp";
    String eliminar="";
    String modificar="";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controllerModulo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controllerModulo at " + request.getContextPath() + "</h1>");
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
                daoModulo daoModulo = new daoModulo();
                List<Modulo> lstModulo= daoModulo.listar();
                Iterator<Modulo> iteratorModulo= lstModulo.iterator();
                Modulo modulo = new Modulo();
                while(iteratorModulo.hasNext()){
                    modulo=iteratorModulo.next();
                    request.setAttribute("modulo", modulo);
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