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
        //RequestDispatcher vista = request.getRequestDispatcher("index.jsp");
        RequestDispatcher vista = request.getRequestDispatcher(listar);//Temporal accesso, favor comentar esta linea y dejar "index.jsp"
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acceso = "";
        String action = request.getParameter("accion");
        String id, nombre, descrip, activo;
        
        daoRol daor = new daoRol();
        List<Rol> lstRol = null;
        

        switch (action) {
            case "read":
                lstRol = daor.listar();
                request.setAttribute("rol", lstRol);
                /* MODIFICADO 14-05-2021
                Rol rol = new Rol();
                Iterator<Rol> iteratorRol= lstRol.iterator();
                while(iteratorRol.hasNext()){
                    rol=iteratorRol.next();
                    request.setAttribute("rol", rol);
                }*/
                acceso = listar;
                break;
            //case "nuevo":                
            case "agregar":
                nombre = request.getParameter("Anombre");
                descrip = request.getParameter("Adescripcion");                
                activo = request.getParameter("Aactivo");
                System.out.println("nombre:"+nombre+" descripcion:"+descrip+" activo:"+activo);
                lstRol = daor.listar();
                request.setAttribute("rol", lstRol);                
                acceso=listar;
                break;
            case "editar":
                id = request.getParameter("Eidrol");
                nombre = request.getParameter("Enombre");
                descrip = request.getParameter("Edescripcion");                
                activo = request.getParameter("Eactivo");
                System.out.println("nombre:"+nombre+" descripcion:"+descrip+" activo:"+activo);
                lstRol = daor.listar();
                request.setAttribute("rol", lstRol);                
                acceso=listar;
                break;
            case "eliminar":
                request.getParameter("Didrol");
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
