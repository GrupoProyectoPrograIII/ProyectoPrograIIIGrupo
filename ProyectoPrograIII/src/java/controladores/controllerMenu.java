package controladores;

import dao.DaoModulo;
import dao.DaoRol;
import dao.DaoUsuario;
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
import modelos.Rol;
import modelos.Usuario;

@WebServlet(name = "controllerMenu", urlPatterns = {"/controllerMenu"})
public class controllerMenu extends HttpServlet {

    String listar = "Seguridad/Modulos.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        DaoModulo daoModulo = new DaoModulo();
        List<Modulo> lstModulo = daoModulo.listar();
        Modulo modulo = new Modulo();
        DaoUsuario daoUsuario = new DaoUsuario();
        List<Usuario> lstUsuario = null;
        DaoRol daoRol = new DaoRol();
        List<Rol> lstRol = null;
        Usuario user = new Usuario();

        switch (action) {
            case "area":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = "Mantenimientos/Areas.jsp";
                break;
            case "cliente":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = "Mantenimientos/Clientes.jsp";
                break;
            case "mesa":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = "Mantenimientos/Mesas.jsp";
                break;
            case "monitor":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = "Mantenimientos/Monitor.jsp";
                break;
            case "productCombo":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = "Mantenimientos/ProductoCombinado.jsp";
                break;
            case "producto":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = "Mantenimientos/Productos.jsp";
                break;
            case "proveedor":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = "Mantenimientos/Proveedores.jsp";
                break;
            case "tipoProduct":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = "Mantenimientos/TipoProductos.jsp";
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
