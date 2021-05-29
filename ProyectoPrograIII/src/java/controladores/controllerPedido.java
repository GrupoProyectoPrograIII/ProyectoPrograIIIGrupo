package controladores;

import dao.DaoArea;
import dao.DaoCliente;
import dao.DaoDespacho;
import dao.DaoMesa;
import dao.DaoProductoCombo;
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
import modelos.Despacho;
import modelos.Mesa;
import modelos.ProductoCombo;
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
        String mesas = request.getParameter("mesa");
        String areas = request.getParameter("areas");
        
        DaoUsuario daoUsuario = new DaoUsuario();
        DaoArea daoArea = new DaoArea();
        DaoMesa daoMesa = new DaoMesa();
        DaoCliente daoCliente = new DaoCliente();
        DaoProductoCombo daoProductoCombo = new DaoProductoCombo();
        DaoDespacho daoDespacho = new DaoDespacho();
        
        Usuario user = new Usuario();
        Area area = new Area();
        Mesa mesa = new Mesa();
        Cliente cliente = new Cliente();
        ProductoCombo productoCombo = new ProductoCombo();
        Despacho despacho = new Despacho();
        
        List<Despacho> lstDesp = daoDespacho.listar();
        List<Usuario> lstUsuario = daoUsuario.listar();
        List<Area> lstArea = daoArea.listar();
        List<Mesa> lstMesa = daoMesa.listar();
        List<Cliente> lstCliente = daoCliente.listar();
        List<ProductoCombo> lstProductoCombo = daoProductoCombo.listar();
        
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
                despacho = new Despacho();
                despacho.setId_despacho(Integer.parseInt(request.getParameter("pedido")));
                despacho.setPedido(Integer.parseInt(request.getParameter("")));
                //despacho.setDescripcion(request.par ameter("Asrea"));
                despacho.setMesa(mesas);
                despacho.setArea(areas);
                
                lstArea = daoArea.listar();
                lstMesa = daoMesa.listar();
                request.setAttribute("lstArea", lstArea);
                request.setAttribute("lstMesa", lstMesa);
                //request.setAttribute("datos", datos);
                acceso = "Procesos/Monitores.jsp";
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
                lstProductoCombo = daoProductoCombo.listar();
                //lstMesa = daoMesa.listar();
                request.setAttribute("lstCliente", lstCliente);
                request.setAttribute("lstProductoCombo", lstProductoCombo);
                request.setAttribute("mesa", mesas);
                request.setAttribute("area", areas);
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
