package controladores;

import dao.DaoArea;
import dao.DaoCliente;
import dao.DaoDespacho;
import dao.DaoDetallePedido;
import dao.DaoMesa;
import dao.DaoPedido;
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
import modelos.DetallePedido;
import modelos.Mesa;
import modelos.Pedido;
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
        String usuario = request.getParameter("usuario");
        
        DaoUsuario daoUsuario = new DaoUsuario();
        DaoArea daoArea = new DaoArea();
        DaoMesa daoMesa = new DaoMesa();
        DaoCliente daoCliente = new DaoCliente();
        DaoProductoCombo daoProductoCombo = new DaoProductoCombo();
        DaoDespacho daoDespacho = new DaoDespacho();
        DaoDetallePedido daoDetallePedido = new DaoDetallePedido();
        DaoPedido daoPedido = new DaoPedido();
        
        ProductoCombo productoCombo = new ProductoCombo();
        Despacho despacho = new Despacho();
        DetallePedido detallePedido = new DetallePedido();
        Pedido pedido = new Pedido();
        
        List<Despacho> lstDesp = daoDespacho.listar();
        List<Usuario> lstUsuario = daoUsuario.listar();
        List<Area> lstArea = daoArea.listar();
        List<Mesa> lstMesa = daoMesa.listar();
        List<Cliente> lstCliente = daoCliente.listar();
        List<ProductoCombo> lstProductoCombo = daoProductoCombo.listar();
        List<DetallePedido> lstDetallePedido = daoDetallePedido.listar();
        List<Pedido> lstPedido = daoPedido.listar();
        
        switch(action){
            case "readSM":
                lstArea = daoArea.listar();
                lstMesa = daoMesa.listar();
                request.setAttribute("lstArea", lstArea);
                request.setAttribute("lstMesa", lstMesa);
                acceso = listar + "SeleccionarMesa.jsp";
                break;
            case "readEM":
                lstArea = daoArea.listar();
                lstMesa = daoMesa.listar();
                lstPedido = daoPedido.listar();
                lstDetallePedido = daoDetallePedido.listar();
                request.setAttribute("lstArea", lstArea);
                request.setAttribute("lstMesa", lstMesa);
                request.setAttribute("lstPedido", lstPedido);
                request.setAttribute("lstDetallePedido", lstDetallePedido);
                acceso = listar + "ElegirMonitor.jsp";
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
                pedido = new Pedido();
                pedido.setIdMesa(Integer.parseInt(request.getParameter("mesas")));
                pedido.setIdUsuario(Integer.parseInt(request.getParameter("idUser")));
                pedido.setIdCliente(Integer.parseInt(request.getParameter("cliente")));
                detallePedido = new DetallePedido();
                lstArea = daoArea.listar();
                lstMesa = daoMesa.listar();
                request.setAttribute("lstArea", lstArea);
                request.setAttribute("lstMesa", lstMesa);
                acceso = listar + "SeleccionarMesa.jsp";
                break;
            case "editarEM":
                acceso = listar + "ElegirMonitor.jsp";
                break;
            case "nuevoPedido":
                
                lstCliente = daoCliente.listar();
                lstProductoCombo = daoProductoCombo.listar();
                lstDetallePedido = daoDetallePedido.listar();
                lstPedido = daoPedido.listar();
                
                System.out.println("Prueba:"+usuario);
                request.setAttribute("lstCliente", lstCliente);
                request.setAttribute("lstProductoCombo", lstProductoCombo);
                request.setAttribute("mesa", mesas);
                request.setAttribute("area", areas);
                request.setAttribute("lstDp", lstDetallePedido);
                request.setAttribute("lstPedido", lstPedido);
                request.setAttribute("user", usuario);
                
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
