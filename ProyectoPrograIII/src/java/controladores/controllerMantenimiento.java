package controladores;

import dao.DaoArea;
import dao.DaoCliente;
import dao.DaoDetallePedido;
import dao.DaoMesa;
import dao.DaoModulo;
import dao.DaoPedido;
import dao.DaoPermiso;
import dao.DaoProductoCombo;
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
import modelos.Cliente;
import modelos.DetallePedido;
import modelos.Mesa;
import modelos.Modulo;
import modelos.Pedido;
import modelos.Permiso;
import modelos.Producto;
import modelos.ProductoCombo;
import modelos.Rol;
import modelos.Usuario;

@WebServlet(name = "controllerMantenimiento", urlPatterns = {"/controllerMantenimiento"})
public class controllerMantenimiento extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher vista = request.getRequestDispatcher("index.jsp"); //invoca de modo directo un recurso web
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String listar = "Mantenimientos/";
        String acceso = "";
        String action = request.getParameter("accion");

        DaoUsuario daoUsuario = new DaoUsuario();
        DaoRol daoRol = new DaoRol();
        DaoPermiso daoPermiso = new DaoPermiso();
        DaoModulo daoModulo = new DaoModulo();
        DaoArea daoArea = new DaoArea();
        DaoMesa daoMesa = new DaoMesa();
        DaoCliente daoCliente = new DaoCliente();
        DaoDetallePedido daoDp = new DaoDetallePedido();
        DaoPedido daoPedido = new DaoPedido();
        DaoProductoCombo daoProdCombo = new DaoProductoCombo();
        

        Usuario user = new Usuario();
        Permiso permiso = new Permiso();
        Modulo modulo = new Modulo();
        Rol rol = new Rol();
        Mesa mesa = new Mesa();
        Area area = new Area();
        Cliente cliente = new Cliente();
        DetallePedido dp = new DetallePedido();
        Pedido pedido = new Pedido();
        Producto producto = new Producto();

        List<Usuario> lstUsuario = daoUsuario.listar();
        List<Modulo> lstModulo = daoModulo.listar();
        List<Rol> lstRol = daoRol.listar();
        List<Permiso> lstPermiso = daoPermiso.listar();
        List<Area> lstArea = daoArea.listar();
        List<Mesa> lstMesa = daoMesa.listar();
        List<Cliente> lstCliente = daoCliente.listar();
        List<DetallePedido> lstDp = daoDp.listar();
        List<Pedido> lstPedido = daoPedido.listar();
        List<ProductoCombo> lstProdCombo = daoProdCombo.listar();
        

        switch(action){
        //--------- CRUD AREAS  --------------------------------  
            case "readA":
                lstArea = daoArea.listar();
                request.setAttribute("area", lstArea);
                acceso = listar + "Areas.jsp";
                break;
                
             case "agregarA":
                area = new Area();
                area.setDescripcion(request.getParameter("Anombre"));
                area.setEstado(Integer.parseInt(request.getParameter("Aactivo")));
                daoArea.insertar(area);
                lstArea = daoArea.listar();
                request.setAttribute("area", lstArea);
                acceso = listar + "Areas.jsp";
                break;
                
            case "editarA":
                area = new Area();
                area.setIdArea(Integer.parseInt(request.getParameter("Eidarea")));
                area.setDescripcion(request.getParameter("Edescripcion"));
                area.setEstado(Integer.parseInt(request.getParameter("Eactivo")));
                daoArea.modificar(area);
                lstArea = daoArea.listar();
                request.setAttribute("area", lstArea);                
                acceso = listar + "Areas.jsp";
                break;
                
            case "eliminarA":
                area = new Area();
                area.setIdArea(Integer.parseInt(request.getParameter("Didarea")));
                daoArea.eliminar(area);
                lstArea = daoArea.listar();                
                request.setAttribute("area", lstArea);
                acceso = listar + "Areas.jsp";
                break;                
            
        //------- CRUD MESAS -------------------------------------
                
            case "readM":
                lstMesa = daoMesa.listar();               
                request.setAttribute("mesa", lstMesa);
                acceso = listar + "Mesas.jsp";
                break;
                
            case "agregarM":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Mesas.jsp";
                break;
                
            case "eliminarM":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Mesas.jsp";
                break;
                
        //--------
                
            case "editarM":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Mesas.jsp";
                break;
                
            case "readC":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Clientes.jsp";
                break;
            
            case "readMon":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Monitor.jsp";
                break;
            case "readPC":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "ProductoCombinado.jsp";
                break;
            case "readProd":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Productos.jsp";
                break;
            case "readPro":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Proveedores.jsp";
                break;
            case "readTP":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "TipoProductos.jsp";
                break;
           
            case "agregarC":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Clientes.jsp";
                break;
            
            case "agregarMon":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Monitor.jsp";
                break;
            case "agregarPC":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "ProductoCombinado.jsp";
                break;
            case "agregarProd":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Productos.jsp";
                break;
            case "agregarPro":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Proveedores.jsp";
                break;
            case "agregarTP":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "TipoProductos.jsp";
                break;
            
            case "editarC":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Clientes.jsp";
                break;
            
            case "editarMon":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Monitor.jsp";
                break;
            case "editarPC":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "ProductoCombinado.jsp";
                break;
            case "editarProd":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Productos.jsp";
                break;
            case "editarPro":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Proveedores.jsp";
                break;
            case "editarTP":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "TipoProductos.jsp";
                break;
            
            case "eliminarC":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Clientes.jsp";
                break;
            
            case "eliminarMon":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Monitor.jsp";
                break;
            case "eliminarPC":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "ProductoCombinado.jsp";
                break;
            case "eliminarProd":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Productos.jsp";
                break;
            case "eliminarPro":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Proveedores.jsp";
                break;
            case "eliminarTP":
                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "TipoProductos.jsp";
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
