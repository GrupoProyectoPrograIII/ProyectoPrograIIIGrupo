package controladores;

import dao.DaoModulo;
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

@WebServlet(name = "controllerModulo", urlPatterns = {"/controllerModulo"})
public class controllerModulo extends HttpServlet {

    String listar = "Seguridad/Modulos/consultaModulos.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DaoModulo daoModulo = new DaoModulo();
        List<Modulo> lstModulo = daoModulo.listar();
        lstModulo = daoModulo.listar();
        request.setAttribute("modulo", lstModulo);
        RequestDispatcher vista = request.getRequestDispatcher(listar); //invoca de modo directo un recurso web
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        DaoModulo daoModulo = new DaoModulo();
        List<Modulo> lstModulo = daoModulo.listar();
        Modulo modulo = new Modulo();

        switch (action) {
            case "read":
                lstModulo = daoModulo.listar();
                request.setAttribute("modulo", lstModulo);
                acceso = listar;
                break;
            case "agregar":
                modulo = new Modulo();
                modulo.setNombre(request.getParameter("Anombre"));
                modulo.setDescripcion(request.getParameter("Adescripcion"));
                modulo.setPath(request.getParameter("Apath"));
                modulo.setNivel(Integer.parseInt(request.getParameter("Anivel")));
                modulo.setOrden(Integer.parseInt(request.getParameter("Aorden")));
                modulo.setIdModuloPadre(Integer.parseInt(request.getParameter("AmoduloPadre")));
                modulo.setIsActivo(Integer.parseInt(request.getParameter("Aactivo")));
                daoModulo.insertar(modulo);
                lstModulo = daoModulo.listar();
                request.setAttribute("modulo", lstModulo);
                acceso = listar;
                break;
            case "editar":
                modulo = new Modulo();
                modulo.setIdModulo(Integer.parseInt(request.getParameter("Eidmodulo")));
                modulo.setNombre(request.getParameter("Enombre"));
                modulo.setDescripcion(request.getParameter("Edescripcion"));
                modulo.setPath(request.getParameter("Epath"));
                modulo.setNivel(Integer.parseInt(request.getParameter("Enivel")));
                modulo.setOrden(Integer.parseInt(request.getParameter("Eorden")));
                modulo.setIdModuloPadre(Integer.parseInt(request.getParameter("EmoduloPadre")));
                modulo.setIsActivo(Integer.parseInt(request.getParameter("Eactivo")));
                daoModulo.modificar(modulo);
                lstModulo = daoModulo.listar();
                request.setAttribute("modulo", lstModulo);
                acceso = listar;
                break;
            case "eliminar":
                modulo = new Modulo();
                modulo.setIdModulo(Integer.parseInt(request.getParameter("Didmodulo")));
                daoModulo.eliminar(modulo);
                lstModulo = daoModulo.listar();
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
