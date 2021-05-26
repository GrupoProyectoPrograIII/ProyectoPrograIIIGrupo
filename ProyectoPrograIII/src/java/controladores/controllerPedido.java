package controladores;

import dao.DaoArea;
import dao.DaoCliente;
import dao.DaoMesa;
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
import modelos.Cliente;
import modelos.Mesa;
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
        DaoArea daoArea = new DaoArea();
        DaoMesa daoMesa = new DaoMesa();
        DaoCliente daoCliente = new DaoCliente();

        Usuario user = new Usuario();
        Area area = new Area();
        Mesa mesa = new Mesa();
        Cliente cliente = new Cliente();

        List<Usuario> lstUsuario = daoUsuario.listar();
        List<Area> lstArea = daoArea.listar();
        List<Mesa> lstMesa = daoMesa.listar();
        List<Cliente> lstCliente = daoCliente.listar();
        
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
                //daoMesa.modificar(mesa);
                
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
                lstCliente = daoCliente.listar();
                lstArea = daoArea.listar();
                //lstMesa = daoMesa.listar();
                request.setAttribute("lstArea", lstArea);
                request.setAttribute("lstCliente", lstCliente);
                request.setAttribute("mesa", request.getParameter("mesa"));
                //request.setAttribute("lstMesa", lstMesa);
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
