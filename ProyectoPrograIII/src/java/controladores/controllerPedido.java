package controladores;

import dao.DaoArea;
import dao.DaoMesa;
import dao.DaoModulo;
import dao.DaoPermiso;
import dao.DaoRol;
import dao.DaoUsuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Area;
import modelos.Mesa;
import modelos.Modulo;
import modelos.Permiso;
import modelos.Rol;
import modelos.Usuario;

@WebServlet(name = "controllerPedido", urlPatterns = {"/controllerPedido"})
public class controllerPedido extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher vista = request.getRequestDispatcher("index.jsp"); //invoca de modo directo un recurso web
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String listar = "Pedidos/";
        String acceso = "";
        String action = request.getParameter("accion");

        DaoUsuario daoUsuario = new DaoUsuario();
        DaoRol daoRol = new DaoRol();
        DaoPermiso daoPermiso = new DaoPermiso();
        DaoModulo daoModulo = new DaoModulo();
        DaoArea daoArea = new DaoArea();
        DaoMesa daoMesa = new DaoMesa();

        Usuario user = new Usuario();
        Permiso permiso = new Permiso();
        Modulo modulo = new Modulo();
        Rol rol = new Rol();
        Area area = new Area();
        Mesa mesa = new Mesa();

        List<Usuario> lstUsuario = daoUsuario.listar();
        List<Modulo> lstModulo = daoModulo.listar();
        List<Rol> lstRol = daoRol.listar();
        List<Permiso> lstPermiso = daoPermiso.listar();
        List<Area> lstArea = daoArea.listar();
        List<Mesa> lstMesa = daoMesa.listar();
        
        
        
        
        switch(action){
            case "readSM":
                lstArea = daoArea.listar();
                lstMesa = daoMesa.listar();
                request.setAttribute("lstArea", lstArea);
                request.setAttribute("lstMesa", lstMesa);
                acceso = listar + "SeleccionarMesa.jsp";
                break;
            case "readEM":
                acceso = listar + "ElegirMonitor.jsp";
                break;
            case "readAP":
                acceso = listar + "AnularPedido.jsp";
                break;
            case "agregarSM":
                acceso = listar + "SeleccionarMesa.jsp";
                break;
            case "agregarEM":
                acceso = listar + "ElegirMonitor.jsp";
                break;
            case "agregarAP":
                acceso = listar + "AnularPedido.jsp";
                break;
            case "editarSM":
                acceso = listar + "SeleccionarMesa.jsp";
                break;
            case "editarEM":
                acceso = listar + "ElegirMonitor.jsp";
                break;
            case "editarAP":
                acceso = listar + "AnularPedido.jsp";
                break;
            case "eliminarSM":
                acceso = listar + "SeleccionarMesa.jsp";
                break;
            case "eliminarEM":
                acceso = listar + "ElegirMonitor.jsp";
                break;
            case "eliminarAP":
                acceso = listar + "AnularPedido.jsp";
                break;
            case "nuevoPedido":
                acceso = listar + "IngresoPedido.jsp";
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
