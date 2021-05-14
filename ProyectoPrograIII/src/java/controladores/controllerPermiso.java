package controladores;

import dao.daoModulo;
import dao.daoPermiso;
import dao.daoRol;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Modulo;
import modelos.Permiso;
import modelos.Rol;

@WebServlet(name = "controllerPermiso", urlPatterns = {"/controllerPermiso"})
public class controllerPermiso extends HttpServlet {

    String listar = "Seguridad/Permisos/consultaPermisos.jsp";
    String eliminar = "";
    String modificar = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        daoPermiso daoPermiso = new daoPermiso();
        List<Permiso> lstPermiso = daoPermiso.listar();
        daoRol daoRol = new daoRol();
        List<Rol> lstRol = daoRol.listar();
        daoModulo daoModulo = new daoModulo();
        List<Modulo> lstModulo = daoModulo.listar();

        request.setAttribute("permiso", lstPermiso);
        request.setAttribute("rol", lstRol);
        request.setAttribute("modulo", lstModulo);
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
                List<Permiso> lstPermiso = daoPermiso.listar();
                daoRol daoRol = new daoRol();
                List<Rol> lstRol = daoRol.listar();
                daoModulo daoModulo = new daoModulo();
                List<Modulo> lstModulo = daoModulo.listar();

                request.setAttribute("permiso", lstPermiso);
                request.setAttribute("rol", lstRol);
                request.setAttribute("modulo", lstModulo);
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
