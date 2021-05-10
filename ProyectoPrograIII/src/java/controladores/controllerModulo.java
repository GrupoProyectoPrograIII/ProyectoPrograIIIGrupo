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
    
    String listar = "Seguridad/Modulos/consultaModulos.jsp";
    String eliminar="";
    String modificar="";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accionL");
        switch (accion){
            case "Principal":
                request.getRequestDispatcher("plantilla.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
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
        //processRequest(request, response);
        String accion = request.getParameter("accionL");
        switch (accion){
            case "Principal":
                request.getRequestDispatcher("plantilla.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
