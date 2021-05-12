package controladores;

import dao.daoPermiso;
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
import modelos.Permiso;

@WebServlet(name = "controllerPermiso", urlPatterns = {"/controllerPermiso"})
public class controllerPermiso extends HttpServlet {

    String listar = "Seguridad/Permisos/consultaPermisos.jsp";
    String eliminar = "";
    String modificar = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        //RequestDispatcher vista = request.getRequestDispatcher("index.jsp");
        RequestDispatcher vista = request.getRequestDispatcher(listar);//Temporal accesso, favor comentar esta linea y dejar "index.jsp"
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");

        switch (action) {
            case "read":
                daoPermiso daoPermiso = new daoPermiso();
                List<Permiso> lstPermiso= daoPermiso.listar();
                Iterator<Permiso> iteratorPermiso= lstPermiso.iterator();
                Permiso permiso = new Permiso();
                
                while(iteratorPermiso.hasNext()){
                    permiso = iteratorPermiso.next();
                    request.setAttribute("permiso", permiso);
                }
                acceso = listar;
                break;
            case "nuevo":
                String nuevo = "";
                acceso = nuevo;
                break;
            case "agregar":
                acceso = listar;
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
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
