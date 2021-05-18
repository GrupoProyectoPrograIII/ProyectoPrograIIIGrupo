package controladores;

import dao.DaoModulo;
import dao.DaoPermiso;
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
import modelos.Modulo;
import modelos.Permiso;
import modelos.Rol;

@WebServlet(name = "controllerPermiso", urlPatterns = {"/controllerPermiso"})
public class controllerPermiso extends HttpServlet {

    String listar = "Seguridad/Permisos/consultaPermisos.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controllerPermiso</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controllerPermiso at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher vista = request.getRequestDispatcher("index.jsp"); //invoca de modo directo un recurso web
        vista.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoPermiso daoPermiso = new DaoPermiso();
        DaoRol daoRol = new DaoRol();
        DaoModulo daoModulo = new DaoModulo();
        List<Permiso> lstPermiso = daoPermiso.listar();
        List<Rol> lstRol = daoRol.listar();
        List<Modulo> lstModulo = daoModulo.listar();
        String acceso = "";
        String action = request.getParameter("accion");
        Permiso permiso = new Permiso();

        switch (action) {
            case "read":
                lstRol = daoRol.listar();
                lstModulo = daoModulo.listar();
                lstPermiso = daoPermiso.listar();
                request.setAttribute("permiso", lstPermiso);
                request.setAttribute("rol", lstRol);
                request.setAttribute("modulo", lstModulo);
                acceso = listar;
                break;
            case "agregar":
                permiso = new Permiso();
                permiso.setIdModulo(Integer.parseInt(request.getParameter("Amodulo")));
                permiso.setIdRol(Integer.parseInt(request.getParameter("Arol")));
                permiso.setIsActivo(Integer.parseInt(request.getParameter("Aactivo")));
                daoPermiso.insertar(permiso);

                lstRol = daoRol.listar();
                lstModulo = daoModulo.listar();
                lstPermiso = daoPermiso.listar();
                request.setAttribute("permiso", lstPermiso);
                request.setAttribute("rol", lstRol);
                request.setAttribute("modulo", lstModulo);
                acceso = listar;
                break;
            case "editar":
                permiso = new Permiso();
                permiso.setIdPermiso(Integer.parseInt(request.getParameter("Eidpermiso")));
                permiso.setIdModulo(Integer.parseInt(request.getParameter("Emodulo")));
                permiso.setIdRol(Integer.parseInt(request.getParameter("Erol")));
                permiso.setIsActivo(Integer.parseInt(request.getParameter("Eactivo")));
                daoPermiso.modificar(permiso);

                lstRol = daoRol.listar();
                lstModulo = daoModulo.listar();
                lstPermiso = daoPermiso.listar();
                request.setAttribute("permiso", lstPermiso);
                request.setAttribute("rol", lstRol);
                request.setAttribute("modulo", lstModulo);
                acceso = listar;
                break;
            case "eliminar":
                permiso = new Permiso();
                permiso.setIdPermiso(Integer.parseInt(request.getParameter("Didpermiso")));
                daoPermiso.eliminar(permiso);

                lstRol = daoRol.listar();
                lstModulo = daoModulo.listar();
                lstPermiso = daoPermiso.listar();
                request.setAttribute("permiso", lstPermiso);
                request.setAttribute("rol", lstRol);
                request.setAttribute("modulo", lstModulo);
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
