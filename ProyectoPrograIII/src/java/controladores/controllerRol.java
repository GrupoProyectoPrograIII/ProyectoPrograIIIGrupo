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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        RequestDispatcher vista = request.getRequestDispatcher("index.jsp");
        //RequestDispatcher vista = request.getRequestDispatcher(listar);//Temporal accesso, favor comentar esta linea y dejar "index.jsp"
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acceso = "";
        String action = request.getParameter("accion");
        
        daoRol daor = new daoRol();
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
